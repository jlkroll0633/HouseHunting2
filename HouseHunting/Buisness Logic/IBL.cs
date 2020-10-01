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
        Task<bool> AddHouseFeature(FeatureObject newFeature, int HouseID, string connString);
        string GenerateStackTrace(Exception ex);
        Task NavigateToUrlAsync(string url);
        
    }
}
