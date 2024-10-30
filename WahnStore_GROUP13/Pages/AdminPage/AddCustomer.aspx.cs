using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        DataCustomer data = new DataCustomer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddGenderThem.DataSource = data.dsGender();
                ddGenderThem.DataValueField = "GenderID";
                ddGenderThem.DataTextField = "GenderName";
                DataBind();
            }
        }

        protected void bntThemCus_Click(object sender, EventArgs e)
        {
            Customer customer = new Customer
            {
                FullName = txtFullNameThem.Text,
                Email = txtemailThem.Text,
                Phone = txtSdtThem.Text,
                Username = txtTaiKhoanThem.Text,
                Password = txtMatKhauThem.Text,
                Address = txtDiaChiThem.Text,
                GenderId = int.Parse(ddGenderThem.SelectedValue),
                Avatar = data.SaveAvatar(upAvatar.PostedFile),
                CreatedDate = DateTime.Now,
            };
            bool success = data.AddCustomer(customer);
            string avatarPath = data.SaveAvatar(upAvatar.PostedFile);
            imgAvatarThem.Src = avatarPath;

            if (success)
            {
                // Registration successful, redirect or show a success message
                Response.Redirect("ManageCustomer.aspx");
            }
            else
            {
                // Registration failed, handle the error (e.g., display an error message)
            }
        }
    }
}