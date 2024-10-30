using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class Order
    {
        public int OrderId { get; set; }
        public int CustomerId { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
        public string OrderStatus { get; set; }
        public int ShipmentId { get; set; }
        public string ShipmentAddress { get; set; }
        public string ShipmentCity { get; set; }
        public string ShipmentCountry { get; set; }
        public DateTime ShipmentDate { get; set; }
    }
}