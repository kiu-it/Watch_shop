using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class ManageProduct : System.Web.UI.Page
    {
        DataProduct data = new DataProduct();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HienThi();
            }

        }
        public void HienThi()
        {
            if (ViewState["searchResult"] != null && ViewState["searchResult"] is List<Product>)
            {
                List<Product> list = (List<Product>)ViewState["searchResult"];
                dsSanPham.DataSource = list;
            }
            else
            {
                dsSanPham.DataSource = data.dsProduct();
            }
            dsSanPham.DataBind();
        }

        protected void dsSanPham_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Lấy giá trị brand_id từ dòng dữ liệu hiện tại
                int brandId = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "BrandId"));

                // Gọi phương thức selectBrand để lấy brand_name
                string brandName = data.selectBrandName(brandId);

                // Tìm điều khiển Label trong TemplateField và thiết lập text cho nó
                Label lblTenHang = (Label)e.Row.FindControl("lblTenHang");
                if (lblTenHang != null)
                {
                    lblTenHang.Text = brandName;
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Lấy giá trị gender_id từ dòng dữ liệu hiện tại
                int gender_id = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "GenderId"));

                // Gọi phương thức selectBrand để lấy brand_name
                string genderName = data.selectGenderName(gender_id);

                // Tìm điều khiển Label trong TemplateField và thiết lập text cho nó
                Label lblGioiTinh = (Label)e.Row.FindControl("lblGioiTinh");
                if (lblGioiTinh != null)
                {
                    lblGioiTinh.Text = genderName;
                }
            }
        }

        protected void btnXoa_Click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "xoaSanPham")
            {
                int productId = Convert.ToInt16(e.CommandArgument);

                Boolean boolean = data.DeleteProduct(productId);
                if (boolean == true)
                {
                    HienThi();
                }
                else
                {
                    string script = "alert('Không thể xóa được sản phẩm đang tồn tại trong đơn hàng!')";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showError", script, true);
                }

            }

        }
        protected void btnCapNhat_Click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "capNhat")
            {
                int productId = Convert.ToInt16(e.CommandArgument);
                Product product = data.GetProductById(productId);
                Session["product"] = product;
                Response.Redirect("~/Pages/AdminPage/UpdateProduct.aspx");
                HienThi();
            }

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dsSanPham.PageIndex = e.NewPageIndex; // Thiết lập trang hiện tại của GridView
            HienThi();

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string key = txtSearch.Text;
            List<Product> products = data.dsProductBySearch(key);
            if (products.Count > 0)
            {
                dsSanPham.DataSource = data.dsProductBySearch(key);

                ViewState["searchResult"] = data.dsProductBySearch(key);
                HienThi();
            }
            else
            {
                dsSanPham.DataSource = null; // Xóa dữ liệu hiển thị trước đó
                dsSanPham.DataBind();
            }
        }
        //protected void Search_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    dsSanPham.PageIndex = e.NewPageIndex; // Thiết lập trang hiện tại của GridView
        //    dsSanPham.DataSource = ViewState["searchResult"];
        //    dsSanPham.DataBind();

        //}


    }
}