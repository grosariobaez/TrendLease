using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrendLease_WebApp.App.Products
{
    public class Product
    {
        public string prodID { get; set; }
        public string prodName { get; set; }
        public string prodDesc { get; set; }
        public string prodType { get; set; }

        public float prodPrice { get; set; }

        public bool prodAvail { get; set; } 

        public int prodRating { get; set; } 

    }
}