<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisualizaregresadoUI.aspx.cs" Inherits="SWEGR.UI.VisualizaregresadoUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Visualizar Egresado</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript">
        function datosPersonalesToggle() {
            $("#datosPersonales").slideToggle();
        }

        function trayectoriaAcadToggle() {
            $("#trayectoriaAcad").slideToggle();
        }

        function trayectoriaProfToggle() {
            $("#trayectoriaProf").slideToggle();
        }

        function aptitudesInteresesToggle() {
            $("#aptitudesIntereses").slideToggle();
        }

        function mostrarCurso2() {
            $("#Curso2").show();
        }

        function mostrarCurso3() {
            $("#Curso3").show();
        }

        function mostrarCurso4() {
            $("#Curso4").show();
        }

        function mostrarCurso5() {
            $("#Curso5").show();
        }

        function mostrarCurso6() {
            $("#Curso6").show();
        }

        function mostrarCurso7() {
            $("#Curso7").show();
        }

        function mostrarCurso8() {
            $("#Curso8").show();
        }

        function mostrarCurso9() {
            $("#Curso9").show();
        }

        function mostrarCurso10() {
            $("#Curso10").show();
        }

        function mostrarCurso11() {
            $("#Curso11").show();
        }

        function mostrarCurso12() {
            $("#Curso12").show();
        }

        function mostrarCurso13() {
            $("#Curso13").show();
        }

        function mostrarCurso14() {
            $("#Curso14").show();
        }

        function mostrarCurso15() {
            $("#Curso15").show();
        }

        function mostrarCurso16() {
            $("#Curso16").show();
        }

        function mostrarCurso17() {
            $("#Curso17").show();
        }

        function mostrarCurso18() {
            $("#Curso18").show();
        }

        function mostrarCurso19() {
            $("#Curso19").show();
        }

        function mostrarCurso20() {
            $("#Curso20").show();
        }

        function mostrarTrabajo2() {
            $("#Trabajo2").show();
        }

        function mostrarTrabajo3() {
            $("#Trabajo3").show();
        }

        function mostrarTrabajo4() {
            $("#Trabajo4").show();
        }

        function mostrarTrabajo5() {
            $("#Trabajo5").show();
        }

        function mostrarTrabajo6() {
            $("#Trabajo6").show();
        }

        function mostrarTrabajo7() {
            $("#Trabajo7").show();
        }

        function mostrarTrabajo8() {
            $("#Trabajo8").show();
        }

        function mostrarTrabajo9() {
            $("#Trabajo9").show();
        }

        function mostrarTrabajo10() {
            $("#Trabajo10").show();
        }

        function mostrarTrabajo11() {
            $("#Trabajo11").show();
        }

        function mostrarTrabajo12() {
            $("#Trabajo12").show();
        }

        function mostrarTrabajo13() {
            $("#Trabajo13").show();
        }

        function mostrarTrabajo14() {
            $("#Trabajo14").show();
        }

        function mostrarTrabajo15() {
            $("#Trabajo15").show();
        }

        function mostrarTrabajo16() {
            $("#Trabajo16").show();
        }

        function mostrarTrabajo17() {
            $("#Trabajo17").show();
        }

        function mostrarTrabajo18() {
            $("#Trabajo18").show();
        }

        function mostrarTrabajo19() {
            $("#Trabajo19").show();
        }

        function mostrarTrabajo20() {
            $("#Trabajo20").show();
        }

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

                        <li class="active"><a href="VisualizaregresadoUI.aspx">Egresado</a></li>
                        <%--<li><a href="ActualizargraduandoUI.aspx">Graduando</a></li>--%>
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <img alt="" style="height: 19px; width:17px" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                <span class="username">Nombre</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <div class="log-arrow-up"></div>
                                <%--<li><a href="#"><i class=" icon-suitcase"></i>Profile</a></li>--%>
                                <%--<li><a href="#"><i class="icon-cog"></i>Settings</a></li>--%>
                                <%--<li><a href="#"><i class="icon-bell-alt"></i>Notification</a></li>--%>
                                <li><a href="login.aspx"><i class="icon-key"></i>Log Out</a></li>
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
                    <h1>Egresados</h1>
                </div>
                <div class="col-lg-8 col-sm-8">
                    <ol class="breadcrumb pull-right">
                        <li><a href="Index.aspx">Home</a></li>
                        <li class="active">Egresados </li>
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
                <h3>Visualización de datos del Egresado</h3>
            </header>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <form id="swegrform" class="cmxform form-horizontal tasi-form" runat="server">

                            <%-- Datos Personales --%>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="updatosPersonales" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="Div1" runat="server" style="margin: auto">
                                        <div style="float: left; position: relative; top: -10px">
                                            <h3 style="margin-bottom: 4px; text-align: left; float: left">Datos Personales</h3>
                                        </div>
                                        <div style="float: right; position: relative; top: 10px">
                                            <asp:Button ID="btndatosPersonales" runat="server" Text="▼" CssClass="btn" OnClick="btndatosPersonales_Click" />
                                        </div>
                                        <div style="clear: both"></div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div id="datosPersonales" style="border: 1px solid black; padding-left: 4%; padding-top: 4%" hidden="hidden">
                                <div class="row">
                                    <div class="col-sm-8">

                                        <div class="form-group">
                                            <label class="col-sm-3 col-sm-2 control-label">
                                                Nombre completo
                                            </label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="txtnombrecompleto" runat="server" CssClass="form-control" Enabled="false" type="text"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 col-sm-2 control-label">
                                                * DNI
                                            </label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="txtdni" runat="server"
                                                    CssClass="form-control" onkeypress="return isNumber(event)" onpaste="return false" Enabled="false"></asp:TextBox>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 col-sm-2 control-label">
                                                Género
                                            </label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="ddlGenero" runat="server" AutoPostBack="True" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="cold-sm-2">
                                        <div class="row"  >
                                         <img style="height: 135px; width: 135px; margin-left: 30px; " class="img-thumbnail" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png" />
                                        </div>
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
                                        CssClass="form-control" placeholder="00-999-999-9999 (principal)" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false" Enabled="false"></asp:TextBox>

                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="txttelefonoalternativo" runat="server"
                                        CssClass="form-control" placeholder="00-999-999-9999 (alternativo)" data-mask="999-999-999" onkeypress="return isNumber(event)" onpaste="return false" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    País
                                </label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlPais" runat="server" AutoPostBack="false" CssClass="form-control" Enabled="false"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Departamento
                                </label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlDepartamento" runat="server" AutoPostBack="false" CssClass="form-control" Enabled="false"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Distrito
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtdistrito" runat="server"
                                        CssClass="form-control" placeholder="Ejemplo: San Isidro" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Dirección
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtdireccion" runat="server"
                                        CssClass="form-control" placeholder="Ejemplo: Av. Callejones rojos 450" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    * Correo
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtcorreo" runat="server"
                                        CssClass="form-control" placeholder="Ejemplo: usuario@gmail.com" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Correo Alternativo
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtcorreoalternativo" runat="server"
                                        CssClass="form-control" placeholder="Ejemplo: usuario_alternativo@hotmail.com" Enabled="false"></asp:TextBox>
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
                                            CssClass="form-control" placeholder="Ejemplo: https://pe.linkedin.com/iduduario" Enabled="false"></asp:TextBox>
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
                                            CssClass="form-control" placeholder="Ejemplo: https://www.facebook.com/usuario" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            </div>

                            <%-- Trayectoria Académica --%>
                            <asp:UpdatePanel ID="uptrayecAcad" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="Div2" runat="server" style="margin: auto">
                                        <div style="float: left; position: relative; top: -10px">
                                            <h3 style="margin-bottom: 4px; text-align: left; float: left">Trayectoria Académica</h3>
                                        </div>
                                        <div style="float: right; position: relative; top: 10px">
                                            <asp:Button ID="btntrayectoriaAcad" runat="server" Text="▼" OnClick="btntrayectoriaAcad_Click" CssClass="btn" />
                                        </div>
                                        <div style="clear: both"></div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div class="col-md-12" id="trayectoriaAcad" style="border: 1px solid black; padding-left: 4%; padding-top: 4%" hidden="hidden">
                                <div id="Curso1">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <hr />
                                <div id="Curso2" hidden="hidden">
                                    <div class="form-group">

                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso3" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso4" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso5" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso6" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso7" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso8" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso9" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso10" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso11" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso12" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso13" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso14" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso15" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso16" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso17" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso18" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso19" hidden="hidden">
                                    <div class="form-group">

                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso20" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Centro de estudios:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcentroEstudios20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Universidad Privada de Ciencias Aplicadas"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionEstudio20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 3 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Tipo de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttipoEstudio20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de estudio:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEstudio20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: La Maestría en Administración y Dirección de Proyectos"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionEstudio20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Maestría especializada en guiar a cómo dirigir un proyecto exitosamente" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <%-- Trayectoria Profesional --%>
                            <asp:UpdatePanel ID="uptrayecProf" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="Div3" runat="server" style="margin: auto">
                                        <div style="float: left; position: relative; top: -10px">
                                            <h3 style="margin-bottom: 4px; text-align: left; float: left">Trayectoria Profesional</h3>
                                        </div>
                                        <div style="float: right; position: relative; top: 10px">
                                            <asp:Button ID="btntrayectoriaProf" runat="server" Text="▼" CssClass="btn" OnClick="btntrayectoriaProf_Click" />
                                        </div>
                                        <div style="clear: both"></div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div id="trayectoriaProf" style="border: 1px solid black; padding-left: 4%; padding-top: 4%" hidden="hidden">
                                <div id="Trabajo1">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo2" hidden="hidden">
                                    <hr />
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo2" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual2" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo3" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo3" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual3" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo4" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo4" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual4" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo5" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo5" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual5" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo6" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo6" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual6" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo7" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo7" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual7" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo8" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo8" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual8" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo9" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo9" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual9" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo10" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo10" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual10" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo11" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo11" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual11" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo12" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo12" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual12" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo13" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo13" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual13" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo14" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo14" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual14" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo15" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo15" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual15" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo16" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo16" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual16" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo17" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo17" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual17" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo18" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo18" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual18" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo19" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo19" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual19" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>

                                <div id="Trabajo20" hidden="hidden">
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre de la empresa:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombreEmpresa20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargoTrabajo20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto de souciones de software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Duración:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtduracionTrabajo20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 8 años"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Descripción:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtdescripcionTrabajo20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Arquitecto en los proyectos de software de IBM"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre del jefe directo:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtnombrejefeTrabajo20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Bill Jobs"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Cargo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcargojefeTrabajo20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: Jefe de Arquitectos de Software"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Teléfono del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txttelefonojefeTrabajo20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: 00-999-999-9999" data-mask="99-999-9999" onkeypress="return isNumber(event)" onpaste="return false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Correo del jefe:
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtcorreojefeTrabajo20" runat="server" CssClass="form-control" Enabled="false" type="text" placeholder="Ejemplo: jefemaestro@gmail.com"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div>
                                        <asp:CheckBox ID="cbotrabajoActual20" runat="server" Enabled="false" />
                                        <label>
                                            Trabajo Actual
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <%-- Aptitudes e Intereses--%>
                            <asp:UpdatePanel ID="upaptitudesIntereses" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="Div4" runat="server" style="margin: auto">
                                        <div style="float: left; position: relative; top: -10px">
                                            <h3 style="margin-bottom: 4px; text-align: left; float: left">Aptitudes e Intereses</h3>
                                        </div>
                                        <div style="float: right; position: relative; top: 10px">
                                            <asp:Button ID="btnaptitudesIntereses" runat="server" Text="▼" CssClass="btn" OnClick="btnaptitudesIntereses_Click" />
                                        </div>
                                        <div style="clear: both"></div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <div id="aptitudesIntereses" style="border: 1px solid black; padding-left: 4%; padding-top: 4%" hidden="hidden">
                                <div class="form-group">
                                    <table cellspacion="0" cellpadding="3" border="0" style="margin: auto" class="auto-style13">
                                        <tr>
                                            <td style="text-align: left; vertical-align: top">Aptitudes:</td>
                                            <td>
                                                <asp:ListBox ID="lstaptitudes" runat="server" Width="220px" Height="150px" AutoPostBack="false"></asp:ListBox>
                                            </td>
                                            <td></td>
                                            <td style="text-align: right; vertical-align: top">Intereses:</td>
                                            <td>
                                                <asp:ListBox ID="lstintereses" runat="server" Width="220px" Height="150px" AutoPostBack="false"></asp:ListBox>
                                            </td>
                                        </tr>
                                    </table>
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
