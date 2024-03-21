using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrendLease_WebApp.App.Products;

namespace TrendLease_WebApp
{
    public partial class MainContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            // Retrieve username from query string
            string username = Request.QueryString["username"];

            // Store username in session state
            Session["Username"] = username;

            BindProductRepeater();

        }

        public void BindProductRepeater()
        {
            ProductRepository repository = new ProductRepository();
            ItemsRepeater.DataSource = repository.GetAllProducts();
            ItemsRepeater.DataBind();
        }

        protected void SeeProdBtn_Click(object sender, EventArgs e)
        {

        }
    }
}