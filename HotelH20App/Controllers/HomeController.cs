using H20.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HotelH20App.Controllers
{
    public class HomeController : Controller
    {
        EncryptDecrypt ed = new EncryptDecrypt();

        public ActionResult Index()
        {
            return View();
        }       

        public ActionResult Home()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

      
    }
}