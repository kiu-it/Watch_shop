using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class Shipment
    {
        public int ShipmentId { get; set; }
        public string ShipmentAddress { get; set; }
        public string ShipmentCity { get; set; }
        public string ShipmentCountry { get; set; }
        public DateTime ShipmentDate { get; set; }
    }

}