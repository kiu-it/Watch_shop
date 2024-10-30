using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class ProductDeatails : System.Web.UI.Page
    {
        DataProduct dataProduct = new DataProduct();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Product product = (Product)Session["product"];
                txtMaSanPham.Text = product.ProductId.ToString();
                txtTenSanPham.Text = product.ProductName;
                txtMoTa.Text = product.ProductDescription;
                txtGiaTien.Text = product.ProductPrice.ToString();
                txtSoLuong.Text = product.ProductQuantity.ToString();
                txtXuatXu.Text = product.ProductOrigin;
                txtDuongKinh.Text = product.ProductDiameter.ToString();
                txtBeDayMatSo.Text = product.ProductThickness.ToString();
                txtBaoHiem.Text = product.ProductWarrantyPeriod;
                txtLoaiKinh.Text = product.ProductGlass;
                txtMauMatSo.Text = product.ProductColor;
                txtChatLieuDay.Text = product.ProductStrap;
                string urlImage = "/ProductImg/" + product.ProductImage.ToString();
                image.ImageUrl = urlImage;
                txtGioiTinh.Text = dataProduct.selectGenderName(product.GenderId);
                txtThuongHieu.Text = dataProduct.selectBrandName(product.BrandId);
            }
        }
    }
}