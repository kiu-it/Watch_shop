<%@ Page Title="Cửa hàng Nữ" Language="C#" MasterPageFile="~/Pages/CustomerPage/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="WomanShop.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.WomanShop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cửa hàng Nữ</title>
    <style>
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }

        .product-item {
            width: 200px;
            margin: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-item:hover {
            transform: translateY(-10px);
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .product-item img {
            width: 150px;
            height: 150px;
            margin-bottom: 10px;
            border-radius: 8px;
        }

        .product-name {
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
            text-decoration: none;
        }

        .product-price {
            color: red;
            font-size: 1.4em;
            font-weight: bold;
        }

        .rating-stars {
            color: #FFD700; /* Màu vàng cho sao */
            font-size: 1.2em;
            margin-bottom: 5px;
        }

        .price-filter {
            margin-bottom: 20px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .price-filter label {
            font-weight: bold;
            margin-right: 5px;
        }

        .price-filter input {
            width: 100px;
            padding: 10px;
            margin: 0 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            text-align: right;
            font-size: 1em;
            transition: border-color 0.3s;
        }

        .price-filter input:focus {
            border-color: #007bff;
        }

        .price-filter button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s, transform 0.3s;
        }

        .price-filter button:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .data-pager {
            text-align: center;
            margin-top: 20px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Sản phẩm Nữ</h1>
        <div class="price-filter">
            <asp:Label ID="lblMinPrice" Text="Giá từ:" AssociatedControlID="txtMinPrice" runat="server" CssClass="price-filter-label" />
            <asp:TextBox ID="txtMinPrice" runat="server" CssClass="price-filter-input" />
            <asp:Label ID="lblMaxPrice" Text="đến:" AssociatedControlID="txtMaxPrice" runat="server" CssClass="price-filter-label" />
            <asp:TextBox ID="txtMaxPrice" runat="server" CssClass="price-filter-input" />
            <asp:Button ID="btnSearch" Text="Tìm kiếm" OnClick="btnSearch_Click" runat="server" CssClass="price-filter-button" />
        </div>
        <div class="product-container">
            <asp:ListView ID="ListView1" runat="server">
                <ItemTemplate>
                    <div class="product-item">
                        <a href='<%# "ProductDetails.aspx?productId=" + Eval("ProductId") %>'>
                            <img src='<%# "/ProductImg/" + Eval("ProductImage") %>' alt='<%# Eval("ProductName") %>' />
                        </a>
                        <br />
                        <a href='<%# "ProductDetails.aspx?productId=" + Eval("ProductId") %>' class="product-name">
                            <asp:Label runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </a>
                        <br />
                        <div class="rating-stars">
                            <%# new string('★', 5) %> <!-- Hiển thị 5 sao -->
                        </div>
                        <asp:Label runat="server" CssClass="product-price" Text='<%# string.Format("{0:N0} VND", Eval("ProductPrice")) %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="data-pager">
            <asp:Literal ID="lblPagination" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Content>
