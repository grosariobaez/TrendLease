<%@ Page Title="Sign up to TrendLease" Language="C#" MasterPageFile="~/Nav-2.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TrendLease_WebApp.Register_1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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

        .register-container {
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
    <div class="register-container">
        <div class="row justify-content-center align-items-center">

            <div class="col-md-6">
                <h1 class="main-logo">TREND<span class ="main-span">LEASE</span></h1>
                <h1 class="tagline">Join the Trend</h1>
            </div>

            <div class="col-md-6 card box--container">
                
                    <div class="text">
                        <p class="header">Sign Up</p>
                    </div>

                    <div class="form-group">
                        <label for="username">First Name:</label>
                        <asp:TextBox autocomplete="off" ID="fNameTxtBox" CssClass="email" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="fnameTxtBox" runat="server" ErrorMessage="First Name is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="fnameTxtBox" runat="server" ErrorMessage="Invalid Input."  ValidationExpression="^[a-zA-Z\s]{1,50}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    
                    </div>
                    <div class="form-group">
                        <label for="password">Last Name:</label>
                        <asp:TextBox autocomplete="off" ID="lNameTxtBox" CssClass="password" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="lnameTxtBox" runat="server" ErrorMessage="Last Name is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="lnameTxtBox" runat="server" ErrorMessage="Invalid Input."  ValidationExpression="^[a-zA-Z\s]{1,50}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    
                    </div>

                     <div class="form-group">
                         <label for="username">Enter Address:</label>
                         <asp:TextBox autocomplete="off" ID="addressTxtBox" CssClass ="email" runat="server" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="addressTxtBox" runat="server" ErrorMessage="Address is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ControlToValidate="addressTxtBox" runat="server" ErrorMessage="Invalid Input." ValidationExpression="^[a-zA-Z0-9\s\-,.'#/]{1,100}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                     </div>

                    <div class="form-group">
                        <label for="username">Email:</label>
                        <asp:TextBox autocomplete="off" ID="emailTxtBox" CssClass="email" runat="server" Placeholder ="e.g. (abcdefg@gmail.com)" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="emailTxtBox" runat="server" ErrorMessage="Email is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Must be a valid E-mail!" ControlToValidate="emailTxtBox" ForeColor="Red" ValidationExpression="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>


                    <div class="form-group">
                        <label for="username">Enter Phone Number:</label>
                        <asp:TextBox autocomplete="off" ID="phoneNoTxtBox" CssClass="email" runat="server" Placeholder ="e.g. (09112223333)"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="phoneNoTxtBox" runat="server" ErrorMessage="Phone Number is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="phoneNoTxtBox" runat="server" ErrorMessage="Invalid Input." ValidationExpression="^09\d{9}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>

                    </div>

                    <div class="form-group">
                        <label for="username">Username:</label>
                        <asp:TextBox autocomplete="off" ID="usernameTxtBox" CssClass="email" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="usernameTxtBox" runat="server" ErrorMessage="Username is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="usernameTxtBox" runat="server" ErrorMessage="Invalid Input." ValidationExpression="^(?=.*[a-zA-Z])[a-zA-Z][a-zA-Z0-9]{2,49}$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>

                    </div>

                    <div class="form-group">
                        <label for="username">Password:</label>
                        <asp:TextBox autocomplete="off" ID="pass1TxtBox" CssClass="email" runat="server" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="pass1TxtBox" runat="server" ErrorMessage="Password is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="pass1TxtBox" runat="server" ErrorMessage="Invalid Input." ValidationExpression="^(?=.{1,50}$).*$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>


                    </div>


                    <div class="form-group">
                        <label for="username">Confirm Password:</label>
                        <asp:TextBox autocomplete="off" ID="pass2TxtBox" CssClass="email" runat="server" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="pass2TxtBox" runat="server" ErrorMessage="Password is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="pass2TxtBox" runat="server" ErrorMessage="Invalid Input." ValidationExpression="^(?=.{1,50}$).*$" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="CompareValidator6" ControlToValidate="pass2TxtBox" ControlToCompare="pass1TxtBox" Operator="Equal" Type="String" runat="server" ErrorMessage="Passwords do not match." ForeColor="Red" Display="Dynamic"></asp:CompareValidator>

                    </div>


                    <asp:Button ID="registerBtn" CssClass="button" runat="server" Text="Create Account" OnClick="registerBtn_Click" />
                    <div class="text">
                        <p>Already have an account? <a href="Login.aspx">Sign In!</a></p>
                    </div>
                
            </div>

        </div>
    </div>
</asp:Content>