<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginprueba.aspx.cs" Inherits="SWEGR.UI.Loginprueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Egresado</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>IDEgresado:</td>
                <td>
                    <asp:TextBox ID="txtidegresado" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnLogin" Text="Iniciar Sesion" runat="server" OnClick="btnLogin_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
