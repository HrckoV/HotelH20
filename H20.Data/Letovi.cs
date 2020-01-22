using Dapper;
using H20.Entities;
using System.Data;
using System;
using System.Collections.Generic;

namespace H20.Data
{
    public class Letovi
    {               

        public List<Let> DohvatiLetove(IDbConnection conn, string polazniLet, string dolazniLet, string datumPolaska, string datumDolaska, int brojPutnika, string valuta)
        {
            using (conn)
            {
                var let = conn.Query<Let>("dbo.DohvatiLetove " +
                    "@PolazniAerodrom,@OdredisniAerodrom,@DatumPolaska,@DatumPovratka,@BrojPutnika,@Valuta", new { PolazniAerodrom = polazniLet,OdredisniAerodrom = dolazniLet,
                                         DatumPolaska=datumPolaska,DatumPovratka=datumDolaska,BrojPutnika=brojPutnika,Valuta=valuta}).AsList<Let>();

                conn.Close();

                return let;
            }
        }       

    }

}

