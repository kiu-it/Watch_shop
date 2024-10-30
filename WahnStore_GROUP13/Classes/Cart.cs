using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class Cart
    {
        public int CartId { get; set; }
        public int CustomerId { get; set; }
        public DateTime CreatedDate { get; set; }
        public List<CartItem> Items { get; set; }

        public Cart()
        {
            Items = new List<CartItem>();
        }
    }
}