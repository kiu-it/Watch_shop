// Code behind file: UpdateOrder.aspx.cs

using System;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.AdminPage
{
    public partial class UpdateOrder : System.Web.UI.Page
    {
        private int orderId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["orderId"] != null)
            {
                orderId = Convert.ToInt32(Request.QueryString["orderId"]);
            }

            if (!IsPostBack)
            {
                LoadOrderDetails();
            }
        }

        private void LoadOrderDetails()
        {
            DataOrder dataOrder = new DataOrder();
            Order order = dataOrder.GetOrderById(orderId);
            if (order != null)
            {
                lblOrderId.Text = order.OrderId.ToString();
                lblCustomerId.Text = order.CustomerId.ToString();
                lblOrderDate.Text = order.OrderDate.ToString("yyyy-MM-dd");
                lblTotalAmount.Text = order.TotalAmount.ToString("C");
                lblShipmentId.Text = order.ShipmentId.ToString();
                txtOrderStatus.Text = order.OrderStatus;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Update order status based on the UI fields
            Order updatedOrder = new Order
            {
                OrderId = orderId,
                OrderStatus = txtOrderStatus.Text,
            };

            DataOrder dataOrder = new DataOrder();
            dataOrder.UpdateOrderStatus(updatedOrder);
            Response.Redirect("~/Pages/AdminPage/ManageOrder.aspx");
        }
    }
}
