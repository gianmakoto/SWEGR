<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaregresadosUI.aspx.cs" Inherits="SWEGR.UI.ListaregresadosUI" EnableEventValidation="false" %>

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


            var a = document.getElementById('<%=PNombre.ClientID%>').value;
            var b = document.getElementById('<%=PDireccion.ClientID%>').value;
            var c = document.getElementById('<%=PTelf1.ClientID%>').value;
            var d = document.getElementById('<%=Ptelf2.ClientID%>').value;
            var e = document.getElementById('<%=PCorreo1.ClientID%>').value;
            var f = document.getElementById('<%=Pcorreo2.ClientID%>').value;


            $("#salpe").text(a)
            $("#saliope").text(b)
            $("#salioooo").text(c)
            $("#saliow").text(d)
            $("#yasalio").text(e)
            $("#porfinsalio").text(f)


            $("#dialogInfo").dialog({
                width: dWidth,
                title: "Datos de Egresado",
                buttons: {
                    Aceptar: function () {
                        document.getElementById("ButtonGuardar_Invisible").click();
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

        function error_mensaje(mensaje) {
            $("#dialogerror_mensaje").text(mensaje).dialog({
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

        function mensaje_extraccion_datos() {
            $("#dialogerror_mensaje").text("Se ha iniciado la extracción de datos").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                modal: true
            }).css("font-size", "12px");
        }


        function menor() {
            $("#dialogmenor").dialog({
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

        function error_mensaje(mensaje) {
            $("#dialogerror_mensaje").text(mensaje).dialog({
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
    </script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <!--header start-->
    <header class="header-frontend" style=" color:black; " >
        <div class="navbar">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-sm-12">
                        <br />
                        <br />
                        <ol class="breadcrumb pull-left">
                            <li><a href="http://blogs.upc.edu.pe/ingenieria/node">Home</a></li>
                            <li><a href="http://www.upc.edu.pe/">UPC</a></li>
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
                             <a class="navbar-brand pull-right" href="https://www.linkedin.com/pub/escuela-de-ingenier%C3%ADa-de-sistemas-y-computaci%C3%B3n/a3/864/45b">
                           <img  style="margin-right: 15px" src="Images/in2.png"></img></a>
                            <a class="navbar-brand pull-right" href="https://www.facebook.com/profile.php?id=100007924308551">
                           <img style="margin-right: 15px" src="Images/fb.png"></img></a>
                           
                                              
                        </div>
                    </div>
                </div>
                <div class="row">
                    <hr />
                    <div class="col-lg-8 col-sm-12">
                        <br />
                        <h1>Seguimiento Egresados</h1>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <a class="navbar-brand pull-right" href="#">
                           <img style="margin-top: -15px; margin-right: 60px" src="http://cdn4.upc.edu.pe/sites/all/themes/upc_2013/img/logo.png"></img></a>
                    </div>
                </div>
                <div class="row">
                    <%--<hr />--%>
                    <div class="col-lg-8 col-sm-12">
                       
                    </div>
                    <div class="col-lg-4 col-sm-12">
                         <ul class="nav navbar-nav">
                            <%--<li><a href="Index.aspx">Inicio</a></li>--%>

                            <li class="active"><a href="ListaregresadosUI.aspx">Egresado</a></li>
                             <li ><a href="#">Carga de Datos</a></li>
                            <%--<li><a href="ActualizargraduandoUI.aspx">Graduando</a></li>--%>
                            <!-- user login dropdown start-->
                            <li class="dropdown">
                                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                    <img alt="" style="height: 19px; width: 17px" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                    <span class="username" id="span1">Nombre</span>
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu extended logout">
                                    <div class="log-arrow-up" ></div>
                                    <%--<li><a href="#"><i class=" icon-suitcase"></i>Profile</a></li>--%>
                                    <%--<li><a href="Cambiarcontrasena.aspx"><i class="icon-cog"></i>Cambiar Contraseña</a></li>--%>
                                    <%--<li><a href="#"><i class="icon-bell-alt"></i>Notification</a></li>--%>
                                    <li><a href="login.aspx"><i class="icon-key"></i>Cerrar sesión</a></li>
                                </ul>
                            </li>
                            <!-- user login dropdown end -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--header end-->
    <div class="container">
        <%--<hr style="border-style: dashed" />--%>
        <hr style="border-color:red" />
    </div>
    <!--breadcrumbs end-->

    <!--container start-->
    <div class="container">
        <section class="panel">
            <header class="panel-heading">
            </header>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-11">
                        <form id="swegrform" class="cmxform form-horizontal tasi-form" runat="server">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="uppanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                    <asp:HiddenField ID="NombreHidden" runat="server" />


                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            Nombre y/o código:
                                    <asp:HiddenField ID="PNombre" runat="server"></asp:HiddenField>
                                            <asp:HiddenField ID="PDireccion" runat="server"></asp:HiddenField>
                                            <asp:HiddenField ID="PTelf1" runat="server"></asp:HiddenField>
                                            <asp:HiddenField ID="Ptelf2" runat="server"></asp:HiddenField>
                                            <asp:HiddenField ID="PCorreo1" runat="server"></asp:HiddenField>
                                            <asp:HiddenField ID="Pcorreo2" runat="server"></asp:HiddenField>
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
                                            <asp:Button ID="ButtonGuardar_Invisible" runat="server" Style="display: none;" OnClick="GuardarDatosExtraidosButton_Click1" />

                                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnBuscar_Click" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-9">
                                            <asp:GridView ID="grdEgresados" Width="930px" align="center" runat="server" CellPadding="8" CellSpacing="3" AutoGenerateColumns="false" DataKeyNames="EgresadoID" OnRowCommand="grdEgresados_RowCommand" AllowPaging="true" PageSize="10" OnPageIndexChanging="grdEgresados_PageIndexChanging">
                                                <Columns>
                                                    <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller" DataField="EgresadoID" HeaderText="EgresadoID" Visible="False" />
                                                    <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller" HeaderText="Código" DataField="Codigo" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller" HeaderText="Nombre" DataField="Nombre" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField ItemStyle-Width="300" ItemStyle-Font-Size="Smaller" HeaderText="Carrera" DataField="Carrera" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller" HeaderText="Ciclo egreso" DataField="Cicloegreso" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField ItemStyle-Width="300" ItemStyle-Font-Size="Smaller" HeaderText="Trabajo Actual" DataField="Trabajoactual" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller" HeaderText="Nombre jefe" DataField="Nombrejefe" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller" HeaderText="Cargo jefe" DataField="Cargojefe" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller" HeaderText="Teléfono jefe" DataField="Telefonojefe" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller" HeaderText="Correo jefe" DataField="Correojefe" ItemStyle-HorizontalAlign="Left"></asp:BoundField>

                                                    <asp:TemplateField HeaderText="Ver" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="80px">
                                                        <ItemTemplate>

                                                            <asp:LinkButton ID="lkbVer" runat="server" CommandName="cmdVer" CommandArgument='<%# Eval("EgresadoID") %>'>
                                                                <asp:Image ID="btnVer" runat="server" ImageUrl="Images/visua.png" Width="16" Height="16" />
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Extraer datos" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="80px">
                                                        <ItemTemplate>

                                                            <asp:LinkButton ID="lkbExtraerDatos" runat="server" CommandName="cmdExtraer" CommandArgument='<%# Eval("EgresadoID") %>'>
                                                                <asp:Image ID="Image1" runat="server" ImageUrl="Images/extra.png" Width="16" Height="16" />
                                                            </asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>


                                                <HeaderStyle BackColor="#626262" ForeColor="White" />

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>--%>
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <asp:Button ID="btnImprimir" runat="server" Text="Exportar" CssClass="btn btn-danger pull-right" type="submit" OnClick="Imprimir_Click" />
                                        </div>
                                    </div>
                                <%--</ContentTemplate>
                            </asp:UpdatePanel>--%>

                            <div class="form-group">
                                <div id="dialogerror_mensaje" style="text-align: justify; display: none" runat="server"></div>

                                <div id="dialogerror" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">No existen egresados para mostrar.
                                </div>

                                <div id="dialogmenor" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">El Año inicio debe ser menor o igual al Año fin.
                                </div>
                            </div>

                            <!-- Parte Dialog Form -->
                            <div class="dialog-form" title="Datos Obtenidos">


                                <div id="dialogInfo" style="text-align: justify; display: none" runat="server">

                                    <asp:UpdatePanel ID="up_dialog" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>

                                            <table>
                                                <tr>
                                                    <td>
                                                        <div id="divformulario" style="width: auto">
                                                            <label id="dlgname">Nombre Completo: </label>
                                                            <label id="salpe"></label>
                                                            <br />
                                                            <label id="dlgtelefono">Telefonos:</label>
                                                            <label id="salioooo"></label>
                                                            <label>/  </label>
                                                            <label id="saliow"></label>
                                                            <br />
                                                            <label id="dlgdireccion">Dirección:</label>
                                                            <label id="saliope"></label>
                                                            <br />
                                                            <label id="dlgcorreo">Correo:</label>
                                                            <label id="yasalio"></label>
                                                            <br />
                                                            <label id="dlgcorreoalt">Correo Alternativo:
                                                                <label id="porfinsalio"></label>
                                                            </label>
                                                            <br />
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div id="divfoto" style="width: auto">
                                                            <img id="fotoEgresadoURL" style="height: 135px; width: 135px;" runat="server" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />

                                            <label style="">Trabajos</label>
                                            <asp:GridView ID="tbegresadoTrabajos" class="ui-widget ui-widget-content" runat="server" AutoGenerateColumns="false"
                                                Width="98.1%" ShowHeader="true" UseAccessibleHeader="true">
                                                <HeaderStyle CssClass="ui-widget-header" />
                                                <Columns>
                                                    <asp:BoundField DataField="Cargotrabajo" HeaderText="Cargo" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField DataField="Nombretrabajo" HeaderText="Empresa" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField DataField="Duraciontrabajo" HeaderText="Duración" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                </Columns>
                                            </asp:GridView>

                                            <br />
                                            <div class="separadorTabla"></div>

                                            <label style="">Estudios</label>
                                            <asp:GridView ID="tbegresadoEstudios" class="ui-widget ui-widget-content" runat="server" AutoGenerateColumns="false"
                                                Width="98.1%" ShowHeader="true" UseAccessibleHeader="true">
                                                <HeaderStyle CssClass="ui-widget-header" />
                                                <Columns>
                                                    <asp:BoundField DataField="Nombreestudio" HeaderText="Estudio" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField DataField="Nombreinstitucion" HeaderText="Institución" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                    <asp:BoundField DataField="Duracionestudio" HeaderText="Duración" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                </Columns>
                                            </asp:GridView>


                                            <br />
                                            <div class="separadorTabla"></div>

                                            <label style="">Intereses</label>
                                            <asp:GridView ID="tbegresadoIntereses" class="ui-widget ui-widget-content" runat="server" AutoGenerateColumns="true"
                                                Width="98.1%" ShowHeader="true" UseAccessibleHeader="true">
                                                <HeaderStyle CssClass="ui-widget-header" />
                                            </asp:GridView>


                                            <br />
                                            <div class="separadorTabla"></div>

                                            <label style="">Aptitudes</label>
                                            <asp:GridView ID="tbegresadoAptitudes" class="ui-widget ui-widget-content" runat="server" AutoGenerateColumns="true"
                                                Width="98.1%" ShowHeader="true" UseAccessibleHeader="true">
                                                <HeaderStyle CssClass="ui-widget-header" />
                                            </asp:GridView>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>


                                    <!--<asp:Button ID="GuardarDatosExtraidosButton" runat="server" Text="Guardar" CssClass="btn btn-danger pull-right" type="submit"   OnClick="GuardarDatosExtraidosButton_Click"/>-->


                                </div>
                                <!--<input type="submit" tabindex="-1"/> -->

                            </div>

                            <!-- Parte Dialog Form-->


                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>



    
    <!--footer start-->
     <footer class="footer" style="background:white; color:black; box-shadow: grey 0 5px 5px 0 inset; text-align: left"  >
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
