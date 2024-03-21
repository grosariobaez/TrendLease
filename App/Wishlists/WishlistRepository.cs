using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TrendLease_WebApp.App.Products;

namespace TrendLease_WebApp.App.Wishlists
{
    public class WishlistRepository
    {
        public string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        // insert into database
        public void InsertWishlist(string username, string prodID)
        {
            string selectQuery = "SELECT COUNT(*) FROM WishlistItems WHERE username = @Username AND prodID = @ProdID";
            string insertQuery = "INSERT INTO WishlistItems (username, prodID) VALUES (@Username, @ProdID)";

            using (var connection = new SqlConnection(connectionString))
            {
                using (var selectCommand = new SqlCommand(selectQuery, connection))
                {
                    selectCommand.Parameters.AddWithValue("@Username", username);
                    selectCommand.Parameters.AddWithValue("@ProdID", prodID);

                    connection.Open();

                    int count = (int)selectCommand.ExecuteScalar();

                    if (count == 0)
                    {
                        using (var insertCommand = new SqlCommand(insertQuery, connection))
                        {
                            insertCommand.Parameters.AddWithValue("@Username", username);
                            insertCommand.Parameters.AddWithValue("@ProdID", prodID);

                            insertCommand.ExecuteNonQuery();
                        }
                    }

                }
            }
        }




        public bool IsItemInWishlist(string username, string prodID)
        {
            string selectQuery = "SELECT COUNT(*) FROM WishlistItems WHERE username = @Username AND prodID = @ProdID";

            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(selectQuery, connection))
            {
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@ProdID", prodID);

                connection.Open();

                int count = (int)command.ExecuteScalar();
                return count > 0;
            }
        }



        // get wishlist (specific user)
        public IEnumerable<Wishlist> GetWishlists(string username)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();


                command.CommandText = @"SELECT prodName, prodDesc, prodType, prodPrice, WishlistItems.prodID FROM WishlistItems 
                                       LEFT JOIN Products 
                                       ON Products.prodID = WishlistItems.prodID
                                       WHERE username = @username;";

                command.Parameters.AddWithValue ("username", username);


                using (var reader = command.ExecuteReader())
                {
                    var products = new List<Wishlist>();

                    while (reader.Read())
                    {
                        products.Add(new Wishlist
                        {
                            prodName = reader["prodName"].ToString(),
                            prodID = reader["prodID"].ToString(),
                            //prodName = reader["prodName"].ToString(),
                            //prodID = reader["prodID"].ToString(),
                            //prodDesc = reader["prodDesc"].ToString(),
                            //prodType = reader["prodType"].ToString(),
                            //prodPrice = Convert.ToSingle(reader["prodPrice"]),
                            //prodAvail = (bool)reader["prodAvail"],
                            //prodRating = Convert.ToSingle(reader["userRating"]),
                            //reviewCount = Convert.ToInt32(reader["ProductReviews"])
                        });
                    }

                    return products;
                }


            }
        }



    }
}