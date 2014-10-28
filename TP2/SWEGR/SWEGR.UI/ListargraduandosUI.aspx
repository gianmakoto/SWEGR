<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListargraduandosUI.aspx.cs" Inherits="SWEGR.UI.ListargraduandosUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Lista de Graduandos</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <script type="text/javascript" src="MaxLength.min.js"></script>

         <link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">

 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    <link href="http://localhost:49184/maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

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
                    <a class="navbar-brand" href="InicioComite.aspx">
                        <img style="margin-top: -15px" src="http://cdn4.upc.edu.pe/sites/all/themes/upc_2013/img/logo.png"></img></a>
                </div>

                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav" style=" align: center">
                        <li><a href="InicioComite.aspx">Inicio</a></li>
                        
                          <li class><a href="ListaregresadosUI.aspx">Egresado</a></li>
                        
                        <li><a href="#">Graduando</a></li>
                        <li><a href="#">Carga De Datos</a></li>
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <img alt="" style="height: 19px; width:17px" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                <span class="username" id="spanNombre">Nombre</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <div class="log-arrow-up"></div>
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
                    <h1>Lista de Egresados</h1>
                </div>
                <div class="col-lg-8 col-sm-8">
                    <ol class="breadcrumb pull-right">
                        <li><a href="Index.aspx">Home</a></li>
                        <li class="active">Lista de graduandos </li>
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
                            <asp:UpdatePanel ID="uppanel" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
<asp:HiddenField  ID="NombreHidden" runat="server"/>
                                
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">
                                    Nombre y/o código:
                                    <asp:HiddenField ID="PNombre" runat="server" ></asp:HiddenField>
                                            <asp:HiddenField ID="PDireccion" runat="server" ></asp:HiddenField>
                                            <asp:HiddenField ID="PTelf1" runat="server" ></asp:HiddenField>
                                            <asp:HiddenField ID="Ptelf2" runat="server" ></asp:HiddenField>
                                            <asp:HiddenField ID="PCorreo1" runat="server" ></asp:HiddenField>
                                            <asp:HiddenField ID="Pcorreo2" runat="server" ></asp:HiddenField>
                                </label>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtNombreCodigo" runat="server" CssClass="form-control"></asp:TextBox>
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
                                    <asp:GridView ID="grdGraduandos" Width="930px"  align = "center" runat="server"  CellPadding="8" CellSpacing="3" AutoGenerateColumns="false" DataKeyNames="Idegresado" OnRowCommand="grdGraduandos_RowCommand" AllowPaging="true" PageSize="2" OnPageIndexChanging="grdGraduandos_PageIndexChanging">
                                        <Columns>
                                            <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller"  DataField="EgresadoID" HeaderText="Idegresado" Visible="False" />
                                            <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller"  HeaderText="Código" DataField="Codigouniversitarioegresado" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller" HeaderText="Nombre" DataField="Nombrecompletoegresado" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="300" ItemStyle-Font-Size="Smaller" HeaderText="Carrera" DataField="Carreraegresado" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                            <asp:BoundField ItemStyle-Width="200" ItemStyle-Font-Size="Smaller" HeaderText="Ciclo actual" DataField="Cicloegresado" ItemStyle-HorizontalAlign="Left"></asp:BoundField>

                                            <asp:TemplateField HeaderText="Actualizado" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="80px">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkbActualizacion" runat="server" Enabled="false" Checked='<%# VerficarCheck(Eval("Idegresado").ToString()) %>'/>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Ver" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="80px">
                                                <ItemTemplate>
                                                            
                                                    <asp:LinkButton ID="lkbVer" runat="server"   CommandName="cmdVer" CommandArgument='<%# Eval("Idegresado") %>' >
                                                                <asp:Image ID="btnVer" runat="server" ImageUrl="Images/visua.png" Width="16" Height="16"/>
                                                            </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle BackColor="#626262"  ForeColor="White" />  
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
                                    <b style="text-align: center">No existen graduandos para mostrar.                   </div>
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
