using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class ManageBrand : System.Web.UI.Page
    {
        DataBrand dataBrand = new DataBrand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HienThi();
            }
        }
        private void HienThi()
        {
            tlbBrand.DataSource = dataBrand.dsBrand();
            DataBind();
        }
        protected void btnXoa_Click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                int brandId = Convert.ToInt16(e.CommandArgument);
                Boolean boolean = dataBrand.DeleteBrand(brandId);
                if (boolean == true)
                {
                    HienThi();
                }
                else
                {
                    Console.WriteLine("Có lỗi xảy ra");
                }

            }

        }
        protected void btnCapNhat_Click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "capNhat")
            {
                int brandId = Convert.ToInt16(e.CommandArgument);
                Brand brand = dataBrand.getBrandById(brandId);
                Session["brand"] = brand;
                Response.Redirect("~/Pages/AdminPage/UpdateBrand.aspx");
            }

        }
    }
}