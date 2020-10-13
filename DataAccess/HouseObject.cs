using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Sockets;
using System.Runtime.CompilerServices;
using System.Text;

namespace DataAccess
{
    public class HouseObject
    {
        public int HouseID { get; set; }
       
        public string Address { get; set; }
        
        public decimal Price { get; set; }
        public List<FeatureObject> Features { get; set; } = new List<FeatureObject>();
        public double Score { get; set; }

        public string ZillowUrl { get; set; }
        public bool IsActive { get; set; }
        public string ImageUrl { get; set; }
        public string Notes { get; set; }

        public double GetScore()
        {
            if(Features.Count == 0)
            {
                return 0;
            }
            else
            {
                int score = 0;
                foreach(FeatureObject feat in Features)
                {
                    score += feat.Weight;
                }
                return score;
            }
        }
    }
}
