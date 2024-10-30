<%@ Page Title="Manage Customers" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageCustomer.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.ManageCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .btnThemMoi {
            background-color: green;
            color: white;
            margin-bottom: 15px;
        }

        .btn-edit {
            background-color: dodgerblue;
            color: white;
            margin: 0 5px;
        }

        .btn-delete {
            background-color: red;
            color: white;
            margin: 0 5px;
        }

        .grid-container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* Customize GridView Header */
        .grid-container thead {
            background-color: #007bff;
            color: white;
        }

        /* Customize GridView Rows */
        .grid-container tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .grid-container tr:hover {
            background-color: #ddd;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Danh sách người dùng</h2>
        <div class="grid-container">
            <div class="text-center mb-3">
                <asp:Button ID="btnThemMoiCus" runat="server" Text="Thêm mới" CssClass="btnThemMoi" PostBackUrl="~/Pages/AdminPage/AddCustomer.aspx" />
            </div>
            <asp:GridView ID="grdCustomer" runat="server" AutoGenerateColumns="false" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="CustomerID" HeaderText="Mã khách hàng" />
                    <asp:BoundField DataField="FullName" HeaderText="Tên khách hàng" />
                    <asp:TemplateField HeaderText="Hình ảnh">
                        <ItemTemplate>
                            <img src='<%# "/Avatar/" + Eval("Avatar") %>' width="100" height="100" class="img-fluid rounded" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Số điện thoại" />
                    <asp:BoundField DataField="Username" HeaderText="Tên tài khoản" />
                    <asp:BoundField DataField="Password" HeaderText="Mật khẩu" />
                    <asp:BoundField DataField="Address" HeaderText="Địa Chỉ" />
                    <asp:BoundField DataField="CreatedDate" HeaderText="Ngày tạo tài khoản" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnCapNhatCus" runat="server" Text="Cập nhật" CssClass="btn-edit" OnCommand="btnCapNhatCus_Command" CommandName="capNhatCus" CommandArgument='<%# Bind("CustomerID") %>' />
                            <asp:Button ID="btnXoaCus" runat="server" Text="Xóa tài khoản" CssClass="btn-delete" OnCommand="btnXoaCus_Command" CommandName="xoaTaiKhoan" CommandArgument='<%# Bind("CustomerID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
