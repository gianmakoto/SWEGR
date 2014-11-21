<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargaDatosUI.aspx.cs" Inherits="SWEGR.UI.CargaDatosUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Lista de Egresados</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <script type="text/javascript" src="MaxLength.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">

    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="Content/css/theme.css" rel="stylesheet" type="text/css">
    <link href="Content/css/bootstrap-reset.css" rel="stylesheet" type="text/css">

    <!--external css-->
    <link href="Content/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="Content/css/flexslider.css" />
    <link href="Content/assets/bxslider/jquery.bxslider.css" rel="stylesheet" />


    <!-- Custom styles for this template -->
    <link href="Content/css/style.css" rel="stylesheet">
    <link href="Content/css/style-responsive.css" rel="stylesheet" />


    <style>
        .separadorTabla {
            -webkit-column-count: 2;
            -moz-column-count: 2;
            column-count: 2;
        }
    </style>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div id="page-outer" style="background-color: #ccc; padding: 20px 0;">
        <div id="page" style="width: 62%; margin: 0 auto; background-color: white; border: 1px solid #b0b0b0; padding: 0 5px; padding-left: 10px;">

            <!--header start-->
            <header class="header-frontend" style="color: black;">
                <div class="navbar">
                    <div class="container">
                        <div class="row" style="margin-left: 0px;">
                            <hr style="margin-bottom: 5px;" />
                            <div class="col-lg-6 col-sm-12">
                                <ol class="breadcrumb pull-left">
                                    <li><a href="http://blogs.upc.edu.pe/ingenieria/node" style="font-weight: bold; font-size: 14px; color: #494848">INICIO</a></li>
                                    <li><a href="http://www.upc.edu.pe/" style="font-weight: bold; font-size: 14px; color: #494848">UPC</a></li>
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
                                        <img style="margin-right: 15px" src="Images/in2.png"></img></a>
                                    <a class="navbar-brand pull-right" href="https://www.facebook.com/profile.php?id=100007924308551" style="margin-top: 0px;">
                                        <img style="margin-right: 15px" src="Images/fb.png"></img></a>


                                </div>
                            </div>
                        </div>


                        <div class="row" style="margin-left: 0px;">
                            <hr style="margin-top: 5px;" />
                            <div class="col-lg-8 col-sm-12" style="padding-left: 0px;">
                                <h1 style="font-family: 'Agency FB'; font-weight: bold; color: #494848; margin-top: 0px; margin-bottom: 0px;">SEGUIMIENTO DE EGRESADOS DE LA ESCUELA DE INGENIERÍA DE SISTEMAS Y COMPUTACIÓN</h1>
                            </div>
                            <div class="col-lg-4 col-sm-12">
                                <a class="navbar-brand pull-right" href="#">
                                    <img style="margin-top: -15px; margin-right: 60px" src="http://cdn4.upc.edu.pe/sites/all/themes/upc_2013/img/logo.png"></img></a>
                            </div>
                        </div>


                        <div class="row" id="navigation-inner">
                            <ul class="ul-inner" style="width: 100%;">
                                <li class="li-inner" style="width: 10%;"><a href="ListaregresadosUI.aspx">Egresados</a></li>
                                <li class="li-inner" style="width: 77%;"><a href="CargaDatosUI.aspx">Cargar Datos</a></li>

                                <li class="li-inner" style="width: 13%;">
                                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                        <img alt="" style="height: 19px; width: 17px" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                        <span class="username" id="span2">Nombre</span>
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu extended logout">
                                        <div class="log-arrow-up"></div>
                                        <%--<li><a href="#"><i class=" icon-suitcase"></i>Profile</a></li>
                                     <%--<li><a href="Cambiarcontrasena.aspx"><i class="icon-cog"></i>Cambiar Contraseña</a></li>--%>
                                        <%--<li><a href="#"><i class="icon-bell-alt"></i>Notification</a></li>--%>
                                        <li><a href="login.aspx"><i class="icon-key"></i>Cerrar sesión</a></li>
                                    </ul>
                                </li>
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
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <br />
                            <br />
                            <div class="col-md-12">
                                <span>La carga de Datos de los egresados
                                    <br />
                                    se realizara al final de cada ciclo </span>
                                <br />
                            </div>
                            <br />
                            <div class="col-md-5">
                                <label>Seleccione la Lista de Egresados</label>
                                <!--aca debe ir el fileupload-->
                                <button class="btn btn-danger">Limpiar</button>
                            </div>
                            <div class="col-md-7">
                                <button class="btn btn-danger">Limpiar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Conteido de la grilla -->
                <div class="row">
                    <div class="col-lg-12">
                        Algo debe ir aca
                    </div>
                </div>


                <!--Acaba la grilla -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="pull-right">
                            <button class="btn btn-danger">Guardar</button>&nbsp;
                            <button class="btn btn-danger">Limpiar</button>&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                </div>
            </div>

            <!--footer start-->
            <footer class="footer" style="background: white; color: black; box-shadow: grey 0 5px 0px 0 inset; text-align: left">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12">
                            <h1>Informacion de contacto</h1>
                            <address>
                                <p>
                                    Dirección:  Prolongación Primavera 2390, Monterrico
                            Telf: 313-3333 | Fax: 313-3344
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contacto : <a href="http://contactoweb.upc.edu.pe/">Consultas</a>
                                </p>
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
            <script src="Content/js/jquery.flexslider.js"></script>

            <script src="Content/js/jquery.easing.min.js"></script>
            <script src="Content/js/link-hover.js"></script>

            <!--common script for all pages-->
            <script src="Content/js/common-scripts.js"></script>

            <!--script for this page-->
            <script src="Content/js/form-validation-script.js"></script>



        </div>
    </div>

</body>
</html>
