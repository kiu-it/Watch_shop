using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class AddProduct : System.Web.UI.Page
    {
        DataGender dataGender = new DataGender();
        DataBrand dataBrand = new DataBrand();
        DataProduct dataProduct = new DataProduct();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hienThiGioiTinh();
                hienThiThuongHieu();
            }
        }
        public void hienThiGioiTinh()
        {
            ddlGioiTinh.DataSource = dataGender.DsGender();
            ddlGioiTinh.DataTextField = "GenderName";
            ddlGioiTinh.DataValueField = "GenderId";
            ddlGioiTinh.DataBind();
        }
        public void hienThiThuongHieu()
        {
            ddlThuongHieu.DataSource = dataBrand.dsBrand();
            ddlThuongHieu.DataTextField = "BrandName";
            ddlThuongHieu.DataValueField = "BrandId";
            ddlThuongHieu.DataBind();
        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            string productName = txtTenSanPham.Text;
            string description = txtMoTa.Text;
            decimal price = decimal.Parse(txtGiaTien.Text);
            int quantity = int.Parse(txtSoLuong.Text);
            string origin = txtXuatXu.Text;
            decimal diameter = decimal.Parse(txtDuongKinh.Text);
            decimal thickness = decimal.Parse(txtBeDayMatSo.Text);
            string warrantyPeriod = txtBaoHiem.Text;
            string image = dataProduct.SaveAvatar(fileHinhAnh, HttpContext.Current);
            int genderId = int.Parse(ddlGioiTinh.SelectedValue);
            string glass = txtLoaiKinh.Text;
            int brandId = int.Parse(ddlThuongHieu.SelectedValue);
            string Color = txtMauMatSo.Text;
            string strap = txtChatLieuDay.Text;
            DateTime createdDate = DateTime.Now;
            Product product = new Product(productName, description, price, quantity, origin, diameter, thickness, warrantyPeriod, image, genderId, glass, brandId, Color, strap, createdDate);
            dataProduct.AddProduct(product);
            Response.Redirect("~/Pages/AdminPage/ManageProduct.aspx");
        }
    }
}