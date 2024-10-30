<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateBrand.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.UpdateBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-header {
            text-align: center;
            margin-top: 20px;
            color: #007bff;
        }

        .panel-custom {
            max-width: 600px;
            margin: 0 auto;
            margin-top: 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .panel-custom .panel-heading {
            background-color: #007bff;
            color: white;
            padding: 15px;
            font-size: 1.2rem;
        }

        .panel-custom .panel-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ced4da;
        }

        .btn-update {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.2rem;
            text-transform: uppercase;
            margin-top: 20px;
        }

        .btn-update:hover {
            background-color: #218838;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-header">Cập nhật thương hiệu</h1>

    <div class="panel panel-custom">
        <div class="panel-heading">
            <h3 class="panel-title">Cập nhật thương hiệu</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="txtMaThuongHieu">Mã thương hiệu</label>
                <asp:TextBox ID="txtMaThuongHieu" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtTenThuongHieu">Tên thương hiệu</label>
                <asp:TextBox ID="txtTenThuongHieu" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtMoTa">Mô tả</label>
                <asp:TextBox ID="txtMoTa" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" CssClass="btn-update" OnClick="btnCapNhat_Click" />
        </div>
    </div>
</asp:Content>
