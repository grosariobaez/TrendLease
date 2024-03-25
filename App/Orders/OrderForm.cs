using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrendLease_WebApp.App.Orders
{
    public class OrderForm
    {
        public string orderID { get; set; }
        public string orderStatus { get; set; }
        public DateTime orderDate { get; set; }
        public DateTime returnDate { get; set; }
        public string orderTotal { get; set; }
        public TimeSpan orderTime {  get; set; } 
        
    }
}