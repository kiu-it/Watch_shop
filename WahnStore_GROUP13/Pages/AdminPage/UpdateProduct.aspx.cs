using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;


namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        DataBrand dataBrand = new DataBrand();
        DataGender dataGender = new DataGender();
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
                ddlThuongHieu.DataSource = dataBrand.dsBrand();
                ddlThuongHieu.DataTextField = "BrandName";
                ddlThuongHieu.DataValueField = "BrandId";
                ddlThuongHieu.DataBind();
                ddlGioiTinh.DataSource = dataGender.DsGender();
                ddlGioiTinh.DataTextField = "GenderName";
                ddlGioiTinh.DataValueField = "GenderId";
                ddlGioiTinh.DataBind();
                ddlGioiTinh.SelectedValue = product.GenderId.ToString();
                ddlThuongHieu.SelectedValue = product.BrandId.ToString();
                string urlImage = "/ProductImg/" + product.ProductImage.ToString();
                image.ImageUrl = urlImage;


            }
        }
        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            int productId = int.Parse(txtMaSanPham.Text);
            string productName = txtTenSanPham.Text;
            string description = txtMoTa.Text;
            decimal price = decimal.Parse(txtGiaTien.Text);
            int quantity = int.Parse(txtSoLuong.Text);
            string origin = txtXuatXu.Text;
            decimal diameter = decimal.Parse(txtDuongKinh.Text);
            decimal thickness = decimal.Parse(txtBeDayMatSo.Text);
            string warrantyPeriod = txtBaoHiem.Text;

            string fileAnh = null;
            if (fileHinhAnh.HasFile)
            {
                fileAnh = dataProduct.SaveAvatar(fileHinhAnh, HttpContext.Current);
            }
            else
            {
                fileAnh = Path.GetFileName(image.ImageUrl);

            }

            int genderId = int.Parse(ddlGioiTinh.SelectedValue);
            string glass = txtLoaiKinh.Text;
            int brandId = int.Parse(ddlThuongHieu.SelectedValue);
            string Color = txtMauMatSo.Text;
            string strap = txtChatLieuDay.Text;
            DateTime createdDate = DateTime.Now;
            Product product = new Product(productId, productName, description, price, quantity, origin, diameter, thickness, warrantyPeriod, fileAnh, genderId, glass, brandId, Color, strap, createdDate);
            dataProduct.UpdateProduct(product);
            Response.Redirect("~/Pages/AdminPage/ManageProduct.aspx");
        }

    }

}