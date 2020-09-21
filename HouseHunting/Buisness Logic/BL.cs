using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace HouseHunting.Buisness_Logic
{
    public class BL : IBL
    {
        public void GenerateStackTrace(Exception ex)
        {
            var inner = ex.InnerException;
            while (inner != null)
            {
                //keeps writing multi layer stack traces
                Debug.Write(inner.StackTrace);
                inner = inner.InnerException;
            }
        }

    }
}
