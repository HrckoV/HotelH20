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

        public ActionResult Booking()
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

       
        public JsonResult GetCity()
        {
            Cities cityData = new Cities();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            var city = cityData.GetCity(conn);

            return Json(city, JsonRequestBehavior.AllowGet);
        }

      
        public JsonResult GetHotel(string city_id)
        {
            Hotels hotelData = new Hotels();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;


            var hotel = hotelData.GetHotel(conn,city_id);

            return Json(hotel, JsonRequestBehavior.AllowGet);
        }


     
        public ActionResult BookingSearch(string hotel_id,string hotelName,string gView)
        {
                      
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            var result = new List<Room>();

            if (hotel_id != null)
            {

                Rooms roomData = new Rooms();             

                List<Room> roomGrid = roomData.GetRooms(conn, hotel_id);
                roomGrid.Sort(0, 0, null);
                result = roomGrid;


                ViewBag.TotalRows = result.Count();
                ViewBag.HotelName = hotelName;
                
            }

            return PartialView(gView, result);

        }

        public ActionResult BookedRoomSearch(string gView)
        {
            int guestID = int.Parse(Session["userID"].ToString());

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            IEnumerable<Booking> result = Enumerable.Empty<Booking>(); 

            if (guestID != 0)
            {

                Bookings roomData = new Bookings();

                IEnumerable<Booking> roomGrid = roomData.GetBookedRooms(conn, guestID);               

                result = roomGrid;


                ViewBag.TotalRows = result.Count();
               

            }

            return PartialView(gView, result);

        }

        public void BookingSave(int room_id, decimal price, DateTime dateTo, DateTime dateFrom)
        {
            var book = new Bookings();
            int guest_id = int.Parse(Session["userID"].ToString());

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;
            
            try
            {
                book.SaveBooking(conn, guest_id,room_id, price, dateTo, dateFrom);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message + ' ' + ex.Source);
            }
        }

        public void BookingUpdate(int book_id,decimal price, DateTime dateFrom, DateTime dateTo)
        {
            var book = new Bookings();          

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            try
            {
                book.UpdateBooking(conn,book_id,price, dateTo, dateFrom);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message + ' ' + ex.Source);
            }
        }

        public void DeleteBooking(int bookingID)
        {
            var book = new Bookings();

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["DbConnection"].ConnectionString;

            try
            {
                book.DeleteBooking(conn, bookingID);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message + ' ' + ex.Source);
            }
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
