<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SWEGR.UI.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">




<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link href="Login/css/bootstrap.min.css" rel="stylesheet">
    <link href="Login/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="Content/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="Login/css/style.css" rel="stylesheet">
    <link href="Login/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->



</head>

  <body class="login-body">

      
            

  

      <form runat="server" class="form-signin" >
          
                <div class="Login-wrap">
                    
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                   
                    <a class="navbar-brand" >
                        <img style="margin-top: -10px" src="http://cdn4.upc.edu.pe/sites/all/themes/upc_2013/img/logo.png"></img></a>
                </div>
        <h2 class="form-signin-heading">Seguimiento Egresados</h2>
        <div class="login-wrap">
            <asp:TextBox id="txtid" type="text" class="form-control" placeholder="Usuario"  runat="server" /> 
            <asp:TextBox id="txtpass" type="password" class="form-control" placeholder="Contraseña" runat="server" />


            <asp:Button  runat="server" CssClass="btn btn-lg btn-login btn-block" Text="Entrar"  OnClick="boton_Click" />
        
          
             <div class="">

                <a class="" href="InsertaregresadoUI.aspx">
                   Regístrate
                </a>
            </div>

              

        </div>

       

      </form>
    



    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>       
</html>

