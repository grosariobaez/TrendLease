using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrendLease_WebApp.App.Products;

namespace TrendLease_WebApp
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            string username = Request.QueryString["username"];
            string prodID = Request.QueryString["prodID"];

            Session["Username"] = username;
            Session["ProdID"] = prodID;

            SpecificProductDataBind();

        }

        public void SpecificProductDataBind()
        {
            ProductRepository repository = new ProductRepository();

            ViewProductRepeater.DataSource = repository.GetSpecificProduct(Request.QueryString["prodID"]);
            ViewProductRepeater.DataBind();

        }





    }
}