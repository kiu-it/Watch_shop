using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class OrderItem
    {
        public int OrderItemId { get; set; }
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
    }
}