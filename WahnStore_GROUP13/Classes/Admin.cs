using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class Admin
    {
        public int AdminId { get; set; }
        public string AdFullName { get; set; }
        public string AdEmail { get; set; }
        public string AdPhone { get; set; }
        public string AdUsername { get; set; }
        public string AdPassword { get; set; }
        public string AdAddress { get; set; }
        public string AdAvatar { get; set; }
        public DateTime CreatedDate { get; set; }
        public int GenderId { get; set; }

        public Admin()
        {

        }
    }
}