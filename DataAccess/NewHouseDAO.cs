using Dapper;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.ExceptionServices;
using System.Threading.Tasks;

namespace DataAccess
{

    public class NewHouseDAO : INewHouseDAO
    {
        public async Task<List<T>> Load<T, U>(U parameters, string connString, string sql)
        {
            try
            {
                //AnotherMethod();
                //throw new Exception("TEST");
                using (IDbConnection connection = new SqlConnection(connString))
                {
                    connection.Open();
                    var rows = await connection.QueryAsync<T>(sql, parameters, null, null, CommandType.StoredProcedure);

                    return rows.ToList();
                }
            }
            catch (Exception ex)
            {
                ExceptionDispatchInfo.Capture(ex).Throw();
                throw;
                //throw new Exception($"Problem exectuing stored proc: {sql}", ex);
            }

        }

        private void AnotherMethod()
        {
            throw new Exception("TEST");
        }

        public async Task<int> AddHouseAsync<T>(string address, decimal price, string zillow, string image, string connString)
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
                    await connection.ExecuteAsync(sql, p, null, null, CommandType.StoredProcedure);
                    int newID = p.Get<int>("@HouseID");
                    return newID;
                }
                catch (Exception ex)
                {
                    ExceptionDispatchInfo.Capture(ex).Throw();
                    throw;
                    //throw new Exception($"Could not add house using stored proc: {sql}.", ex);
                }


            }
        }
        public async Task<bool> AddAsync<T>(T parameters, string connString, string sql)
        {

            using (IDbConnection connection = new SqlConnection(connString))
            {
                try
                {
                    connection.Open();
                    await connection.ExecuteAsync(sql, parameters, null, null, CommandType.StoredProcedure);
                    return true;
                }
                catch (Exception ex)
                {
                    ExceptionDispatchInfo.Capture(ex).Throw();
                    throw;
                    //throw new Exception($"Problem executing stored proc: {sql}", ex);
                }


            }
        }
        public async Task<bool> EditAsync<T>(T parameters, string connString, string sql)
        {

            using (IDbConnection connection = new SqlConnection(connString))
            {
                try
                {
                    connection.Open();
                await connection.ExecuteAsync(sql, parameters, null, null, CommandType.StoredProcedure);
                return true;
                }
                catch (Exception ex)
                {
                    ExceptionDispatchInfo.Capture(ex).Throw();
                    throw;
                }


            }
        }
        public async Task<bool> EditHouseFeaturesAsync<T>(T parameters, string connString, string sql)
        {

            using (IDbConnection connection = new SqlConnection(connString))
            {
                try
                {
                    connection.Open();
                    await connection.ExecuteAsync(sql, parameters, null, null, CommandType.StoredProcedure);
                    return true;
                }
                catch (Exception ex)
                {
                    ExceptionDispatchInfo.Capture(ex).Throw();
                    throw;
                    //throw new Exception($"Could not edit house using stored proc: {sql}", ex);
                }


            }
        }

        public async Task<bool> DeleteHouseAsync<T>(T parameters, string connString)
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
                        if (connection.State != ConnectionState.Open)
                        {
                            connection.Open();
                        }
                        using (IDbTransaction transaction = connection.BeginTransaction())
                        {

                            rows = await connection.ExecuteAsync(sql2, parameters, transaction);
                            rows = await connection.ExecuteAsync(sql, parameters, transaction);
                            transaction.Commit();

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
                ExceptionDispatchInfo.Capture(ex).Throw();
                throw;
                //throw new Exception($"Delete transaction cancelled.", ex);
            }

        }

        private bool HasFeatures<T>(T parameters, IDbConnection connection)
        {
            string sql = "Select Count (HouseID) From HouseFeatures where HouseID = @HouseID";

            object obj = connection.ExecuteScalar(sql, parameters);
            if (obj != null)
            {
                int count = Convert.ToInt32(obj);
                if (count > 0)
                {
                    return true;
                }
            }


            return false;
        }

        public async Task<bool> DeleteAsync<T>(T parameters, string connString, string sql)
        {
            //TODO does this need to be async?
            bool isDeleted = false;
            try
            {
                using (IDbConnection connection = new SqlConnection(connString))
                {

                    connection.Open();
                    await connection.ExecuteAsync(sql, parameters, null, null, CommandType.StoredProcedure);
                    isDeleted = true;
                }
            }
            catch (Exception ex)
            {
                ExceptionDispatchInfo.Capture(ex).Throw();
                throw;
                //throw new Exception($"Problem executing stored proc: {sql}.", ex);
            }
            return isDeleted;

        }


    }

}
