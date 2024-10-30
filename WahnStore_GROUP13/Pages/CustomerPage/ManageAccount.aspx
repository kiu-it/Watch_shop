<%@ Page Title="Manage Your Account" Language="C#" MasterPageFile="~/Pages/CustomerPage/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="ManageAccount.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.YourAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nav-links {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .nav-links a {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
        }

        .nav-links a:hover {
            background-color: #45a049;
        }

        .order-detail-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .order-detail-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .content-area {
            width: 75%;
            padding-left: 20px;
            padding-right: 20px;
            background-color: #f4f4f4;
            border-radius: 5px;
            padding: 20px;
        }

        .profile-section {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .avatar {
            border-radius: 50%;
            border: 2px solid #4CAF50;
            margin-right: 20px;
        }

        .profile-details div {
            margin-bottom: 10px;
        }

        .update-link {
            display: block;
            padding: 10px;
            color: white;
            background-color: #008CBA;
            text-decoration: none;
            text-align: center;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
        }

        .update-link:hover {
            background-color: #007B9E;
        }

        .button-style {
            padding: 10px 15px;
            border: 1px solid transparent;
            border-radius: 5px;
            background-color: #e67e22;
            color: white;
            transition: background-color 0.3s, border-color 0.3s, color 0.3s;
            cursor: pointer;
            margin-top: 10px;
            display: block;
            text-align: center;
        }

        .button-style:hover {
            background-color: #d35400;
            border-color: #d35400;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="order-detail-container">
        <div class="nav-links">
            <a href="ManageAccount.aspx">Quản lý tài khoản</a>
            <a href="HistoryOrder.aspx">Lịch sử giao dịch</a>
        </div>

        <div class="content-area">
            <h1>Manage Your Account</h1>
            <div class="profile-section">
                <asp:Image ID="imgAvatar" runat="server" Width="150px" Height="150px" CssClass="avatar" />
                <div class="profile-details">
                    <div>
                        <label>Fullname:</label>
                        <asp:Label ID="lblFullname" runat="server" Text=""></asp:Label>
                    </div>

                    <div>
                        <label>Email:</label>
                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                    </div>

                    <div>
                        <label>Phone:</label>
                        <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                    </div>

                    <div>
                        <label>Username:</label>
                        <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
                    </div>

                    <div>
                        <label>Address:</label>
                        <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                    </div>

                    <div>
                        <label>Gender:</label>
                        <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>

            <a href="UpdateAccount.aspx" class="update-link">Cập nhật thông tin tài khoản</a>
        </div>
    </div>
</asp:Content>
