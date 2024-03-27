<%@ Page Title="TrendLease" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="MainContent.aspx.cs" Inherits="TrendLease_WebApp.MainContent" %>

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
            border-color: #6a98cc;
            background-color: #6a98cc;
            color: white;
            font-weight: 600;
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


        .viewProdBtn {
            background-color: transparent;
            border: 1px solid #6a98cc;
            color: #6a98cc;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
        }

        .viewProdBtn:hover {
            background-color: #6a98cc;
            color: white;
            text-decoration: none;
        }

        .noprod {
            margin-bottom: 28%;
        }

        .wish-btn {
            font-size: 30px;
            font-weight: 600;
            color: #6a98cc;
            margin-top: -0.5rem;
            outline: none;
        }

        .wish-btn:hover {
            color: red;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Main Container --%>
    <div class="mt-5 mb-5 container">

        <%-- Selection Container --%>
        <div class="row justify-content-end">
            <div class="col-auto selections">
                <asp:RadioButton ID="RadioButton6" runat="server" Text="All" GroupName="Options" class="custom-radio me-2 mb-2" OnCheckedChanged="RadioButton_CheckedChanged" AutoPostBack="True" Checked="true" />
                <asp:RadioButton ID="RadioButton1" runat="server" Text="Apparel" GroupName="Options" class="custom-radio me-2 mb-2" OnCheckedChanged="RadioButton_CheckedChanged" AutoPostBack="True" />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Bottoms" GroupName="Options" class="custom-radio me-2 mb-2" OnCheckedChanged="RadioButton_CheckedChanged" AutoPostBack="True" />
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Footwear" GroupName="Options" class="custom-radio me-2 mb-2" OnCheckedChanged="RadioButton_CheckedChanged" AutoPostBack="True" />
                <asp:RadioButton ID="RadioButton4" runat="server" Text="Bags" GroupName="Options" class="custom-radio me-2 mb-2" OnCheckedChanged="RadioButton_CheckedChanged" AutoPostBack="True" />
            </div>
        </div>




        <%-- Products Main Container --%>
        <div class="row d-flex justify-content-center">

            <%-- No Items in the Cart --%>
            <div id="NoProduct" runat="server" class="noprod">
                <div class="card mt-5 mb-5 text-center">
                    <div class="card-body">
                        <p class="card-text">No available items in this category.</p>
                    </div>
                </div>
            </div>
            <asp:Repeater ID="ItemsRepeater" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mt-5 d-flex align-items-center justify-content-center">
                        <div class="card" style="width: 18rem; position: relative;">
                            <img class="card-img-top" src="Image/Products/<%# Eval("prodID") %>.png" alt="Card image cap">
                            <div class="card-body">
                                <!-- Rating -->
                                <div class="d-flex align-items-center rating-container">
                                    <svg class="me-2" xmlns="http://www.w3.org/2000/svg" height="14" width="15.75" viewBox="0 0 576 512">
                                        <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path fill="#FFD43B" d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z" />
                                    </svg>
                                    <div class="me-2"><%# Eval("prodRating") %></div>
                                    <div>(<%# Eval("reviewCount") %>) reviews</div>
                                </div>

                                <div>
                                    <div>
                                        <!-- Product Title -->
                                        <div class="title-container mt-2">
                                            <%# Eval("prodName") %>
                                        </div>

                                        <!-- Product Price -->
                                        <div class="price-container">
                                            <%# Eval("prodPrice", "{0:C}") %>
                                        </div>

                                    </div>
                                    <%-- Button See Product --%>
                                   <asp:Button ID="SeeProdBtn" class="viewProdBtn mt-3" runat="server" Text="View Product" OnClick="SeeProdBtn_Click" CommandArgument='<%# Eval("prodID") %>' />
                                </div>


                                <!-- Button Overlapping -->
                                <div class="position-absolute top-0 end-0 mt-2">
                                    <asp:Button ID="Button1" runat="server" class="btn btn-sm wish-btn pe-3" Text="♡" OnClick="WishlistBtn_Click" CommandArgument='<%# Eval("prodID") + ";" + Eval("prodName") + ";" + Eval("prodType") + ";" + Eval("prodType")%>' />
                                
                                </div>

                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>