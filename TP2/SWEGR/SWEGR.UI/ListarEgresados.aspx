<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarEgresados.aspx.cs" Inherits="SWEGR.UI.ListarEgresados" %>

<!DOCTYPE html>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>

   
</head>
<body>
    
    
    <form id="Form1" runat="server">
    <div>
        <asp:TextBox ID="codigoEgresado" runat="server"></asp:TextBox>

        <asp:Button ID="extraerDatosTextBox" runat="server" Text="Extraer Datos" OnClick="extraerDatosTextBox_Click" />
    </div>
    

             <asp:Image ID="Image1" runat="server" /><br />
        Datos generales:     <br />
        Correo: <asp:TextBox ID="correoTextBox" runat="server" Width="285px"></asp:TextBox>     <br />
        Correo alternativo: <asp:TextBox ID="correoAlterTextBox" runat="server" Width="285px"></asp:TextBox>     <br />
        Telefono: <asp:TextBox ID="telefonoTextBox" runat="server" Width="285px"></asp:TextBox>     <br />
        Telefono Alternativo: <asp:TextBox ID="telefonoAlterTextBox" runat="server" Width="285px"></asp:TextBox>     <br />
        Direccion: <asp:TextBox ID="direccionTextBox" runat="server" Width="285px"></asp:TextBox>     <br />     <br />


        <asp:GridView ID="registrosLaborales" runat="server"></asp:GridView> <br />     <br />
        <asp:GridView ID="registrosAcademicos" runat="server"></asp:GridView> <br />     <br />
        <asp:GridView ID="intereses" runat="server"></asp:GridView> <br />     <br />
        <asp:GridView ID="aptitudes" runat="server"></asp:GridView> <br />     <br />

 </form>
</body>
</html>