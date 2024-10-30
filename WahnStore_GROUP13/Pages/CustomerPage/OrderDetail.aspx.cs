using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class OrderDetail : System.Web.UI.Page
    {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    int orderId = Convert.ToInt32(Request.QueryString["orderId"]);
                    BindOrderDetailGrid(orderId);
                }
            }

            private void BindOrderDetailGrid(int orderId)
            {
                DataOrder dataOrder = new DataOrder();
                List<OrderDetailItem> orderDetailItems = dataOrder.GetOrderDetails(orderId); // Lấy chi tiết đơn hàng theo ID đơn hàng

                OrderDetailGridView.DataSource = orderDetailItems;
                OrderDetailGridView.DataBind();
            }
        }
}