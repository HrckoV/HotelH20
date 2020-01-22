using H20.Entities;
using H20.Data;
using System;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Configuration;

namespace HotelH20App.Controllers
{
    public class GuestController : Controller
    {

        SqlConnection conn = new SqlConnection();
       


        // GET: Guest
        public ActionResult Index()
        {          

            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Letovi()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Login(Guest guest)
        {
            if (Session["userName"] == null)
            {               
                Login userData = new Login();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

                var user = userData.UserData(conn,guest);

                if (user.Count == 0)
                {
                    ModelState.AddModelError("", "Korisničko ime ili lozinka pogrešni !");
                }
                else
                {
                    Session["userName"] = user[0].Guest_Username;
                    Session["userID"] = user[0].Guest_ID;

                    return RedirectToAction("Home");
                }
            }
            else
            {
                Session["userName"] = null;
               
            }

            return View();
        }

       
        public JsonResult DohvatiLetoviDolazni()
        {
            LetoviDolazni letData = new LetoviDolazni();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            var let = letData.DohvvatiLetDol(conn);

            return Json(let, JsonRequestBehavior.AllowGet);
        }


        public JsonResult DohvatiLetoviOdlazni()
        {
            LetoviOdlazni letData = new LetoviOdlazni();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            var let = letData.DohvvatiLetOdl(conn);

            return Json(let, JsonRequestBehavior.AllowGet);
        }


        public ActionResult LetoviTrazi(string polazniLet,string dolazniLet,string datumPolaska,string datumDolaska,int brojPutnika,string valuta,string gView)
        {
                      
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            var result = new List<Let>();
            

                Letovi letData = new Letovi();             

                List<Let> letGrid = letData.DohvatiLetove(conn, polazniLet, dolazniLet,  datumPolaska, datumDolaska, brojPutnika, valuta);
                letGrid.Sort(0, 0, null);
                result = letGrid;


                ViewBag.TotalRows = result.Count();
                
                
            
            return PartialView(gView, result);

        }
        
        public ActionResult Home()
        {
            if (Session["userName"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login");
            }
        }

        [AllowAnonymous]
        public ActionResult LogOut()
        {
            Session.Abandon();
            return RedirectToAction("Home", "Guest", null);
        }
    }

}
