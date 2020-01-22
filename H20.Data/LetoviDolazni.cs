using System;
using H20.Entities;
using System.Collections.Generic;
using System.Text;
using Dapper;
using System.Data;

namespace H20.Data
{
    public class LetoviDolazni
    {
        
        public IEnumerable<LetDolazni> DohvvatiLetDol(IDbConnection conn)
        {
            using (conn)
            {
                var letDol = conn.Query<LetDolazni>("dbo.DohvatiLetDol").AsList<LetDolazni>();

                conn.Close();

                return letDol;
            }            
        }
    }
}
