<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container-fluid {
            width: 95%;
            padding-left: 40px;
        }

        .page-header {
            text-align: center;
            margin-top: 20px;
            color: #007bff;
        }

        .card-custom {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .card-custom .card-body {
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-custom .card-body h3 {
            margin: 0;
            font-size: 2rem;
        }

        .card-custom .card-body p {
            margin: 0;
            font-size: 1.1rem;
        }

        .card-custom .card-footer {
            padding: 10px 20px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.05);
        }

        .text-white {
            color: white !important;
        }

        .bg-warning {
            background-color: #ffc107 !important;
        }

        .bg-success {
            background-color: #28a745 !important;
        }

        .bg-info {
            background-color: #17a2b8 !important;
        }

        .bg-primary {
            background-color: #007bff !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">Tổng quan</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="card card-custom bg-warning text-white">
                    <div class="card-body">
                        <h3>363</h3>
                        <p>Sản phẩm</p>
                    </div>
                    <div class="card-footer">
                        <asp:LinkButton runat="server" PostBackUrl="~/Pages/AdminPage/ManageProduct.aspx" class="text-white">Chi tiết</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card card-custom bg-success text-white">
                    <div class="card-body">
                        <h3>12</h3>
                        <p>Đơn hàng</p>
                    </div>
                    <div class="card-footer">
                        <asp:LinkButton runat="server" PostBackUrl="~/Pages/AdminPage/ManageOrder.aspx" class="text-white">Chi tiết</asp:LinkButton>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="card card-custom bg-success text-white">
                    <div class="card-body">
                        <h3>10</h3>
                        <p>Thống kế doanh thu</p>
                    </div>
                    <div class="card-footer">
                        <asp:LinkButton runat="server" PostBackUrl="~/Pages/AdminPage/Statistics.aspx" class="text-white">Chi tiết</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card card-custom bg-primary text-white">
                    <div class="card-body">
                        <h3>Top 6</h3>
                        <p>Sản phẩm bán chạy</p>
                    </div>
                    <div class="card-footer">
                        <asp:LinkButton runat="server" PostBackUrl="~/Pages/AdminPage/BestSeller.aspx" class="text-white">Chi tiết</asp:LinkButton>
                    </div>
                </div>
            </div>
                        <div class="col-md-3">
                <div class="card card-custom bg-info text-white">
                    <div class="card-body">
                        <h3>Top 6</h3>
                        <p>Sản phẩm không bán được</p>
                    </div>
                    <div class="card-footer">
                        <asp:LinkButton runat="server" PostBackUrl="~/Pages/AdminPage/FlopSeller.aspx" class="text-white">Chi tiết</asp:LinkButton>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
