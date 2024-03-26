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
                        <asp:TextBox ID="calendar" runat="server" TextMode="Date"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="dateValidator" runat="server"
                            ControlToValidate="calendar"
                            ErrorMessage="Please select a date of return"
                            CssClass="text-danger"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <script>
                        var today = new Date();

                        var sevenDaysFromNow = new Date();
                        sevenDaysFromNow.setDate(today.getDate() + 7);

                        var calendarTextBox = document.getElementById('<%= calendar.ClientID %>');

                        calendarTextBox.min = today.toISOString().split('T')[0];
                        calendarTextBox.max = sevenDaysFromNow.toISOString().split('T')[0];
                    </script>




                    <h5 class="card-title">Payment Information</h5>
                    <div class="mb-3">
                        <asp:DropDownList ID="paymentMethod" runat="server" CssClass="form-select"
                            aria-label="Payment Method">
                            <asp:ListItem Text="Select Payment Method" Value=""></asp:ListItem>
                            <asp:ListItem Text="Credit Card" Value="credit"></asp:ListItem>
                            <asp:ListItem Text="Debit Card" Value="debit"></asp:ListItem>
                            <asp:ListItem Text="PayPal" Value="paypal"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="paymentMethodValidator" runat="server"
                            ControlToValidate="paymentMethod" InitialValue=""
                            ErrorMessage="Please select a payment method"
                            CssClass="text-danger" />
                    </div>



                    <div class="mb-3">
                        <asp:TextBox ID="cardholderName" class="form-control" placeholder="Enter Cardholder's Name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cardholder's Name is required." ControlToValidate="cardholderName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div class="mb-3">
                        <asp:TextBox ID="cardNumber" class="form-control" placeholder="Enter Card Number" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Card Number is required." ControlToValidate="cardNumber" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>


                    <asp:Button ID="payBtn" class="btn-sm mt-3 paymentBtn" runat="server" Text="Process Payment" OnClick="payBtn_Click" />


                </div>
            </div>
        </div>



    </div>
    </div>
</asp:Content>

