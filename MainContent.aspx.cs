using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrendLease_WebApp.App.Products;
using TrendLease_WebApp.App.Wishlists;

namespace TrendLease_WebApp
{
    public partial class MainContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            string username = Request.QueryString["username"];

            Session["Username"] = username;

            BindProductRepeater();

            RadioButton_CheckedChanged(RadioButton6, EventArgs.Empty);
        }


        public void BindProductRepeater()
        {
            ProductRepository repository = new ProductRepository();
            ItemsRepeater.DataSource = repository.GetAllProducts();
            ItemsRepeater.DataBind();
        }

        protected void RadioButton_CheckedChanged(object sender, EventArgs e)
        {

            string category = ((RadioButton)sender).Text;

            List<Product> filteredProducts;
            if (category == "All")
            {
                filteredProducts = new ProductRepository().GetAllProducts().ToList();
            }
            else
            {
                filteredProducts = new ProductRepository().GetProductsByCategory(category).ToList();
            }

            ItemsRepeater.DataSource = filteredProducts;
            ItemsRepeater.DataBind();

            NoProduct.Visible = filteredProducts.Count == 0;
        }


        protected void SeeProdBtn_Click(object sender, EventArgs e)
        {

            Button button = (Button)sender;
            string prodID = button.CommandArgument.ToString();

            Response.Redirect($"ViewProduct.aspx?username={Session["Username"]}&prodID={prodID}");
        }

        protected void WishlistBtn_Click(object sender, EventArgs e)
        {

            Button btn = (Button)sender;


            string[] args = btn.CommandArgument.ToString().Split(';');


            string username = Session["Username"] as string;

            if (!string.IsNullOrEmpty(username))
            {
                if (args.Length >= 4)
                {
                    string prodID = args[0];
                    string prodName = args[1];
                    string prodType = args[2];
                    string prodPrice = args[3];




                    if (!string.IsNullOrEmpty(prodName) && !string.IsNullOrEmpty(prodType) && !string.IsNullOrEmpty(prodPrice))
                    {

                        WishlistRepository repository = new WishlistRepository();


                        if (repository.IsItemInWishlist(prodID, username))
                        {
                            Response.Write($"<script>alert('Item {prodName} is already in your wishlist.');</script>");
                        }
                        else
                        {
                            Response.Write($"<script>alert('Item {prodName} added to wishlist.');</script>");
                            repository.InsertWishlist(prodID, username);
                        }
                    }
                }
            }
        }
    }
}