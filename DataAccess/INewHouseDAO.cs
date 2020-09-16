using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccess
{
    public interface INewHouseDAO
    {
        Task<int> AddHouse<T>(T parameters, string connString);
        Task<int> AddHouse<T>(string address, decimal price, string zillow, string image, string connString);

        Task<bool> DeleteHouse<T>(T parameters, string connString);
       
        Task<List<T>> LoadFeatureData<T, U>(U parameters, string connString);
        Task<List<T>> LoadHouseData<T, U>(U parameters, string connString);
       
        Task UpdateHouse<T>(T parameters, string connString);
    }
}