using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class YourAccount : System.Web.UI.Page
    {
        DataCustomer data = new DataCustomer();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                // Kiểm tra xem người dùng đã đăng nhập chưa
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();
                    // Truy xuất thông tin tài khoản từ cơ sở dữ liệu

                    Customer c = data.GetCustomerByUsername(username);

                    if (c != null)
                    {
                        string gioiTinh = "";
                        if (c.GenderId == 1)
                        {
                            gioiTinh = "Nam";
                        }
                        else gioiTinh = "Nữ";
                        // Hiển thị thông tin tài khoản trên giao diện
                        lblFullname.Text = c.FullName;
                        lblEmail.Text = c.Email;
                        lblPhone.Text = c.Phone;
                        lblUsername.Text = c.Username;
                        lblAddress.Text = c.Address;
                        lblGender.Text = gioiTinh;
                        if (!string.IsNullOrEmpty(c.Avatar))
                        {
                            imgAvatar.ImageUrl = "~/Avatar/" + c.Avatar;
                        }
                        else
                        {
                            // Nếu không có ảnh, ẩn điều khiển imgAvatar
                            imgAvatar.Visible = false;
                        }
                        // Hiển thị các thông tin khác tương ứng
                    }
                    else
                    {
                        // Xử lý trường hợp không tìm thấy thông tin tài khoản
                        //lblError.Text = "Unable to retrieve account information.";
                    }
                }
                else
                {
                    // Người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
                    Response.Redirect("~/Pages/CustomerPage/Login.aspx");
                }
            }
        }
    }
}