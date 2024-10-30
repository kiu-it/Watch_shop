using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class UpdateBrand : System.Web.UI.Page
    {
        DataBrand dataBrand = new DataBrand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Brand brand = (Brand)Session["brand"];
                txtMaThuongHieu.Text = brand.BrandId.ToString();
                txtTenThuongHieu.Text = brand.BrandName.ToString();
                txtMoTa.Text = brand.BrandDescription.ToString();
            }

        }
        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            Brand brand = new Brand();
            brand.BrandId = int.Parse(txtMaThuongHieu.Text);
            brand.BrandName = txtTenThuongHieu.Text;
            brand.BrandDescription = txtMoTa.Text;
            dataBrand.UpdateBrand(brand);
            Response.Redirect("~/Pages/AdminPage/ManageBrand.aspx");
        }
    }
}