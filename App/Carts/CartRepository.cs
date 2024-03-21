using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TrendLease_WebApp.App.Carts
{
    public class CartRepository
    {

        public string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


        // INSERT CART


        // get all cart items user
        //public IEnumerable<Cart> GetCarts(string username)
        //{
        //    using (var connection = new SqlConnection(connectionString))
        //    using (var command = connection.CreateCommand())
        //    {
        //        connection.Open();


        //        command.CommandText = @"SELECT prodName, prodDesc, prodType, prodPrice, WishlistItems.prodID FROM WishlistItems 
        //                                LEFT JOIN Products 
        //                                ON Products.prodID = WishlistItems.prodID
        //                                WHERE username = @username;";

        //        command.Parameters.AddWithValue("username", username);

        //    }

        //}
    }
}