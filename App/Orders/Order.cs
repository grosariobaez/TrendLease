using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrendLease_WebApp.App.Orders
{
    public class Order
    {
        public string orderID {  get; set; }
        public string prodID { get; set; }
        public string username { get; set; }
        public string cardName { get; set; }
        public string cardNum { get; set; }
        public float total { get; set; }
    }
}