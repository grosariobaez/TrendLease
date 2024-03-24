<%@ Page Title="My Cart" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="TrendLease_WebApp.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container mt-4">
        <h1 class="mb-5 mt-3 main-title">My Cart</h1>
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
                <div class="card mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Order Summary</h5>
                        <!-- Total number of items -->
                        
                        <p class="mb-3">Total Items: <asp:Label ID="totalItems" runat="server" Text=""></asp:Label></p>

                        <!-- Product details -->
                        <ul id="productDetails" class="list-group mb-3">
                            <asp:Repeater ID="ProdDetails" runat="server">
                                <ItemTemplate>
                                    <li class="list-group-item">
                                        <!-- Use Eval to display product details -->
                                        <%# Eval("prodName") %> - ₱<%# Eval("prodPrice", "{0:F2}") %>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>


                        </ul>

                        <!-- Subtotal -->
                        <h6 class="mb-3">Total Price: <asp:Label ID="totalPrice" runat="server" Text=""></asp:Label></h6>



                        <!-- Process payment button -->
                        <button type="button" class="btn btn-primary btn-sm btn-block">Process Payment</button>
                    </div>
                </div>
            </div>



        </div>
    </div>
</asp:Content>

