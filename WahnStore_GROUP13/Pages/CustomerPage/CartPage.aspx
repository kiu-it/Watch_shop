<%@ Page Title="Giỏ hàng của bạn" Language="C#" MasterPageFile="~/Pages/CustomerPage/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.CartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Giỏ hàng của bạn</title>
    <style>
        body {
            background-color: #f9f9f9;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .cart-table th, .cart-table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .cart-table th {
            background-color: #4CAF50;
            color: white;
            font-size: 1.1em;
        }

        .cart-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .checkout-btn {
            background-color: #4CAF50;
            color: white;
            padding: 14px 28px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2em;
            text-align: center;
            display: block;
            margin: 0 auto;
            transition: background-color 0.3s;
        }

        .checkout-btn:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="cart-title">Giỏ hàng của bạn</h1>
    <div class="cart-container">
        <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" 
            OnRowDeleting="CartGridView_RowDeleting" OnRowCommand="CartGridView_RowCommand" DataKeyNames="CartItemId" CssClass="cart-table">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:TemplateField HeaderText="Giảm">
                    <ItemTemplate>
                        <asp:Button ID="DecreaseButton" runat="server" Text="-" CommandName="Decrease" CommandArgument='<%# Eval("CartItemId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:TemplateField HeaderText="Tăng">
                    <ItemTemplate>
                        <asp:Button ID="IncreaseButton" runat="server" Text="+" CommandName="Increase" CommandArgument='<%# Eval("CartItemId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Price" HeaderText="Đơn giá" />
                <asp:TemplateField HeaderText="Xóa">
                    <ItemTemplate>
                        <asp:Button ID="DeleteButton" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("CartItemId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:Button ID="CheckoutButton" runat="server" Text="Thanh toán" CssClass="checkout-btn" OnClick="CheckoutButton_Click" />
    </div>
</asp:Content>
