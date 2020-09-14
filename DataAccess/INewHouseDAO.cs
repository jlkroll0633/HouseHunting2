using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataAccess
{
    public interface INewHouseDAO
    {
        List<HouseObject> GetHouseData(string sql, string con);
        List<FeatureObject> GetHouseFeatures(string sql, string con);
        Task SaveData<T>(string sql, T parameters, string connString);
    }
}