using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrendLease_WebApp.App.Carts;
using TrendLease_WebApp.App.Wishlists;

namespace TrendLease_WebApp
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            string username = Request.QueryString["username"];

            Session["Username"] = username;

            CartDataBind();

        }

        


        public void CartDataBind()
        {
            // Get cart items from the repository
            CartRepository repository = new CartRepository();
            var cartItems = repository.GetCarts(Request.QueryString["username"]);

            // Bind cart items to repeater
            CartRepeater.DataSource = cartItems;
            CartRepeater.DataBind();

            ProdDetails.DataSource = cartItems; 
            ProdDetails.DataBind();

            // Calculate total price
            float totalCartPrice = repository.CalculateTotalPrice(cartItems);

            // Set total items and total price in frontend
            int noOfItems = cartItems.Count();
            totalItems.Text = noOfItems.ToString();
            totalPrice.Text = $"₱ {totalCartPrice.ToString("F2")}";

            NoProduct.Visible = noOfItems == 0;


        }

        protected void deleteFromCart_Click (object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string prodID = button.CommandArgument.ToString();

            string username = Request.QueryString["username"];

            CartRepository repository = new CartRepository();


            // validation

            // delete from wishlist
            repository.DeleteFromCart(username, prodID);

            Response.Redirect(Request.RawUrl);
        }

        protected void payBtn_Click(object sender, EventArgs e)
        {







        }
    }
}