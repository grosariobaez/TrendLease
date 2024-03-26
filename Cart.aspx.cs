using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrendLease_WebApp.App.Carts;
using TrendLease_WebApp.App.Orders;
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
            totalPrice.Text = $"{totalCartPrice.ToString("F2")}";

            NoProduct.Visible = noOfItems == 0;


        }

        protected void deleteFromCart_Click(object sender, EventArgs e)
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
            Button button = (Button)sender;

            OrderRepository repository = new OrderRepository();

            // transaction ID
            string transactionID = repository.GetTransactionID(Request.QueryString["username"]);

            if (transactionID == "")
            {
                transactionID = "C-" + Request.QueryString["username"] + "-1";
            }


            // payment information
            string selectedPaymentMethod = paymentMethod.SelectedValue;
            string cardName = cardholderName.Text;
            string cardNo = cardNumber.Text;

            PaymentInfo payment = new PaymentInfo(
                transactionID,
                Request.QueryString["username"],
                cardName,
                cardNo
            );

            repository.StorePaymentInfo(payment);




            float total = float.Parse(totalPrice.Text);


            // store order form
            OrderForm form = new OrderForm(
                transactionID,
                Request.QueryString["username"],
                "Order Placed",
                DateTime.Today,
                DateTime.Parse(calendar.Text),
                total,
                DateTime.Now.TimeOfDay
            );

            repository.StoreOrderForm(form);



            // store order items
            repository.StoreOrderItem(transactionID, Request.QueryString["username"]);


            Response.Write($"<script>alert('{transactionID}')</script>");

        }
    }
}