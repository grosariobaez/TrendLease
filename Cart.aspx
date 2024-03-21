<%@ Page Title="" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="TrendLease_WebApp.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div>
        Cart
    </div>

    <div>
        <asp:Repeater ID="CartRepeater" runat="server">
            <ItemTemplate>





            </ItemTemplate>
        </asp:Repeater>

    </div>


</asp:Content>
