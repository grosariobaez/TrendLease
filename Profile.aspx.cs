using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TrendLease_WebApp.App.Orders;

namespace TrendLease_WebApp
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Request.QueryString["username"];

            if (!IsPostBack)
            {
                BindData();
            }

        }



        public void BindData()
        {
            OrderRepository repository = new OrderRepository();

            IEnumerable<OrderForm> orderForms = repository.GetUserOrderForms(Request.QueryString["username"]);
            
            UserOrderFormsRepeater.DataSource = orderForms; 
            UserOrderFormsRepeater.DataBind();
        }
    }
}