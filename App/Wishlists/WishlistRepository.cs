using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

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




    }
}