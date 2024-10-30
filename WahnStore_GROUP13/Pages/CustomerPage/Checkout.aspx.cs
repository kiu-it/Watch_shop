using System;
using System.Collections.Generic;
using System.Web.UI;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class Checkout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCheckoutGrid();
                DisplayTotalAmount();
            }
        }

        protected void PlaceOrderButton_Click(object sender, EventArgs e)
        {
            string shipmentAddress = ShipmentAddressTextBox.Text;
            string shipmentCity = ShipmentCityTextBox.Text;
            string shipmentCountry = ShipmentCountryTextBox.Text;
            int customerId = GetCustomerId(); // Lấy ID khách hàng hiện tại
            decimal totalAmount = CalculateTotalAmount(); // Tính tổng số tiền đơn hàng

            DataOrder dataOrder = new DataOrder();
            DataCart cart = new DataCart();

            try
            {
                // Tạo lô hàng
                int shipmentId = dataOrder.CreateShipment(customerId, shipmentAddress, shipmentCity, shipmentCountry);

                // Tạo đơn hàng với lô hàng mới tạo
                int orderId = dataOrder.CreateOrder(customerId, shipmentId, totalAmount);

                // Thêm các mục vào đơn hàng
                List<CartItem> cartItems = GetCartItems(customerId); // Lấy các mục giỏ hàng của khách hàng
                foreach (var item in cartItems)
                {
                    dataOrder.AddOrderItem(orderId, item.ProductId, item.Price, item.Quantity); // Thêm quantity cho OrderItem
                }

                // Xóa giỏ hàng sau khi đặt hàng thành công
                int cartId = cart.GetCartIdByCustomerId(customerId);
                cart.RemoveCartItemsByCartId(cartId);

                // Chuyển hướng đến trang Lịch sử đơn hàng sau khi đặt hàng thành công
                Response.Redirect("HistoryOrder.aspx");
            }
            catch (Exception ex)
            {
                // Xử lý lỗi và thông báo
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        private int GetCustomerId()
        {
            DataCustomer customer = new DataCustomer();
            int customerId = customer.GetCustomerIdByUsername(Session["Username"].ToString());
            return customerId;
        }

        private decimal CalculateTotalAmount()
        {
            List<CartItem> cartItems = GetCartItems(GetCustomerId());
            decimal totalAmount = 0;
            foreach (var item in cartItems)
            {
                totalAmount += item.Price * item.Quantity; // Tính tổng số tiền với quantity
            }
            return totalAmount;
        }

        private List<CartItem> GetCartItems(int customerId)
        {
            DataCart dataCart = new DataCart();
            return dataCart.GetCartItemsByCustomerId(customerId);
        }

        private void BindCheckoutGrid()
        {
            int customerId = GetCustomerId();
            List<CartItem> cartItems = GetCartItems(customerId);
            DataProduct dataProduct = new DataProduct();
            foreach (var item in cartItems)
            {
                Product product = dataProduct.GetProductById(item.ProductId);
                if (product != null)
                {
                    item.ProductName = product.ProductName;
                }
            }

            CheckoutGridView.DataSource = cartItems;
            CheckoutGridView.DataBind();
        }

        private void DisplayTotalAmount()
        {
            decimal totalAmount = CalculateTotalAmount();
            TotalAmountLabel.Text = $"Tổng giá trị: {totalAmount:C} VND"; // Định dạng giá trị thành định dạng tiền tệ và thêm VND
        }
    }
}
