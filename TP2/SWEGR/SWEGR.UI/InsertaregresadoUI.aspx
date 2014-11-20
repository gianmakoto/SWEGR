<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertaregresadoUI.aspx.cs" Inherits="SWEGR.UI.InsertaregresadoUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Insertar Egresado</title>

    <script type="text/javascript" src="MaxLength.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>

    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="Content/css/bootstrap.min.css" rel="stylesheet">
    <link href="Content/css/theme.css" rel="stylesheet">
    <link href="Content/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="Content/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="Content/css/flexslider.css" />
    <link href="Content/assets/bxslider/jquery.bxslider.css" rel="stylesheet" />


    <!-- Custom styles for this template -->
    <link href="Content/css/style.css" rel="stylesheet">
    <link href="Content/css/style-responsive.css" rel="stylesheet" />



    <script type="text/javascript">
        function error() {
            $("#dialogerror").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    Aceptar: function () {
                        $(this).dialog("close");
                    }
                },
                modal: true
            }).css("font-size", "12px");
        }

        function ocurrencia() {
            $("#dialogocurrencia").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    Aceptar: function () {
                        $(this).dialog("close");
                    }
                },
                modal: true
            }).css("font-size", "12px");
        }

        function exito() {
            $("#dialogexito").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    Aceptar: function () {
                        $(this).dialog("close");
                        $("#btnRedireccionar").click();
                    }
                },
                modal: true
            }).css("font-size", "12px");
        }

        function egresadorepetido() {
            $("#dialogrepetido").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    Aceptar: function () {
                        $(this).dialog("close");
                    }
                },
                modal: true
            }).css("font-size", "12px");
        }

        function egresadonoencontrado() {
            $("#dialogegresadonoencontrado").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    Aceptar: function () {
                        $(this).dialog("close");
                    }
                },
                modal: true
            }).css("font-size", "12px");
        }

    </script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div id="page-outer" style="background-color: #ccc;padding: 20px 0;">
        <div id="page" style="width: 62%;margin: 0 auto;background-color: white;border: 1px solid #b0b0b0;  padding: 0 5px;padding-left: 10px;">
      
       <!--header start-->
    <header class="header-frontend" style=" color:black; " >
        <div class="navbar">
            <div class="container">
                <div class="row" style="margin-left: 0px;">
                    <hr style="margin-bottom: 5px;" />
                    <div class="col-lg-6 col-sm-12">
                        <ol class="breadcrumb pull-left">
                            <li><a href="http://blogs.upc.edu.pe/ingenieria/node" style="font-weight: bold;font-size: 14px; color:#494848">INICIO</a></li>
                            <li><a href="http://www.upc.edu.pe/" style="font-weight: bold;font-size: 14px; color:#494848">UPC</a></li>
                        </ol>

                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <label id="fecha"></label>
                    </div>
                    <div class="col-lg-2 col-sm-6">
                        <div class="pull-right">
                            <%--<span><a href="https://www.facebook.com/profile.php?id=100007924308551" style="color: #3B5998"><i class="icon-facebook fa-2x"></i></a></span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><a href="https://www.linkedin.com/pub/escuela-de-ingenier%C3%ADa-de-sistemas-y-computaci%C3%B3n/a3/864/45b" style="color: skyblue"><i class="icon-linkedin fa-2x"></i></a></span>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%> 
                             <a class="navbar-brand pull-right" href="https://www.linkedin.com/pub/escuela-de-ingenier%C3%ADa-de-sistemas-y-computaci%C3%B3n/a3/864/45b" style="margin-top: 0px;">
                           <img  style="margin-right: 15px" src="Images/in2.png"></img></a>
                            <a class="navbar-brand pull-right" href="https://www.facebook.com/profile.php?id=100007924308551"  style="margin-top: 0px;">
                           <img style="margin-right: 15px" src="Images/fb.png"></img></a>
                           
                                              
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-left: 0px;">
                    <hr style="margin-top: 5px;"/>
                    <div class="col-lg-8 col-sm-12" style="padding-left: 0px;">
                    

                        <h1 style="font-family: 'Agency FB';font-weight: bold;color: #494848;margin-top: 0px;margin-bottom: 0px;">SEGUIMIENTO DE EGRESADOS DE LA ESCUELA DE INGENIERÍA DE SISTEMAS Y COMPUTACIÓN</h1>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <a class="navbar-brand pull-right" href="#">
                           <img style="margin-top: -15px; margin-right: 60px" src="http://cdn4.upc.edu.pe/sites/all/themes/upc_2013/img/logo.png"></img></a>
                    </div>
                </div>
                  <div class="row" id="navigation-inner">
                   <ul class="ul-inner">
                        <li class="li-inner"><a href="Login.aspx">Iniciar sesión</a></li>
                       
                </div>
            </div>
        </div>
    </header>
    <!--header end-->
    <div class="container">
        <%--<hr style="border-style: dashed" />--%>
    </div>
    <!--breadcrumbs end-->

    <!--container start-->
    <div class="container">
        <section class="panel">
            <header class="panel-heading">
                <h3>Ingrese sus datos</h3>
            </header>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <form id="swegrform" class="cmxform form-horizontal tasi-form" runat="server">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="uppanel" runat="server">
                                <ContentTemplate>
                                    <asp:Panel runat="server" DefaultButton="btnbuscar">
                                        <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Código
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <asp:Button ID="btnbuscar" runat="server" OnClick="btnbuscar_Click" Style="display:none;" />
                                    </div>
                                    </asp:Panel>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombre" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreo" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Contraseña
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcontrasena" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Confirmar Contraseña
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtconfirmarcontrasena" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnLimpiar_Click" />
                                            <label class="pull-right">&nbsp&nbsp&nbsp</label>
                                            <asp:Button ID="btnRegistrar" runat="server" Text="Regístrate" Enabled="false" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnRegistrar_Click" />
                                        </div>

                                        <asp:Button ID="btnRedireccionar" runat="server" CssClass="hidden" type="submit" OnClick="btnRedireccionar_Click"/>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="form-group">
                                <div id="dialogerror" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">Todos los campos son necesarios para registrarse.</b>
                                </div>

                                <div id="dialogexito" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">Sus datos han sido guardados sastifactoriamente.</b>
                                </div>

                                <div id="dialogocurrencia" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">Las constraseñas no coinciden.</b>
                                </div>

                                <div id="dialogrepetido" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">El egresado con este código universitario ya ha sido registrado.</b>
                                </div>

                                <div id="dialogegresadonoencontrado" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">No existe este egresado</b>
                                </div>
                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>


   <!--footer start-->
      <footer class="footer" style="background:white; color:black; box-shadow: grey 0 5px 0px 0 inset;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-sm-12">
                    <h1>Informacion de contacto</h1>
                    <address>
                        <p>
                            Dirección:  Prolongación Primavera 2390, Monterrico
                            Telf: 313-3333 | Fax: 313-3344
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contacto : <a href="http://contactoweb.upc.edu.pe/">Consultas</a></p>
                    </address>
                </div>
                
            </div>

            </div>
       
    </footer>
    <!--footer end-->
    <!-- js placed at the end of the document so the pages load faster -->

    <script src="Content/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Content/js/hover-dropdown.js"></script>
    <script type="text/javascript" src="Content/assets/bxslider/jquery.bxslider.js"></script>
    <script defer src="Content/js/jquery.flexslider.js"></script>

    <script src="Content/js/jquery.easing.min.js"></script>
    <script src="Content/js/link-hover.js"></script>

    <!--common script for all pages-->
    <script src="Content/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="Content/js/form-validation-script.js"></script>

    <script>
        $(window).load(function () {
            $('[data-zlname = reverse-effect]').mateHover({
                position: 'y-reverse',
                overlayStyle: 'rolling',
                overlayBg: '#fff',
                overlayOpacity: 0.7,
                overlayEasing: 'easeOutCirc',
                rollingPosition: 'top',
                popupEasing: 'easeOutBack',
                popup2Easing: 'easeOutBack'
            });
        });

        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                start: function (slider) {
                    $('body').removeClass('loading');
                }
            });
        });


    </script>


</body>
</html>
