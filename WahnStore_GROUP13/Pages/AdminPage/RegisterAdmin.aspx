<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterAdmin.aspx.cs" Inherits="WahnStore_GROUP13.Pages.AdminPage.RegisterAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <div>
            <h2>Register</h2>
            <div>
                <label for="txtFullName">Full Name:</label>
                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtEmail">Email:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtPhone">Phone:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtUsername">Username:</label>&nbsp;
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtPassword">Password:</label>&nbsp;
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <label for="txtAddress">Address:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="ddlGender">Gender:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddGender" runat="server" size="1"></asp:DropDownList>
            </div>
            <div>
                <label for="fuAvatar">Avatar:</label>
                <asp:FileUpload ID="fuAvatar" runat="server" />
                <img id="imgAvatar" runat="server" alt="Avatar" style="max-width: 200px; max-height: 200px;" />

            </div>
            <div>
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </div>
            <p><a href="LoginAdmin.aspx">Do you already have an account?</a></p>
        </div>
    </form>
</body>
</html>
