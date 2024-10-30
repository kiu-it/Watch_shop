using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class Brand
    {
        public int BrandId { get; set; }
        public string BrandName { get; set; }
        public string BrandDescription { get; set; }
        public Brand()
        {

        }
        public Brand(int brandId, string brandName, string brandDescription)
        {
            BrandId = brandId;
            BrandName = brandName;
            BrandDescription = brandDescription;
        }
    }
}