using DataAccess;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HouseHunting.Data
{
    public class MarkerModel : HouseObject
    {
        
        ////public MapPoint Point { get; set; }
        public string Name { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
        //private double latitude;
        //public double Latitude
        //{
        //    get
        //    {
        //        return latitude;
        //    }
        //    set
        //    {
        //        if (Point != null)
        //        {
        //            latitude = Point.Latitude;
        //        }
        //    }
        //}
        //private double longitude;
        //public double Longitude
        //{
        //    get
        //    {
        //        return longitude;
        //    }
        //    set
        //    {
        //        if(Point !=null)
        //        {
        //            longitude = Point.Longitude;
        //        }
        //    }
        //}


    }
}
