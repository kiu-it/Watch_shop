<%@ Page Title="Update Customer" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateCustomer.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.UpdateCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .panel {
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .panel-heading {
            background-color: #f4f4f4;
            border-bottom: 1px solid #ddd;
            padding: 15px;
            border-radius: 8px 8px 0 0;
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .panel-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .text-center {
            text-align: center;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            margin-top: 20px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Cập nhật tài khoản</h1>

    <div class="panel">
        <div class="panel-heading">
            Thông tin tài khoản
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="txtMaTaiKhoan">Mã tài khoản</label>
                <asp:TextBox ID="txtMaTaiKhoan" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group text-center">
                <asp:Image runat="server" ID="imageTaiKhoan" CssClass="img-thumbnail" Width="100" Height="100" />
                <div class="input-group mt-3">
                    <asp:FileUpload ID="fileHinhAnh" runat="server" />
                </div>
            </div>

            <div class="form-group">
                <label for="txtEmailED">Email</label>
                <asp:TextBox ID="txtEmailED" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPhoneED">Số điện thoại</label>
                <asp:TextBox ID="txtPhoneED" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtFullNameED">Tên tài khoản</label>
                <asp:TextBox ID="txtFullNameED" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtMatKhauED">Mật Khẩu</label>
                <asp:TextBox ID="txtMatKhauED" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlGioiTinhED">Giới tính</label>
                <asp:DropDownList ID="ddlGioiTinhED" CssClass="form-control" runat="server">
                    <asp:ListItem Text="---Chọn giới tính---" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtDiaChiED">Địa chỉ</label>
                <asp:TextBox ID="txtDiaChiED" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <asp:Button runat="server" ID="btnCapNhatED" CssClass="btn-primary" Text="Cập nhật tài khoản" OnClick="btnCapNhatED_Click"/>
        </div>
    </div>
</asp:Content>
