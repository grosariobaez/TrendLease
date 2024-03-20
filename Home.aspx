<%@ Page Title="" Language="C#" MasterPageFile="~/NavHome.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TrendLease_WebApp.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .image-container {
            height: 20rem; /* Adjust this value as needed */
            overflow: hidden;
        }

        .full-width-image {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 mb-5">
        <%-- Introduction --%>
        <div class="container">
            <div class="row">
                <div class="col-md-12 centered-div text-center ">
                    <div>Where Fashion Meets Convenience</div>

                    <div>
                        Discover and Wear the Latest Fashion Trends
                    </div>

                    <div>
                        At TrendLease, we believe that fashion is more than just clothing – it's a statement, 
                        an expression of individuality, and a reflection of the ever-evolving trends that shape our
                        world. That's why we're dedicated to providing a seamless and innovative way for you to 
                        experience the latest in fashion without the commitment of ownership.
                    </div>
                </div>
            </div>
        </div>

        <%-- Image Holder --%>
        <%--<div class="image-container">
            <img src="Image/Home/home-display-1.png" class="full-width-image" />
        </div>--%>
    </div>
</asp:Content>
