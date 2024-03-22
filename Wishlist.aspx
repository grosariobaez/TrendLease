<%@ Page Title="" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="TrendLease_WebApp.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .prod-card {
            height: auto;
        }

        .prod-type {
            font-weight: 100;
            font-size: 16px;
        }

        .prod-title {
            font-weight: 500;
            font-size: 24px;
            margin-top: -0.7rem;
        }

        .addToCartBtn {
            font-size: 14px;
            background-color: #6A98CC;
            padding: 4px 16px;
            color: #fff; 
            border: none;
            border-radius: 4px; 
            cursor: pointer; 
            transition: background-color 0.3s;
            margin-top: 10%;
        }

        .addToCartBtn:hover {
            background-color: #2D3C4D; 
        }

        @media (max-width: 1200px) {
        .prod-card {
            display: none;
        }
        }
    </style>





<div class="container">
    <div class="row">
        <div class="col-12 mb-3">
            My Wishlist
        </div>
        <asp:Repeater ID="WishlistRepeater" runat="server">
            <ItemTemplate>
                <div class="col-md-6">
                    <div class="card mb-3">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <!-- Image -->
                                <img class="prod-card img-fluid rounded-start prod-card" src="Image/Products/<%# Eval("prodID") %>.png" style="max-height: 100%;" />

                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <!-- Details -->
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div>
                                            <p class="card-title prod-type"><%# Eval("prodType") %></p>
                                        </div>
                                        <div>
                                            <asp:Button ID="Button2" class="btn-close btn-sm" runat="server" />
                                        </div>
                                    </div>
                                    <p class="card-text prod-title"><%# Eval("prodName") %></p>
                                    <!-- Details -->
                                </div>
                                <!-- Add to Cart Button -->
                                <div class="card-footer bg-transparent border-0">
                                    <asp:Button ID="addToCartBtn" runat="server" Text="Add to Cart" class="addToCartBtn w-100" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>




</asp:Content>
