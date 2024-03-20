<%@ Page Title="" Language="C#" MasterPageFile="~/Nav-1.Master" AutoEventWireup="true" CodeBehind="MainContent.aspx.cs" Inherits="TrendLease_WebApp.MainContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .custom-radio {
            display: inline-block;
            color: #2D3C4D;
            border: 1px solid #2D3C4D;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease, border-color 0.3s ease;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
            margin: 0;
        }


            .custom-radio input[type="radio"] {
                display: none;
            }

            .custom-radio label {
                padding: 8px 36px;
            }


            .custom-radio input[type="radio"]:checked + label,
            .custom-radio input[type="radio"]:active + label {
                background-color: #b7d9ff;
                border-color: #b7d9ff;
                font-weight: 600;
            }

        .selections {
            /*margin-right: 10%;*/
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Main Container --%>
    <div class="mt-5 mb-5 container">
        <div class="row justify-content-end">
            <div class="col-auto selections">
                <asp:RadioButton ID="RadioButton6" runat="server" Text="All" GroupName="Options" class="custom-radio me-2" />
                <asp:RadioButton ID="RadioButton1" runat="server" Text="Shirt" GroupName="Options" class="custom-radio me-2" />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Pant" GroupName="Options" class="custom-radio me-2" />
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Shoe" GroupName="Options" class="custom-radio me-2" />
                <asp:RadioButton ID="RadioButton4" runat="server" Text="Bag" GroupName="Options" class="custom-radio me-2" />
                <asp:RadioButton ID="RadioButton5" runat="server" Text="OOTD" GroupName="Options" class="custom-radio" />
            </div>
        </div>

        <div>
            sample body
        </div>
    </div>
</asp:Content>
