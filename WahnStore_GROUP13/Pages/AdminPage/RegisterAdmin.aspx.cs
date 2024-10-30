using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class RegisterAdmin : System.Web.UI.Page
    {
        DataAdmin data = new DataAdmin();
        DataCustomer data1 = new DataCustomer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddGender.DataSource = data1.dsGender();
                ddGender.DataValueField = "GenderID";
                ddGender.DataTextField = "GenderName";
                DataBind();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Create a new admin object
            Admin admin = new Admin()
            {
                AdFullName = txtFullName.Text,
                AdEmail = txtEmail.Text,
                AdPhone = txtPhone.Text,
                AdUsername = txtUsername.Text,
                AdPassword = txtPassword.Text,  // Ideally, hash the password before storing it
                AdAddress = txtAddress.Text,
                GenderId = int.Parse(ddGender.SelectedValue),
                AdAvatar = data.SaveAvatar(fuAvatar.PostedFile), // Assuming fuAvatar is your FileUpload control
                CreatedDate = DateTime.Now
            };

            // Add the customer to the database
            bool success = data.AddAdmin(admin);
            string avatarPath = data.SaveAvatar(fuAvatar.PostedFile);
            imgAvatar.Src = avatarPath;

            if (success)
            {
                // Registration successful, redirect or show a success message
                Response.Redirect("LoginAdmin.aspx");
            }
            else
            {
                // Registration failed, handle the error (e.g., display an error message)
            }
        }
    }
}