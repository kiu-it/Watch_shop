using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class Register : System.Web.UI.Page
    {
        DataCustomer data = new DataCustomer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddGender.DataSource = data.dsGender();
                ddGender.DataValueField = "GenderID";
                ddGender.DataTextField = "GenderName";
                DataBind();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Create a new customer object
            Customer customer = new Customer
            {
                FullName = txtFullName.Text,
                Email = txtEmail.Text,
                Phone = txtPhone.Text,
                Username = txtUsername.Text,
                Password = txtPassword.Text,  // Ideally, hash the password before storing it
                Address = txtAddress.Text,
                GenderId = int.Parse(ddGender.SelectedValue),
                Avatar = data.SaveAvatar(fuAvatar.PostedFile), // Assuming fuAvatar is your FileUpload control
                CreatedDate = DateTime.Now
            };

            // Add the customer to the database
            bool success = data.AddCustomer(customer);
            string avatarPath = data.SaveAvatar(fuAvatar.PostedFile);
            

            if (success)
            {
                // Registration successful, redirect or show a success message
                Response.Redirect("Login.aspx");
            }
            else
            {
                // Registration failed, handle the error (e.g., display an error message)
            }
        }
    }
}