using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TrendLease_WebApp.App.Orders;
using TrendLease_WebApp.App.Products;

namespace TrendLease_WebApp
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Request.QueryString["username"];

            if (!IsPostBack)
            {
                ddlOrderStatus.SelectedValue = "InProcess";


                ddlOrderStatus_SelectedIndexChanged(sender, e);
            }
        }


        protected void ddlOrderStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string username = Request.QueryString["username"];
            string selectedStatus = ddlOrderStatus.SelectedValue;

            OrderRepository repository = new OrderRepository();
            IEnumerable<OrderForm> orderForms = repository.GetUserOrderFormsByStatus(username, selectedStatus);

            UserOrderFormsRepeater.DataSource = orderForms;
            UserOrderFormsRepeater.DataBind();

            if (!orderForms.Any())
            {
                NoProduct.Visible = true; 
            }
            else
            {
                NoProduct.Visible = false;
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

            IEnumerable<OrderForm> orderInfoForm = repository.GetInfoOrderForm(Request.QueryString["username"], orderID);
            OrderForm firstOrderForm = orderInfoForm.FirstOrDefault();


            string itemsHtml = "";

            string borrowedDateHtml = @"
                <div class='col'>
                    <h6 class='mb-0'>Borrowed Date</h6>
                </div>
                <div class='col text-end'>
                    <h6 class='mb-0'>" + Convert.ToDateTime(firstOrderForm.orderDate).ToString("MMMM dd, yyyy") + @"</h6>
                </div>";

            string returnDateHtml = @"
                <div class='col'>
                    <h6 class='mb-0'>Return Date</h6>
                </div>
                <div class='col text-end'>
                    <h6 class='mb-0'>" + Convert.ToDateTime(firstOrderForm.returnDate).ToString("MMMM dd, yyyy") + @"</h6>
                </div>";

            itemsHtml += @"
                <div class='row d-flex align-items-center'>" + borrowedDateHtml + @"
                </div>
                <div class='row d-flex align-items-center mb-3'>" + returnDateHtml + @"
                </div>";


            float addItems = 0;

            foreach (OrderItems orderItem in orderItems)
            {
                // Construct HTML for each order item
                itemsHtml +=
                $"<div class='row justify-content-center mb-3 d-flex align-items-center'>" +
                    $"<img class='col' height='125rem' src='/Image/Products/{orderItem.prodID}.png' />" +
                    $"<div class='col'>{orderItem.prodName}</div>" +
                    $"<div class='col text-end'>₱ {orderItem.prodPrice}</div>" +
                    $"</div>";

                addItems += orderItem.prodPrice;
            }

            itemsHtml +=
                $"<h6 class='col text-end'>" +
                $"Total Price: ₱ {addItems}.00" +
                $"</h6>";


            return itemsHtml;
        }

        protected void UserOrderFormsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlGenericControl modalBody = (HtmlGenericControl)e.Item.FindControl("modalBody");

                if (modalBody != null)
                {
                    string orderID = DataBinder.Eval(e.Item.DataItem, "orderID").ToString();

                    modalBody.InnerText = orderID;
                }
            }
        }


    }
}