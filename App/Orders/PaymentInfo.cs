using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrendLease_WebApp.App.Orders
{
    public class PaymentInfo
    {
        public string orderID { get; set; }
        public string username { get; set; }
        public string cardName { get; set; }
        public string cardNum { get; set; }

        public PaymentInfo(string orderID, string username, string cardName, string cardNum)
        {
            this.orderID = orderID;
            this.username = username;
            this.cardName = cardName;
            this.cardNum = cardNum;
        }
    }
}