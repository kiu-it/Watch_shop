using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    [Serializable]
    public class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public decimal ProductPrice { get; set; }
        public int ProductQuantity { get; set; }
        public string ProductOrigin { get; set; }
        public decimal ProductDiameter { get; set; }
        public decimal ProductThickness { get; set; }
        public string ProductWarrantyPeriod { get; set; }
        public string ProductImage { get; set; }
        public int GenderId { get; set; }
        public string ProductGlass { get; set; }
        public int BrandId { get; set; }
        public string ProductColor { get; set; }
        public string ProductStrap { get; set; }
        public DateTime ProductCreatedDate { get; set; }

        public Product()
        {

        }
        public Product(string productName, string productDescription, decimal productPrice, int productQuantity, string productOrigin, decimal productDiameter, decimal productThickness, string productWarrantyPeriod, string productImage, int genderId, string productGlass, int brandId, string productColor, string productStrap, DateTime productCreatedDate)
        {

            ProductName = productName;
            ProductDescription = productDescription;
            ProductPrice = productPrice;
            ProductQuantity = productQuantity;
            ProductOrigin = productOrigin;
            ProductDiameter = productDiameter;
            ProductThickness = productThickness;
            ProductWarrantyPeriod = productWarrantyPeriod;
            ProductImage = productImage;
            GenderId = genderId;
            ProductGlass = productGlass;
            BrandId = brandId;
            ProductColor = productColor;
            ProductStrap = productStrap;
            ProductCreatedDate = productCreatedDate;
        }
        public Product(int productId, string productName, string productDescription, decimal productPrice, int productQuantity, string productOrigin, decimal productDiameter, decimal productThickness, string productWarrantyPeriod, string productImage, int genderId, string productGlass, int brandId, string productColor, string productStrap, DateTime productCreatedDate)
        {
            ProductId = productId;
            ProductName = productName;
            ProductDescription = productDescription;
            ProductPrice = productPrice;
            ProductQuantity = productQuantity;
            ProductOrigin = productOrigin;
            ProductDiameter = productDiameter;
            ProductThickness = productThickness;
            ProductWarrantyPeriod = productWarrantyPeriod;
            ProductImage = productImage;
            GenderId = genderId;
            ProductGlass = productGlass;
            BrandId = brandId;
            ProductColor = productColor;
            ProductStrap = productStrap;
            ProductCreatedDate = productCreatedDate;
        }
    }
}
    