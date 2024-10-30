using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class OrderDetailItem
    {
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public decimal ProductPrice { get; set; }
        public string ShipmentAddress { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
    }
}