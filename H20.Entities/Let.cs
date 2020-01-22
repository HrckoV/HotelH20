using System;
using System.Collections.Generic;
using System.Text;

namespace H20.Entities
{
    public class Let
    {
        public int ID { get; }

        public string PolazniAerodrom { get; set; }
        public string OdredisniAerodrom { get; set; }
        public string DatumPolaska { get; set; }
        public string DatumPovratka { get; set; }
        public int BrojPutnika { get; set; }
        public string Valuta { get; set; }
        public string Cijena { get; set; }
    }
}
