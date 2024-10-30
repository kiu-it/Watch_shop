<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.AddProduct" %>
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
            max-width: 800px;
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            color: #007bff;
        }

        .form-group input, .form-group select {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            width: 100%;
            margin-bottom: 15px;
            font-size: 16px;
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
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Thêm mới sản phẩm</h1>
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">Thông tin sản phẩm</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="txtTenSanPham">Tên sản phẩm (*)</label>
                <asp:TextBox ID="txtTenSanPham" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="fileHinhAnh">Hình ảnh</label>
                <asp:FileUpload ID="fileHinhAnh" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtMoTa">Mô tả</label>
                <asp:TextBox ID="txtMoTa" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtGiaTien">Giá tiền (*)</label>
                <asp:TextBox ID="txtGiaTien" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtSoLuong">Số lượng (*)</label>
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
                <label for="ddlGioiTinh">Giới tính (*)</label>
                <asp:DropDownList ID="ddlGioiTinh" CssClass="form-control" runat="server">
                    <asp:ListItem Text="---Chọn giới tính---" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlThuongHieu">Thương hiệu (*)</label>
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
        </div>
        <asp:Button runat="server" ID="btnThemMoi" Text="Thêm sản phẩm mới" CssClass="btnThemMoi" OnClick="btnThemMoi_Click" />        
    </div>
</asp:Content>
