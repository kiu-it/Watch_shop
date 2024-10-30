<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.AddCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* CSS for the form container */
        #TabThemCus {
            width: 80%;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        /* CSS for form elements */
        .form-row {
            margin-bottom: 15px;
        }

        .form-row label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-row input,
        .form-row select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-row img {
            max-width: 100px;
            max-height: 100px;
            margin-top: 10px;
            display: block;
        }

        .form-button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 16px;
        }

        .form-button:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Thêm người dùng mới</h2>
    <div>
        <asp:Table ID="TabThemCus" runat="server">
            <asp:TableRow class="form-row">
                <asp:TableCell>Nhập họ tên</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtFullNameThem" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow class="form-row">
                <asp:TableCell>Nhập email</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtemailThem" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow class="form-row">
                <asp:TableCell>Nhập SĐT</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtSdtThem" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow class="form-row">
                <asp:TableCell>Nhập tên tài khoản</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtTaiKhoanThem" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow class="form-row">
                <asp:TableCell>Nhập mật khẩu</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtMatKhauThem" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow class="form-row">
                <asp:TableCell>Nhập giới tính</asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddGenderThem" runat="server" size="1"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow class="form-row">
                <asp:TableCell>Nhập địa chỉ</asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtDiaChiThem" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow class="form-row">
                <asp:TableCell>Thêm ảnh</asp:TableCell>
                <asp:TableCell>
                    <asp:FileUpload ID="upAvatar" runat="server" />
                    <img id="imgAvatarThem" runat="server" alt="Avatar" style="max-width: 100px; max-height: 100px;" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Button ID="bntThemCus" Text="Thêm Tài Khoản" runat="server" OnClick="bntThemCus_Click" CssClass="form-button"/>
    </div>
</asp:Content>
