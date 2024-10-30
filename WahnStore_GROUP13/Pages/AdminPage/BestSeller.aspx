<%@ Page Title="Product List" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="BestSeller.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.BestSeller" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Scrolling Title Styles */
        #scrolling-title {
            white-space: nowrap;
            overflow: hidden;
            display: inline-block;
            animation: scroll 5s linear infinite;
            font-size: 2rem;
            font-weight: bold;
            color: #ff5733;
            margin-bottom: 20px;
        }

        @keyframes scroll {
            0% {
                transform: translateX(100%);
            }
            100% {
                transform: translateX(-100%);
            }
        }

        /* Card Styles */
        .product-card {
            margin-bottom: 20px;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .card-body {
            padding: 15px;
            text-align: center;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 1rem;
            color: #555;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        /* Table Styles */
        .table-container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            overflow-x: auto; /* Ensures the table scrolls */
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            font-size: 0.9rem;
        }

        table thead {
            background-color: #007bff;
            color: white;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="centered-h2">
        <h2 id="scrolling-title">Top 6 sản phẩm bán chạy</h2>
    </div>
    <div class="container">
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="product-card">
                            <img src="<%# "/ProductImg/" + Eval("ProductImage") %>" class="card-img-top" alt="Product Image" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("ProductName") %></h5>
                                <p class="card-text"><%# Eval("ProductDescription") %></p>
                                <asp:Button ID="xemChiTiet" Text="Xem chi tiết" class="btn btn-primary" runat="server" CommandName="xemChiTietSanPham" OnCommand="xemChiTiet_Click" CommandArgument='<%# Bind("ProductId") %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    
    <div class="table-container mt-4">
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <img src="<%# "/ProductImg/" + Eval("ProductImage") %>" alt="Product Image" width="100" height="100" style="border-radius: 8px;" />
                            </td>
                            <td><%# Eval("ProductName") %></td>
                            <td><%# Eval("ProductDescription") %></td>
                            <td>
                                <asp:Button ID="xemChiTiet" Text="Xem chi tiết" runat="server" CommandName="xemChiTietSanPham" OnCommand="xemChiTiet_Click" CommandArgument='<%# Bind("ProductId") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
