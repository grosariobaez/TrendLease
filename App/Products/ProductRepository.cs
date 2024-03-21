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

                command.CommandText = @"SELECT Products.prodID, prodName, prodDesc, prodType, prodPrice, prodAvail, 
                                       COALESCE(AVG(ProductRating.userRating), 0) as userRating, 
                                       COALESCE(COUNT(ProductRating.prodID), 0) as ProductReviews
                                       FROM Products 
                                       LEFT JOIN ProductRating ON Products.prodID = ProductRating.prodID
                                       GROUP BY Products.prodID, prodName, prodDesc, prodType, prodPrice, prodAvail;";

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
                            prodRating = Convert.ToSingle(reader["userRating"]), // Convert to int
                            reviewCount = Convert.ToInt32(reader["ProductReviews"])

                        });
                    }

                    return products;
                }
            }
        }

        public IEnumerable<Product> GetProductsByCategory(string category)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                // Construct the SQL query based on the selected category
                string query;
                if (category == "All")
                {
                    query = @"SELECT Products.prodID, prodName, prodDesc, prodType, prodPrice, prodAvail, 
                      COALESCE(AVG(ProductRating.userRating), 0) as userRating, 
                      COALESCE(COUNT(ProductRating.prodID), 0) as ProductReviews
                      FROM Products 
                      LEFT JOIN ProductRating ON Products.prodID = ProductRating.prodID
                      GROUP BY Products.prodID, prodName, prodDesc, prodType, prodPrice, prodAvail;";
                }
                else
                {
                    query = @"SELECT Products.prodID, prodName, prodDesc, prodType, prodPrice, prodAvail, 
                      COALESCE(AVG(ProductRating.userRating), 0) as userRating, 
                      COALESCE(COUNT(ProductRating.prodID), 0) as ProductReviews
                      FROM Products 
                      LEFT JOIN ProductRating ON Products.prodID = ProductRating.prodID
                      WHERE prodType = @category
                      GROUP BY Products.prodID, prodName, prodDesc, prodType, prodPrice, prodAvail;";
                    command.Parameters.AddWithValue("@category", category);
                }

                command.CommandText = query;

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
                            prodRating = Convert.ToSingle(reader["userRating"]), // Convert to float
                            reviewCount = Convert.ToInt32(reader["ProductReviews"])
                        });
                    }

                    return products;
                }
            }
        }



        // get specific item for product view
        public IEnumerable<Product> GetSpecificProduct(string prodID)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                //command.CommandText = @"SELECT * FROM Products WHERE prodID = @prodID";


                command.CommandText = @"SELECT Products.prodID, prodName, prodDesc, prodType, prodPrice, prodAvail, 
                      COALESCE(AVG(ProductRating.userRating), 0) as userRating, 
                      COALESCE(COUNT(ProductRating.prodID), 0) as ProductReviews
                      FROM Products 
                      LEFT JOIN ProductRating ON Products.prodID = ProductRating.prodID
                      WHERE Products.prodID = @prodID
                      GROUP BY Products.prodID, prodName, prodDesc, prodType, prodPrice, prodAvail;";



                command.Parameters.Add("@prodID", prodID);

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
                            prodRating = Convert.ToSingle(reader["userRating"]), // Convert to float
                            reviewCount = Convert.ToInt32(reader["ProductReviews"])
                        });
                    }

                    return products;
                }


            }
        }







    }
}
