<%@ Page Title="" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="TrendLease_WebApp.ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        img {
            height: 30rem;
        }

        .prod-container {
            margin-top: 3rem;
            margin-bottom: 4rem;
        }

        .prod-title {
            font-size: 70px;
            font-weight: 700;
        }

        .prod-price {
            font-size: 26px;
            font-weight: 500;
            color: #6a98cc;
        }

        .prod-desc {
            font-size: 16px;
            margin-top: 1rem;
        }

        .horizontal-line {
            border-bottom: 1px solid #D3D3D3;
            margin-top: 2rem;
            margin-bottom: 2rem;
        }

        .btnDesign {
            background-color: transparent;
            padding: 5rem;
            border: 1px solid #6a98cc;
            color: #6a98cc;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
            width: 48%;
        }

        .btnDesign:hover {
            background-color: #6a98cc;
            color: white;
            text-decoration: none;
        }

        .btn-container {
            margin-top: 4rem;
        }

        .back-btn {
            color: #2D3C4D;
            font-weight: 700;
        }

        .prod-rating-stars {
            font-weight: 600;
        }
    </style>

    <div>

        <asp:Repeater ID="ViewProductRepeater" runat="server">
            <ItemTemplate>

                <div class="container prod-container">

                    <a href="MainContent.aspx?username=<%= Session["Username"] %>" class="d-flex align-items-center flex-row mb-4 m-2">
                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="17.5" viewBox="0 0 448 512">
                            <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path fill="#2d3c4d" d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z" />
                        </svg>
                        <div class="back-btn px-3">
                            Back
                        </div>
                    </a>
                    <div class="row m-2">
                        <div class="col-md-6">
                            <div>
                                <img src="Image/Products/<%# Eval("prodID") %>.png" />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div>

                                <div class="prod-title">
                                    <%# Eval("prodName") %>
                                </div>

                                <div class=" d-flex align-items-center justify-content-between flex-row">
                                    <div class="prod-price">
                                        PHP <%# Eval("prodPrice") %>.00
                                    </div>

                                    <div class="prod-rating d-flex align-items-center flex-row mb-3 mt-3">

                                        <div>
                                            <svg class="me-2" xmlns="http://www.w3.org/2000/svg" height="14" width="15.75" viewBox="0 0 576 512">
                                                <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                                <path fill="#FFD43B" d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z" />
                                            </svg>
                                        </div>
                                        <div class="prod-rating-stars">
                                            <%# Eval("prodRating") %> Stars
                                        </div>

                                    </div>
                                </div>

                                <div class="prod-desc">
                                    <%# Eval("prodDesc") %>
                                </div>
                                <div class="horizontal-line">
                                </div>

                                <%-- Buttons --%>
                                <div class="btn-container row d-flex justify-content-between">
                                    <asp:Button ID="Button1" runat="server" Text="Add To Cart" class="btnDesign col-md-5" />
                                    <asp:Button ID="Button2" runat="server" Text="Add To Wishlist" class="btnDesign col-md-5" />
                                </div>


                            </div>
                        </div>

                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>




</asp:Content>
