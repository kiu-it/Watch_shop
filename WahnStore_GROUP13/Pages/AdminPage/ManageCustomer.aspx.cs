using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class ManageCustomer : System.Web.UI.Page
    {
        DataCustomer data = new DataCustomer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            // Giả sử bạn có một phương thức để lấy dữ liệu từ cơ sở dữ liệu
            grdCustomer.DataSource = data.dsCustomer();
            grdCustomer.DataBind();
        }

        protected void btnCapNhatCus_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "capNhatCus")
            {
                int customerId = Convert.ToInt16(e.CommandArgument);
                Customer cus = data.GetCustomerById(customerId);
                Session["customer"] = cus;
                Response.Redirect("~/Pages/AdminPage/UpdateCustomer.aspx");
                BindData();
            }
        }

        protected void btnXoaCus_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "xoaTaiKhoan")
            {
                int CustomerId = Convert.ToInt16(e.CommandArgument);
                data.DeleteCustomer(CustomerId);
                BindData();
            }
        }
    }
}