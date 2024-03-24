using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TrendLease_WebApp.App.Products;

namespace TrendLease_WebApp.App.Carts
{
    public class CartRepository
    {

        public string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


        // insert item to cart
        public void InsertItemCart(string username, string prodID)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"INSERT INTO CartItems(username, prodID) VALUES(@username, @prodID)";
                command.Parameters.AddWithValue("username", username);
                command.Parameters.AddWithValue("prodID", prodID);

                command.ExecuteNonQuery();
            }
        }


        // get all cart items user
        public IEnumerable<Cart> GetCarts(string username)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();


                command.CommandText = @"SELECT CartItems.prodID, prodName, prodPrice FROM CartItems 
                                        LEFT JOIN Products 
                                        ON CartItems.prodID = Products.prodID
                                        WHERE username = @username;";
                command.Parameters.AddWithValue("username", username);

                using (var reader = command.ExecuteReader())
                {
                    var products = new List<Cart>();

                    while (reader.Read())
                    {
                        products.Add(new Cart
                        {
                            prodID = reader["prodID"].ToString(),
                            prodName = reader["prodName"].ToString(),
                            prodPrice = Convert.ToSingle(reader["prodPrice"])
                        });
                    }

                    return products;
                }
            }
        }

        // Calculate total price of items in the cart
        public float CalculateTotalPrice(IEnumerable<Cart> cartItems)
        {
            float totalPrice = 0;

            foreach (var item in cartItems)
            {
                totalPrice += item.prodPrice;
            }

            return totalPrice;
        }


        // does the item exists in the cart
        public bool ItemExistsInCart(string username, string prodID)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"SELECT COUNT(*) FROM CartItems WHERE username = @username AND prodID = @prodID";
                command.Parameters.AddWithValue("username", username);
                command.Parameters.AddWithValue("prodID", prodID);

                int count = (int)command.ExecuteScalar();

                return count > 0;
            }
        }


        // delete from cart
        public void DeleteFromCart(string username, string prodID)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"DELETE FROM CartItems WHERE username = @username AND prodID = @prodID";
                command.Parameters.AddWithValue("username", username);
                command.Parameters.AddWithValue("prodID", prodID);

                command.ExecuteNonQuery();
            }
        }


    }
}