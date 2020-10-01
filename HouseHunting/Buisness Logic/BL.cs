using Microsoft.JSInterop;
using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Components;
using DataAccess;
using System.Collections.Generic;

namespace HouseHunting.Buisness_Logic
{
    public class BL : IBL
    {
        //public IJSRuntime JsRuntime;
        //[Inject] public IJSRuntime JsRuntime { get; set; }

        IJSRuntime JsRuntime;
        INewHouseDAO newHouseDAO;
        public string GenerateStackTrace(Exception ex)
        {
            var inner = ex.InnerException;
            string stackTrace = string.Empty;
            while (inner != null)
            {
                //keeps writing multi layer stack traces
                //Debug.Write(inner.StackTrace);
                stackTrace += inner.StackTrace;
                inner = inner.InnerException;
            }
            return stackTrace;
        }
        public async Task NavigateToUrlAsync(string url)
        {
            //WebBroswer.Navigate(url);
            await JsRuntime.InvokeAsync<object>("open", url, "_blank");
            
            
                //_logger.LogWarning(ex, "Warning navigating to url {Time}", DateTime.UtcNow);
                //string stackTrace = _ibl.GenerateStackTrace(ex);
            

        }
        public async Task<bool> AddHouseFeature(FeatureObject newFeature, int houseID, string connString)
        {
            ////bool result;
            ////string sql = "spGetFeatureWeight";
            //////TODO make another signiture for one item?
            ////List<int> weight = await newHouseDAO.Load<int,dynamic>(new { }, connString, sql);
            ////sql = "spInsertNewHouseFeature";
            //////if user entered weight matches whats in the features table, do not oerride default weight
            //////if (weight[0] == newFeature.Weight)
            //////{
            //////    result = await newHouseDAO.EditAsync<dynamic>(new { Weight = newFeature.Weight, FeatureID = newFeature.FeatureID, HouseID = houseID }, connString, sql);
            //////}
            //////else
            //////{
            //////    result = await newHouseDAO.EditAsync<dynamic>(new { FeatureID = newFeature.FeatureID, HouseID = houseID }, connString, sql);
            //////}

            
           
           
            return true;
        }

    }
}
