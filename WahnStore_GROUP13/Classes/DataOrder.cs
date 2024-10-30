using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;

namespace WahnStore_GROUP13.Classes
{
    public class DataOrder

    {
        private string connectionString = "Data Source=DESKTOP-NGDEMD4\\SQLEXPRESS;Initial Catalog=WahnStore;Integrated Security=True";

        public int CreateOrder(int customerId, int shipmentId, decimal totalAmount)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO Orders (customer_id, order_totalamount, order_status, shipment_id) OUTPUT INSERTED.order_id VALUES (@customerId, @totalAmount, N'Chờ xác nhận', @shipmentId)";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@customerId", customerId);
                cmd.Parameters.AddWithValue("@totalAmount", totalAmount);
                cmd.Parameters.AddWithValue("@shipmentId", shipmentId);

                return (int)cmd.ExecuteScalar();
            }
        }

        public void AddOrderItem(int orderId, int productId, decimal price, decimal quantity)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO OrderItem (order_price, quantity, product_id, order_id) VALUES (@price, @quantity, @productId, @orderId)";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.Parameters.AddWithValue("@productId", productId);
                cmd.Parameters.AddWithValue("@orderId", orderId);
                cmd.ExecuteNonQuery();
            }
        }


        public List<Order> GetOrdersByCustomerId(int customerId)
        {
            List<Order> orders = new List<Order>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
                SELECT o.*, s.shipment_address, s.shipment_city, s.shipment_country, s.shipment_date 
                FROM Orders o
                INNER JOIN Shipment s ON o.shipment_id = s.shipment_id
                WHERE o.customer_id = @customerId";

                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@customerId", customerId);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Order order = new Order
                    {
                        OrderId = reader.GetInt32(0),
                        CustomerId = reader.GetInt32(1),
                        OrderDate = reader.GetDateTime(2),
                        TotalAmount = reader.GetDecimal(3),
                        OrderStatus = reader.GetString(4),
                        ShipmentId = reader.GetInt32(5),
                        ShipmentAddress = reader.GetString(6),
                        ShipmentCity = reader.GetString(7),
                        ShipmentCountry = reader.GetString(8),
                        ShipmentDate = reader.GetDateTime(9)
                    };
                    orders.Add(order);
                }
            }

            return orders;
        }

        public Order GetOrderById(int orderId)
        {
            Order order = null;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM Orders WHERE order_id = @orderId";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@orderId", orderId);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    order = new Order
                    {
                        OrderId = reader.GetInt32(0),
                        CustomerId = reader.GetInt32(1),
                        OrderDate = reader.GetDateTime(2),
                        TotalAmount = reader.GetDecimal(3),
                        OrderStatus = reader.GetString(4),
                        ShipmentId = reader.GetInt32(5)
                    };
                }
            }
            return order;
        }

        public int CreateShipment(int customerId, string shipmentAddress, string shipmentCity, string shipmentCountry)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "INSERT INTO Shipment (customer_id, shipment_address, shipment_city, shipment_country) OUTPUT INSERTED.shipment_id VALUES (@customerId, @shipmentAddress, @shipmentCity, @shipmentCountry)";
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@customerId", customerId);
                cmd.Parameters.AddWithValue("@shipmentAddress", shipmentAddress);
                cmd.Parameters.AddWithValue("@shipmentCity", shipmentCity);
                cmd.Parameters.AddWithValue("@shipmentCountry", shipmentCountry);

                return (int)cmd.ExecuteScalar();
            }
        }

        public List<OrderDetailItem> GetOrderDetails(int orderId)
        {
            List<OrderDetailItem> orderDetails = new List<OrderDetailItem>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = @"SELECT p.product_name AS ProductName, 
                                o.order_date AS OrderDate,
                                odi.order_price AS ProductPrice,
                                odi.quantity AS Quantity,
                                c.shipment_address AS ShipmentAddress,
                                (odi.quantity * odi.order_price) AS TotalAmount
                         FROM OrderItem odi
                         JOIN Products p ON odi.product_id = p.product_id
                         JOIN Orders o ON odi.order_id = o.order_id
                         JOIN Shipment c ON o.shipment_id = c.shipment_id
                         WHERE odi.order_id = @OrderId";

                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@OrderId", orderId);

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    OrderDetailItem item = new OrderDetailItem
                    {
                        ProductName = reader["ProductName"].ToString(),
                        OrderDate = Convert.ToDateTime(reader["OrderDate"]),
                        ProductPrice = Convert.ToDecimal(reader["ProductPrice"]),
                        Quantity = Convert.ToInt32(reader["Quantity"]),
                        ShipmentAddress = reader["ShipmentAddress"].ToString(),
                        TotalAmount = Convert.ToDecimal(reader["TotalAmount"])
                    };

                    orderDetails.Add(item);
                }

                con.Close();
            }
            return orderDetails;
        }

        public void DeleteOrder(int orderId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlTransaction transaction = connection.BeginTransaction())
                {
                    try
                    {
                        // Delete order items first
                        string deleteOrderItemsQuery = "DELETE FROM OrderItem WHERE order_id = @orderId";
                        SqlCommand deleteOrderItemsCmd = new SqlCommand(deleteOrderItemsQuery, connection, transaction);
                        deleteOrderItemsCmd.Parameters.AddWithValue("@orderId", orderId);
                        deleteOrderItemsCmd.ExecuteNonQuery();

                        // Delete the order
                        string deleteOrderQuery = "DELETE FROM Orders WHERE order_id = @orderId";
                        SqlCommand deleteOrderCmd = new SqlCommand(deleteOrderQuery, connection, transaction);
                        deleteOrderCmd.Parameters.AddWithValue("@orderId", orderId);
                        deleteOrderCmd.ExecuteNonQuery();

                        transaction.Commit();
                    }
                    catch (Exception)
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
        }


        public void UpdateOrderStatus(Order order)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlTransaction transaction = connection.BeginTransaction())
                {
                    try
                    {
                        // Cập nhật trạng thái đơn hàng
                        string updateStatusQuery = "UPDATE Orders SET order_status = @OrderStatus WHERE order_id = @OrderId";
                        SqlCommand updateCmd = new SqlCommand(updateStatusQuery, connection, transaction);
                        updateCmd.Parameters.AddWithValue("@OrderStatus", order.OrderStatus);
                        updateCmd.Parameters.AddWithValue("@OrderId", order.OrderId);
                        updateCmd.ExecuteNonQuery();

                        // Commit transaction
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw new Exception("An error occurred while updating order status", ex);
                    }
                }
            }
        }

        // DataOrder.cs

        public DataTable GetOrdersByDateRange(DateTime? fromDate = null, DateTime? toDate = null)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = @"
            SELECT o.*, 
                s.shipment_address, 
                s.shipment_city, 
                s.shipment_country, 
                s.shipment_date 
            FROM Orders o
            INNER JOIN Shipment s ON o.shipment_id = s.shipment_id 
            WHERE 1=1"; 
                if (fromDate.HasValue)
                {
                    query += " AND o.order_date >= @FromDate";
                }

                // Thêm điều kiện lọc ngày kết thúc
                if (toDate.HasValue)
                {
                    query += " AND o.order_date <= @ToDate";
                }

                SqlCommand command = new SqlCommand(query, connection);

                if (fromDate.HasValue)
                {
                    command.Parameters.AddWithValue("@FromDate", fromDate.Value);
                }

                if (toDate.HasValue)
                {
                    command.Parameters.AddWithValue("@ToDate", toDate.Value);
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                return dataTable;
            }
        }
        public List<Order> GetAllOrders()
        {
            List<Order> orders = new List<Order>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
            SELECT o.*, 
                   s.shipment_address, 
                   s.shipment_city, 
                   s.shipment_country, 
                   s.shipment_date 
            FROM Orders o
            INNER JOIN Shipment s ON o.shipment_id = s.shipment_id";

                SqlCommand cmd = new SqlCommand(query, connection);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Order order = new Order
                    {
                        OrderId = reader.GetInt32(0),
                        CustomerId = reader.GetInt32(1),
                        OrderDate = reader.GetDateTime(2),
                        TotalAmount = reader.GetDecimal(3),
                        OrderStatus = reader.GetString(4),
                        ShipmentId = reader.GetInt32(5),
                        ShipmentAddress = reader.GetString(6),
                        ShipmentCity = reader.GetString(7),
                        ShipmentCountry = reader.GetString(8),
                        ShipmentDate = reader.GetDateTime(9)
                    };
                    orders.Add(order);
                }
            }

            return orders;
        }

        public DataTable GetOrderStatisticsByDay(DateTime fromDate, DateTime toDate)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
            SELECT 
                CONVERT(date, order_date) AS Date,
                COUNT(*) AS TotalOrders,
                SUM(order_totalamount) AS TotalRevenue
            FROM Orders
            WHERE order_date >= @FromDate AND order_date <= @ToDate
            GROUP BY CONVERT(date, order_date)
            ORDER BY Date";

                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@FromDate", fromDate);
                cmd.Parameters.AddWithValue("@ToDate", toDate);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                return dt;
            }
        }
        public DataTable GetOrderStatisticsByMonth(int year, int month)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
            SELECT 
                DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS Date,
                COUNT(*) AS TotalOrders,
                SUM(order_totalamount) AS TotalRevenue
            FROM Orders
            WHERE YEAR(order_date) = @Year AND MONTH(order_date) = @Month
            GROUP BY YEAR(order_date), MONTH(order_date)
            ORDER BY Date";

                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Year", year);
                cmd.Parameters.AddWithValue("@Month", month);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                return dt;
            }
        }
        public DataTable GetOrderStatisticsByYear(int year)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
            SELECT 
                DATEFROMPARTS(YEAR(order_date), 1, 1) AS Date,
                COUNT(*) AS TotalOrders,
                SUM(order_totalamount) AS TotalRevenue
            FROM Orders
            WHERE YEAR(order_date) = @Year
            GROUP BY YEAR(order_date)
            ORDER BY Date";

                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@Year", year);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                return dt;
            }
        }


    }
}

