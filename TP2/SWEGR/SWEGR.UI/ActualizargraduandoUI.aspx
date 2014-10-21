<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActualizargraduandoUI.aspx.cs" Inherits="SWEGR.UI.ActualizargraduandoUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Actualizar Graduando</title>

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
        $(function () {

            $('#txtdni').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 7) {
                    e.preventDefault();
                }
            });
            $('#txttelefonoprincipal').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 8) {
                    e.preventDefault();
                }
            });
            $('#txttelefonoalternativo').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 8) {
                    e.preventDefault();
                }
            });
            $('#txtnombrecompleto').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 99) {
                    e.preventDefault();
                }
            });
            $('#txtdireccion').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 99) {
                    e.preventDefault();
                }
            });
            $('#txtdistrito').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 49) {
                    e.preventDefault();
                }
            });
            $('#txtcorreo').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 49) {
                    e.preventDefault();
                }
            });
            $('#txtcorreoalternativo').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 49) {
                    e.preventDefault();
                }
            });
            $('#txtperfillinkedin').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 99) {
                    e.preventDefault();
                }
            });
            $('#txtperfilfacebook').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 99) {
                    e.preventDefault();
                }
            });
        });

        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function dnivacio() {
            $("#dialogvalidacion").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close")
                    }
                },
                modal: true
            }).css("font-size", "12px");
        }

        function telefonovacio() {
            $("#dialogvalidacion").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close")
                    }
                },
                modal: true
            }).css("font-size", "12px");
        }

        function correovacio() {
            $("#dialogvalidacion").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close")
                    }
                },
                modal: true
            }).css("font-size", "12px");

        }

        function perfillinkedinvacio() {
            $("#dialogvalidacion").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close")
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
                    Aceptar: function() {
                        $(this).dialog("close");
                    }
                },
                modal: true
            }).css("font-size", "12px");
        }

        function incompleto() {
            $("#dialogincompleto").dialog({
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
                        <%--<li><a href="Index.aspx">Inicio</a></li>--%>
                        
                        <%--<li><a href="VisualizaregresadoUI.aspx">Egresado</a></li>--%>
                        <li class="active"><a href="ActualizargraduandoUI.aspx">Graduando</a></li>
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <img alt="" style="height: 19px; width:17px" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                <span class="username" id="spanNombre">Nombre</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <div class="log-arrow-up"></div>
                                <%--<li><a href="#"><i class=" icon-suitcase"></i>Profile</a></li>--%>
                                <%--<li><a href="#"><i class="icon-cog"></i>Settings</a></li>--%>
                                <%--<li><a href="#"><i class="icon-bell-alt"></i>Notification</a></li>--%>
                                <li><a href="Login.aspx"><i class="icon-key"></i>Cerrar sesión</a></li>
                            </ul>
                        </li>
                        <!-- user login dropdown end -->
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!--header end-->
    <%--  --%>
    <!--breadcrumbs start-->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-sm-4">
                    <h1>Graduandos</h1>
                </div>
                <div class="col-lg-8 col-sm-8">
                    <ol class="breadcrumb pull-right">
                        <li><a href="Index.aspx">Home</a></li>
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
                            <asp:HiddenField ID="NombreHidden" runat="server"/>
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
                                   * DNI
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtdni" runat="server"
                                        CssClass="form-control" onkeypress="return isNumber(event)" Enabled="false" onpaste="return false" ></asp:TextBox>
                                    
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
                                        Carrera
                                    </label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtCarrera" runat="server"
                                            CssClass="form-control" placeholder="Ejemplo: Carrera" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                   * Teléfonos
                                </label>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txttelefonoprincipal" runat="server"
                                        CssClass="form-control" placeholder="00-999-999-9999 (principal)" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false" ></asp:TextBox>
                                  
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txttelefonoalternativo" runat="server"
                                        CssClass="form-control" placeholder="00-999-999-9999 (alternativo)" data-mask="999-999-999"  onkeypress="return isNumber(event)"  onpaste="return false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Departamento
                                </label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlDepartamento" runat="server" AutoPostBack="false" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Distrito
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtdistrito" runat="server"
                                        CssClass="form-control" placeholder="Ejemplo: San Isidro"></asp:TextBox>
                                </div>
                            </div>

                             <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Dirección
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtdireccion" runat="server"
                                        CssClass="form-control" placeholder="Ejemplo: Av. Callejones rojos 450"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                   * Correo
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtcorreo" runat="server"
                                        CssClass="form-control" placeholder="Ejemplo: usuario@gmail.com"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Correo Alternativo
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtcorreoalternativo" runat="server"
                                        CssClass="form-control" placeholder="Ejemplo: usuario_alternativo@hotmail.com"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                   * Perfil LinkedIn
                                </label>
                                <div class="col-sm-8">

                                    <div class="input-group m-bot15">
                                        <span class="input-group-addon"><i class="fa fa-linkedin"></i>
                                        </span>
                                        <asp:TextBox ID="txtperfillinkedin" runat="server"
                                            CssClass="form-control" placeholder="Ejemplo: https://pe.linkedin.com/iduduario" ></asp:TextBox>
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
                                            CssClass="form-control" placeholder="Ejemplo: https://www.facebook.com/usuario "></asp:TextBox>
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
                                    <b style="text-align: center">Debe ingresar todos los campos necesarios para actualizar sus datos.</b>
                                </div>

                                <div id="dialogincompleto" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">El formato de algunos campos es incorrecto.</b>
                                </div>

                                <div id="dialogexito" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">Sus datos han sido actualizados satisfactoriamente.</b>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>


    <!--footer start-->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-sm-12">
                    <h1>Informacion de contacto</h1>
                    <address>
                        <p>
                            Dirección:  Prolongación Primavera 2390, Monterrico
                            <br />

                            Telf: 313-3333 | Fax: 313-3344
                        </p>
                        <p>Contacto : <a href="http://contactoweb.upc.edu.pe/">Consultas</a></p>
                    </address>
                </div>
                <div class="col-lg-2 col-sm-12 ">
                    <h1>Contactenos</h1>
                    <ul class="social-link-footer list-unstyled">
                        <li><a href="https://www.facebook.com/profile.php?id=100007924308551"><i class="icon-facebook"></i></a></li>
                        <li><a href="https://www.linkedin.com/pub/escuela-de-ingenier%C3%ADa-de-sistemas-y-computaci%C3%B3n/a3/864/45b"><i class="icon-linkedin"></i></a></li>

                    </ul>
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



            var algo = document.getElementById("<%= NombreHidden.ClientID %>").value; //hiddenField asp
            $("#spanNombre").text(algo); //span html
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
