using Dapper;
using H20.Entities;
using System.Data;
using System;
using System.Collections.Generic;

namespace H20.Data
{
    public class Bookings
    {

        public void SaveBooking(IDbConnection conn, int guest_id, int room_id, decimal price, DateTime dateTo, DateTime dateFrom)
        {
            using (conn)
            {
                var guest = conn.Query<Booking>("dbo.SaveBooking @Guest_ID,@Room_ID,@Date_From,@Date_To,@Price ", new
                {
                    Guest_ID = guest_id,
                    Room_ID = room_id,
                    Date_To = dateTo,
                    Date_From = dateFrom,
                    Price = price
                });

                conn.Close();              
            }

        }

        public IEnumerable<Booking> GetBookedRooms(IDbConnection conn, int guestID)
        {
            using (conn)
            {
                var rooms = conn.Query<Booking>("dbo.GetBookedRooms @GuestID", new { GuestID = guestID }).AsList<Booking>();

                conn.Close();

                return rooms;
            }
        }

        public void UpdateBooking(IDbConnection conn,int book_id,decimal price, DateTime dateTo, DateTime dateFrom)
        {
            using (conn)
            {
                var guest = conn.Query<Booking>("dbo.UpdateBooking @Booking_ID,@Price, @Date_From,@Date_To ", new
                {
                    Booking_ID = book_id,     
                    Price = price,
                    Date_To = dateTo,
                    Date_From = dateFrom
                }) ;

                conn.Close();
            }

        }

        public void DeleteBooking(IDbConnection conn, int booking_id)
        {
            using (conn)
            {
                var guest = conn.Query<Booking>("dbo.DeleteBooking @Booking_ID", new
                {
                    Booking_ID = booking_id
                });

                conn.Close();
            }

        }

    }

}

