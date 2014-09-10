<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisualizaregresadoUI.aspx.cs" Inherits="SWEGR.UI.VisualizaregresadoUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Visualizar Egresado</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#btndatosPersonales").click(function () {
                $("#datosPersonales").slideToggle();
            });

            $("#btntrayectoriaAcad").click(function () {
                $("#trayectoriaAcad").slideToggle();
            });

            $("#btntrayectoriaProf").click(function () {
                $("#trayectoriaProf").slideToggle();
            });

            $("#btnaptitudesIntereses").click(function () {
                $("#aptitudesIntereses").slideToggle();
            });
        });
</script>

    <script type="text/javascript" src="MaxLength.min.js"></script>


    <%-- 
    <link rel="stylesheet" href="/resources/demos/style.css"> --%>

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

</head>
<body>
    <!--header start-->
    <header class="header-frontend">
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Index.aspx">
                        <img style="margin-top: -15px" src="http://cdn4.upc.edu.pe/sites/all/themes/upc_2013/img/logo.png"></img></a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav" style="align: center">
                        <li><a href="Index.aspx">Inicio</a></li>
                        
                        <li><a href="#">Egresado</a></li>
                        <li class="active"><a href="ActualizargraduandoUI.aspx">Graduando</a></li>
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <img alt="" src="img/avatar1_small.jpg">
                                <span class="username">Nombre</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <div class="log-arrow-up"></div>
                                <li><a href="#"><i class=" icon-suitcase"></i>Profile</a></li>
                                <li><a href="#"><i class="icon-cog"></i>Settings</a></li>
                                <li><a href="#"><i class="icon-bell-alt"></i>Notification</a></li>
                                <li><a href="#"><i class="icon-key"></i>Log Out</a></li>
                            </ul>
                        </li>
                        <!-- user login dropdown end -->
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!--header end-->

    <!--breadcrumbs start-->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-sm-4">
                    <h1>Graduandos</h1>
                </div>
                <div class="col-lg-8 col-sm-8">
                    <ol class="breadcrumb pull-right">
                        <li><a href="#">Home</a></li>
                        <li class="active">Graduandos </li>
                    </ol>
                </div>
            </div>
        </div>
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

                            <div runat="server" style="margin:auto">
                                <table border="0" style="width: 750px; margin:auto">
                                <tr>
                                    <td style="text-align:left">
                                        <h3 style="margin-bottom: 4px; text-align:right">Datos Personales
                                            <asp:Button ID="btndatosPersonales" runat="server" Text="+" />
                                            <%--<button id="btndatosPersonales"> + </button>--%>
                                        </h3>
                                    </td>
                                </tr>
                                </table>
                            </div>
                            <div id="datosPersonales" style="border: 1px solid black; padding-left:4%; padding-top:4%">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Nombre completo
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtnombrecompleto" runat="server" CssClass="form-control" Enabled="false" type="text" ></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        DNI
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtdni" runat="server"
                                            CssClass="form-control" onkeypress="return isNumber(event)" onpaste="return false" ></asp:TextBox>
                                    
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Género
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlGenero" runat="server" AutoPostBack="True" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Fecha de Nacimiento
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtfechanacimiento" runat="server"
                                            CssClass="form-control" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Teléfonos
                                    </label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txttelefonoprincipal" runat="server"
                                            CssClass="form-control" placeholder="Teléfono Principal" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false" ></asp:TextBox>
                                  
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txttelefonoalternativo" runat="server"
                                            CssClass="form-control" placeholder="Teléfono Alternativo" data-mask="999-999-999"  onkeypress="return isNumber(event)"  onpaste="return false"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Dirección
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtdireccion" runat="server"
                                            CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Departamento
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="ddlDepartamento" runat="server" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Distrito
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtdistrito" runat="server"
                                            CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Correo
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtcorreo" runat="server"
                                            CssClass="form-control" placeholder="ejemplo: darkpepito@gmail.com"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Correo Alternativo
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtcorreoalternativo" runat="server"
                                            CssClass="form-control" placeholder="ejemplo: pepitomk2@hotmail.com"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Perfil LinkedIn
                                    </label>
                                    <div class="col-sm-8">

                                        <div class="input-group m-bot15">
                                            <span class="input-group-addon"><i class="fa fa-linkedin"></i>
                                            </span>
                                            <asp:TextBox ID="txtperfillinkedin" runat="server"
                                                CssClass="form-control" placeholder="ejemplo: https://pe.linkedin.com/iduduario"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Perfil Facebook
                                    </label>
                                    <div class="col-sm-8">

                                        <div class="input-group m-bot15">
                                            <span class="input-group-addon"><i class="fa fa-facebook"></i>
                                            </span>
                                            <asp:TextBox ID="txtperfilfacebook" runat="server"
                                                CssClass="form-control" placeholder="ejemplo: usuario@facebook.com"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-10">
                                        <asp:Button ID="btnguardar" runat="server" Text="Guardar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnguardar_Click" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div id="dialogvalidacion" style="text-align: center; display: none" runat="server">
                                        <b style="text-align: center">Campos incompletos</b>
                                    </div>

                                    <div id="dialogexito" style="text-align: justify; display: none" runat="server">
                                        <b style="text-align: center">Sus datos han sido actualizados satisfactoriamente</b>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>





    <%--Acá termina el código--%>

    <!--footer start-->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-sm-12">
                    <h1>contact info</h1>
                    <address>
                        <p>
                            Dirección:  Prolongación Primavera 2390, Monterrico
                            <br />

                            Telf: 313-3333 | Fax: 313-3344
                        </p>
                        <p>Contacto : <a href="http://contactoweb.upc.edu.pe/">Consultas</a></p>
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
