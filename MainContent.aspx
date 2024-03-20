<%@ Page Title="" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="MainContent.aspx.cs" Inherits="TrendLease_WebApp.MainContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .custom-radio {
            display: inline-block;
            color: #2D3C4D;
            border: 1px solid #2D3C4D;
            cursor: pointer;
            border-radius: 16px;
            transition: background-color 0.3s ease, border-color 0.3s ease;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
            margin: 0;
        }

            .custom-radio:hover {
                background-color: #b7d9ff;
            }

            .custom-radio input[type="radio"] {
                display: none;
            }

            .custom-radio label {
                padding: 8px 36px;
                border-radius: 16px;
            }


            .custom-radio input[type="radio"]:checked + label,
            .custom-radio input[type="radio"]:active + label {
                /*background-color: #b7d9ff;*/
                border-color: #6a98cc;
                background-color: #6a98cc;
                color: white;
                font-weight: 600;
            }

        .selections {
            /*margin-right: 10%;*/
        }

        .rating-container {
            font-size: 14px;
            font-weight: 600;
            color: slategray;
        }

        .title-container {
            font-size: 20px;
            font-weight: 600;
        }

        .price-container {
            font-size: 16px;
            font-weight: 600;
        }

        .card {
            border: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Main Container --%>
    <div class="mt-5 mb-5 container">

        <%-- Selection Container --%>
        <div class="row justify-content-end">
            <div class="col-auto selections">
                <asp:RadioButton ID="RadioButton6" runat="server" Text="All" GroupName="Options" class="custom-radio me-2" />
                <asp:RadioButton ID="RadioButton1" runat="server" Text="Apparel" GroupName="Options" class="custom-radio me-2" />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Bottoms" GroupName="Options" class="custom-radio me-2" />
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Footwear" GroupName="Options" class="custom-radio me-2" />
                <asp:RadioButton ID="RadioButton4" runat="server" Text="Bags" GroupName="Options" class="custom-radio me-2" />
            </div>
        </div>



        <%-- Products Main Container --%>
        <div class="row">
            <div class="col-md-4 mt-5">
                <div class="card" style="width: 18rem; position: relative;">
                    <img class="card-img-top" src="Image/Products/1.png" alt="Card image cap">
                    <div class="card-body">
                        <!-- Rating -->
                        <div class="d-flex align-items-center rating-container">
                            <svg class="me-2" xmlns="http://www.w3.org/2000/svg" height="14" width="15.75" viewBox="0 0 576 512">
                                <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path fill="#FFD43B" d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z" />
                            </svg>
                            <div class="me-2">4.8</div>
                            <div>(1) reviews</div>
                        </div>

                        <!-- Product Title -->
                        <div class="title-container mt-2">
                            Oversized Doodie Shirt
                        </div>

                        <!-- Product Price -->
                        <div class="price-container">
                            ₱ 1000.00
                        </div>

                        <!-- Button Overlapping -->
                        <div class="position-absolute top-0 end-0 mt-2">
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-sm" Text="" />
                            <button type="button" class="btn btn-sm" aria-label="Close">
                                <span aria-hidden="true">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="32" width="36" viewBox="0 0 576 512">
                                        <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path fill="#6a98cc" d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9l2.6-2.4C267.2 438.6 256 404.6 256 368c0-97.2 78.8-176 176-176c28.3 0 55 6.7 78.7 18.5c.9-6.5 1.3-13 1.3-19.6v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5zM432 512a144 144 0 1 0 0-288 144 144 0 1 0 0 288zm16-208v48h48c8.8 0 16 7.2 16 16s-7.2 16-16 16H448v48c0 8.8-7.2 16-16 16s-16-7.2-16-16V384H368c-8.8 0-16-7.2-16-16s7.2-16 16-16h48V304c0-8.8 7.2-16 16-16s16 7.2 16 16z" />
                                    </svg>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>












    </div>
</asp:Content>