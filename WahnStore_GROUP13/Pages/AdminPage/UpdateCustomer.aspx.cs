using Irony;
using System;
using System.Web.UI;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class UpdateCustomer : Page
    {
        DataCustomer dataCustomer = new DataCustomer();
        DataGender dataGender = new DataGender();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Customer customer = (Customer)Session["customer"];
                txtMaTaiKhoan.Text = customer.CustomerID.ToString();
                txtEmailED.Text = customer.Email;
                txtPhoneED.Text = customer.Phone;
                txtFullNameED.Text = customer.FullName;
                txtMatKhauED.Text = customer.Password;
                txtDiaChiED.Text = customer.Address;

                ddlGioiTinhED.DataSource = dataGender.DsGender(); // Lấy danh sách giới tính
                ddlGioiTinhED.DataTextField = "GenderName";
                ddlGioiTinhED.DataValueField = "GenderId";
                ddlGioiTinhED.DataBind();
                ddlGioiTinhED.SelectedValue = customer.GenderId.ToString();

                string urlImage = "/Avatar/" + customer.Avatar;
                imageTaiKhoan.ImageUrl = urlImage;
            }
        }

        protected void btnCapNhatED_Click(object sender, EventArgs e)
        {
            Customer updatedCustomer = new Customer
            {
                CustomerID = int.Parse(txtMaTaiKhoan.Text),
                FullName = txtFullNameED.Text,
                Email = txtEmailED.Text,
                Phone = txtPhoneED.Text,
                Address = txtDiaChiED.Text,
                GenderId = int.Parse(ddlGioiTinhED.SelectedValue),
                Avatar = SaveAvatar(), // Lưu hình ảnh nếu có thay đổi
                CreatedDate = DateTime.Now
            };

            if (!string.IsNullOrEmpty(txtMatKhauED.Text))
            {
                updatedCustomer.Password = txtMatKhauED.Text; // Hash password if necessary
            }

            bool isUpdated = dataCustomer.UpdateCustomer(updatedCustomer);

            if (isUpdated)
            {
                // Cập nhật thành công
                Response.Redirect("~/Pages/AdminPage/ManageCustomer.aspx");
            }
            else
            {
                // Cập nhật thất bại
                //lblMessage.Text = "Cập nhật không thành công!";
            }
        }

        private string SaveAvatar()
        {
            if (fileHinhAnh.HasFile)
            {
                string fileName = System.IO.Path.GetFileName(fileHinhAnh.FileName);
                string directoryPath = Server.MapPath("~/Avatar/");

                // Ensure the directory exists
                if (!System.IO.Directory.Exists(directoryPath))
                {
                    System.IO.Directory.CreateDirectory(directoryPath);
                }

                string filePath = System.IO.Path.Combine(directoryPath, fileName);
                fileHinhAnh.SaveAs(filePath);

                return fileName;
            }

            return null;
        }
    }
}
