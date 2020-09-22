using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace HouseHunting.Buisness_Logic
{
    public class BL : IBL
    {
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

    }
}
