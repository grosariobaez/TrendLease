using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrendLease_WebApp.App.Orders
{
    public class OrderItems
    {
        public string orderID {  get; set; }
        public string prodID { get; set; }
        public float price { get; set; }
    }
}