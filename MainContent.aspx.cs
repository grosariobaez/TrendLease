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

            if (!string.IsNullOrEmpty(username) && args.Length >= 4)
            {
                string prodID = args[0];
                string prodName = args[1];
                string prodType = args[2];
                string prodPrice = args[3];

                if (!string.IsNullOrEmpty(prodName) && !string.IsNullOrEmpty(prodType) && !string.IsNullOrEmpty(prodPrice))
                {
                    WishlistRepository repository = new WishlistRepository();

                    if (repository.IsItemInWishlist(username, prodID))
                    {
                        Response.Write($"<script>alert('Item {prodName} is already in your wishlist.');</script>");
                    }
                    else
                    {
                        Response.Write($"<script>alert('Item {prodName} added to wishlist.');</script>");
                        repository.InsertWishlist(username, prodID);
                    }
                }
            }

            RadioButton radioButton6 = (RadioButton)FindControlRecursive(Page, "RadioButton6");
            RadioButton radioButton1 = (RadioButton)FindControlRecursive(Page, "RadioButton1");
            RadioButton radioButton2 = (RadioButton)FindControlRecursive(Page, "RadioButton2");
            RadioButton radioButton3 = (RadioButton)FindControlRecursive(Page, "RadioButton3");
            RadioButton radioButton4 = (RadioButton)FindControlRecursive(Page, "RadioButton4");

            if (radioButton6 != null && radioButton1 != null && radioButton2 != null && radioButton3 != null && radioButton4 != null)
            {
                string selectedValue = "";
                if (radioButton6.Checked)
                    selectedValue = radioButton6.Text;
                else if (radioButton1.Checked)
                    selectedValue = radioButton1.Text;
                else if (radioButton2.Checked)
                    selectedValue = radioButton2.Text;
                else if (radioButton3.Checked)
                    selectedValue = radioButton3.Text;
                else if (radioButton4.Checked)
                    selectedValue = radioButton4.Text;

                List<Product> filteredProducts;
                if (selectedValue == "All")
                    filteredProducts = new ProductRepository().GetAllProducts().ToList();
                else
                    filteredProducts = new ProductRepository().GetProductsByCategory(selectedValue).ToList();

                ItemsRepeater.DataSource = filteredProducts;
                ItemsRepeater.DataBind();

                NoProduct.Visible = filteredProducts.Count == 0;
            }
            else
            {
                Response.Write("<script>alert('One or more radio buttons are not found.');</script>");
            }
        }

        protected Control FindControlRecursive(Control control, string id)
        {
            if (control.ID == id)
            {
                return control;
            }

            foreach (Control childControl in control.Controls)
            {
                Control foundControl = FindControlRecursive(childControl, id);
                if (foundControl != null)
                {
                    return foundControl;
                }
            }

            return null;
        }


    }
}