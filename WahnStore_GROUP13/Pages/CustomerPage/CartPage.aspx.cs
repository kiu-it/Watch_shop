using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WahnStore_GROUP13.Classes;

namespace WahnStore_GROUP13.Pages.CustomerPage
{
    public partial class CartPage : System.Web.UI.Page
    {
        DataCart data = new DataCart();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Hiển thị giỏ hàng khi trang được tải lần đầu tiên
                DisplayCart();
            }
        }

        private void DisplayCart()
        {
            DataCustomer customer = new DataCustomer();
            int customerId = customer.GetCustomerIdByUsername(Session["Username"].ToString());

            // Lấy danh sách CartItem dựa trên customerId
            List<CartItem> items = data.GetCartItemsByCustomerId(customerId);

            // Fetch product names and add to each cart item
            DataProduct dataProduct = new DataProduct();
            foreach (var item in items)
            {
                Product product = dataProduct.GetProductById(item.ProductId);
                if (product != null)
                {
                    item.ProductName = product.ProductName; // Fetching product name directly
                }
            }

            // Display the CartItem list in GridView
            CartGridView.DataSource = items;
            CartGridView.DataBind();
        }



        protected void CartGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the cartItemId of the item being deleted
            int cartItemId = Convert.ToInt32(CartGridView.DataKeys[e.RowIndex].Value);
            // Remove the item from the cart
            data.RemoveFromCart(cartItemId);

            // Refresh the cart display
            DisplayCart();
        }

        protected void CartGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Increase")
            {
                // Get the cartItemId of the item being increased
                int cartItemId = Convert.ToInt32(e.CommandArgument);

                // Increase the quantity of the item in the cart
                data.IncreaseCartItemQuantity(cartItemId);

                // Refresh the cart display
                DisplayCart();
            }
            else if (e.CommandName == "Decrease")
            {
                // Get the cartItemId of the item being decreased
                int cartItemId = Convert.ToInt32(e.CommandArgument);

                // Decrease the quantity of the item in the cart
                data.DecreaseCartItemQuantity(cartItemId);

                // Refresh the cart display
                DisplayCart();
            }
        }

        protected void CheckoutButton_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/Pages/CustomerPage/Checkout.aspx");
        }

    }
}