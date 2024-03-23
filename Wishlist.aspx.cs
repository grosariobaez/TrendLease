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
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            string username = Request.QueryString["username"];

            WishlistDataBind();
        }


        public void WishlistDataBind()
        {
            WishlistRepository repository = new WishlistRepository();
            WishlistRepeater.DataSource = repository.GetWishlists(Request.QueryString["username"]);
            WishlistRepeater.DataBind();    
        }

        protected void addToCartBtn_Click(object sender, EventArgs e)
        {

            Button button = (Button)sender;
            string prodID = button.CommandArgument.ToString();

            string username = Request.QueryString["username"];

            CartRepository repository = new CartRepository();

            bool itemExistsInCart = repository.ItemExistsInCart(username, prodID);


            if (!itemExistsInCart)
            {
                repository.InsertItemCart(username, prodID);
                Response.Write($"<script>alert('Success! Item is added to cart.');</script>");
            }
            else
            {
                Response.Write($"<script>alert('Item is already in the cart.');</script>");
            }
        }

        protected void deleteToWishlist_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            string prodID = button.CommandArgument.ToString();

            string username = Request.QueryString["username"];

            WishlistRepository repository = new WishlistRepository();


            // validation

            // delete from wishlist
            repository.DeleteFromWishlist(username, prodID);

            Response.Redirect(Request.RawUrl);




        }
    }
}