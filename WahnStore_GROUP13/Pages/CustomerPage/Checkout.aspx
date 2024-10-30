<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Pages/CustomerPage/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WahnStore_GROUP13.Pages.CustomerPage.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: #f9f9f9;
        }

        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .form-group label {
            margin-bottom: 5px;
            font-size: 1.2em;
            color: #333;
        }

        .form-group input {
            width: 300px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            outline-color: #4CAF50;
        }

        .checkout-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .checkout-title {
            font-size: 2em;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .checkout-grid {
            margin-bottom: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        .checkout-grid th, .checkout-grid td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .checkout-grid th {
            background-color: #4CAF50;
            color: white;
            font-size: 1.1em;
        }

        .checkout-grid tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .total-amount-label {
            font-size: 1.8em;
            color: red;
            margin-bottom: 20px;
            text-align: center;
        }

        .place-order-btn {
            background-color: #4CAF50;
            color: white;
            padding: 14px 28px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2em;
            display: block;
            margin: 0 auto;
            transition: background-color 0.3s;
        }

        .place-order-btn:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="checkout-container">
        <h1 class="checkout-title">Thanh toán</h1>
        <div class="form-group">
            <asp:Label ID="ShipmentAddressLabel" runat="server" Text="Địa chỉ giao hàng:"></asp:Label>
            <asp:TextBox ID="ShipmentAddressTextBox" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="ShipmentCityLabel" runat="server" Text="Thành phố:"></asp:Label>
            <asp:TextBox ID="ShipmentCityTextBox" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="ShipmentCountryLabel" runat="server" Text="Quốc gia:"></asp:Label>
            <asp:TextBox ID="ShipmentCountryTextBox" runat="server"></asp:TextBox>
        </div>

        <asp:GridView ID="CheckoutGridView" runat="server" CssClass="checkout-grid" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="Tên Sản phẩm" />
                <asp:BoundField DataField="Quantity" HeaderText="Số Lượng" />
                <asp:BoundField DataField="Price" HeaderText="Giá" />
            </Columns>
        </asp:GridView>
                <asp:Label ID="PaymentMethodLabel" runat="server" Text="Hình thức thanh toán: Trả tiền mặt" CssClass="form-group"></asp:Label>

        <asp:Label ID="TotalAmountLabel" runat="server" CssClass="total-amount-label"></asp:Label>
        <br />
        <asp:Button ID="PlaceOrderButton" runat="server" Text="Đặt hàng" CssClass="place-order-btn" OnClick="PlaceOrderButton_Click" />
    </div>
</asp:Content>
