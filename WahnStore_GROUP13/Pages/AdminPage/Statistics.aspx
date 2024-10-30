<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.Statistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-header {
            text-align: center;
            margin-top: 20px;
            color: #007bff;
        }

        .filter-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .filter-section label {
            font-weight: bold;
            margin-right: 10px;
        }

        .filter-section .form-control {
            display: inline-block;
            width: auto;
            margin-right: 10px;
        }

        .filter-section .btn-filter {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .filter-section .btn-filter:hover {
            background-color: #218838;
        }

        .statistics-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .statistics-table th, .statistics-table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #dee2e6;
        }

        .statistics-table th {
            background-color: #007bff;
            color: white;
        }

        .statistics-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .statistics-table tr:hover {
            background-color: #e9ecef;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="page-header">Thống Kê doanh thu</h1>
        
        <div class="filter-section">
            <label>Chọn khoảng thời gian:</label>
            <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" CssClass="form-control">
                <asp:ListItem Text="-- Chọn Năm --" Value="-1"></asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" CssClass="form-control">
                <asp:ListItem Text="-- Chọn Tháng --" Value="-1"></asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlDay" runat="server" CssClass="form-control">
                <asp:ListItem Text="-- Chọn Ngày --" Value="-1"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnFilter" runat="server" Text="Lọc" CssClass="btn-filter" OnClick="btnFilter_Click" />
            <asp:Button ID="btnExportExcel" runat="server" Text="Xuất Excel" CssClass="btn-filter" OnClick="btnExportExcel_Click" />

        </div>
        
        <asp:GridView ID="gvOrderStatistics" runat="server" AutoGenerateColumns="false" CssClass="statistics-table">
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Ngày" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="TotalOrders" HeaderText="Tổng Số Đơn Hàng" />
                <asp:BoundField DataField="TotalRevenue" HeaderText="Tổng Doanh Thu" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
