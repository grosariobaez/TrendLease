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

        public IEnumerable<Product> GetAllProducts() {

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                connection.Open();

                command.CommandText = $"SELECT * FROM Products";

                using (var reader = command.ExecuteReader())
                {
                    var products = new List<Product>();

                    while (reader.Read())
                    {
                        products.Add(new Product
                        {
                            prodName = reader.GetString(reader.GetOrdinal("prodName")),
                        });
                    }
                    return products;
                }
            }


        }
    }
}