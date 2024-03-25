using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrendLease_WebApp.App.Orders
{
    public class OrderRepository
    {
        public string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;


    }
}