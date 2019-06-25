using System;
using System.Collections.Generic;
using System.Text;
using H20.Entities;
using Dapper;
using System.Data;

namespace H20.Data
{
    public class Hotels
    {
       
        public IEnumerable<Hotel> GetHotel(IDbConnection conn, string city_id)
        {
            using (conn)
            {
                var hotel = conn.Query<Hotel>("dbo.GetHotelForCity @City_ID", new { City_ID = int.Parse(city_id) }).AsList<Hotel>();

                conn.Close();

                return hotel;
               
            }
        }
    }
}
