using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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



        protected string GetOrderItems(object dataItem)
        {
            OrderForm orderForm = (OrderForm)dataItem;
            string orderID = orderForm.orderID;

            OrderRepository repository = new OrderRepository();
            IEnumerable<OrderItems> orderItems = repository.GetUserOrderItems(orderID);

            string itemsHtml = "";

            foreach (OrderItems orderItem in orderItems)
            {
                // Construct HTML for each order item
                itemsHtml += "<li>" + orderItem.prodName + " - ₱" + orderItem.prodPrice.ToString() + "</li>";
            }

            return itemsHtml;
        }

        protected void UserOrderFormsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the modal control within the repeater item
                HtmlGenericControl modalBody = (HtmlGenericControl)e.Item.FindControl("modalBody");

                if (modalBody != null)
                {
                    // Get the orderID from the data item
                    string orderID = DataBinder.Eval(e.Item.DataItem, "orderID").ToString();

                    // Set the modal body text to the orderID
                    modalBody.InnerText = orderID;
                }
            }
        }


    }
}