<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaregresadosUI.aspx.cs" Inherits="SWEGR.UI.ListaregresadosUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Lista de Egresados</title>

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


<style>
        .separadorTabla
        {  
            -webkit-column-count: 2;
            -moz-column-count: 2; 
            column-count: 2;

        }
    </style>
    <script type="text/javascript">

        function visualizarInfoCompleta() {

            var wWidth = $(window).width();
            var dWidth = wWidth * 0.6;
            var tableWidth = dWidth * 0.93;


            $("#tbegresadoTrabajos").width(tableWidth);
            $("#tbegresadoEstudios").width(tableWidth);
            $("#tbegresadoIntereses").width(dWidth * 0.45);
            $("#tbegresadoAptitudes").width(dWidth * 0.45);
            $("#divformulario").width(dWidth * 0.7)
            $("#divfoto").width(dWidth * 0.2)


            $("#dialogInfo").dialog({
                width: dWidth,
                title: "Datos de Egresado",
                buttons: {
                    Guardar: function () {
                        $(this).dialog("close");
                    }
                },
                modal: true
            }).css("font-size", "12px");
        }

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
                        <li><a href="Index.aspx">Inicio</a></li>
                        
                        <li><a href="VisualizaregresadoUI.aspx">Egresado</a></li>
                        <li class="active"><a href="ActualizargraduandoUI.aspx">Graduando</a></li>
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <img alt="" style="height: 19px; width:17px" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                <span class="username">Nombre</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <div class="log-arrow-up"></div>
                                <li><a href="#"><i class=" icon-suitcase"></i>Profile</a></li>
                                <li><a href="#"><i class="icon-cog"></i>Settings</a></li>
                                <li><a href="#"><i class="icon-bell-alt"></i>Notification</a></li>
                                <li><a href="Loginprueba.aspx"><i class="icon-key"></i>Log Out</a></li>
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
                        <li class="active">Lista de egresados </li>
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
            </header>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <form id="swegrform" class="cmxform form-horizontal tasi-form" runat="server">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="uppanel" runat="server">
                                <ContentTemplate>

                                
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Nombre y/o código:
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtNombreCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Año inicio
                                </label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlInicio" runat="server" AutoPostBack="false" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Año Fin
                                </label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlFin" runat="server" AutoPostBack="false" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Carrera
                                </label>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="ddlCarrera" runat="server" AutoPostBack="false" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                        <div class="col-sm-10">
                                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnBuscar_Click" />
                                        </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <asp:GridView ID="grdEgresados" runat="server" AutoGenerateColumns="false" OnRowCommand="grdEgresados_RowCommand">
                                        <Columns>
                                            <asp:BoundField HeaderText="Código" DataField="Codigo" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField HeaderText="Nombre" DataField="Nombre" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField HeaderText="Carrera" DataField="Carrera" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField HeaderText="Ciclo egreso" DataField="Cicloegreso" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField HeaderText="Trabajo Actual" DataField="Trabajoactual" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField HeaderText="Nombre jefe" DataField="Nombrejefe" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField HeaderText="Cargo jefe" DataField="Cargojefe" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField HeaderText="Teléfono jefe" DataField="Telefonojefe" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField HeaderText="Correo jefe" DataField="Correojefe" ItemStyle-HorizontalAlign="Left"></asp:BoundField>

                                            <asp:TemplateField HeaderText="Ver" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                            <asp:ImageButton ID="btnVer" runat="server" CommandName="cmdVer" ImageUrl="Images/edit.png" Width="16" Height="16" OnClick="btnVer_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Extraer datos" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                            <asp:ImageButton ID="btnExtraerDatos" runat="server" CommandName="cmdExtraer" ImageUrl="Images/delete.png" Width="16" Height="16" OnClick="btnExtraerDatos_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="form-group">
                                        <div class="col-sm-10">
                                            <asp:Button ID="btnImprimir" runat="server" Text="Imprimir" CssClass="btn btn-danger pull-right" type="submit" OnClick="Imprimir_Click" />
                                        </div>
                            </div>
                                    </ContentTemplate>
                            </asp:UpdatePanel>
                            
                            <div class="form-group">
                                <div id="dialogerror" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">No existen egresados por mostrar.</b>
                                </div>
                            </div>

                            <div class="dialog-form" title="Datos Obtenidos">                            
                                <div id="dialogInfo" style="text-align: justify; display: none" runat="server">
                                    <table>
                                        <tr>
                                            <td>
                                        <div id="divformulario" style="width:auto">                             
                                            <label id="dlgname">Nombre Completo:</label><br />                                           
                                            <label id="dlgemail">Telefonos:</label><br />                                           
                                            <label id="dlgpassword">Dirección:</label><br />
                                            <label id="dlgcorreo">Correo:</label><br />
                                            <label id="dlgcorreoalt">Correo Alternativo:</label><br />
                                        </div>
                                                </td>
                                            <td>
                                        <div id="divfoto" style="width:auto">
                                            <img src="http://cdn.slidesharecdn.com/profile-photo-otto9023-96x96.jpg?cb=1413141593" />
                                        </div>
                                                </td>
                                        </tr>
                                    </table>  
                                    <br />
                                    <label style="">Trabajos</label>
                                    <table id="tbegresadoTrabajos" class="ui-widget ui-widget-content">
                                        <thead>
                                            <tr class="ui-widget-header" style="width:auto">
                                                <th id="th1" style="width:25%">Cargo</th>
                                                <th id="th2" style="width:50%">Trabajo</th>
                                                <th id="th3" style="width:25%">Duración</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>John Doe</td>
                                                <td>john.doe@example.com</td>
                                                <td>johndoe1</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                    <label style="">Estudios</label>
                                    <table id="tbegresadoEstudios" class="ui-widget ui-widget-content">
                                        <thead>
                                            <tr class="ui-widget-header" style="width:auto">
                                                <th id="th4" style="width:25%">Tipo</th>
                                                <th id="th5" style="width:25%">Nombre</th>
                                                <th id="th6" style="width:50%">Institución</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>John Doe</td>
                                                <td>john.doe@example.com</td>
                                                <td>johndoe1</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                    <div class="separadorTabla">
                                        <table id="tbegresadoIntereses" class="ui-widget ui-widget-content">
                                            <thead>
                                                <tr class="ui-widget-header" style="width:auto">
                                                    <th>Intereses</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>John Doe</td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <table id="tbegresadoAptitudes" class="ui-widget ui-widget-content">
                                            <thead>
                                                <tr class="ui-widget-header" style="width:auto">
                                                    <th>Aptitudes</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>John Doe</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                            <input type="submit" tabindex="-1" style="position: absolute; top: -1000px"/>
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
