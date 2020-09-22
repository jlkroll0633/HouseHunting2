using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using HouseHunting.Data;
using Syncfusion.Blazor;
using DataAccess;
using HouseHunting.Buisness_Logic;

namespace HouseHunting
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddRazorPages();
            services.AddServerSideBlazor();
            services.AddSingleton<WeatherForecastService>();
            services.AddSyncfusionBlazor();
            services.AddSingleton<INewHouseDAO, NewHouseDAO>();
            services.AddSingleton<IBL, BL>();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            Syncfusion.Licensing.SyncfusionLicenseProvider.RegisterLicense("MzE1MzE1QDMxMzgyZTMyMmUzMGd0VW41NkU1blE5Nmxod0lVSGtmOGNjU3d0a243OTFlR3g5YnViSnpvWnc9;MzE1MzE2QDMxMzgyZTMyMmUzMEl1L0Z6cFJFUzNzR0dsMERLRVVYMDJHcmZwSkp4UGpKYThOUzExWk8ybjg9;MzE1MzE3QDMxMzgyZTMyMmUzMFZIWjNmdmE5OE12MS8rTktrMng4bGM5eTVEdVhOaG4rb2R1cGxPWGZvelk9;MzE1MzE4QDMxMzgyZTMyMmUzMFEwUHNzUzduRG1UYTZ3YnJnNFhhWXdETTBkR1k0L3dPN2ZWa1I2NFVUd0E9;MzE1MzE5QDMxMzgyZTMyMmUzME5GZTg4cC9Qekc2TjYrbmxsZnkvcDBDSkpFUGExREpwY09ob1haby9JYTg9");
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapBlazorHub();
                endpoints.MapFallbackToPage("/_Host");
            });
        }
    }
}
