<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageProduct.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.ManageProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #f4f4f9;
            font-family: Arial, sans-serif;
        }

        .btnThemMoi {
            padding: 10px 25px;
            margin-bottom: 15px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .btnThemMoi:hover {
            background-color: #218838;
        }

        .btn-edit {
            background-color: #007bff;
            color: white;
            margin-right: 5px;
            border: none;
            border-radius: 5px;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
        }

        .search {
            width: 100%;
            max-width: 500px;
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .table th, .table td {
            padding: 10px;
            text-align: center;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .table tbody tr:hover {
            background-color: #e9ecef;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            
    <h2>Quản lý sản phẩm</h2>
    
    <div class="input-group search mt-4 mx-auto">
    <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server" placeholder="Nhập từ khóa..."> </asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm"  CssClass="btn btn-primary" OnClick="btnSearch_Click" />
    
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" CssClass="btnThemMoi" PostBackUrl="~/Pages/AdminPage/AddProduct.aspx" />
    <asp:GridView ID="dsSanPham" runat="server" AutoGenerateColumns="false" OnRowDataBound="dsSanPham_RowDataBound" CssClass="table" AllowPaging="true" PageSize="3" OnPageIndexChanging="GridView1_PageIndexChanging" >
        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="Mã sản phẩm" />
            <asp:BoundField DataField="ProductName" HeaderText="Tên sản phẩm" />
            <asp:TemplateField HeaderText="Hình ảnh">
                <ItemTemplate>
                    <img src='<%# "/ProductImg/" + Eval("ProductImage") %>' width="100" height="100" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProductPrice" HeaderText="Giá tiền" />
            <asp:BoundField DataField="ProductQuantity" HeaderText="Số lượng" />
            <asp:BoundField DataField="ProductOrigin" HeaderText="Xuất xứ" />
            <asp:BoundField DataField="ProductDiameter" HeaderText="Đường kính mặt số" />
            <asp:BoundField DataField="ProductThickness" HeaderText="Bề dày mặt số" />
            <%--<asp:BoundField DataField="ProductWarrantyPeriod" HeaderText="Thời gian bảo hiểm" />--%>
            <%--<asp:BoundField DataField="GenderId" HeaderText="Giới tính" />--%>
            <asp:TemplateField HeaderText="Giới tính">
                <ItemTemplate>
                    <asp:Label ID="lblGioiTinh" runat="server" Text='<%# Bind("GenderId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProductGlass" HeaderText="Loại kính" />
            <%--<asp:BoundField DataField="BrandId" HeaderText="Tên hãng" />--%>
            <asp:TemplateField HeaderText="Tên hãng">
                <ItemTemplate>
                    <asp:Label ID="lblTenHang" runat="server" Text='<%# Bind("BrandId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProductColor" HeaderText="Màu mặt số" />
            <asp:BoundField DataField="ProductStrap" HeaderText="Chất liệu dây" />
            <asp:TemplateField>
                <ItemTemplate>                  
                    <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" CssClass="btn btn-edit" OnCommand="btnCapNhat_Click" CommandName="capNhat" CommandArgument='<%# Bind("ProductId") %>' />
                    <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-delete" OnCommand="btnXoa_Click" CommandName="xoaSanPham" CommandArgument='<%# Bind("ProductId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
