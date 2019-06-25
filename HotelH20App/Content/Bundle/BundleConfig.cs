using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace HotelH20App.Content.Bundle
{
    public class BundleConfig
    {
        
            internal static void RegisterBundles(BundleCollection bundles)
            {
                bundles.Add(
                    new StyleBundle("~/Content").Include(                       
                        "~/Content/LoginStyle.css"
                    ));

                bundles.Add(
                    new ScriptBundle("~/hr/bundles/hrJs").Include(
                        "~/Scripts/jquery-3.3.1.min.js"                       
                    ));
            }
        
    }
}