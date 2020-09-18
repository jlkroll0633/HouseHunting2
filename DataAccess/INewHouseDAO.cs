using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccess
{
    public interface INewHouseDAO
    {
        Task<bool> Add<T>(T parameters, string connString, string sql);
       
        Task<int> AddHouse<T>(string address, decimal price, string zillow, string image, string connString);
        Task<bool> Delete<T>(T parameters, string connString, string sql);
        Task<bool> DeleteHouse<T>(T parameters, string connString);
       
        Task<bool> Edit<T>(T parameters, string connString, string sql);
        Task<bool> EditHouseFeatures<T>(T parameters, string connString, string sql);
        Task<List<T>> Load<T, U>(U parameters, string connString, string sql);
        //Task<List<T>> LoadFeatures<T, U>(U parameters, string connString);
        //Task<List<T>> LoadFeaturesByHouse<T, U>(U parameters, string connString);
        //Task<List<T>> LoadHouseData<T, U>(U parameters, string connString);
       
        //Task UpdateHouse<T>(T parameters, string connString);
    }
}