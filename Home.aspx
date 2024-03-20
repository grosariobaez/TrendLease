<%@ Page Title="Welcome to TrendLease!" Language="C#" MasterPageFile="~/NavHome.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TrendLease_WebApp.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .image-container {
            height: 20rem; /* Adjust this value as needed */
            overflow: hidden;
        }

        .full-width-image {
            width: 100%;
        }

        .title-header {
            font-weight: 700;
        }

        .title-explanation {
            font-weight: 900;
            font-size: 46px;
        }

        .title-desc {
            font-weight: 500;
            font-size: 14px;
            color: slategray;
        }

        .card-container {
            box-shadow: rgba(9, 30, 66, 0.25) 0px 4px 8px -2px, rgba(9, 30, 66, 0.08) 0px 0px 0px 1px;
            text-align: justify;
        }

            .card-container:hover {
                background-color: #b7d9ff;
            }

        .card-num {
            font-size: 30px;
            font-weight: 600;
            color: #6a98cc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5 mb-5">
        <%-- Introduction --%>
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-md-12 centered-div text-center justify-content-center">
                    <div class="title-header mb-4">WHERE FASHION MEETS CONVENIENCE</div>

                    <div class="title-explanation mb-2">
                        Discover and Wear the Latest Fashion Trends
                    </div>

                    <div class="col-md-6 title-desc mx-auto">
                        At TrendLease, we believe that fashion is more than just clothing – it's a statement, 
                an expression of individuality, and a reflection of the ever-evolving trends that shape our
                world. That's why we're dedicated to providing a seamless and innovative way for you to 
                experience the latest in fashion without the commitment of ownership.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- Image Holder --%>
    <img src="Image/Home/model.png" class="full-width-image mb-5 mt-5" />
    <div class="container mt-5 mb-5">

        <%-- Card Holder --%>
        <div class="container">
            <div class="row d-flex justify-content-around">
                <div class="col-lg-4 col-md-6 col-12 mb-3">
                    <div class="card card-container h-100" style="width: 100%;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-2">
                                    <h5 class="card-title card-num">1</h5>
                                </div>
                                <div class="col-md-10">
                                    <div>
                                        <h6 class="card-subtitle mb-2 text-muted">Sustainable Fashion Initiative</h6>
                                        <p class="card-text">We're all about sustainable style. By renting clothes and accessories, we're reducing fashion's environmental footprint.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12 mb-3">
                    <div class="card card-container h-100" style="width: 100%;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-2">
                                    <h5 class="card-title card-num">2</h5>
                                </div>
                                <div class="col-md-10">
                                    <div>
                                        <h6 class="card-subtitle mb-2 text-muted">Extensive Trend Selection</h6>
                                        <p class="card-text">TrendLease offers a wide range of the latest fashion trends, from runway-inspired pieces to everyday essentials, catering to diverse tastes and occasions.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12 mb-3">
                    <div class="card card-container h-100" style="width: 100%;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-2">
                                    <h5 class="card-title card-num">3</h5>
                                </div>
                                <div class="col-md-10">
                                    <div>
                                        <h6 class="card-subtitle mb-2 text-muted">Flexible Rental Options</h6>
                                        <p class="card-text">Experience fashion freedom with TrendLease's flexible rentals. Experiment with styles and designers hassle-free.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
