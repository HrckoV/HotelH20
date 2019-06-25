using System.Collections.Generic;
using System.Text;
using H20.Entities;
using Dapper;
using System.Data;

namespace H20.Data
{
    public class Rooms
    {
        
        public List <Room> GetRooms(IDbConnection conn, string hotel_id)
        {
            using (conn)
            {
                var rooms = conn.Query<Room>("dbo.GetRooms @Hotel_ID", new { Hotel_ID = int.Parse(hotel_id) }).AsList<Room>();

                conn.Close();

                return rooms;
            }
        }       
    }
}
