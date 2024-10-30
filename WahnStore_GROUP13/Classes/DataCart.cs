using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class DataCart
    {
        SqlConnection con;

        public DataCart()
        {
            string sqlcon = @"Data Source=DESKTOP-NGDEMD4\SQLEXPRESS;Initial Catalog=WahnStore;Integrated Security=True";
            con = new SqlConnection(sqlcon);
        }

        // Lấy giỏ hàng theo ID khách hàng
        public Cart GetCartByCustomerId(int customerId)
        {
            Cart cart = null;
            try
            {
                con.Open();
                string query = "SELECT * FROM Cart WHERE CustomerId = @CustomerId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    cart = new Cart
                    {
                        CartId = Convert.ToInt32(reader["CartId"]),
                        CustomerId = Convert.ToInt32(reader["CustomerId"]),
                        CreatedDate = Convert.ToDateTime(reader["CreatedDate"])
                    };
                }
            }
            catch (Exception )
            {
                //throw new Exception("Error retrieving cart: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return cart;
        }

        // Lấy các mục trong giỏ hàng theo ID giỏ hàng
        public List<CartItem> GetCartItems(int cartId)
        {
            List<CartItem> cartItems = new List<CartItem>();
            try
            {
                con.Open();
                string query = @"
            SELECT ci.CartItemId, ci.CartId, ci.ProductId, ci.Quantity, ci.Price, p.ProductName
            FROM CartItem ci
            INNER JOIN Products p ON ci.ProductId = p.ProductId
            WHERE ci.CartId = @CartId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CartId", cartId);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    CartItem item = new CartItem
                    {
                        CartItemId = Convert.ToInt32(reader["CartItemId"]),
                        CartId = Convert.ToInt32(reader["CartId"]),
                        ProductId = Convert.ToInt32(reader["ProductId"]),
                        Quantity = Convert.ToInt32(reader["Quantity"]),
                        Price = Convert.ToDecimal(reader["Price"]),
                        ProductName = reader["ProductName"].ToString() // Assuming the product name is fetched from the database
                    };
                    cartItems.Add(item);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving cart items: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return cartItems;
        }


        // Thêm mục vào giỏ hàng
        public bool AddToCart(int cartId, int productId, int quantity, decimal price)
        {
            try
            {
                con.Open();
                string query = @"INSERT INTO CartItem (cart_id, product_id, cart_quantity, cart_price)
                                 VALUES (@CartId, @ProductId, @Quantity, @Price)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CartId", cartId);
                cmd.Parameters.AddWithValue("@ProductId", productId);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.Parameters.AddWithValue("@Price", price);

                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error adding to cart: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        // Xóa mục khỏi giỏ hàng
        public bool RemoveFromCart(int cartItemId)
        {
            try
            {
                con.Open();
                string query = "DELETE FROM CartItem WHERE cartitem_id = @CartItemId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CartItemId", cartItemId);

                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error removing from cart: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        // Tạo giỏ hàng mới cho khách hàng
        public int CreateCart(int customerId)
        {
            int cartId = -1; // Giá trị mặc định hoặc giá trị không hợp lệ
            try
            {
                con.Open();
                string query = @"INSERT INTO Carts (customer_id, CreatedDate) 
                         VALUES (@CustomerId, @CreatedDate); 
                         SELECT SCOPE_IDENTITY();";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);
                cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                cartId = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (Exception )
            {
                // Xử lý ngoại lệ nếu cần
                // Ví dụ: Log lỗi, hiển thị thông báo lỗi, v.v.
            }
            finally
            {
                con.Close();
            }
            return cartId;
        }

        public int GetCartIdByCustomerId(int customerId)
        {
            try
            {
                con.Open();
                string query = "SELECT TOP 1 cart_id FROM Carts WHERE customer_id = @CustomerId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);
                object result = cmd.ExecuteScalar();

                // Nếu có cartId được trả về, trả về cartId đó; ngược lại, trả về -1
                int cartId = result != null ? Convert.ToInt32(result) : -1;
                return cartId;
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ nếu cần
                // Ví dụ: throw ex; để ném ngoại lệ cho lớp gọi xử lý
                throw new Exception("Error retrieving cart_id by customerId: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }


        public bool IsCustomerInCart(int customerId)
        {
            try
            {
                con.Open();
                string query = "SELECT TOP 1 CartId FROM Cart WHERE CustomerId = @CustomerId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);
                SqlDataReader reader = cmd.ExecuteReader();

                // Nếu có bản ghi được trả về, tức là customerId đã tồn tại trong Cart
                bool isInCart = reader.HasRows;
                return isInCart;
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ nếu cần
                throw new Exception("Error checking if customer is in cart: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public List<CartItem> GetCartItemsByCustomerId(int customerId)
        {
            List<CartItem> cartItems = new List<CartItem>();
            try
            {
                con.Open();
                string query = @"SELECT ci.cartitem_id, ci.cart_id, ci.product_id, ci.cart_quantity, ci.cart_price 
                         FROM CartItem ci
                         INNER JOIN Carts c ON ci.cart_id = c.cart_id
                         WHERE c.customer_id = @CustomerId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    CartItem item = new CartItem
                    {
                        CartItemId = Convert.ToInt32(reader["cartitem_id"]),
                        CartId = Convert.ToInt32(reader["cart_id"]),
                        ProductId = Convert.ToInt32(reader["product_id"]),
                        Quantity = Convert.ToInt32(reader["cart_quantity"]),
                        Price = Convert.ToDecimal(reader["cart_price"])
                    };
                    cartItems.Add(item);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving cart items by customerId: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            return cartItems;
        }

        public bool IncreaseCartItemQuantity(int cartItemId)
        {
            try
            {
                con.Open();
                string query = "UPDATE CartItem SET cart_quantity = cart_quantity + 1 WHERE cartitem_id = @CartItemId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CartItemId", cartItemId);

                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error increasing cart item quantity: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public bool DecreaseCartItemQuantity(int cartItemId)
        {
            try
            {
                con.Open();
                string query = "UPDATE CartItem SET cart_quantity = CASE WHEN cart_quantity > 1 THEN cart_quantity - 1 ELSE cart_quantity END WHERE cartitem_id = @CartItemId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CartItemId", cartItemId);

                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error decreasing cart item quantity: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        public CartItem GetCartItemById(int cartItemId)
        {
            CartItem cartItem = null;
                con.Open();
                string query = "SELECT * FROM CartItem WHERE cartitem_id = @cartItemId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@cartItemId", cartItemId);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    cartItem = new CartItem
                    {
                        CartItemId = Convert.ToInt32(reader["cartitem_id"]),
                        CartId = Convert.ToInt32(reader["cart_id"]),
                        ProductId = Convert.ToInt32(reader["product_id"]),
                        Quantity = Convert.ToInt32(reader["cart_quantity"]),
                        Price = Convert.ToDecimal(reader["cart_price"])
                    };
                }

            return cartItem;
        }
        public bool RemoveCartItemsByCartId(int cartId)
        {
            try
            {
                con.Open();
                string query = "DELETE FROM CartItem WHERE cart_id = @CartId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CartId", cartId);

                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error removing cart items by cartId: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

    }
}

