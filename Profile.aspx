<%@ Page Title="My Orders" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TrendLease_WebApp.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Optional: CSS for custom styling */
        .modal-header {
            background-color: #2d3c4d;
            color: #ffffff;
        }

        .modal-body {
            background-color: white;
        }

        .modal-footer {
            background-color: white;
        }

        .order-span {
            color: #2D3C4D;
        }

        .drpdwn {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h1 class="mb-5 mt-3">My Orders</h1>
        <div class="row justify-content-center">


            <%-- dropdown --%>
            <div class="row container">
                <asp:DropDownList ID="ddlOrderStatus" runat="server" class="form-select drpdwn" AutoPostBack="true" OnSelectedIndexChanged="ddlOrderStatus_SelectedIndexChanged">
                    <asp:ListItem Text="In Process" Value="InProcess"></asp:ListItem>
                    <asp:ListItem Text="Delivered" Value="Delivered"></asp:ListItem>
                    <asp:ListItem Text="To Return" Value="ToReturn"></asp:ListItem>
                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div>
                <%-- header --%>
                <div class="card p-1 mt-4 mb-4">
                    <div class="row">
                        <div class="col-md-3 d-flex justify-content-center align-items-center">
                            <div></div>
                        </div>
                        <h6 class="col-md-3 d-flex justify-content-center align-items-center">
                            <div>Order Date</div>
                        </h6>
                        <h6 class="col-md-3 d-flex justify-content-center align-items-center">
                            <div>Return Date</div>
                        </h6>
                        <h6 class="col-md-3 d-flex justify-content-center align-items-center">
                            <div>Total Price</div>
                        </h6>
                    </div>
                </div>



                <%-- Main Content --%>
                <asp:Repeater ID="UserOrderFormsRepeater" runat="server" OnItemDataBound="UserOrderFormsRepeater_ItemDataBound">
                    <ItemTemplate>
                        <div class="card mt-3 mb-3 p-3">

                            <a href="#" class="row" data-bs-toggle="modal" data-bs-target="#itemProd<%# Container.ItemIndex %>">

                                <div class="col-md-3 d-flex justify-content-center align-items-center">
                                    <%-- date icon --%>
                                    <span class="order-span">
                                        <svg xmlns="http://www.w3.org/2000/svg" height="24" width="21" viewBox="0 0 448 512">
                                            <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                            <path fill="#2d3c4d" d="M160 112c0-35.3 28.7-64 64-64s64 28.7 64 64v48H160V112zm-48 48H48c-26.5 0-48 21.5-48 48V416c0 53 43 96 96 96H352c53 0 96-43 96-96V208c0-26.5-21.5-48-48-48H336V112C336 50.1 285.9 0 224 0S112 50.1 112 112v48zm24 48a24 24 0 1 1 0 48 24 24 0 1 1 0-48zm152 24a24 24 0 1 1 48 0 24 24 0 1 1 -48 0z" />
                                        </svg>
                                    </span>
                                </div>
                                <div class="col-md-3 d-flex justify-content-center align-items-center">
                                    <%-- order date --%>
                                    <span class="order-span">
                                        <%# Convert.ToDateTime(Eval("orderDate")).ToString("MMMM dd, yyyy") %>
                                    </span>
                                </div>
                                <div class="col-md-3 d-flex justify-content-center align-items-center">
                                    <%-- return date --%>
                                    <span class="order-span">
                                        <%# Convert.ToDateTime(Eval("returnDate")).ToString("MMMM dd, yyyy") %>
                                    </span>
                                </div>
                                <div class="col-md-3 d-flex justify-content-center align-items-center">
                                    <%-- order status --%>
                                    <asp:Label ID="statusLbl" runat="server" class="order-span" Text='<%# Eval("orderStatus") %>'></asp:Label>
                                </div>
                            </a>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="itemProd<%# Container.ItemIndex %>" tabindex="-1" aria-labelledby="itemProdModal<%# Container.ItemIndex %>" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-scrollable" role="document">
                                <div class="modal-content">

                                    <%-- header --%>
                                    <div class="modal-header">
                                        <h5 class="modal-title">Order Details</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                    <%-- content --%>
                                    <div class="modal-body mx-3 my-3">
                                        <h6 class="mb-3">Order ID: <%# Eval("orderID") %></h6>
                                        <div>
                                            <%# GetOrderItems(Container.DataItem) %>
                                        </div>
                                    </div>


                                    <%-- RETURN ITEM --%>


                                    <asp:Panel ID="ReturnItemContainer" runat="server">
                                        <div>
                                            Upload Proof of Return:
                                        </div>
                                        <div>
                                            <asp:FileUpload ID="receipt" runat="server" accept=".png,.jpg,.jpeg" />
                                        </div>
                                    </asp:Panel>


                                    <%-- button --%>
                                    <div>
                                        <asp:Button ID="receivedBtn" runat="server" Text="Return Item" CommandArgument='<%# Eval("orderID") %>' OnClick="receivedBtn_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>


            </div>

            <!-- NoProduct div -->
            <div id="NoProduct" runat="server">
                <div class="card mt-3 mb-3 text-center">
                    <div class="card-body">
                        <p class="card-text">You have no orders yet.</p>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
