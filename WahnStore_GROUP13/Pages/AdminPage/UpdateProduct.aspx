<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.UpdateProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .card-custom {
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-align: center;
        }
        .form-group label {
            font-weight: bold;
            color: #007bff;
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
        }
        .btn-update {
            margin-top: 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            text-transform: uppercase;
        }
        .btn-update:hover {
            background-color: #218838;
        }
        .image-preview {
            text-align: center;
            margin-bottom: 10px;
        }
        .image-preview img {
            max-width: 100px;
            max-height: 100px;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Cập nhật sản phẩm</h1>
        <div class="card card-custom">
            <div class="card-header">Thông tin sản phẩm</div>
            <div class="card-body">
                <div class="form-group">
                    <label for="txtMaSanPham">Mã sản phẩm</label>
                    <asp:TextBox ID="txtMaSanPham" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtTenSanPham">Tên sản phẩm</label>
                    <asp:TextBox ID="txtTenSanPham" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group image-preview">
                    <asp:Image ID="image" runat="server" Width="100" Height="100" />
                    <asp:FileUpload ID="fileHinhAnh" runat="server" CssClass="form-control-file mt-2" />
                </div>
                <div class="form-group">
                    <label for="txtMoTa">Mô tả</label>
                    <asp:TextBox ID="txtMoTa" CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtGiaTien">Giá tiền</label>
                    <asp:TextBox ID="txtGiaTien" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtSoLuong">Số lượng</label>
                    <asp:TextBox ID="txtSoLuong" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtXuatXu">Xuất xứ</label>
                    <asp:TextBox ID="txtXuatXu" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDuongKinh">Đường kính mặt số</label>
                    <asp:TextBox ID="txtDuongKinh" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtBeDayMatSo">Bề dày mặt số</label>
                    <asp:TextBox ID="txtBeDayMatSo" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtBaoHiem">Thời gian bảo hiểm</label>
                    <asp:TextBox ID="txtBaoHiem" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlGioiTinh">Giới tính</label>
                    <asp:DropDownList ID="ddlGioiTinh" CssClass="form-control" runat="server">
                        <asp:ListItem Text="---Chọn giới tính---" Value=""></asp:ListItem>
                        <asp:ListItem Text="Nam" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Nữ" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Khác" Value="Other"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="ddlThuongHieu">Thương hiệu</label>
                    <asp:DropDownList ID="ddlThuongHieu" CssClass="form-control" runat="server">
                        <asp:ListItem Text="---Chọn thương hiệu---" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtLoaiKinh">Loại kính</label>
                    <asp:TextBox ID="txtLoaiKinh" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtMauMatSo">Màu mặt số</label>
                    <asp:TextBox ID="txtMauMatSo" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtChatLieuDay">Chất liệu dây</label>
                    <asp:TextBox ID="txtChatLieuDay" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <asp:Button CssClass="btn btn-update btn-block" runat="server" ID="btnCapNhat" Text="Cập nhật" OnClick="btnCapNhat_Click" />
            </div>
        </div>
    </div>
</asp:Content>
