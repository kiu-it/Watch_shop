using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class Login : System.Web.UI.Page
    {
        DataCustomer data = new DataCustomer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Kiểm tra xác thực

            bool isAuthenticated = data.AuthenticateUser(username, password);

            if (isAuthenticated)
            {
                Session["Username"] = username;
                // Chuyển hướng đến trang chính sau khi đăng nhập thành công
                Response.Redirect("Home.aspx");
            }
            else
            {
                // Hiển thị thông báo đăng nhập không thành công
                Response.Write("Invalid username or password. Please try again.");
            }
        }
    }
}