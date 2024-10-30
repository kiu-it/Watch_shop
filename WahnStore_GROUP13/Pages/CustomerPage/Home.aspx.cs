using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBestSellingProducts();
                LoadLatestProducts();
            }
        }

        private void LoadBestSellingProducts()
        {
            try
            {
                var dataProduct = new DataProduct();
                var bestSellingProducts = dataProduct.GetTop5BestSellingProducts();

                ListView1.DataSource = bestSellingProducts;
                ListView1.DataBind();
            }
            catch (Exception ex)
            {
                // Xử lý lỗi và thông báo lỗi đến người dùng hoặc ghi vào log
                Console.WriteLine("Error loading best-selling products: " + ex.Message);
            }
        }

        private void LoadLatestProducts()
        {
            try
            {
                var dataProduct = new DataProduct();
                var latestProducts = dataProduct.GetTop4LatestProducts();

                ListView2.DataSource = latestProducts;
                ListView2.DataBind();
            }
            catch (Exception ex)
            {
                // Xử lý lỗi và thông báo lỗi đến người dùng hoặc ghi vào log
                Console.WriteLine("Error loading latest products: " + ex.Message);
            }
        }

    }
}