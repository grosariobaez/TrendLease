using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrendLease_WebApp.App.Orders
{
    public class OrderForm
    {
        public string orderID { get; set; }
        public string username { get; set; }
        public string orderStatus { get; set; }
        public DateTime orderDate { get; set; }
        public DateTime returnDate { get; set; }
        public float orderTotal { get; set; }
        public TimeSpan orderTime { get; set; }


        public OrderForm(string orderID, string username, string orderStatus, DateTime orderDate, DateTime returnDate, float orderTotal, TimeSpan orderTime)
        {
            this.orderID = orderID;
            this.username = username;
            this.orderStatus = orderStatus;
            this.orderDate = orderDate;
            this.returnDate = returnDate;
            this.orderTotal = orderTotal;
            this.orderTime = orderTime;
        }
    }

}