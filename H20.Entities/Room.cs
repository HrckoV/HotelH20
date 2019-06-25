using System;
using System.Collections.Generic;
using System.Text;

namespace H20.Entities
{
    public class Room
    {
        public int Room_ID { get; set; }
        public string Name { get; set; }
        public int Number_Of_Beds { get; set; }
        public string Price_Per_Night { get; set; }
    }
}
