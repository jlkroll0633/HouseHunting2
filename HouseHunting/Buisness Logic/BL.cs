using Microsoft.JSInterop;
using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Components;

namespace HouseHunting.Buisness_Logic
{
    public class BL : IBL
    {
        //public IJSRuntime JsRuntime;
        [Inject] public IJSRuntime JsRuntime { get; set; }
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

    }
}
