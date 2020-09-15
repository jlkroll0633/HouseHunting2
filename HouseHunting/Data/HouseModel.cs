using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace HouseHunting.Data
{
    public class HouseModel
    {
        [Required]
        public string Address { get; set; }
        [Required]
        public decimal Price { get; set; }
        [Required]
        [Url]
        public string ZillowUrl { get; set; }
        [Required]
        public string ImageUrl { get; set; }
    }
}
