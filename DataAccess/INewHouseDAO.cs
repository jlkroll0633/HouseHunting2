using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccess
{
    public interface INewHouseDAO
    {
        Task<bool> AddAsync<T>(T parameters, string connString, string sql);
       

        Task<int> AddHouseAsync<T>(string address, decimal price, string zillow, string image, string connString, bool isActive);
        Task<bool> DeleteAsync<T>(T parameters, string connString, string sql);
        Task<bool> DeleteHouseAsync<T>(T parameters, string connString);
       
        Task<bool> EditAsync<T>(T parameters, string connString, string sql);
        Task<bool> EditHouseFeaturesAsync<T>(T parameters, string connString, string sql);
        Task<List<T>> Load<T, U>(U parameters, string connString, string sql);
        
        //Task<List<T>> LoadFeatures<T, U>(U parameters, string connString);
        //Task<List<T>> LoadFeaturesByHouse<T, U>(U parameters, string connString);
        //Task<List<T>> LoadHouseData<T, U>(U parameters, string connString);

        //Task UpdateHouse<T>(T parameters, string connString);
    }
}