using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class BestSeller : System.Web.UI.Page
    {
        DataProduct dataProduct = new DataProduct();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Product> Products = dataProduct.GetTop5BestSellingProducts();
                Repeater1.DataSource = Products;
                Repeater1.DataBind();
            }
        }
        protected void xemChiTiet_Click(object sender, CommandEventArgs e)
        {

            int product_id = Convert.ToInt32(e.CommandArgument.ToString());
            Product product = dataProduct.GetProductById(product_id);
            Session["product"] = product;
            Response.Redirect(ResolveUrl("~/Pages/AdminPage/ProductDeatails.aspx"));

        }
    }
}