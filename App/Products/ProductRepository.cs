using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using TrendLease_WebApp.App.Users;

namespace TrendLease_WebApp.App.Products
{
    public class ProductRepository
    {
        public string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        public IEnumerable<Product> GetAllProducts()
        {

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = @"SELECT Products.prodID, prodName, prodDesc, prodType, prodPrice, prodAvail, ProductRating.userRating 
                                        FROM Products 
                                        JOIN ProductRating ON Products.ProdID = ProductRating.ProdID";

                using (var reader = command.ExecuteReader())
                {
                    var products = new List<Product>();

                    while (reader.Read())
                    {
                        products.Add(new Product
                        {
                            prodName = reader["prodName"].ToString(),
                            prodID = reader["prodID"].ToString(),
                            prodDesc = reader["prodDesc"].ToString(),
                            prodType = reader["prodType"].ToString(),
                            prodPrice = Convert.ToSingle(reader["prodPrice"]), // Convert to float
                            prodAvail = (bool)reader["prodAvail"], // Cast to bool
                            prodRating = Convert.ToInt32(reader["userRating"]) // Convert to int
                        });
                    }

                    return products;
                }
            }
        }
    }
}
