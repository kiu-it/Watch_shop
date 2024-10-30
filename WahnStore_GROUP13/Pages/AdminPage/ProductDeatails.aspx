<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ProductDeatails.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.ProductDeatails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Panel Container Styles */
        .panel-container {
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* Panel Heading Styles */
        .panel-heading {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border-radius: 8px 8px 0 0;
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        /* Form Group Styles */
        .form-group {
            margin-bottom: 15px;
        }

        /* Readonly TextBox Styles */
        .form-control[readonly] {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 8px;
            border-radius: 4px;
        }

        /* Button Styles */
        .btn-custom {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
            text-align: center;
            display: inline-block;
            margin-top: 20px;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Thông tin chi tiết sản phẩm</h1>
    <div class="panel-container">
        <div class="panel-heading">Thông tin sản phẩm</div>
        <div class="panel-body">
            <div class="form-group">
                <label for="txtMaSanPham">Mã sản phẩm</label>
                <asp:TextBox ID="txtMaSanPham" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtTenSanPham">Tên sản phẩm </label>
                <asp:TextBox ID="txtTenSanPham" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="image">Hình ảnh</label>
                <asp:Image ID="image" CssClass="form-control" runat="server" Width="100" Height="100" ReadOnly="true" />
            </div>
            <div class="form-group">
                <label for="txtMoTa">Mô tả</label>
                <asp:TextBox ID="txtMoTa" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtGiaTien">Giá tiền</label>
                <asp:TextBox ID="txtGiaTien" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtSoLuong">Số lượng</label>
                <asp:TextBox ID="txtSoLuong" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtXuatXu">Xuất xứ</label>
                <asp:TextBox ID="txtXuatXu" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDuongKinh">Đường kính mặt số</label>
                <asp:TextBox ID="txtDuongKinh" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtBeDayMatSo">Bề dày mặt số</label>
                <asp:TextBox ID="txtBeDayMatSo" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtBaoHiem">Thời gian bảo hiểm</label>
                <asp:TextBox ID="txtBaoHiem" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtGioiTinh">Giới tính</label>
                <asp:TextBox ID="txtGioiTinh" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtThuongHieu">Thương hiệu</label>
                <asp:TextBox ID="txtThuongHieu" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtLoaiKinh">Loại kính</label>
                <asp:TextBox ID="txtLoaiKinh" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtMauMatSo">Màu mặt số</label>
                <asp:TextBox ID="txtMauMatSo" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtChatLieuDay">Chất liệu dây</label>
                <asp:TextBox ID="txtChatLieuDay" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>

        </div>
        <a href="~/Pages/AdminPage/BestSeller.aspx" class="btn-custom">Quay lại</a>

    </div>
</asp:Content>
