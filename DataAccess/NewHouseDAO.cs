using Dapper;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess
{

    public class NewHouseDAO : INewHouseDAO
    {
        public async Task<List<T>> LoadHouseData<T, U>(U parameters, string connString)
        {
            string sql = "select * from HouseDetails";
            using (IDbConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                var rows = await connection.QueryAsync<T>(sql, parameters);

                return rows.ToList();
            }
        }
        public async Task<List<T>> LoadFeaturesByHouse<T, U>(U parameters, string connString)
        {
            string sql = @"select HouseFeatures.HouseID, Features.FeatureID, Name, Description, Weight from HouseFeatures 
                        Left Join Features On HouseFeatures.FeatureID = Features.FeatureID 
                        where HouseID = @HouseID";
            using (IDbConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                var rows = await connection.QueryAsync<T>(sql, parameters);

                return rows.ToList();
            }
        }
        public async Task<List<T>> LoadFeatures<T, U>(U parameters, string connString)
        {
            string sql = @"select FeatureID, [Name], [Description] from Features";
            try
            {
                using (IDbConnection connection = new SqlConnection(connString))
                {
                    connection.Open();
                    var rows = await connection.QueryAsync<T>(sql, parameters);

                    return rows.ToList();
                }
            }
            catch (Exception ex)
            {
                return null;
            }
           
        }
        public Task UpdateHouse<T>(T parameters, string connString)
        {
            string sql = "";
            using (IDbConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                return connection.ExecuteAsync(sql, parameters);

            }
        }
        public async Task<int> AddHouse<T>(string address, decimal price, string zillow, string image, string connString)
        {
            string sql = $@"Insert into HouseDetails (Address, Price, ZillowUrl, ImageUrl) 
                        values (@Address, @Price, @ZillowUrl, @ImageUrl)
                        select @HouseID = @@IDENTITY";
            var p = new DynamicParameters();
            p.Add("@HouseID", 0, DbType.Int32, ParameterDirection.Output);
            p.Add("@Address", address);
            p.Add("@Price", price);
            p.Add("@ZillowUrl", zillow);
            p.Add("@ImageUrl", image);

            using (IDbConnection connection = new SqlConnection(connString))
            {
                try
                {
                    connection.Open();
                    await connection.ExecuteAsync(sql, p);
                    int newID = p.Get<int>("@HouseID");
                    return newID;
                }
                catch (Exception ex)
                {
                    return -1;
                }
               

            }
        }
        public async Task<bool> AddFeature<T>(T parameters, string connString)
        {
            string sql = $@"Insert into HouseFeatures (HouseID, FeatureID) 
                        values (@HouseID, @FeatureID)";
                        
            

            using (IDbConnection connection = new SqlConnection(connString))
            {
                try
                {
                    connection.Open();
                    await connection.ExecuteAsync(sql, parameters);
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }


            }
        }
        public async Task<bool> EditHouse<T>(T parameters, string connString)
        {
            string sql = $@"update HouseDetails set Address = @Address, Price = @Price, ZillowUrl = @ZillowUrl, ImageUrl = @ImageUrl where HouseID = @HouseID";



            using (IDbConnection connection = new SqlConnection(connString))
            {
                try
                {
                    connection.Open();
                    await connection.ExecuteAsync(sql, parameters);
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }


            }
        }


        //public int DeleteHouse<T>(T parameters, string connString)
        //{
        //    string sql = "Delete From HouseDetails where ID = @HouseID";

        //    using (IDbConnection connection = new SqlConnection(connString))
        //    {
        //        connection.Open();
        //        return connection.Execute(sql, parameters);

        //    }
        //}

        public async Task<bool> DeleteHouse<T>(T parameters, string connString)
        {
          
            string sql = "Delete From HouseDetails where HouseID = @HouseID";
            string sql2 = "Delete From HouseFeatures where HouseID = @HouseID";
            int rows;
            try
            {
                using (IDbConnection connection = new SqlConnection(connString))
                {
                    connection.Open();
                    if (HasFeatures(parameters, connection))
                    {
                        //Begin transaction
                        if(connection.State != ConnectionState.Open)
                        {
                            connection.Open();
                        }
                        using (IDbTransaction transaction = connection.BeginTransaction())
                        {
                            try
                            {
                                rows = await connection.ExecuteAsync(sql, parameters, transaction);
                                rows = await connection.ExecuteAsync(sql2, parameters, transaction);
                                transaction.Commit();
                            }
                            catch (Exception ex)
                            {
                                transaction.Rollback();
                                Console.WriteLine($" Delete transaction cancelled. {ex.Message}");
                                throw new Exception(ex.Message, ex.InnerException);
                            }

                        }

                        return true;
                    }
                    else
                    {
                        //just delete house only
                        rows = await connection.ExecuteAsync(sql, parameters);
                        return true;
                    }

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Something went wrong deleting. {ex.Message}");
                return false;
            }
       
        }

        private bool HasFeatures<T>(T parameters, IDbConnection connection)
        {
            string sql = "Select Count (HouseID) From HouseFeatures where HouseID = @HouseID";
           
                object obj = connection.ExecuteScalar(sql, parameters);
                if (obj != null)
                {
                    int count = Convert.ToInt32(obj);
                    if (count > 1)
                    {
                        return true;
                    }
                }


            return false;
        }

        public Task<int> AddHouse<T>(T parameters, string connString)
        {
            throw new NotImplementedException();
        }
    }

}
