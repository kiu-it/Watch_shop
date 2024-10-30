<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký | WahnStore</title>
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

        .register-container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            max-width: 400px;
            width: 80%;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px; /* Khoảng cách giữa các phần tử */
        }

        h2 {
            color: #007bff;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
            text-align: center;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #007bff;
            font-size: 16px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #007bff;
            outline: none;
        }

        .btn-register {
            background-color: #007bff;
            color: white;
            padding: 12px 18px; /* Kích thước nút register được giảm lại */
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }

        .btn-register:hover {
            background-color: #0056b3;
        }

        .login-link {
            margin-top: 15px;
            font-size: 14px;
            color: #007bff;
            text-align: center;
        }

        .login-link a {
            text-decoration: none;
            transition: color 0.3s;
        }

        .login-link a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <form id="form1" runat="server">
            <h2>Đăng ký tài khoản</h2>
            <div class="form-row">
                <div>
                    <label for="txtFullName">Full Name:</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div>
                    <label for="txtEmail">Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-row">
                <div>
                    <label for="txtPhone">Phone:</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div>
                    <label for="txtUsername">Username:</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-row">
                <div>
                    <label for="txtPassword">Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div>
                    <label for="txtAddress">Address:</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-row">
                <div>
                    <label for="ddGender">Gender:</label>
                    <asp:DropDownList ID="ddGender" runat="server" CssClass="form-control" size="1"></asp:DropDownList>
                </div>
                <div>
                    <label for="fuAvatar">Avatar:</label>
                    <asp:FileUpload ID="fuAvatar" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div>
                <asp:Button ID="btnRegister" runat="server" CssClass="btn-register" Text="Register" OnClick="btnRegister_Click" />
            </div>
            <div class="login-link">
                <p><a href="Login.aspx">Bạn đã có tài khoản?</a></p>
            </div>
        </form>
    </div>
</body>
</html>
