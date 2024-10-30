using System;
using System.Collections.Generic;
using System.Web.UI;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class CustomerMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if there is a session variable named "Username"
                if (Session["Username"] != null)
                {
                    // User is logged in, show account management and logout buttons
                    hypManageAccount.Visible = true;
                    hypManageCart.Visible = true;
                    btnLogout.Visible = true;
                    hypLogin.Visible = false;
                    hypRegister.Visible = false;
                }
                else
                {
                    // User is not logged in, show login and register links
                    hypLogin.Visible = true;
                    hypRegister.Visible = true;
                    hypManageAccount.Visible = false;
                    hypManageCart.Visible = false;
                    btnLogout.Visible = false;
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string query = txtSearch.Text.Trim();
            if (!string.IsNullOrEmpty(query))
            {
                // Perform search and get search results if needed. For simplicity, let's assume the method SearchProductsByName exists.
                List<Product> searchResults = new DataProduct().SearchProductsByName(query);

                // Redirect to SearchItem.aspx with the query parameter.
                Response.Redirect($"SearchItem.aspx?query={Uri.EscapeDataString(query)}");
            }
            else
            {
                // Optionally handle empty search query if needed.
                // You can add a message or prompt the user.
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Handle the logout functionality here
            // For example, clear the session or redirect to the login page

            Session.Clear();
            Response.Redirect("~/Pages/CustomerPage/Login.aspx");
        }
    }
}
