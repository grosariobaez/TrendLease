using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

    }
}