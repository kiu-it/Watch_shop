<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.AddBrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            padding-top: 20px;
        }

        .panel {
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            margin: auto;
            padding: 20px;
            max-width: 600px;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .form-group input {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            width: 100%;
            margin-bottom: 15px;
        }

        .btnThemMoi {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-weight: bold;
            text-transform: uppercase;
            margin-top: 15px;
            cursor: pointer;
        }

        .btnThemMoi:hover {
            background-color: #218838;
        }

        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Thêm mới thương hiệu</h1>
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">Thông tin thương hiệu</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="txtTenThuongHieu">Tên thương hiệu</label>
                <asp:TextBox ID="txtTenThuongHieu" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtMoTa">Mô tả</label>
                <asp:TextBox ID="txtMoTa" CssClass="form-control" runat="server"></asp:TextBox>
            </div>        
        </div>
        <asp:Button runat="server" ID="btnThemMoi" Text="Thêm thương hiệu mới" CssClass="btnThemMoi" OnClick="btnThemMoi_Click" />       
    </div>
</asp:Content>
