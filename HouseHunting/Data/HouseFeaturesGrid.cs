using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HouseHunting.Data
{
    public class HouseFeaturesGrid
    {
        public int HouseID { get; set; }
        public int FeatureID { get; set; }
       
        public string Description { get; set; }
        public int Weight { get; set; }
        public bool IsEditable { get; set; }
    }
}
