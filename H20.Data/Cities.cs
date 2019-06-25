using System;
using H20.Entities;
using System.Collections.Generic;
using System.Text;
using Dapper;
using System.Data;

namespace H20.Data
{
    public class Cities
    {
        
        public IEnumerable<City> GetCity(IDbConnection conn)
        {
            using (conn)
            {
                var cities = conn.Query<City>("dbo.GetCity").AsList<City>();

                conn.Close();

                return cities;
            }            
        }
    }
}
