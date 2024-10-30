using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class SearchItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = Request.QueryString["query"];
            if (!string.IsNullOrEmpty(query))
            {
                List<Product> searchResults = new DataProduct().SearchProductsByName(query);
                ListView1.DataSource = searchResults;
                ListView1.DataBind();
            }
            else
            {
                // Optionally handle empty search query if needed.
            }
        }
    }
}