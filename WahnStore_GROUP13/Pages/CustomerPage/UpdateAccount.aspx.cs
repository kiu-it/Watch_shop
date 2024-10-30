using System;
using System.Web.UI;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class UpdateAccount : Page
    {
        DataCustomer data = new DataCustomer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();
                    Customer c = data.GetCustomerByUsername(username);
                    if (c != null)
                    {
                        txtFullname.Text = c.FullName;
                        txtEmail.Text = c.Email;
                        txtPhone.Text = c.Phone;
                        txtAddress.Text = c.Address;
                        ddlGender.SelectedValue = c.GenderId.ToString();
                    }
                    else
                    {
                        Response.Redirect("~/Pages/CustomerPage/Login.aspx");
                    }
                }
                else
                {
                    Response.Redirect("~/Pages/CustomerPage/Login.aspx");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                Customer c = data.GetCustomerByUsername(username);

                if (c != null)
                {
                    c.FullName = txtFullname.Text;
                    c.Email = txtEmail.Text;
                    c.Phone = txtPhone.Text;
                    c.Address = txtAddress.Text;
                    c.GenderId = Convert.ToInt32(ddlGender.SelectedValue);

                    // Handle file upload
                    if (fileUploadAvatar.HasFile)
                    {
                        string filename = System.IO.Path.GetFileName(fileUploadAvatar.PostedFile.FileName);
                        string extension = System.IO.Path.GetExtension(fileUploadAvatar.PostedFile.FileName);
                        string path = Server.MapPath("~/Avatar/") + filename;
                        fileUploadAvatar.SaveAs(path);
                        c.Avatar = filename;
                    }

                    // Update password if provided
                    if (!string.IsNullOrEmpty(txtPassword.Text) && txtPassword.Text == txtConfirmPassword.Text)
                    {
                        c.Password = HashPassword(txtPassword.Text);
                    }
                    else if (!string.IsNullOrEmpty(txtPassword.Text))
                    {
                        // Show error for mismatched passwords or empty password field
                        lblError.Text = "Password and confirm password do not match!";
                        return;
                    }

                    // Save updated customer information to database
                    data.UpdateCustomer(c);

                    Response.Redirect("~/Pages/CustomerPage/ManageAccount.aspx");
                }
                else
                {
                    // Handle user not found case
                    Response.Redirect("~/Pages/CustomerPage/Login.aspx");
                }
            }
            else
            {
                // Handle session not found case
                Response.Redirect("~/Pages/CustomerPage/Login.aspx");
            }
        }

        private string HashPassword(string password)
        {
            // Replace with a secure hashing algorithm, e.g., bcrypt or Argon2
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] bytes = System.Text.Encoding.UTF8.GetBytes(password);
                byte[] hashBytes = sha256.ComputeHash(bytes);
                return Convert.ToBase64String(hashBytes);
            }
        }
    }
}
