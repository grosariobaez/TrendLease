<%@ Page Title="My Cart" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="TrendLease_WebApp.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .right-column-container {
            /*background-color: #F5F5F5;*/
        }

        .horizontal-line {
            border-top: 1px solid #000;
            margin: 10px 0;
        }

        .text-highlight {
            color: #6A98CC;
            font-weight: 700;
        }

        .paymentBtn {
    background-color: white; 
    color: #6A98CC; 
    border: 1px solid #6A98CC; 
    border-radius: 12px; 
    padding: 10px 20px; 
}

.paymentBtn:hover {
    
    background-color: #6A98CC; 
    color: #fff; 
}

    </style>


    <div class="container mt-5">
        <h1 class="mb-5 mt-3">My Cart</h1>
        <div class="row">
            <!-- Left Column (Cart Items) -->
            <div class="col-md-6">
                <div id="NoProduct" runat="server">
                    <div class="card text-center">
                        <div class="card-body">
                            <p class="card-text">You have no items in your cart.</p>
                        </div>
                    </div>
                </div>
                <div>
                    <asp:Repeater ID="CartRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3">
                                <div class="row g-0">
                                    <div class="col-md-4">
                                        <!-- product image -->
                                        <img class="card-img-top" src="Image/Products/<%# Eval("prodID") %>.png" alt="Card image cap" style="width: 180px; height: auto;">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <!-- product description -->
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <h5 class="card-title"><%# Eval("prodName") %></h5>
                                                    <p class="card-text">Price: ₱<%# Eval("prodPrice", "{0:F2}") %></p>
                                                </div>
                                                <div class="me-4">
                                                    <asp:Button ID="deleteItem" runat="server" Text="" class="btn btn-close" aria-label="Close" OnClick="deleteFromCart_Click" CommandArgument='<%# Eval("prodID") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <!-- Right Column (Order Summary) -->
            <div class="col-md-6">
                <div class="card mb-3 right-column-container px-4 p-3">
                    <div class="card-body">
                        <h5 class="card-title">Order Summary</h5>
                        <!-- Total number of items -->

                        <p class="mb-4 text-highlight">
                            Total Items:
                            <asp:Label class="text-highlight" ID="totalItems" runat="server" Text=""></asp:Label>
                        </p>


                        <!-- Product details -->
                        <div id="productDetails" class="mb-3 mt-3">
                            <asp:Repeater ID="ProdDetails" runat="server">
                                <ItemTemplate>
                                    <div style="border-top: 1px solid slategray; margin: 10px 0;"></div>
                                    <div class="d-flex justify-content-between mb-3">
                                        <div class="col-auto">
                                            <%# Eval("prodName") %>
                                        </div>
                                        <div class="col-auto">
                                            ₱<%# Eval("prodPrice", "{0:F2}") %>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div style="border-top: 1px solid slategray; margin: 10px 0;"></div>
                        </div>
                    </div>
                    <!-- Subtotal -->
                    <h6 class="mb-3 mt-1 col-md-12 text-end text-highlight">Total Price:
                        <asp:Label ID="totalPrice" runat="server" class="text-highlight" Text=""></asp:Label>
                    </h6>

                </div>


                <div class="card p-5 mb-4">



                    <h5 class="card-title">Return Date</h5>
                    <%-- Calendar --%>
                    <div class="mb-5">
                        Select Date of Return:
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
                    </div>





                    <h5 class="card-title">Payment Information</h5>
                    <div class="mb-3">
                        <select class="form-select" id="paymentMethod" aria-label="Payment Method">
                            <option selected>Select Payment Method</option>
                            <option value="credit">Credit Card</option>
                            <option value="debit">Debit Card</option>
                            <option value="paypal">PayPal</option>
                        </select>
                    </div>

                    <div class="mb-3">

                        <input type="text" class="form-control" id="cardholderName" placeholder="Enter Cardholder's Name">
                    </div>

                    <div class="mb-3">
                        <input type="text" class="form-control" id="cardNumber" placeholder="Enter Card Number">
                    </div>


                    <asp:Button ID="Button1" class="btn-sm mt-3 paymentBtn" runat="server" Text="Process Payment" />


                </div>
            </div>
        </div>



    </div>
    </div>
</asp:Content>

