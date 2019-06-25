using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.Entity;

namespace H20.Data
{
    public class Services
    {
        public static IDbConnection ConnectToDB()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString =
            "Data Source=LAPTOP-QVQ8QR1I;" +
            "Initial Catalog=HotelH20;" +
            "Integrated Security=SSPI;";
            conn.Open();

            return conn;

        }

    }
}
