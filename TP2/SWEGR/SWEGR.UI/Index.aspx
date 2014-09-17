<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SWEGR.UI.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Home</title>

    <!-- Bootstrap core CSS -->
    <link href="Content/css/bootstrap.min.css" rel="stylesheet">
    <link href="Content/css/theme.css" rel="stylesheet">
    <link href="Content/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="Content/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="Content/css/flexslider.css"/>
    <link href="Content/assets/bxslider/jquery.bxslider.css" rel="stylesheet" />
    <link href="Content/assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />

    <link rel="stylesheet" href="Content/assets/revolution_slider/css/rs-style.css" media="screen">
    <link rel="stylesheet" href="Content/assets/revolution_slider/rs-plugin/css/settings.css" media="screen">

    <!-- Custom styles for this template -->
    <link href="Content/css/style.css" rel="stylesheet">
    <link href="Content/css/style-responsive.css" rel="stylesheet" />

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
                    <a class="navbar-brand" href="index.aspx"><img style="margin-top:-15px" src="http://cdn4.upc.edu.pe/sites/all/themes/upc_2013/img/logo.png"></img></a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav" style="align: center">
                        <li class="active"><a href="Index.aspx">Inicio</a></li>
                    
                        
                        <li><a href="VisualizaregresadoUI.aspx">Egresado</a></li>
                        
                        <li><a href="ActualizargraduandoUI.aspx">Graduando</a></li>
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
                                <li><a href="#l"><i class="icon-key"></i>Log Out</a></li>
                            </ul>
                        </li>
                              <!-- user login dropdown end -->
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!--header end-->

     <!-- revolution slider start -->
     <div class="fullwidthbanner-container main-slider">
         <div class="fullwidthabnner">
             <ul id="revolutionul" style="display:none;">
                 <!-- 1st slide -->
                 <li data-transition="fade" data-slotamount="8" data-masterspeed="700" data-delay="9400" data-thumb="">
                     <div class="caption lfl slide_item_left"
                          data-x="10"
                          data-y="70"
                          data-speed="400"
                          data-start="1500"
                          data-easing="easeOutBack">
                         <img src="Images/foto2.png" alt="Image 1">
                     </div>
                     <div class="caption lfr slide_title"
                          data-x="670"
                          data-y="120"
                          data-speed="400"
                          data-start="1000"
                          data-easing="easeOutExpo">
                         Seguimiento Egresados
                     </div>

                     <div class="caption lfr slide_subtitle dark-text"
                          data-x="670"
                          data-y="190"
                          data-speed="400"
                          data-start="2000"
                          data-easing="easeOutExpo">
                         UPC
                     </div>
                     <div class="caption lfr slide_desc"
                          data-x="670"
                          data-y="260"
                          data-speed="400"
                          data-start="2500"
                          data-easing="easeOutExpo">
                         Bienvenidos a la web de seguimientos de egresados que se encarga<br />
                         de mantener en conectacto a la universidad con los ya graduados, ofreciendole beneficios.
                     </div>
                 <%--    <a class="caption lfr btn yellow slide_btn" href="http://thevectorlab.net/flatlab" target="_blank"
                        data-x="670"
                        data-y="400"
                        data-speed="400"
                        data-start="3500"
                        data-easing="easeOutExpo">
                        alo
                     </a>--%>

                 </li>

                 <!-- 2nd slide  -->
                 <li data-transition="fade" data-slotamount="8" data-masterspeed="700" data-delay="9400" data-thumb="">
                     <!-- THE MAIN IMAGE IN THE FIRST SLIDE -->
                     <img src="img/banner/banner_bg.jpg" alt="">
                     <div class="caption lft slide_title"
                          data-x="10"
                          data-y="125"
                          data-speed="400"
                          data-start="1500"
                          data-easing="easeOutExpo">
                         Bolsa de trabajo
                     </div>
                     <div class="caption lft slide_subtitle dark-text"
                          data-x="10"
                          data-y="180"
                          data-speed="400"
                          data-start="2000"
                          data-easing="easeOutExpo">
                         UPC
                     </div>
                     <div class="caption lft slide_desc dark-text"
                          data-x="10"
                          data-y="240"
                          data-speed="400"
                          data-start="2500"
                          data-easing="easeOutExpo">
                        La bolsa de trabajo upc otorga excelentes ofertas<br />
                        de trabajo a nuestros graduados.
                     </div>
                     <a class="caption lft slide_btn btn red slide_item_left" href="http://bolsadetrabajo.upc.edu.pe/" target="_blank"
                        data-x="10"
                        data-y="360"
                        data-speed="400"
                        data-start="3000"
                        data-easing="easeOutExpo">
                         Ingresar
                     </a>
                     <div class="caption lft start"
                          data-x="640"
                          data-y="55"
                          data-speed="400"
                          data-start="2000"
                          data-easing="easeOutBack"  >
                         <img src="Images/foto3.png" alt="man">
                     </div>
                     <div class="caption lft slide_item_right"
                          data-x="330"
                          data-y="20"
                          data-speed="500"
                          data-start="5000"
                          data-easing="easeOutBack">
                       
                     </div>

                 </li>

                 <!-- 3rd slide  -->
                 <%--<li data-transition="fade" data-slotamount="7" data-masterspeed="300" data-delay="9400" data-thumb="">
                     <img src="img/banner/red-bg.jpg" alt="">
                     <div class="caption lfl slide_item_right"
                          data-x="10"
                          data-y="105"
                          data-speed="1200"
                          data-start="1500"
                          data-easing="easeOutBack">
                         <img src="img/banner/imac.png" alt="Image 1">
                     </div>
                     <div class="caption lfl slide_item_right"
                          data-x="25"
                          data-y="345"
                          data-speed="1200"
                          data-start="2000"
                          data-easing="easeOutBack">
                         <img src="img/banner/tab.png" alt="Image 1">
                     </div>
                     <div class="caption lfl slide_item_right"
                          data-x="200"
                          data-y="330"
                          data-speed="1200"
                          data-start="2500"
                          data-easing="easeOutBack">
                         <img src="img/banner/mobile.png" alt="Image 1">
                     </div>
                     <div class="caption lfl slide_item_right"
                          data-x="250"
                          data-y="230"
                          data-speed="1200"
                          data-start="3000"
                          data-easing="easeOutBack">
                         <img src="img/banner/laptop.png" alt="Image 1">
                     </div>
                     <div class="caption lfl slide_item_right"
                          data-x="165"
                          data-y="30"
                          data-speed="500"
                          data-start="5000"
                          data-easing="easeOutBack">
                         <img src="img/banner/text_imac.png" id="rev-hint1" alt="Image 1">
                     </div>

                     <div class="caption lfr slide_title slide_item_left yellow-txt"
                          data-x="670"
                          data-y="145"
                          data-speed="400"
                          data-start="3500"
                          data-easing="easeOutExpo">
                         Full Responsive
                     </div>
                     <div class="caption lfr slide_subtitle slide_item_left"
                          data-x="670"
                          data-y="200"
                          data-speed="400"
                          data-start="4000"
                          data-easing="easeOutExpo">
                         And Awesome Flat Design
                     </div>
                     <div class="caption lfr slide_desc slide_item_left"
                          data-x="670"
                          data-y="280"
                          data-speed="400"
                          data-start="4500"
                          data-easing="easeOutExpo">
                         Sed ut perspiciatis unde omnis iste natus error sit voluptatem <br>
                         accusantium doloremque laudantium, totam rem aperiam,<br>
                         eaque ipsa quae ablic jiener.
                     </div>


                 </li>--%>

             </ul>
            <div class="tp-bannertimer tp-top"></div>
         </div>
     </div>
     <!-- revolution slider end -->

    <!--container start-->
    

    <!--footer start-->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-sm-12">
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
            </div>
        </div>
    </footer>
    <!--footer end-->

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="Content/js/jquery.js"></script>
    <script src="Content/js/jquery-1.8.3.min.js"></script>
    <script src="Content/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Content/js/hover-dropdown.js"></script>
    <script defer src="Content/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="Content/assets/bxslider/jquery.bxslider.js"></script>

    <script type="text/javascript" src="Content/js/jquery.parallax-1.1.3.js"></script>

    <script src="Content/js/jquery.easing.min.js"></script>
    <script src="Content/js/link-hover.js"></script>

    <script src="Content/assets/fancybox/source/jquery.fancybox.pack.js"></script>

    <script type="text/javascript" src="Content/assets/revolution_slider/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="Content/assets/revolution_slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

    <!--common script for all pages-->
    <script src="Content/js/common-scripts.js"></script>

    <script src="Content/js/revulation-slide.js"></script>


  <script>

      RevSlide.initRevolutionSlider();

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

      //    fancybox
      jQuery(".fancybox").fancybox();



  </script>

  </body>
</html>
