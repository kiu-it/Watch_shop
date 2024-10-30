<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập | WahnStore</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #9face6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }
        .logo {
            margin-bottom: 20px;
            text-align: center;
            font-size: 40px;
            color: #007bff;
            font-weight: bold;
        }
        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            max-width: 350px;
            width: 80%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h2 {
            color: #007bff;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 20px;
            width: 100%;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            color: #007bff;
            font-size: 16px;
        }
        .form-control {
            width: 300px;
            padding: 12px; /* Giảm chiều rộng của padding */
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: #007bff;
            outline: none;
        }
        .btn-login {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px; /* Điều chỉnh giảm khoảng cách margin-top */
            transition: background-color 0.3s;
            width: 325px;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
        .register-link {
            margin-top: 10px; /* Giảm khoảng cách margin-top */
            font-size: 14px;
            color: #007bff;
            text-align: center;
        }
        .register-link a {
            text-decoration: none;
            transition: color 0.3s;
        }
        .register-link a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn-login" />
            <div class="register-link">
                <p><a href="Register.aspx">Bạn chưa có tài khoản?</a></p>
            </div>
        </form>
    </div>
</body>
</html>
