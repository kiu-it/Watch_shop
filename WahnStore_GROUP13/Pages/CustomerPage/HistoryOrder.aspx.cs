using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class HistoryOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrderHistory();
            }
        }

        private int GetCustomerId()
        {
            DataCustomer customer = new DataCustomer();
            
            int customerId = customer.GetCustomerIdByUsername(Session["Username"].ToString());
            return customerId;
        }

        private void BindOrderHistory()
        {
            int customerId = GetCustomerId();
            DataOrder dataOrder = new DataOrder();
            List<Order> orderHistory = dataOrder.GetOrdersByCustomerId(customerId);

            OrderHistoryGridView.DataSource = orderHistory;
            OrderHistoryGridView.DataBind();
        }

        protected void OrderHistoryGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Detail")
            {
                int orderId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"OrderDetail.aspx?orderId={orderId}");
            }
        }

        protected void OrderHistoryGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            int orderId = Convert.ToInt32(OrderHistoryGridView.SelectedDataKey.Value);
            Response.Redirect($"OrderDetail.aspx?orderId={orderId}");
        }
    }
}
