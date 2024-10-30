using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class AddBrand : System.Web.UI.Page
    {
        DataBrand dataBrand = new DataBrand();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            Brand brand = new Brand();
            brand.BrandName = txtTenThuongHieu.Text;
            brand.BrandDescription = txtMoTa.Text;
            dataBrand.Addbrand(brand);
            Response.Redirect("~/Pages/AdminPage/ManageBrand");

        }
    }
}