using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccess
{
    public interface INewHouseDAO
    {
        Task<bool> AddFeature<T>(T parameters, string connString);
        Task<int> AddHouse<T>(T parameters, string connString);
        Task<int> AddHouse<T>(string address, decimal price, string zillow, string image, string connString);

        Task<bool> DeleteHouse<T>(T parameters, string connString);
        Task<bool> EditHouse<T>(T parameters, string connString);
        Task<List<T>> LoadFeatures<T, U>(U parameters, string connString);
        Task<List<T>> LoadFeaturesByHouse<T, U>(U parameters, string connString);
        Task<List<T>> LoadHouseData<T, U>(U parameters, string connString);
       
        Task UpdateHouse<T>(T parameters, string connString);
    }
}