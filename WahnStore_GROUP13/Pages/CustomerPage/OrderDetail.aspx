<%@ Page Title="Order Detail" Language="C#" MasterPageFile="~/Pages/CustomerPage/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .nav-links {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .nav-links a {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
        }

        .nav-links a:hover {
            background-color: #45a049;
        }

        .order-detail-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .order-detail-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .grid-view-container {
            overflow-x: auto;
        }

        .grid-view-container table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .grid-view-container th,
        .grid-view-container td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }

        .grid-view-container th {
            background-color: #4CAF50;
            color: white;
        }

        .grid-view-container tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .grid-view-container tr:hover {
            background-color: #ddd;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="order-detail-container">
        <div class="nav-links">
            <a href="ManageAccount.aspx">Quản lý tài khoản</a>
            <a href="HistoryOrder.aspx">Lịch sử giao dịch</a>
        </div>
        <h2>Chi tiết đơn hàng</h2>
        <div class="grid-view-container">
            <asp:GridView ID="OrderDetailGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Tên sản phẩm" SortExpression="ProductName" />
                    <asp:BoundField DataField="Quantity" HeaderText="Số lượng" SortExpression="Quantity" />
                    <asp:BoundField DataField="ProductPrice" HeaderText="Đơn giá" SortExpression="ProductPrice" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="ShipmentAddress" HeaderText="Địa chỉ nhận hàng" SortExpression="ShipmentAddress" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Thời gian giao dịch" SortExpression="OrderDate" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Tổng giá trị" SortExpression="TotalAmount" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
