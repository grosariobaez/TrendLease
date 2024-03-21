using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrendLease_WebApp.App.Carts;

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
            CartRepository repository = new CartRepository();
            CartRepeater.DataSource = repository.GetCarts(Request.QueryString["username"]);
            CartRepeater.DataBind();
        }

    }
}