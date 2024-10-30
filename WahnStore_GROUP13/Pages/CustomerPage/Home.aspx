<%@ Page Title="Home" Language="C#" MasterPageFile="~/Pages/CustomerPage/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Container Styles */
        .container-new {
            margin: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        /* Banner Styles */
        .banner {
            margin-top: 20px;
            text-align: center;
        }

        .banner img {
            width: 80%;
            height: auto;
            border-radius: 8px;
        }

        /* Product Item Styles */
        .product-item {
            width: 200px;
            margin: 10px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-item:hover {
            transform: translateY(-8px);
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
        }

        .product-price {
            color: red;
            font-size: 1.4em;
            font-weight: bold;
        }
        .centered-h2 {
            text-align: center;
            margin-bottom: 20px; /* Optional: Adjust the spacing between the heading and product list */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner">
        <img src="/Design/banner.jfif" alt="Banner">
    </div>

    <div class="container-new">
        <h2 class="centered-h2">Sản phẩm bán chạy</h2>
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
                    <asp:Label runat="server" CssClass="product-price" Text='<%# string.Format("{0:N0} VND", Eval("ProductPrice")) %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>

    <div class="container-new">
        <h2 class="centered-h2">Sản phẩm mới nhất</h2>
        <asp:ListView ID="ListView2" runat="server">
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
                    <asp:Label runat="server" CssClass="product-price" Text='<%# string.Format("{0:N0} VND", Eval("ProductPrice")) %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
