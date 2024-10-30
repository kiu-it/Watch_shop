<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageBrand.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.ManageBrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn-custom {
            padding: 5px 20px;
            margin-bottom: 15px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .btn-add {
            background-color: #28a745;
            color: white;
        }

        .btn-edit {
            background-color: #17a2b8;
            color: white;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .table-custom {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            border: 1px solid #dee2e6;
        }

        .table-custom th, .table-custom td {
            padding: 12px;
            text-align: left;
            border: 1px solid #dee2e6;
        }

        .table-custom th {
            background-color: #007bff;
            color: white;
        }

        .table-custom tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .page-header {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
            color: #007bff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="page-header">Quản lý thương hiệu</h1>
        <div class="text-right">
            <asp:Button ID="btnThemMoi" runat="server" Text="Thêm mới" CssClass="btn btn-custom btn-add" PostBackUrl="~/Pages/AdminPage/AddBrand.aspx" />
        </div>
        <asp:GridView runat="server" ID="tlbBrand" AutoGenerateColumns="false" CssClass="table-custom">
            <Columns>
                <asp:BoundField DataField="BrandId" HeaderText="Mã thương hiệu" />
                <asp:BoundField DataField="BrandName" HeaderText="Tên thương hiệu" />
                <asp:BoundField DataField="BrandDescription" HeaderText="Mô tả" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnCapNhat" runat="server" Text="Cập nhật" CssClass="btn btn-custom btn-edit" OnCommand="btnCapNhat_Click" CommandName="capNhat" CommandArgument='<%# Bind("BrandId") %>' />
                        <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-custom btn-delete" OnCommand="btnXoa_Click" CommandName="xoa" CommandArgument='<%# Bind("BrandId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
