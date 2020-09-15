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
        public async Task<List<T>> LoadFeatureData<T, U>(U parameters, string connString)
        {
            string sql = "select HouseID, FeatureID AS ID, Name, Description, Weight from HouseFeatures Left Join Features On HouseFeatures.FeatureID = Features.ID where HouseID = @ID";
            using (IDbConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                var rows = await connection.QueryAsync<T>(sql, parameters);

                return rows.ToList();
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
                        select @ID @@IDENTITY";
            var p = new DynamicParameters();
            p.Add("@ID", 0, DbType.Int32, ParameterDirection.Output);
            p.Add("@Address", address);
            p.Add("@Price", price);
            p.Add("@ZillowUrl", zillow);
            p.Add("@ImageUrl", image);

            using (IDbConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                connection.Execute(sql, p);
                int newID = p.Get<int>("@ID");
                return newID;

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

        public async Task<int> DeleteHouse<T>(T parameters, string connString)
        {
            string sql = "Delete From HouseDetails where ID = @HouseID";

            using (IDbConnection connection = new SqlConnection(connString))
            {
                int rows = await connection.ExecuteAsync(sql, parameters);
                return rows;



            }
        }

        public Task<int> AddHouse<T>(T parameters, string connString)
        {
            throw new NotImplementedException();
        }
    }

}
