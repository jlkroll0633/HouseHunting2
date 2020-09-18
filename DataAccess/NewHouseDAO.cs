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
        public async Task<List<T>> Load<T, U>(U parameters, string connString, string sql)
        {
            using (IDbConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                var rows = await connection.QueryAsync<T>(sql, parameters);

                return rows.ToList();
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
        public async Task<bool> Add<T>(T parameters, string connString, string sql)
        {
           
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
        public async Task<bool> Edit<T>(T parameters, string connString, string sql)
        {

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
        public async Task<bool> EditHouseFeatures<T>(T parameters, string connString, string sql)
        {

            using (IDbConnection connection = new SqlConnection(connString))
            {
                try
                {
                    connection.Open();
                    CommandType commandType = CommandType.StoredProcedure;
                    await connection.ExecuteAsync(sql, parameters);
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }


            }
        }

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

        public async Task<bool> Delete<T>(T parameters, string connString, string sql)
        {

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


    }

}
