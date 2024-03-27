using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TrendLease_WebApp.App.Orders
{
    public class OrderRepository
    {
        public string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        public string GetTransactionID(string username)
        {

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"SELECT orderNum
                                FROM InfoUsers
                                WHERE username = @username";
                command.Parameters.AddWithValue("@username", username);

                object result = command.ExecuteScalar();
                if (result != null)
                {
                    int currOrder = (int)result;
                    string transactionID = $"C-{username}-{currOrder}";


                    // update the order number
                    command.CommandText = @"UPDATE InfoUsers
                                    SET orderNum = @newOrderNum
                                    WHERE username = @username";
                    command.Parameters.Clear();
                    command.Parameters.AddWithValue("@newOrderNum", currOrder + 1);
                    command.Parameters.AddWithValue("@username", username);
                    command.ExecuteNonQuery();


                    return transactionID;
                }
                else
                {
                    return "";
                }
            }
        }


        public void StorePaymentInfo(PaymentInfo payment)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"INSERT INTO PaymentInfo
                                        VALUES(@orderID, @username, @cardName, @cardNum)";
                command.Parameters.AddWithValue("orderID", payment.orderID);
                command.Parameters.AddWithValue("username", payment.username);
                command.Parameters.AddWithValue("cardName", payment.cardName);
                command.Parameters.AddWithValue("cardNum", payment.cardNum);

                command.ExecuteNonQuery();
            }
        }


        public void StoreOrderForm(OrderForm form)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"INSERT INTO OrderForm
                                        VALUES(@orderID, @username, @orderStatus, @orderTotal, @orderDate, @orderTime, @returnDate)";
                command.Parameters.AddWithValue("orderID", form.orderID);
                command.Parameters.AddWithValue("username", form.username);
                command.Parameters.AddWithValue("orderStatus", form.orderStatus);
                command.Parameters.AddWithValue("orderTotal", form.orderTotal);
                command.Parameters.AddWithValue("orderDate", form.orderDate);
                command.Parameters.AddWithValue("orderTime", form.orderTime);
                command.Parameters.AddWithValue("returnDate", form.returnDate);

                command.ExecuteNonQuery();
            }
        }




        public void StoreOrderItem(string transactionID, string username)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"SELECT username, CartItems.prodID, Products.prodPrice
                        FROM CartItems
                        JOIN Products ON CartItems.prodID = Products.prodID
                        WHERE username = @username";
                command.Parameters.AddWithValue("@username", username);

                using (var reader = command.ExecuteReader())
                {
                    List<OrderItems> orderItemsList = new List<OrderItems>();

                    while (reader.Read())
                    {
                        OrderItems orderItem = new OrderItems();
                        orderItem.orderID = transactionID;
                        orderItem.prodID = reader["prodID"].ToString();
                        orderItem.prodPrice = Convert.ToSingle(reader["prodPrice"]);

                        orderItemsList.Add(orderItem);
                    }

                    reader.Close();

                    foreach (var item in orderItemsList)
                    {
                        using (var updateCommand = connection.CreateCommand())
                        {
                            updateCommand.CommandText = @"UPDATE Products 
                                          SET prodAvail = 'false' 
                                          WHERE prodID = @prodID";
                            updateCommand.Parameters.AddWithValue("@prodID", item.prodID);
                            updateCommand.ExecuteNonQuery();
                        }

                        using (var insertCommand = connection.CreateCommand())
                        {
                            insertCommand.CommandText = @"INSERT INTO OrderItems (orderID, prodID, price)
                                          VALUES (@orderID, @prodID, @price)";
                            insertCommand.Parameters.AddWithValue("@orderID", item.orderID);
                            insertCommand.Parameters.AddWithValue("@prodID", item.prodID);
                            insertCommand.Parameters.AddWithValue("@price", item.prodPrice);

                            insertCommand.ExecuteNonQuery();
                        }

                        // Delete the item from the wishlist
                        using (var deleteWishlistCommand = connection.CreateCommand())
                        {
                            deleteWishlistCommand.CommandText = @"DELETE FROM WishListItems WHERE username = @username AND prodID = @prodID";
                            deleteWishlistCommand.Parameters.AddWithValue("@username", username);
                            deleteWishlistCommand.Parameters.AddWithValue("@prodID", item.prodID);
                            deleteWishlistCommand.ExecuteNonQuery();
                        }
                    }
                }

                // Clear the cart after items have been ordered
                using (var deleteCommand = connection.CreateCommand())
                {
                    deleteCommand.CommandText = @"DELETE FROM CartItems WHERE username = @username";
                    deleteCommand.Parameters.AddWithValue("@username", username);
                    deleteCommand.ExecuteNonQuery();
                }
            }
        }

        public List<string> GetProdIDsByOrderID(string orderID)
        {
            List<string> prodIDs = new List<string>();

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = "SELECT prodID FROM OrderItems WHERE orderID = @orderID";
                command.Parameters.AddWithValue("@orderID", orderID);

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        prodIDs.Add(reader["prodID"].ToString());
                    }
                }
            }

            return prodIDs;
        }





        // get order forms from a specific user
        public IEnumerable<OrderForm> GetUserOrderForms(string username)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"SELECT * FROM OrderForm WHERE username = @username";
                command.Parameters.Add("username", username);


                List<OrderForm> orderForms = new List<OrderForm>();

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        TimeSpan orderTime = reader.GetTimeSpan(reader.GetOrdinal("orderTime"));

                        OrderForm orderForm = new OrderForm(
                            reader["orderID"].ToString(),
                            username,
                            reader["orderStatus"].ToString(),
                            Convert.ToDateTime(reader["orderDate"]),
                            Convert.ToDateTime(reader["returnDate"]),
                            reader.GetOrdinal("orderTotal"),
                            orderTime
                        );


                        orderForms.Add(orderForm);
                    }

                }

                return orderForms;

            }

        }

        public IEnumerable<OrderForm> GetUserOrderFormsByStatus(string username, string orderStatus)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                string query = @"SELECT * FROM OrderForm WHERE username = @username";

                if (orderStatus == "InProcess")
                {
                    query += " AND orderStatus IN ('Order Placed', 'Preparing to Ship', 'In Transit')";
                }
                else if (orderStatus == "Delivered")
                {
                    query += " AND orderStatus = 'Delivered'";
                }
                else if (orderStatus == "ToReturn")
                {
                    query += " AND orderStatus = 'To Return'";
                }
                else if (orderStatus == "Completed")
                {
                    query += " AND orderStatus = 'Completed'";
                }

                command.CommandText = query;
                command.Parameters.AddWithValue("@username", username);

                List<OrderForm> orderForms = new List<OrderForm>();

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        TimeSpan orderTime = reader.GetTimeSpan(reader.GetOrdinal("orderTime"));

                        OrderForm orderForm = new OrderForm(
                            reader["orderID"].ToString(),
                            username,
                            reader["orderStatus"].ToString(),
                            Convert.ToDateTime(reader["orderDate"]),
                            Convert.ToDateTime(reader["returnDate"]),
                            reader.GetOrdinal("orderTotal"),
                            orderTime
                        );

                        orderForms.Add(orderForm);
                    }
                }

                return orderForms;
            }
        }


        public IEnumerable<OrderItems> GetUserOrderItems(string orderID)
        {
            List<OrderItems> orderItemsList = new List<OrderItems>();

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"SELECT OrderItems.orderID, Products.prodID, Products.prodName, Products.prodPrice, OrderItems.price as TotalPrice
                                        FROM OrderItems 
                                        JOIN Products on OrderItems.prodID = Products.prodID
                                        WHERE orderID = @orderID";

                command.Parameters.AddWithValue("@orderID", orderID);

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        OrderItems orderItem = new OrderItems()
                        {
                            orderID = reader["orderID"].ToString(),
                            prodID = reader["prodID"].ToString(),
                            prodName = reader["prodName"].ToString(),
                            prodPrice = Convert.ToSingle(reader["prodPrice"]),
                            totalPrice = Convert.ToSingle(reader["TotalPrice"])
                        };

                        orderItemsList.Add(orderItem);
                    }
                }
            }

            return orderItemsList;
        }


        // get information on the orderForm from the orderID
        public IEnumerable<OrderForm> GetInfoOrderForm(string username, string orderID)
        {
            List<OrderForm> orderItemsList = new List<OrderForm>();

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"SELECT * FROM OrderForm WHERE orderID = @orderID";
                command.Parameters.Add("orderID", orderID);


                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        TimeSpan orderTime = reader.GetTimeSpan(reader.GetOrdinal("orderTime"));

                        OrderForm form = new OrderForm(
                            reader["orderID"].ToString(),
                            username,
                            reader["orderStatus"].ToString(),
                            Convert.ToDateTime(reader["orderDate"]),
                            Convert.ToDateTime(reader["returnDate"]),
                            reader.GetOrdinal("orderTotal"),
                            orderTime
                        );

                        orderItemsList.Add(form);

                    }
                }
            }

            return orderItemsList;
        }



        public bool IsCartEmpty(string username)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"SELECT COUNT(*) FROM CartItems WHERE username = @username";
                command.Parameters.AddWithValue("@username", username);

                int count = (int)command.ExecuteScalar();

                return count == 0;
            }
        }



        public void StoreReceipt(string username, string orderID, byte[] imageData)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (var command = connection.CreateCommand())
                {
                    // Insert receipt data into CompletedOrders table
                    command.CommandText = "INSERT INTO CompletedOrders (username, orderID, image_receipt) VALUES (@username, @orderID, @receipt)";
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@orderID", orderID);
                    command.Parameters.AddWithValue("@receipt", imageData);
                    command.ExecuteNonQuery();
                }

                using (var command = connection.CreateCommand())
                {
                    // Update orderStatus in OrderForm table
                    command.CommandText = "UPDATE OrderForm SET orderStatus = @status WHERE orderID = @orderID";
                    command.Parameters.AddWithValue("@status", "Completed");
                    command.Parameters.AddWithValue("@orderID", orderID);
                    command.ExecuteNonQuery();
                }
            }
        }

        public void SetProdAvail(string prodID)
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (var command = connection.CreateCommand())
                {
                    // Update prodAvail in Products table
                    command.CommandText = "UPDATE Products SET prodAvail = 'true' WHERE prodID = @prodID";
                    command.Parameters.AddWithValue("@prodID", prodID);
                    command.ExecuteNonQuery();
                }
            }

        }


        public void AddProductRating(string prodID, int userRating)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"INSERT INTO ProductRating
                                        VALUES(@prodID, @userRating)";
                command.Parameters.AddWithValue("prodID", prodID);
                command.Parameters.AddWithValue("userRating", userRating);

                command.ExecuteNonQuery();
            }
        }



        }
    }
}