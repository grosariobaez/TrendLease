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

            var wishlistItems = repository.GetWishlists(Request.QueryString["username"]);
            WishlistRepeater.DataSource = wishlistItems;
            WishlistRepeater.DataBind();
            int noOfItems = wishlistItems.Count();

            NoProduct.Visible = noOfItems == 0;
        }

        protected void addToCartBtn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            // Find the productName label within the current repeater item
            Label productName = (Label)item.FindControl("productName");
            string prodName = productName.Text;
            string prodID = btn.CommandArgument.ToString();

            string username = Request.QueryString["username"];

            CartRepository repository = new CartRepository();

            bool itemExistsInCart = repository.ItemExistsInCart(username, prodID);

            if (!itemExistsInCart)
            {
                repository.InsertItemCart(username, prodID);
                Response.Write($"<script>alert('Item {prodName} added to wishlist.');</script>");
            }
            else
            {
                Response.Write($"<script>alert('Item {prodName} is already in your wishlist.');</script>");
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