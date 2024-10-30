<%@ Page Title="Chi tiết sản phẩm" Language="C#" MasterPageFile="~/Pages/CustomerPage/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.ProductDeatails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Chi tiết sản phẩm</title>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }

        .container-product {
            max-width: 1200px;
            margin: 50px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .product-details {
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
        }

        .product-details img {
            max-width: 100%;
            border-radius: 8px;
            margin-bottom: 20px;
            width: 300px;
            height: 300px; /* Kích thước hình ảnh cố định */
        }

        .product-image {
            flex: 1;
            min-width: 300px;
        }

        .product-info {
            flex: 2;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin-left: 20px;
        }

        .product-info h1 {
            margin-top: 0;
            color: #333;
            font-size: 28px;
        }

        .product-info p {
            margin: 10px 0;
            color: #666;
            font-size: 16px;
        }

        .product-info .price {
            font-size: 24px;
            color: #FF0000 ;
            margin: 20px 0;
        }

        .product-info .details {
            list-style: none;
            padding: 0;
            margin-bottom: 20px;
        }

        .product-info .details li {
            margin: 10px 0;
            color: #666;
            font-size: 16px;
        }

        .add-to-cart-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #e67e22;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .add-to-cart-btn:hover {
            background-color: #d35400;
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-item {
            flex: 1;
            min-width: 200px;
            padding: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
            margin: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-item:hover {
            transform: translateY(-10px);
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .product-item img {
            max-width: 100%;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .product-name {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            margin-bottom: 10px;
            display: block;
        }

        .rating-stars {
            margin: 5px 0;
            color: gold;
            font-size: 16px;
        }

        .product-price {
            font-size: 18px;
            color: #e67e22;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Thông tin chi tiết sản phẩm</h1>
    <div class="container-product">
        <div class="product-details">
            <div class="product-image">
                <img id="ProductImage" runat="server" alt="Product Image" />
            </div>
            <div class="product-info">
                <h1><asp:Label ID="ProductName" runat="server" Text=""></asp:Label></h1>
                <p><asp:Label ID="ProductDescription" runat="server" Text=""></asp:Label></p>
                <p class="price"><asp:Label ID="ProductPrice" runat="server" Text=""></asp:Label></p>
                <ul class="details">
                    <li><asp:Label ID="ProductQuantity" runat="server" Text=""></asp:Label></li>
                    <li><asp:Label ID="ProductOrigin" runat="server" Text=""></asp:Label></li>
                    <li><asp:Label ID="ProductDiameter" runat="server" Text=""></asp:Label></li>
                    <li><asp:Label ID="ProductThickness" runat="server" Text=""></asp:Label></li>
                    <li><asp:Label ID="ProductWarrantyPeriod" runat="server" Text=""></asp:Label></li>
                    <li><asp:Label ID="ProductGender" runat="server" Text=""></asp:Label></li>
                    <li><asp:Label ID="ProductBrand" runat="server" Text=""></asp:Label></li>
                    <li><asp:Label ID="ProductGlass" runat="server" Text=""></asp:Label></li>
                    <li><asp:Label ID="ProductColor" runat="server" Text=""></asp:Label></li>
                    <li><asp:Label ID="ProductStrap" runat="server" Text=""></asp:Label></li>
                </ul>
                <asp:HiddenField ID="ProductIdHidden" runat="server" />
                <asp:Button ID="AddToCartButton" runat="server" Text="Thêm vào giỏ hàng" CssClass="add-to-cart-btn" OnClick="AddToCartButton_Click" />
            </div>
        </div>

        <h2>Sản phẩm liên quan</h2>
        <div class="product-container">
            <asp:ListView ID="RelatedProductsListView" runat="server">
                <ItemTemplate>
                    <div class="product-item">
                        <a href='<%# "ProductDetails.aspx?productId=" + Eval("ProductId") %>'>
                            <img src='<%# "/ProductImg/" + Eval("ProductImage") %>' alt='<%# Eval("ProductName") %>' />
                        </a>
                        <a href='<%# "ProductDetails.aspx?productId=" + Eval("ProductId") %>' class="product-name">
                            <asp:Label runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </a>
                        <div class="rating-stars">
                            <%# new string('★', 5) %>
                        </div>
                        <asp:Label runat="server" CssClass="product-price" Text='<%# string.Format("{0:N0} VND", Eval("ProductPrice")) %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
