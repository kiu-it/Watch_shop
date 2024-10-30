<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.LoginAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background: linear-gradient(135deg, #74ebd5, #9face6);
            color: #333;
            font-family: Arial, sans-serif;
        }

        .login-container {
            margin-top: 100px;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
            color: white;
            text-align: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            padding: 15px 0;
        }

        .card-body {
            padding: 20px;
        }

        .form-control {
            height: 40px;
        }

        .btn {
            width: 100%;
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5 login-container">
                    <div class="card">
                        <div class="card-header">
                            <h2>Admin Login</h2>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="txtUsername">Username:</label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtPassword">Password:</label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
