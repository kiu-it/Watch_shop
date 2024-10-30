<%@ Page Title="Update Order" Language="C#" MasterPageFile="~/Pages/AdminPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateOrder.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.UpdateOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .order-panel {
    background-color: #f4f4f4;
    padding: 20px;
    border-radius: 8px;
    border: 1px solid #ddd;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    margin: 20px auto;
    max-width: 600px;
}

.order-label {
    font-size: 16px;
    padding: 8px;
    border-radius: 4px;
    background-color: #fff;
    border: 1px solid #ddd;
    margin: 5px 0;
}

.order-textbox {
    font-size: 16px;
    padding: 8px;
    border-radius: 4px;
    border: 1px solid #ddd;
    margin: 5px 0;
}

.order-button {
    background-color: #007bff;
    border: none;
    border-radius: 4px;
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    margin-top: 15px;
}

.order-button:hover {
    background-color: #0056b3;
}

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Update Order</h2>
    <div class="order-panel">
        <table>
            <tr>
                <td>Order ID:</td>
                <td>
                    <asp:Label ID="lblOrderId" runat="server" CssClass="order-label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Customer ID:</td>
                <td>
                    <asp:Label ID="lblCustomerId" runat="server" CssClass="order-label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Order Date:</td>
                <td>
                    <asp:Label ID="lblOrderDate" runat="server" CssClass="order-label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Order Status:</td>
                <td>
                    <asp:TextBox ID="txtOrderStatus" runat="server" CssClass="order-textbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Total Amount:</td>
                <td>
                    <asp:Label ID="lblTotalAmount" runat="server" CssClass="order-label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Shipment ID:</td>
                <td>
                    <asp:Label ID="lblShipmentId" runat="server" CssClass="order-label"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnSave" runat="server" CssClass="order-button" Text="Save Changes" OnClick="btnSave_Click" />
    </div>
</asp:Content>