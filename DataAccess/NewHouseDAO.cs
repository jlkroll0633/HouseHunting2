using Dapper;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace DataAccess
{

    public class NewHouseDAO : INewHouseDAO
    {
        public async Task<List<T>> LoadData<T, U>(string sql, U parameters, string connString)
        {
            using (IDbConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                var rows = await connection.QueryAsync<T>(sql, parameters);

                return rows.ToList();
            }
        }
        public Task SaveData<T>(string sql, T parameters, string connString)
        {

            using (IDbConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                return connection.ExecuteAsync(sql, parameters);

            }
        }
        public List<HouseObject> GetData(string sql, string con)
        {
            List<HouseObject> data = new List<HouseObject>();
            HouseObject house;
            using (var connection = new SqlConnection(con))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {

                            while (dr.Read())
                            {

                            }
                        }

                    }
                }

            }
            return data;
        }


    }

}
