using System;
using H20.Entities;
using System.Collections.Generic;
using System.Text;
using Dapper;
using System.Data;

namespace H20.Data
{
    public class LetoviOdlazni
    {
        
        public IEnumerable<LetOdlazni> DohvvatiLetOdl(IDbConnection conn)
        {
            using (conn)
            {
                var letOdl = conn.Query<LetOdlazni>("dbo.DohvatiLetOdl").AsList<LetOdlazni>();

                conn.Close();

                return letOdl;
            }            
        }
    }
}
