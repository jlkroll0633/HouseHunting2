using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess
{
    public class HouseObject
    {
        public int ID { get; set; }
        public string Address { get; set; }
        public decimal Price { get; set; }
        //public List<Features> Features { get; set; }
        //public double Score { get; set; }
        public string Status { get; set; }
        public int DaysListed { get; set; }
        public string ZillowUrl { get; set; }
        public string ImageUrl { get; set; }
    }
}
