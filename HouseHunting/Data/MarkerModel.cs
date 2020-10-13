using DataAccess;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HouseHunting.Data
{
    public class MarkerModel : HouseObject
    {
        
        public string Name { get; set; }
        public double Latitude { get; set; }
        public double Longitude { get; set; }
      

    }
}
