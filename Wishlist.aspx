<%@ Page Title="" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="TrendLease_WebApp.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div>
        My Wishlist
    </div>


    <div>
        <asp:Repeater ID="WishlistRepeater" runat="server">
            <ItemTemplate>
                <div>
                    <%# Eval("prodName") %>

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>


</asp:Content>
