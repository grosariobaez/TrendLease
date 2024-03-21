<%@ Page Title="Log in to TrendLease" Language="C#" MasterPageFile="~/Nav-2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TrendLease_WebApp.Sample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Inter');

        body {
            font-family: 'Inter';
            background-color: #fdfbfe;
        }

        .main-logo {
            margin-bottom: 10px;
            font-size: 5rem;
            font-weight: 700;
        }

        .tagline {
            font-size: 20px;
            font-weight: 700;
        }

        .main-span {
            color: #6a98cc;
        }

        .box--container {
            background-color: #2D3C4D;
            border-radius: 13px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.385);
            color: #b7d9ff;
            padding: 4rem;
        }

        .button {
            background-color: #b7d9ff;
            color: #2D3C4D;
            font-weight: bold;
            padding: 14px 20px;
            margin: 25px 0 25px;
            border: none;
            border-radius: 18px;
            cursor: pointer;
            width: 100%;
            transition: 0.4s ease 0s;
        }

            .button:hover {
                background-color: #1d2834;
                color: #b7d9ff;
                transition: 0.2s ease 0s;
            }

        .email,
        .password {
            width: 100%;
            padding: 13px;
            margin-top: 5px;
            margin-bottom: 25px;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 7px;
        }

        .text {
            display: flex;
            justify-content: center;
        }

        .header {
            font-weight: bold;
            color: #b7d9ff;
            font-size: 2rem;
        }

        .login-container {
            margin-top: 7rem;
            margin-bottom: 7rem;
            margin-left: 5%;
            margin-right: 5%;
        }


        /* MEDIA QUERIES */

        @media (max-width: 1198px) {
            .main-logo {
                font-size: 3rem;
            }
        }

        @media (max-width: 780px) {
            .main-logo,
            .tagline {
                text-align: center;
            }

            .box--container {
                margin-top: 2rem;
                padding-left: 5rem;
                padding-right: 5rem;
            }
        }

        a {
            text-decoration: none;
            color: white;
        }
    </style>


    
    <div class="login-container">
        <div class="row justify-content-center align-items-center">

            <div class="col-md-6">
                <h1 class="main-logo">TREND<span class ="main-span">LEASE</span></h1>
                <h1 class="tagline">Join the Trend</h1>
            </div>

            <div class="col-md-6 card box--container">

                <div class="text">
                    <p class="header">Log in</p>
                </div>

                <div class="form-group">
                    <label for="username">Username:</label>
                    <asp:TextBox autocomplete="off" ID="username" CssClass="email" runat="server" placeholder="Enter Username" />
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <asp:TextBox autocomplete="off" ID="password" CssClass="password" runat="server" TextMode="Password" placeholder="Enter Password" />
                </div>

                <asp:Button ID="loginBtn" CssClass="button" runat="server" Text="Sign In" OnClick="loginBtn_Click" />
                <div class="text">
                    <p>Don't have an account yet? <a href="Register.aspx">Sign Up!</a></p>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
