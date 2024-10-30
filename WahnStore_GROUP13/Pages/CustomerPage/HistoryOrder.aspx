<%@ Page Title="Order History" Language="C#" MasterPageFile="~/Pages/CustomerPage/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="HistoryOrder.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.HistoryOrder" %>

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

        .order-history-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .order-history-container h2 {
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

        .grid-view-container .link-button {
            padding: 5px 10px;
            background-color: #008CBA;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            display: inline-block;
        }

        .grid-view-container .link-button:hover {
            background-color: #007B9E;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="order-history-container">
        <div class="nav-links">
            <a href="ManageAccount.aspx">Quản lý tài khoản</a>
            <a href="HistoryOrder.aspx">Lịch sử giao dịch</a>
        </div>
        <h2>Lịch sử giao dịch</h2>
        <div class="grid-view-container">
            <asp:GridView ID="OrderHistoryGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="OrderHistoryGridView_RowCommand" OnSelectedIndexChanged="OrderHistoryGridView_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Mã đơn hàng" SortExpression="TotalAmount" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Tổng giá trị" SortExpression="TotalAmount" />
                    <asp:BoundField DataField="OrderStatus" HeaderText="Trạng thái đơn hàng" SortExpression="OrderStatus" />
                    <asp:BoundField DataField="ShipmentAddress" HeaderText="Địa chỉ nhận hàng" SortExpression="ShipmentAddress" />
                    <asp:BoundField DataField="ShipmentCity" HeaderText="Thành phố" SortExpression="ShipmentCity" />
                    <asp:BoundField DataField="ShipmentCountry" HeaderText="Quốc gia" SortExpression="ShipmentCountry" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Thời gian thực hiện giao dịch" SortExpression="OrderDate" />
                    <asp:TemplateField HeaderText="Xem chi tiết">
                        <ItemTemplate>
                            <asp:LinkButton ID="DetailButton" runat="server" CommandName="Detail" CommandArgument='<%# Bind("OrderId") %>' Text="Chi tiết" CssClass="link-button" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
