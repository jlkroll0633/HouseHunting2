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
        
        string GenerateStackTrace(Exception ex);
        Task NavigateToUrlAsync(string url);
        
    }
}
