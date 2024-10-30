<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageOrder.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.ManageOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-header {
            text-align: center;
            margin-top: 20px;
            color: #007bff;
        }

        .btn-custom {
            margin-bottom: 20px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .btn-export {
            background-color: #28a745;
            color: white;
        }

        .btn-update {
            background-color: #17a2b8;
            color: white;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .table-container {
            width: 80%;
            margin: auto;
            margin-top: 20px;
        }

        .table-custom {
            width: 100%;
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

        .btn-action {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            text-transform: uppercase;
            margin-right: 5px;
        }

        .btn-update {
            background-color: #17a2b8;
            color: white;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="page-header">Danh sách đơn hàng</h1>
        <div class="text-right">
            <asp:Button ID="btnExportToExcel" runat="server" Text="Export to Excel" CssClass="btn btn-custom btn-export" OnClick="btnExportToExcel_Click" />
        </div>
        <div class="table-container">
            <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderId" CssClass="table-custom" OnRowDataBound="GridViewOrders_RowDataBound" OnRowDeleting="GridViewOrders_RowDeleting" OnRowCommand="GridViewOrders_RowCommand">
                <Columns>
                    <asp:BoundField DataField="OrderId" HeaderText="Order ID" ReadOnly="True" SortExpression="OrderId" />
                    <asp:BoundField DataField="CustomerId" HeaderText="Customer ID" SortExpression="CustomerId" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" SortExpression="TotalAmount" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" SortExpression="OrderStatus" />
                    <asp:BoundField DataField="ShipmentAddress" HeaderText="Shipment Address" SortExpression="ShipmentAddress" />
                    <asp:BoundField DataField="ShipmentCity" HeaderText="Shipment City" SortExpression="ShipmentCity" />
                    <asp:BoundField DataField="ShipmentCountry" HeaderText="Shipment Country" SortExpression="ShipmentCountry" />
                    <asp:BoundField DataField="ShipmentDate" HeaderText="Shipment Date" SortExpression="ShipmentDate" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-action btn-update" CommandName="UpdateOrder" CommandArgument='<%# Eval("OrderId") %>' />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-action btn-delete" CommandName="DeleteOrder" CommandArgument='<%# Eval("OrderId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
