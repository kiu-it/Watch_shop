<%@ Page Title="Update Account" Language="C#" MasterPageFile="~/Pages/CustomerPage/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="UpdateAccount.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.UpdateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-header h2 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .form-group input,
        .form-group select,
        .form-group .file-upload {
            width: 85%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-group select.small-width {
            width: 50%;
        }

        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-group .file-upload {
            padding: 0;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <div class="form-header">
            <h2>Update Your Account</h2>
        </div>
        <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>
        <div class="form-group">
            <asp:Label ID="lblFullname" runat="server" Text="Fullname:"></asp:Label>
            <asp:TextBox ID="txtFullname" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblPhone" runat="server" Text="Phone:"></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
            <asp:DropDownList ID="ddlGender" runat="server" CssClass="small-width">
                <asp:ListItem Text="Nam" Value="1"></asp:ListItem>
                <asp:ListItem Text="Nữ" Value="2"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label ID="lblAvatar" runat="server" Text="Avatar:"></asp:Label>
            <asp:FileUpload ID="fileUploadAvatar" runat="server" CssClass="file-upload" />
        </div>
        <div class="form-group">
            <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:"></asp:Label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnUpdate" runat="server" Text="Update Account" OnClick="btnUpdate_Click" />
        </div>
    </div>
</asp:Content>
