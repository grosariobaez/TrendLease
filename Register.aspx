<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TrendLease_WebApp.Register_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <%-- Bootstrap --%>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <%-- CSS --%>
    <link href="Styles/Entry.css" rel="stylesheet" type="text/css" />

    <title></title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center">

            <div class="col-md-6">
                <h1 class="logo">TREND<span>LEASE</span></h1>
                <h1 class="tagline">Join the Trend</h1>
            </div>

            <div class="col-md-6 card box--container">
                <form id="registerForm" runat="server">

                    <div class="text">
                        <p class="header">Register</p>
                    </div>

                    <div class="form-group">
                        <label for="username">Username:</label>
                        <asp:TextBox ID="TextBox1" CssClass="email" runat="server" placeholder="Enter Username" />
                    </div>
                    <div class="form-group">
                        <label for="username">First Name:</label>
                        <asp:TextBox ID="email" CssClass="email" runat="server" placeholder="Enter First Name" />
                    </div>
                    <div class="form-group">
                        <label for="password">Last Name:</label>
                        <asp:TextBox ID="password" CssClass="password" runat="server" TextMode="Password" placeholder="Enter Last Name" />
                    </div>

                    <div class="form-group">
                        <label for="username">Email:</label>
                        <asp:TextBox ID="TextBox2" CssClass="email" runat="server" placeholder="Enter Email" />
                    </div>
                    <div class="form-group">
                        <label for="username">Password:</label>
                        <asp:TextBox ID="TextBox3" CssClass="email" runat="server" placeholder="Enter Password" />
                    </div>
                    <div class="form-group">
                        <label for="username">Confirm Password:</label>
                        <asp:TextBox ID="TextBox4" CssClass="email" runat="server" placeholder="Confirm Password" />
                    </div>
                    <asp:Button ID="registerBtn" CssClass="button" runat="server" Text="Create Account" OnClick="registerBtn_Click" />
                    <div class="text">
                        <p>Already have an account? <a href="Login.aspx">Sign In!</a></p>
                    </div>
                </form>
            </div>

        </div>
    </div>
</body>
</html>
