using Microsoft.JSInterop;
using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Components;
using DataAccess;
using System.Collections.Generic;
using HouseHunting.Data;
using Microsoft.Extensions.Configuration;
using System.Data.SqlTypes;
using Syncfusion.Blazor.Maps;
using Microsoft.Extensions.Logging;

namespace HouseHunting.Buisness_Logic
{
    public class BL : IBL
    {
        private readonly ILogger _logger;
        private string _connString;
        //public IJSRuntime JsRuntime { get; set; }
        public INewHouseDAO DAO { get; set; }

        public BL(INewHouseDAO newHouseDAO, IConfiguration Config, ILoggerFactory logger)
        {
            DAO = newHouseDAO;
            _connString = Config.GetConnectionString("defaultWork");
            _logger = logger.CreateLogger("MarkerModel");
        }
       


        public string GenerateStackTrace(Exception ex)
        {
            var inner = ex.InnerException;
            string stackTrace = string.Empty;
            while (inner != null)
            {
                stackTrace += inner.StackTrace;
                inner = inner.InnerException;
            }
            return stackTrace;
        }
       
       public async Task<List<HouseObject>> GetAllHouseList(bool activeOnly = false)
        {
            string sql;
            if (activeOnly) sql = "spGetAllActiveHouseDetails";
            else sql = "spGetAllHouseDetails";

            List<HouseObject> houseObjectList = await DAO.Load<HouseObject, dynamic>(new { }, _connString, sql);

            foreach (HouseObject house in houseObjectList)
            {
                sql = "spGetFeaturesByHouseID";
                List<FeatureObject>  Features = await DAO.Load<FeatureObject, dynamic>(new { house.HouseID }, _connString, sql);

                house.Features.AddRange(Features);
                house.Score = house.GetScore();

            }
            return houseObjectList;
        }
       
        public async Task<List<FeatureObject>> GetAllUniqueFeatures()
        {
            string sql = "spGetAllFeatures";
            List<FeatureObject> features = await DAO.Load<FeatureObject, dynamic>(new { }, _connString, sql);
            return features;
        }

        public async Task<bool> EditHouseDetails(HouseObject house)
        {
            string sql= "spUpdateHouseDetails";
            bool isEdited = await DAO.EditAsync<dynamic>(new { Address = house.Address, Price = house.Price, ZillowUrl = house.ZillowUrl, ImageUrl = house.ImageUrl, HouseID = house.HouseID, IsActive = house.IsActive, Notes = house.Notes }, _connString, sql);
            return isEdited;
        }
        public async Task<int> AddNewHouse(HouseObject house)
        {
            int newId = await DAO.AddHouseAsync<HouseObject>(house.Address, house.Price, house.ZillowUrl, house.ImageUrl, _connString, house.IsActive);
            return newId;
        }
        public async Task<bool> DeleteHouse(int houseId)
        {
            bool isDeleted = await DAO.DeleteHouseAsync<dynamic>(new { HouseID = houseId }, _connString);
            return isDeleted;
        }
        public async Task<bool> EditHouseFeatures(FeatureObject feature, FeatureObject sqlFeature, HouseObject house)
        {
            string sql = "spEditFeatureWeight";
            bool result;
            if (sqlFeature.IsEditable)
            {
                if (sqlFeature.Weight == feature.Weight)
                {
                    result = await DAO.EditAsync<dynamic>(new { Weight = (string)null, FeatureID = feature.FeatureID, HouseID = house.HouseID }, _connString, sql);
                }
                else
                {
                    result = await DAO.EditAsync<dynamic>(new { Weight = feature.Weight, FeatureID = feature.FeatureID, HouseID = house.HouseID }, _connString, sql);
                }
            }
            else
            {
                result = await DAO.EditAsync<dynamic>(new { Weight = (string)null, FeatureID = feature.FeatureID, HouseID = house.HouseID }, _connString, sql);
            }
            return result;
        }
        public async Task<bool> AddFeatureToHouse(FeatureObject feature, FeatureObject sqlFeature,HouseObject house)
        {
            string sql = "spInsertNewHouseFeature";
            bool result;
            if (sqlFeature.IsEditable)
            {
                result = await DAO.AddAsync<dynamic>(new { HouseID = house.HouseID, FeatureID = feature.FeatureID, Weight = feature.Weight }, _connString, sql);

            }
            else
            {
                result = await DAO.AddAsync<dynamic>(new { HouseID = house.HouseID, FeatureID = feature.FeatureID, Weight = (string)null }, _connString, sql);
            }
            return result;
        }
        public async Task<bool> DeleteFeatureFromHouse(HouseObject house, FeatureObject feature)
        {
            string sql = "spDeleteFeatureByHouseID";
            bool isDeleted = await DAO.DeleteAsync<dynamic>(new { HouseID = house.HouseID, FeatureID = feature.FeatureID }, _connString, sql);
            return isDeleted;
        }
        public async Task<List<MarkerModel>> GetHousesWithMapMarkers()
        {
            
            string sql = "spGetAllActiveHouseDetails";
            List<MarkerModel> toBeRemoved = new List<MarkerModel>();
            List<MarkerModel> mapMarkers = await DAO.Load<MarkerModel, dynamic>(new { }, _connString, sql);
            //mapMarkers = await DAO.Load<MarkerModel, dynamic>(new { }, _connString, sql);


            foreach (MarkerModel marker in mapMarkers)
            {

                sql = "spGetFeaturesByHouseID";
                List<FeatureObject> Features = await DAO.Load<FeatureObject, dynamic>(new { HouseID = marker.HouseID }, _connString, sql);
                sql = "spGetMapMarkerByHouseID";
                marker.Features.AddRange(Features);
                marker.Score = marker.GetScore();
                List<MarkerModel> location = new List<MarkerModel>();
                location = await DAO.Load<MarkerModel, dynamic>(new { HouseID = marker.HouseID }, _connString, sql);
                if (location.Count == 0)
                {
                    toBeRemoved.Add(marker);
                   
                }
                else
                {
                    marker.Latitude = location[0].Latitude;
                    marker.Longitude = location[0].Longitude;
                    marker.Name = marker.HouseID.ToString();
                }

            }

            if (toBeRemoved.Count > 0)
            {
                
                foreach (MarkerModel mm in toBeRemoved)
                {
                    mapMarkers.Remove(mm);
                    _logger.LogWarning($"no locations for house ID: {mm.HouseID}", mm);
                }
                
            }
           
            return mapMarkers;

        }
        public async Task<List<FeatureObject>> GetFeatureByFeatureID(FeatureObject feature)
        {
            string sql = "spGetFeatureByFeatureID";
            List<FeatureObject> sqlFeatures = await DAO.Load<FeatureObject, dynamic>(new { FeatureID = feature.FeatureID }, _connString, sql);
            return sqlFeatures;
        }

    }
}
