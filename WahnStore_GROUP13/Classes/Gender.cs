using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class Gender
    {
        public int GenderId { get; set; }
        public string GenderName { get; set; }

        public Gender() { }
        public Gender(int genderId, string genderName)
        {
            this.GenderId = genderId;
            this.GenderName = genderName;
        }
    }
}