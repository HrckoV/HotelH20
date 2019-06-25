using System;
using System.Collections.Generic;
using System.Text;

namespace H20.Entities
{
    public class Booking
    {
        public int Booking_ID { get; }
        public int Guest_ID { get; set; }
        public int Room_ID { get; set; }
        public string Hotel { get; set; }
        public string Room { get; set; }
        public int Number_Of_Beds { get; set; }
        public decimal Price_Per_Night { get; set; }
        public string DateTo { get; set; }
        public string DateFrom { get; set; }
        public string Price { get; set; }
    }
}
