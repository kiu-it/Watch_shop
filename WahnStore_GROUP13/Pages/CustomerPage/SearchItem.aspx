<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/CustomerPage/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="SearchItem.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.SearchItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Search Results</title>
    <style>
        .product-item {
            float: left;
            width: 200px;
            margin: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        .product-item img {
            width: 150px;
            height: 150px;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Search Results</h1>
        <asp:ListView ID="ListView1" runat="server" PageSize="10">
            <ItemTemplate>
                <div class="product-item">
                    <a href='<%# "ProductDetails.aspx?productId=" + Eval("ProductId") %>'>
                        <img src='<%# "/ProductImg/" + Eval("ProductImage") %>' alt='<%# Eval("ProductName") %>' />
                    </a>
                    <br />
                    <a href='<%# "ProductDetails.aspx?productId=" + Eval("ProductId") %>'>
                        <asp:Label runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </a>
                    <br />
                    <asp:Label runat="server" Text='<%# string.Format("{0:N0} VND", Eval("ProductPrice")) %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:DataPager ID="DataPager1" runat="server" PageSize="10" PagedControlID="ListView1">
            <Fields>
                <asp:NumericPagerField ButtonCount="10" />
            </Fields>
        </asp:DataPager>
    </div>
</asp:Content>
