using DataAccess;
using HouseHunting.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace HouseHunting
{
    public interface IBL
    {
        Task<bool> AddFeatureToHouse(FeatureObject feature, FeatureObject sqlFeature, HouseObject house);
        Task<int> AddNewHouse(HouseObject house);
        Task<bool> DeleteFeatureFromHouse(HouseObject house, FeatureObject feature);
        Task<bool> DeleteHouse(int house);
        Task<bool> EditHouseDetails(HouseObject house);
        Task<bool> EditHouseFeatures(FeatureObject feature, FeatureObject sqlFeature, HouseObject house);
        string GenerateStackTrace(Exception ex);
       
       
        Task<List<HouseObject>> GetAllHouseList(bool activeOnly = false);
        Task<List<FeatureObject>> GetAllUniqueFeatures();
        Task<List<FeatureObject>> GetFeatureByFeatureID(FeatureObject feature);
        Task<List<MarkerModel>> GetHousesWithMapMarkers();
    }
}
