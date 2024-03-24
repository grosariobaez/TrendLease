<%@ Page Title="My Wishlist" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="TrendLease_WebApp.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .prod-card {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .prod-type {
            font-weight: 100;
            font-size: 16px;
        }

        .prod-title {
            font-weight: 500;
            font-size: 20px;
            margin-top: -0.7rem;
        }

        .addToCartBtn {
            font-size: 14px;
            background-color: #6A98CC;
            padding: 4px calc(16px + 5px);
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            position: absolute;
            bottom: 20px;
            right: 10px;
        }

            .addToCartBtn:hover {
                background-color: #2D3C4D;
            }

        .main-title {
            font-size: 28px;
            font-weight: 700;
            color: #2D3C4D;
        }

            .main-title:hover {
                color: #2D3C4D;
            }

        @media (max-width: 1200px) {
            .prod-card {
                max-height: calc(100vh - 160px);
            }
        }
    </style>

    <div class="container mb-5">
        <h1 class="mb-5 mt-3 main-title">My Wishlist
        </h1>
        <div id="NoProduct" runat="server">
            <div class="card text-center">
                <div class="card-body">
                    <p class="card-text">You have no items in your wishlist.</p>
                </div>
            </div>
        </div>
        <div class="row">

            <asp:Repeater ID="WishlistRepeater" runat="server">
                <ItemTemplate>
                    <div class="col-md-6">
                        <div class="card mb-3" style="position: relative;">
                            <div class="row g-0">
                                <div class="col-md-7">
                                    <!-- Image -->
                                    <img class="prod-card img-fluid rounded-start" src="Image/Products/<%# Eval("prodID") %>.png" style="max-height: 100%;" />
                                </div>
                                <div class="col-md-5 mb-5">
                                    <div class="card-body">
                                        <!-- Details -->
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div>
                                                <p class="card-title prod-type"><%# Eval("prodType") %></p>
                                            </div>
                                            <div>
                                                <asp:Button ID="deleteToWishlist" class="btn-close btn-sm" runat="server" OnClick="deleteToWishlist_Click" CommandArgument='<%# Eval("prodID") %>' />
                                            </div>
                                        </div>
                                        <p class="card-text prod-title"><%# Eval("prodName") %></p>
                                        <!-- Details -->
                                    </div>
                                    <!-- Add to Cart Button -->
                                    <div class="card-footer bg-transparent border-0" style="position: absolute; bottom: 0; right: 0;">
                                        <asp:Button ID="addToCartBtn" runat="server" Text="Add to Cart" class="addToCartBtn" OnClick="addToCartBtn_Click" CommandArgument='<%# Eval("prodID") %>' />
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
