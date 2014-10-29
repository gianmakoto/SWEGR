<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActualizaregresadoUI.aspx.cs" Inherits="SWEGR.UI.ActualizaregresadoUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Actualizar Egresado</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });
            $('#txttelefonoalternativo').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
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

            //-- Trayectoria Academica --//

            //-- Trayectoria Laboral --//
            $('#txttelefonojefeTrabajo').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo2').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo3').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo4').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo5').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo6').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo7').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo8').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo9').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo10').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo11').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo12').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo13').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo14').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo15').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo16').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo17').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo18').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo19').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });

            $('#txttelefonojefeTrabajo20').keypress(function (e) {
                var txt = $(this).val();
                if (txt.length > 15) {
                    e.preventDefault();
                }
            });
        });

        //-- Datos Personales --//

        function habilitarDatosPersonales() {
            $("#txttelefonoprincipal").attr("disabled", false);
            $("#txttelefonoalternativo").attr("disabled", false);
            $("#ddlPais").attr("disabled", false);
            $("#ddlDepartamento").attr("disabled", false);
            $("#txtdistrito").attr("disabled", false);
            $("#txtdireccion").attr("disabled", false);
            $("#txtcorreo").attr("disabled", false);
            $("#txtcorreoalternativo").attr("disabled", false);
            $("#txtperfillinkedin").attr("disabled", false);
            $("#txtperfilfacebook").attr("disabled", false);
            $("#CargaImagen").attr("visible", true);
        }

        function deshabilitarDatosPersonales() {
            $("#txttelefonoprincipal").attr("disabled", true);
            $("#txttelefonoalternativo").attr("disabled", true);
            $("#ddlPais").attr("disabled", true);
            $("#ddlDepartamento").attr("disabled", true);
            $("#txtdistrito").attr("disabled", true);
            $("#txtdireccion").attr("disabled", true);
            $("#txtcorreo").attr("disabled", true);
            $("#txtcorreoalternativo").attr("disabled", true);
            $("#txtperfillinkedin").attr("disabled", true);
            $("#txtperfilfacebook").attr("disabled", true);
            $("#CargaImagen").attr("visible", false);
        }

        function mostrarBotonesDP() {
            $("#btncancelarDP").show();
            $("#btneditarDP").hide();
        }

        function ocultarBotonesDP() {
            $("#btncancelarDP").hide();
            $("#btneditarDP").show();
        }

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
                    Aceptar: function () {
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

        //-- Trayectoria Academica --//

        function habilitarTrayectoriaAcademica1() {
            $("#txtcentroEstudios").attr("disabled", false);
            $("#txtduracionEstudio").attr("disabled", false);
            $("#txttipoEstudio").attr("disabled", false);
            $("#txtnombreEstudio").attr("disabled", false);
            $("#txtdescripcionEstudio").attr("disabled", false);
            $("#ddlPaisTA").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica2() {
            $("#txtcentroEstudios2").attr("disabled", false);
            $("#txtduracionEstudio2").attr("disabled", false);
            $("#txttipoEstudio2").attr("disabled", false);
            $("#txtnombreEstudio2").attr("disabled", false);
            $("#txtdescripcionEstudio2").attr("disabled", false);
            $("#ddlPaisTA2").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica3() {
            $("#txtcentroEstudios3").attr("disabled", false);
            $("#txtduracionEstudio3").attr("disabled", false);
            $("#txttipoEstudio3").attr("disabled", false);
            $("#txtnombreEstudio3").attr("disabled", false);
            $("#txtdescripcionEstudio3").attr("disabled", false);
            $("#ddlPaisTA3").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica4() {
            $("#txtcentroEstudios4").attr("disabled", false);
            $("#txtduracionEstudio4").attr("disabled", false);
            $("#txttipoEstudio4").attr("disabled", false);
            $("#txtnombreEstudio4").attr("disabled", false);
            $("#txtdescripcionEstudio4").attr("disabled", false);
            $("#ddlPaisTA4").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica5() {
            $("#txtcentroEstudios5").attr("disabled", false);
            $("#txtduracionEstudio5").attr("disabled", false);
            $("#txttipoEstudio5").attr("disabled", false);
            $("#txtnombreEstudio5").attr("disabled", false);
            $("#txtdescripcionEstudio5").attr("disabled", false);
            $("#ddlPaisTA5").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica6() {
            $("#txtcentroEstudios6").attr("disabled", false);
            $("#txtduracionEstudio6").attr("disabled", false);
            $("#txttipoEstudio6").attr("disabled", false);
            $("#txtnombreEstudio6").attr("disabled", false);
            $("#txtdescripcionEstudio6").attr("disabled", false);
            $("#ddlPaisTA6").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica7() {
            $("#txtcentroEstudios7").attr("disabled", false);
            $("#txtduracionEstudio7").attr("disabled", false);
            $("#txttipoEstudio7").attr("disabled", false);
            $("#txtnombreEstudio7").attr("disabled", false);
            $("#txtdescripcionEstudio7").attr("disabled", false);
            $("#ddlPaisTA7").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica8() {
            $("#txtcentroEstudios8").attr("disabled", false);
            $("#txtduracionEstudio8").attr("disabled", false);
            $("#txttipoEstudio8").attr("disabled", false);
            $("#txtnombreEstudio8").attr("disabled", false);
            $("#txtdescripcionEstudio8").attr("disabled", false);
            $("#ddlPaisTA8").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica9() {
            $("#txtcentroEstudios9").attr("disabled", false);
            $("#txtduracionEstudio9").attr("disabled", false);
            $("#txttipoEstudio9").attr("disabled", false);
            $("#txtnombreEstudio9").attr("disabled", false);
            $("#txtdescripcionEstudio9").attr("disabled", false);
            $("#ddlPaisTA9").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica10() {
            $("#txtcentroEstudios10").attr("disabled", false);
            $("#txtduracionEstudio10").attr("disabled", false);
            $("#txttipoEstudio10").attr("disabled", false);
            $("#txtnombreEstudio10").attr("disabled", false);
            $("#txtdescripcionEstudio10").attr("disabled", false);
            $("#ddlPaisTA10").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica11() {
            $("#txtcentroEstudios11").attr("disabled", false);
            $("#txtduracionEstudio11").attr("disabled", false);
            $("#txttipoEstudio11").attr("disabled", false);
            $("#txtnombreEstudio11").attr("disabled", false);
            $("#txtdescripcionEstudio11").attr("disabled", false);
            $("#ddlPaisTA11").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica12() {
            $("#txtcentroEstudios12").attr("disabled", false);
            $("#txtduracionEstudio12").attr("disabled", false);
            $("#txttipoEstudio12").attr("disabled", false);
            $("#txtnombreEstudio12").attr("disabled", false);
            $("#txtdescripcionEstudio12").attr("disabled", false);
            $("#ddlPaisTA12").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica13() {
            $("#txtcentroEstudios13").attr("disabled", false);
            $("#txtduracionEstudio13").attr("disabled", false);
            $("#txttipoEstudio13").attr("disabled", false);
            $("#txtnombreEstudio13").attr("disabled", false);
            $("#txtdescripcionEstudio13").attr("disabled", false);
            $("#ddlPaisTA13").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica14() {
            $("#txtcentroEstudios14").attr("disabled", false);
            $("#txtduracionEstudio14").attr("disabled", false);
            $("#txttipoEstudio14").attr("disabled", false);
            $("#txtnombreEstudio14").attr("disabled", false);
            $("#txtdescripcionEstudio14").attr("disabled", false);
            $("#ddlPaisTA14").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica15() {
            $("#txtcentroEstudios15").attr("disabled", false);
            $("#txtduracionEstudio15").attr("disabled", false);
            $("#txttipoEstudio15").attr("disabled", false);
            $("#txtnombreEstudio15").attr("disabled", false);
            $("#txtdescripcionEstudio15").attr("disabled", false);
            $("#ddlPaisTA15").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica16() {
            $("#txtcentroEstudios16").attr("disabled", false);
            $("#txtduracionEstudio16").attr("disabled", false);
            $("#txttipoEstudio16").attr("disabled", false);
            $("#txtnombreEstudio16").attr("disabled", false);
            $("#txtdescripcionEstudio16").attr("disabled", false);
            $("#ddlPaisTA16").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica17() {
            $("#txtcentroEstudios17").attr("disabled", false);
            $("#txtduracionEstudio17").attr("disabled", false);
            $("#txttipoEstudio17").attr("disabled", false);
            $("#txtnombreEstudio17").attr("disabled", false);
            $("#txtdescripcionEstudio17").attr("disabled", false);
            $("#ddlPaisTA17").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica18() {
            $("#txtcentroEstudios18").attr("disabled", false);
            $("#txtduracionEstudio18").attr("disabled", false);
            $("#txttipoEstudio18").attr("disabled", false);
            $("#txtnombreEstudio18").attr("disabled", false);
            $("#txtdescripcionEstudio18").attr("disabled", false);
            $("#ddlPaisTA18").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica19() {
            $("#txtcentroEstudios19").attr("disabled", false);
            $("#txtduracionEstudio19").attr("disabled", false);
            $("#txttipoEstudio19").attr("disabled", false);
            $("#txtnombreEstudio19").attr("disabled", false);
            $("#txtdescripcionEstudio19").attr("disabled", false);
            $("#ddlPaisTA19").attr("disabled", false);
        }

        function habilitarTrayectoriaAcademica20() {
            $("#txtcentroEstudios20").attr("disabled", false);
            $("#txtduracionEstudio20").attr("disabled", false);
            $("#txttipoEstudio20").attr("disabled", false);
            $("#txtnombreEstudio20").attr("disabled", false);
            $("#txtdescripcionEstudio20").attr("disabled", false);
            $("#ddlPaisTA20").attr("disabled", false);
        }

        function deshabilitarTODOTryacetoriaAcademica() {
            $("#txtcentroEstudios").attr("disabled", true);
            $("#txtduracionEstudio").attr("disabled", true);
            $("#txttipoEstudio").attr("disabled", true);
            $("#txtnombreEstudio").attr("disabled", true);
            $("#txtdescripcionEstudio").attr("disabled", true);
            $("#ddlPaisTA").attr("disabled", true);

            $("#txtcentroEstudios2").attr("disabled", true);
            $("#txtduracionEstudio2").attr("disabled", true);
            $("#txttipoEstudio2").attr("disabled", true);
            $("#txtnombreEstudio2").attr("disabled", true);
            $("#txtdescripcionEstudio2").attr("disabled", true);
            $("#ddlPaisTA2").attr("disabled", true);

            $("#txtcentroEstudios3").attr("disabled", true);
            $("#txtduracionEstudio3").attr("disabled", true);
            $("#txttipoEstudio3").attr("disabled", true);
            $("#txtnombreEstudio3").attr("disabled", true);
            $("#txtdescripcionEstudio3").attr("disabled", true);
            $("#ddlPaisTA3").attr("disabled", true);

            $("#txtcentroEstudios4").attr("disabled", true);
            $("#txtduracionEstudio4").attr("disabled", true);
            $("#txttipoEstudio4").attr("disabled", true);
            $("#txtnombreEstudio4").attr("disabled", true);
            $("#txtdescripcionEstudio4").attr("disabled", true);
            $("#ddlPaisTA4").attr("disabled", true);

            $("#txtcentroEstudios5").attr("disabled", true);
            $("#txtduracionEstudio5").attr("disabled", true);
            $("#txttipoEstudio5").attr("disabled", true);
            $("#txtnombreEstudio5").attr("disabled", true);
            $("#txtdescripcionEstudio5").attr("disabled", true);
            $("#ddlPaisTA5").attr("disabled", true);

            $("#txtcentroEstudios6").attr("disabled", true);
            $("#txtduracionEstudio6").attr("disabled", true);
            $("#txttipoEstudio6").attr("disabled", true);
            $("#txtnombreEstudio6").attr("disabled", true);
            $("#txtdescripcionEstudio6").attr("disabled", true);
            $("#ddlPaisTA6").attr("disabled", true);

            $("#txtcentroEstudios7").attr("disabled", true);
            $("#txtduracionEstudio7").attr("disabled", true);
            $("#txttipoEstudio7").attr("disabled", true);
            $("#txtnombreEstudio7").attr("disabled", true);
            $("#txtdescripcionEstudio7").attr("disabled", true);
            $("#ddlPaisTA7").attr("disabled", true);

            $("#txtcentroEstudios8").attr("disabled", true);
            $("#txtduracionEstudio8").attr("disabled", true);
            $("#txttipoEstudio8").attr("disabled", true);
            $("#txtnombreEstudio8").attr("disabled", true);
            $("#txtdescripcionEstudio8").attr("disabled", true);
            $("#ddlPaisTA8").attr("disabled", true);

            $("#txtcentroEstudios9").attr("disabled", true);
            $("#txtduracionEstudio9").attr("disabled", true);
            $("#txttipoEstudio9").attr("disabled", true);
            $("#txtnombreEstudio9").attr("disabled", true);
            $("#txtdescripcionEstudio9").attr("disabled", true);
            $("#ddlPaisTA9").attr("disabled", true);

            $("#txtcentroEstudios10").attr("disabled", true);
            $("#txtduracionEstudio10").attr("disabled", true);
            $("#txttipoEstudio10").attr("disabled", true);
            $("#txtnombreEstudio10").attr("disabled", true);
            $("#txtdescripcionEstudio10").attr("disabled", true);
            $("#ddlPaisTA10").attr("disabled", true);

            $("#txtcentroEstudios11").attr("disabled", true);
            $("#txtduracionEstudio11").attr("disabled", true);
            $("#txttipoEstudio11").attr("disabled", true);
            $("#txtnombreEstudio11").attr("disabled", true);
            $("#txtdescripcionEstudio11").attr("disabled", true);
            $("#ddlPaisTA11").attr("disabled", true);

            $("#txtcentroEstudios12").attr("disabled", true);
            $("#txtduracionEstudio12").attr("disabled", true);
            $("#txttipoEstudio12").attr("disabled", true);
            $("#txtnombreEstudio12").attr("disabled", true);
            $("#txtdescripcionEstudio12").attr("disabled", true);
            $("#ddlPaisTA12").attr("disabled", true);

            $("#txtcentroEstudios13").attr("disabled", true);
            $("#txtduracionEstudio13").attr("disabled", true);
            $("#txttipoEstudio13").attr("disabled", true);
            $("#txtnombreEstudio13").attr("disabled", true);
            $("#txtdescripcionEstudio13").attr("disabled", true);
            $("#ddlPaisTA13").attr("disabled", true);

            $("#txtcentroEstudios14").attr("disabled", true);
            $("#txtduracionEstudio14").attr("disabled", true);
            $("#txttipoEstudio14").attr("disabled", true);
            $("#txtnombreEstudio14").attr("disabled", true);
            $("#txtdescripcionEstudio14").attr("disabled", true);
            $("#ddlPaisTA14").attr("disabled", true);

            $("#txtcentroEstudios15").attr("disabled", true);
            $("#txtduracionEstudio15").attr("disabled", true);
            $("#txttipoEstudio15").attr("disabled", true);
            $("#txtnombreEstudio15").attr("disabled", true);
            $("#txtdescripcionEstudio15").attr("disabled", true);
            $("#ddlPaisTA15").attr("disabled", true);

            $("#txtcentroEstudios16").attr("disabled", true);
            $("#txtduracionEstudio16").attr("disabled", true);
            $("#txttipoEstudio16").attr("disabled", true);
            $("#txtnombreEstudio16").attr("disabled", true);
            $("#txtdescripcionEstudio16").attr("disabled", true);
            $("#ddlPaisTA16").attr("disabled", true);

            $("#txtcentroEstudios17").attr("disabled", true);
            $("#txtduracionEstudio17").attr("disabled", true);
            $("#txttipoEstudio17").attr("disabled", true);
            $("#txtnombreEstudio17").attr("disabled", true);
            $("#txtdescripcionEstudio17").attr("disabled", true);
            $("#ddlPaisTA17").attr("disabled", true);

            $("#txtcentroEstudios18").attr("disabled", true);
            $("#txtduracionEstudio18").attr("disabled", true);
            $("#txttipoEstudio18").attr("disabled", true);
            $("#txtnombreEstudio18").attr("disabled", true);
            $("#txtdescripcionEstudio18").attr("disabled", true);
            $("#ddlPaisTA18").attr("disabled", true);

            $("#txtcentroEstudios19").attr("disabled", true);
            $("#txtduracionEstudio19").attr("disabled", true);
            $("#txttipoEstudio19").attr("disabled", true);
            $("#txtnombreEstudio19").attr("disabled", true);
            $("#txtdescripcionEstudio19").attr("disabled", true);
            $("#ddlPaisTA19").attr("disabled", true);

            $("#txtcentroEstudios20").attr("disabled", true);
            $("#txtduracionEstudio20").attr("disabled", true);
            $("#txttipoEstudio20").attr("disabled", true);
            $("#txtnombreEstudio20").attr("disabled", true);
            $("#txtdescripcionEstudio20").attr("disabled", true);
            $("#ddlPaisTA20").attr("disabled", true);

        }

        function mostrarBotonesTA() {
            $("#btncancelarTA").show();
            $("#btnagregarTA").show();
            $("#btneditarTA").hide();
        }

        function ocultarBotonesTA() {
            $("#btncancelarTA").hide();
            $("#btnagregarTA").hide();
            $("#btneditarTA").show();
        }

        function ocultaragregarTA() {
            $("#btnagregarTA").hide();
        }

        function camposVaciosRA() {
            $("#dialogincompletoTA").dialog({
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

        function exitoRA() {
            $("#dialogexitoTA").dialog({
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

        function incompletoRA() {
            $("#dialogvalidacionTA").dialog({
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

        function ocultarCurso2() {
            $("#Curso2").hide();
        }

        function ocultarCurso3() {
            $("#Curso3").hide();
        }

        function ocultarCurso4() {
            $("#Curso4").hide();
        }

        function ocultarCurso5() {
            $("#Curso5").hide();
        }

        function ocultarCurso6() {
            $("#Curso6").hide();
        }

        function ocultarCurso7() {
            $("#Curso7").hide();
        }

        function ocultarCurso8() {
            $("#Curso8").hide();
        }

        function ocultarCurso9() {
            $("#Curso9").hide();
        }

        function ocultarCurso10() {
            $("#Curso10").hide();
        }

        function ocultarCurso11() {
            $("#Curso11").hide();
        }

        function ocultarCurso12() {
            $("#Curso12").hide();
        }

        function ocultarCurso13() {
            $("#Curso13").hide();
        }

        function ocultarCurso14() {
            $("#Curso14").hide();
        }

        function ocultarCurso15() {
            $("#Curso15").hide();
        }

        function ocultarCurso16() {
            $("#Curso16").hide();
        }

        function ocultarCurso17() {
            $("#Curso17").hide();
        }

        function ocultarCurso18() {
            $("#Curso18").hide();
        }

        function ocultarCurso19() {
            $("#Curso19").hide();
        }

        function ocultarCurso20() {
            $("#Curso20").hide();
        }

        //-- Trayectoria Laboral --//

        function habilitarTrayectoriaLaboral1() {
            $("#txtnombreEmpresa").attr("disabled", false);
            $("#txtcargoTrabajo").attr("disabled", false);
            $("#txtduracionTrabajo").attr("disabled", false);
            $("#txtdescripcionTrabajo").attr("disabled", false);
            $("#txtnombrejefeTrabajo").attr("disabled", false);
            $("#txtcargojefeTrabajo").attr("disabled", false);
            $("#txttelefonojefeTrabajo").attr("disabled", false);
            $("#txtcorreojefeTrabajo").attr("disabled", false);
            $("#ddlPaisTL").attr("disabled", false);
            $("#cbotrabajoActual").attr("disabled", false);

        }

        function habilitarTrayectoriaLaboral2() {
            $("#txtnombreEmpresa2").attr("disabled", false);
            $("#txtcargoTrabajo2").attr("disabled", false);
            $("#txtduracionTrabajo2").attr("disabled", false);
            $("#txtdescripcionTrabajo2").attr("disabled", false);
            $("#txtnombrejefeTrabajo2").attr("disabled", false);
            $("#txtcargojefeTrabajo2").attr("disabled", false);
            $("#txttelefonojefeTrabajo2").attr("disabled", false);
            $("#txtcorreojefeTrabajo2").attr("disabled", false);
            $("#ddlPaisTL2").attr("disabled", false);
            $("#cbotrabajoActual2").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral3() {
            $("#txtnombreEmpresa3").attr("disabled", false);
            $("#txtcargoTrabajo3").attr("disabled", false);
            $("#txtduracionTrabajo3").attr("disabled", false);
            $("#txtdescripcionTrabajo3").attr("disabled", false);
            $("#txtnombrejefeTrabajo3").attr("disabled", false);
            $("#txtcargojefeTrabajo3").attr("disabled", false);
            $("#txttelefonojefeTrabajo3").attr("disabled", false);
            $("#txtcorreojefeTrabajo3").attr("disabled", false);
            $("#ddlPaisTL3").attr("disabled", false);
            $("#cbotrabajoActual3").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral4() {
            $("#txtnombreEmpresa4").attr("disabled", false);
            $("#txtcargoTrabajo4").attr("disabled", false);
            $("#txtduracionTrabajo4").attr("disabled", false);
            $("#txtdescripcionTrabajo4").attr("disabled", false);
            $("#txtnombrejefeTrabajo4").attr("disabled", false);
            $("#txtcargojefeTrabajo4").attr("disabled", false);
            $("#txttelefonojefeTrabajo4").attr("disabled", false);
            $("#txtcorreojefeTrabajo4").attr("disabled", false);
            $("#ddlPaisTL4").attr("disabled", false);
            $("#cbotrabajoActual4").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral5() {
            $("#txtnombreEmpresa5").attr("disabled", false);
            $("#txtcargoTrabajo5").attr("disabled", false);
            $("#txtduracionTrabajo5").attr("disabled", false);
            $("#txtdescripcionTrabajo5").attr("disabled", false);
            $("#txtnombrejefeTrabajo5").attr("disabled", false);
            $("#txtcargojefeTrabajo5").attr("disabled", false);
            $("#txttelefonojefeTrabajo5").attr("disabled", false);
            $("#txtcorreojefeTrabajo5").attr("disabled", false);
            $("#ddlPaisTL5").attr("disabled", false);
            $("#cbotrabajoActual5").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral6() {
            $("#txtnombreEmpresa6").attr("disabled", false);
            $("#txtcargoTrabajo6").attr("disabled", false);
            $("#txtduracionTrabajo6").attr("disabled", false);
            $("#txtdescripcionTrabajo6").attr("disabled", false);
            $("#txtnombrejefeTrabajo6").attr("disabled", false);
            $("#txtcargojefeTrabajo6").attr("disabled", false);
            $("#txttelefonojefeTrabajo6").attr("disabled", false);
            $("#txtcorreojefeTrabajo6").attr("disabled", false);
            $("#ddlPaisTL6").attr("disabled", false);
            $("#cbotrabajoActual6").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral7() {
            $("#txtnombreEmpresa7").attr("disabled", false);
            $("#txtcargoTrabajo7").attr("disabled", false);
            $("#txtduracionTrabajo7").attr("disabled", false);
            $("#txtdescripcionTrabajo7").attr("disabled", false);
            $("#txtnombrejefeTrabajo7").attr("disabled", false);
            $("#txtcargojefeTrabajo7").attr("disabled", false);
            $("#txttelefonojefeTrabajo7").attr("disabled", false);
            $("#txtcorreojefeTrabajo7").attr("disabled", false);
            $("#ddlPaisTL7").attr("disabled", false);
            $("#cbotrabajoActual7").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral8() {
            $("#txtnombreEmpresa8").attr("disabled", false);
            $("#txtcargoTrabajo8").attr("disabled", false);
            $("#txtduracionTrabajo8").attr("disabled", false);
            $("#txtdescripcionTrabajo8").attr("disabled", false);
            $("#txtnombrejefeTrabajo8").attr("disabled", false);
            $("#txtcargojefeTrabajo8").attr("disabled", false);
            $("#txttelefonojefeTrabajo8").attr("disabled", false);
            $("#txtcorreojefeTrabajo8").attr("disabled", false);
            $("#ddlPaisTL8").attr("disabled", false);
            $("#cbotrabajoActual8").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral9() {
            $("#txtnombreEmpresa9").attr("disabled", false);
            $("#txtcargoTrabajo9").attr("disabled", false);
            $("#txtduracionTrabajo9").attr("disabled", false);
            $("#txtdescripcionTrabajo9").attr("disabled", false);
            $("#txtnombrejefeTrabajo9").attr("disabled", false);
            $("#txtcargojefeTrabajo9").attr("disabled", false);
            $("#txttelefonojefeTrabajo9").attr("disabled", false);
            $("#txtcorreojefeTrabajo9").attr("disabled", false);
            $("#ddlPaisTL9").attr("disabled", false);
            $("#cbotrabajoActual9").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral10() {
            $("#txtnombreEmpresa10").attr("disabled", false);
            $("#txtcargoTrabajo10").attr("disabled", false);
            $("#txtduracionTrabajo10").attr("disabled", false);
            $("#txtdescripcionTrabajo10").attr("disabled", false);
            $("#txtnombrejefeTrabajo10").attr("disabled", false);
            $("#txtcargojefeTrabajo10").attr("disabled", false);
            $("#txttelefonojefeTrabajo10").attr("disabled", false);
            $("#txtcorreojefeTrabajo10").attr("disabled", false);
            $("#ddlPaisTL10").attr("disabled", false);
            $("#cbotrabajoActual10").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral11() {
            $("#txtnombreEmpresa11").attr("disabled", false);
            $("#txtcargoTrabajo11").attr("disabled", false);
            $("#txtduracionTrabajo11").attr("disabled", false);
            $("#txtdescripcionTrabajo11").attr("disabled", false);
            $("#txtnombrejefeTrabajo11").attr("disabled", false);
            $("#txtcargojefeTrabajo11").attr("disabled", false);
            $("#txttelefonojefeTrabajo11").attr("disabled", false);
            $("#txtcorreojefeTrabajo11").attr("disabled", false);
            $("#ddlPaisTL11").attr("disabled", false);
            $("#cbotrabajoActual11").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral12() {
            $("#txtnombreEmpresa12").attr("disabled", false);
            $("#txtcargoTrabajo12").attr("disabled", false);
            $("#txtduracionTrabajo12").attr("disabled", false);
            $("#txtdescripcionTrabajo12").attr("disabled", false);
            $("#txtnombrejefeTrabajo12").attr("disabled", false);
            $("#txtcargojefeTrabajo12").attr("disabled", false);
            $("#txttelefonojefeTrabajo12").attr("disabled", false);
            $("#txtcorreojefeTrabajo12").attr("disabled", false);
            $("#ddlPaisTL12").attr("disabled", false);
            $("#cbotrabajoActual12").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral13() {
            $("#txtnombreEmpresa13").attr("disabled", false);
            $("#txtcargoTrabajo13").attr("disabled", false);
            $("#txtduracionTrabajo13").attr("disabled", false);
            $("#txtdescripcionTrabajo13").attr("disabled", false);
            $("#txtnombrejefeTrabajo13").attr("disabled", false);
            $("#txtcargojefeTrabajo13").attr("disabled", false);
            $("#txttelefonojefeTrabajo13").attr("disabled", false);
            $("#txtcorreojefeTrabajo13").attr("disabled", false);
            $("#ddlPaisTL13").attr("disabled", false);
            $("#cbotrabajoActual13").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral14() {
            $("#txtnombreEmpresa14").attr("disabled", false);
            $("#txtcargoTrabajo14").attr("disabled", false);
            $("#txtduracionTrabajo14").attr("disabled", false);
            $("#txtdescripcionTrabajo14").attr("disabled", false);
            $("#txtnombrejefeTrabajo14").attr("disabled", false);
            $("#txtcargojefeTrabajo14").attr("disabled", false);
            $("#txttelefonojefeTrabajo14").attr("disabled", false);
            $("#txtcorreojefeTrabajo14").attr("disabled", false);
            $("#ddlPaisTL14").attr("disabled", false);
            $("#cbotrabajoActual14").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral15() {
            $("#txtnombreEmpresa15").attr("disabled", false);
            $("#txtcargoTrabajo15").attr("disabled", false);
            $("#txtduracionTrabajo15").attr("disabled", false);
            $("#txtdescripcionTrabajo15").attr("disabled", false);
            $("#txtnombrejefeTrabajo15").attr("disabled", false);
            $("#txtcargojefeTrabajo15").attr("disabled", false);
            $("#txttelefonojefeTrabajo15").attr("disabled", false);
            $("#txtcorreojefeTrabajo15").attr("disabled", false);
            $("#ddlPaisTL15").attr("disabled", false);
            $("#cbotrabajoActual15").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral16() {
            $("#txtnombreEmpresa16").attr("disabled", false);
            $("#txtcargoTrabajo16").attr("disabled", false);
            $("#txtduracionTrabajo16").attr("disabled", false);
            $("#txtdescripcionTrabajo16").attr("disabled", false);
            $("#txtnombrejefeTrabajo16").attr("disabled", false);
            $("#txtcargojefeTrabajo16").attr("disabled", false);
            $("#txttelefonojefeTrabajo16").attr("disabled", false);
            $("#txtcorreojefeTrabajo16").attr("disabled", false);
            $("#ddlPaisTL16").attr("disabled", false);
            $("#cbotrabajoActual16").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral17() {
            $("#txtnombreEmpresa17").attr("disabled", false);
            $("#txtcargoTrabajo17").attr("disabled", false);
            $("#txtduracionTrabajo17").attr("disabled", false);
            $("#txtdescripcionTrabajo17").attr("disabled", false);
            $("#txtnombrejefeTrabajo17").attr("disabled", false);
            $("#txtcargojefeTrabajo17").attr("disabled", false);
            $("#txttelefonojefeTrabajo17").attr("disabled", false);
            $("#txtcorreojefeTrabajo17").attr("disabled", false);
            $("#ddlPaisTL17").attr("disabled", false);
            $("#cbotrabajoActual17").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral18() {
            $("#txtnombreEmpresa18").attr("disabled", false);
            $("#txtcargoTrabajo18").attr("disabled", false);
            $("#txtduracionTrabajo18").attr("disabled", false);
            $("#txtdescripcionTrabajo18").attr("disabled", false);
            $("#txtnombrejefeTrabajo18").attr("disabled", false);
            $("#txtcargojefeTrabajo18").attr("disabled", false);
            $("#txttelefonojefeTrabajo18").attr("disabled", false);
            $("#txtcorreojefeTrabajo18").attr("disabled", false);
            $("#ddlPaisTL18").attr("disabled", false);
            $("#cbotrabajoActual18").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral19() {
            $("#txtnombreEmpresa19").attr("disabled", false);
            $("#txtcargoTrabajo19").attr("disabled", false);
            $("#txtduracionTrabajo19").attr("disabled", false);
            $("#txtdescripcionTrabajo19").attr("disabled", false);
            $("#txtnombrejefeTrabajo19").attr("disabled", false);
            $("#txtcargojefeTrabajo19").attr("disabled", false);
            $("#txttelefonojefeTrabajo19").attr("disabled", false);
            $("#txtcorreojefeTrabajo19").attr("disabled", false);
            $("#ddlPaisTL19").attr("disabled", false);
            $("#cbotrabajoActual19").attr("disabled", false);
        }

        function habilitarTrayectoriaLaboral20() {
            $("#txtnombreEmpresa20").attr("disabled", false);
            $("#txtcargoTrabajo20").attr("disabled", false);
            $("#txtduracionTrabajo20").attr("disabled", false);
            $("#txtdescripcionTrabajo20").attr("disabled", false);
            $("#txtnombrejefeTrabajo20").attr("disabled", false);
            $("#txtcargojefeTrabajo20").attr("disabled", false);
            $("#txttelefonojefeTrabajo20").attr("disabled", false);
            $("#txtcorreojefeTrabajo20").attr("disabled", false);
            $("#ddlPaisTL120").attr("disabled", false);
            $("#cbotrabajoActual20").attr("disabled", false);
        }

        function deshabilitarTODOTrayectoriaLaboral() {
            $("#txtnombreEmpresa").attr("disabled", true);
            $("#txtcargoTrabajo").attr("disabled", true);
            $("#txtduracionTrabajo").attr("disabled", true);
            $("#txtdescripcionTrabajo").attr("disabled", true);
            $("#txtnombrejefeTrabajo").attr("disabled", true);
            $("#txtcargojefeTrabajo").attr("disabled", true);
            $("#txttelefonojefeTrabajo").attr("disabled", true);
            $("#txtcorreojefeTrabajo").attr("disabled", true);
            $("#ddlPaisTL").attr("disabled", true);
            $("#cbotrabajoActual").attr("disabled", true);

            $("#txtnombreEmpresa2").attr("disabled", true);
            $("#txtcargoTrabajo2").attr("disabled", true);
            $("#txtduracionTrabajo2").attr("disabled", true);
            $("#txtdescripcionTrabajo2").attr("disabled", true);
            $("#txtnombrejefeTrabajo2").attr("disabled", true);
            $("#txtcargojefeTrabajo2").attr("disabled", true);
            $("#txttelefonojefeTrabajo2").attr("disabled", true);
            $("#txtcorreojefeTrabajo2").attr("disabled", true);
            $("#ddlPaisTL2").attr("disabled", true);
            $("#cbotrabajoActual2").attr("disabled", true);

            $("#txtnombreEmpresa3").attr("disabled", true);
            $("#txtcargoTrabajo3").attr("disabled", true);
            $("#txtduracionTrabajo3").attr("disabled", true);
            $("#txtdescripcionTrabajo3").attr("disabled", true);
            $("#txtnombrejefeTrabajo3").attr("disabled", true);
            $("#txtcargojefeTrabajo3").attr("disabled", true);
            $("#txttelefonojefeTrabajo3").attr("disabled", true);
            $("#txtcorreojefeTrabajo3").attr("disabled", true);
            $("#ddlPaisTL3").attr("disabled", true);
            $("#cbotrabajoActual3").attr("disabled", true);

            $("#txtnombreEmpresa4").attr("disabled", true);
            $("#txtcargoTrabajo4").attr("disabled", true);
            $("#txtduracionTrabajo4").attr("disabled", true);
            $("#txtdescripcionTrabajo4").attr("disabled", true);
            $("#txtnombrejefeTrabajo4").attr("disabled", true);
            $("#txtcargojefeTrabajo4").attr("disabled", true);
            $("#txttelefonojefeTrabajo4").attr("disabled", true);
            $("#txtcorreojefeTrabajo4").attr("disabled", true);
            $("#ddlPaisTL4").attr("disabled", true);
            $("#cbotrabajoActual4").attr("disabled", true);

            $("#txtnombreEmpresa5").attr("disabled", true);
            $("#txtcargoTrabajo5").attr("disabled", true);
            $("#txtduracionTrabajo5").attr("disabled", true);
            $("#txtdescripcionTrabajo5").attr("disabled", true);
            $("#txtnombrejefeTrabajo5").attr("disabled", true);
            $("#txtcargojefeTrabajo5").attr("disabled", true);
            $("#txttelefonojefeTrabajo5").attr("disabled", true);
            $("#txtcorreojefeTrabajo5").attr("disabled", true);
            $("#ddlPaisTL5").attr("disabled", true);
            $("#cbotrabajoActual5").attr("disabled", true);

            $("#txtnombreEmpresa6").attr("disabled", true);
            $("#txtcargoTrabajo6").attr("disabled", true);
            $("#txtduracionTrabajo6").attr("disabled", true);
            $("#txtdescripcionTrabajo6").attr("disabled", true);
            $("#txtnombrejefeTrabajo6").attr("disabled", true);
            $("#txtcargojefeTrabajo6").attr("disabled", true);
            $("#txttelefonojefeTrabajo6").attr("disabled", true);
            $("#txtcorreojefeTrabajo6").attr("disabled", true);
            $("#ddlPaisTL6").attr("disabled", true);
            $("#cbotrabajoActual6").attr("disabled", true);

            $("#txtnombreEmpresa7").attr("disabled", true);
            $("#txtcargoTrabajo7").attr("disabled", true);
            $("#txtduracionTrabajo7").attr("disabled", true);
            $("#txtdescripcionTrabajo7").attr("disabled", true);
            $("#txtnombrejefeTrabajo7").attr("disabled", true);
            $("#txtcargojefeTrabajo7").attr("disabled", true);
            $("#txttelefonojefeTrabajo7").attr("disabled", true);
            $("#txtcorreojefeTrabajo7").attr("disabled", true);
            $("#ddlPaisTL7").attr("disabled", true);
            $("#cbotrabajoActual7").attr("disabled", true);

            $("#txtnombreEmpresa8").attr("disabled", true);
            $("#txtcargoTrabajo8").attr("disabled", true);
            $("#txtduracionTrabajo8").attr("disabled", true);
            $("#txtdescripcionTrabajo8").attr("disabled", true);
            $("#txtnombrejefeTrabajo8").attr("disabled", true);
            $("#txtcargojefeTrabajo8").attr("disabled", true);
            $("#txttelefonojefeTrabajo8").attr("disabled", true);
            $("#txtcorreojefeTrabajo8").attr("disabled", true);
            $("#ddlPaisTL8").attr("disabled", true);
            $("#cbotrabajoActual8").attr("disabled", true);

            $("#txtnombreEmpresa9").attr("disabled", true);
            $("#txtcargoTrabajo9").attr("disabled", true);
            $("#txtduracionTrabajo9").attr("disabled", true);
            $("#txtdescripcionTrabajo9").attr("disabled", true);
            $("#txtnombrejefeTrabajo9").attr("disabled", true);
            $("#txtcargojefeTrabajo9").attr("disabled", true);
            $("#txttelefonojefeTrabajo9").attr("disabled", true);
            $("#txtcorreojefeTrabajo9").attr("disabled", true);
            $("#ddlPaisTL9").attr("disabled", true);
            $("#cbotrabajoActual9").attr("disabled", true);

            $("#txtnombreEmpresa10").attr("disabled", true);
            $("#txtcargoTrabajo10").attr("disabled", true);
            $("#txtduracionTrabajo10").attr("disabled", true);
            $("#txtdescripcionTrabajo10").attr("disabled", true);
            $("#txtnombrejefeTrabajo10").attr("disabled", true);
            $("#txtcargojefeTrabajo10").attr("disabled", true);
            $("#txttelefonojefeTrabajo10").attr("disabled", true);
            $("#txtcorreojefeTrabajo10").attr("disabled", true);
            $("#ddlPaisTL10").attr("disabled", true);
            $("#cbotrabajoActual10").attr("disabled", true);

            $("#txtnombreEmpresa11").attr("disabled", true);
            $("#txtcargoTrabajo11").attr("disabled", true);
            $("#txtduracionTrabajo11").attr("disabled", true);
            $("#txtdescripcionTrabajo11").attr("disabled", true);
            $("#txtnombrejefeTrabajo11").attr("disabled", true);
            $("#txtcargojefeTrabajo11").attr("disabled", true);
            $("#txttelefonojefeTrabajo11").attr("disabled", true);
            $("#txtcorreojefeTrabajo11").attr("disabled", true);
            $("#ddlPaisTL11").attr("disabled", true);
            $("#cbotrabajoActual11").attr("disabled", true);

            $("#txtnombreEmpresa12").attr("disabled", true);
            $("#txtcargoTrabajo12").attr("disabled", true);
            $("#txtduracionTrabajo12").attr("disabled", true);
            $("#txtdescripcionTrabajo12").attr("disabled", true);
            $("#txtnombrejefeTrabajo12").attr("disabled", true);
            $("#txtcargojefeTrabajo12").attr("disabled", true);
            $("#txttelefonojefeTrabajo12").attr("disabled", true);
            $("#txtcorreojefeTrabajo12").attr("disabled", true);
            $("#ddlPaisTL12").attr("disabled", true);
            $("#cbotrabajoActual12").attr("disabled", true);

            $("#txtnombreEmpresa13").attr("disabled", true);
            $("#txtcargoTrabajo13").attr("disabled", true);
            $("#txtduracionTrabajo13").attr("disabled", true);
            $("#txtdescripcionTrabajo13").attr("disabled", true);
            $("#txtnombrejefeTrabajo13").attr("disabled", true);
            $("#txtcargojefeTrabajo13").attr("disabled", true);
            $("#txttelefonojefeTrabajo13").attr("disabled", true);
            $("#txtcorreojefeTrabajo13").attr("disabled", true);
            $("#ddlPaisTL13").attr("disabled", true);
            $("#cbotrabajoActual13").attr("disabled", true);

            $("#txtnombreEmpresa14").attr("disabled", true);
            $("#txtcargoTrabajo14").attr("disabled", true);
            $("#txtduracionTrabajo14").attr("disabled", true);
            $("#txtdescripcionTrabajo14").attr("disabled", true);
            $("#txtnombrejefeTrabajo14").attr("disabled", true);
            $("#txtcargojefeTrabajo14").attr("disabled", true);
            $("#txttelefonojefeTrabajo14").attr("disabled", true);
            $("#txtcorreojefeTrabajo14").attr("disabled", true);
            $("#ddlPaisTL14").attr("disabled", true);
            $("#cbotrabajoActual14").attr("disabled", true);

            $("#txtnombreEmpresa15").attr("disabled", true);
            $("#txtcargoTrabajo15").attr("disabled", true);
            $("#txtduracionTrabajo15").attr("disabled", true);
            $("#txtdescripcionTrabajo15").attr("disabled", true);
            $("#txtnombrejefeTrabajo15").attr("disabled", true);
            $("#txtcargojefeTrabajo15").attr("disabled", true);
            $("#txttelefonojefeTrabajo15").attr("disabled", true);
            $("#txtcorreojefeTrabajo15").attr("disabled", true);
            $("#ddlPaisTL15").attr("disabled", true);
            $("#cbotrabajoActual15").attr("disabled", true);

            $("#txtnombreEmpresa16").attr("disabled", true);
            $("#txtcargoTrabajo16").attr("disabled", true);
            $("#txtduracionTrabajo16").attr("disabled", true);
            $("#txtdescripcionTrabajo16").attr("disabled", true);
            $("#txtnombrejefeTrabajo16").attr("disabled", true);
            $("#txtcargojefeTrabajo16").attr("disabled", true);
            $("#txttelefonojefeTrabajo16").attr("disabled", true);
            $("#txtcorreojefeTrabajo16").attr("disabled", true);
            $("#ddlPaisTL16").attr("disabled", true);
            $("#cbotrabajoActual16").attr("disabled", true);

            $("#txtnombreEmpresa17").attr("disabled", true);
            $("#txtcargoTrabajo17").attr("disabled", true);
            $("#txtduracionTrabajo17").attr("disabled", true);
            $("#txtdescripcionTrabajo17").attr("disabled", true);
            $("#txtnombrejefeTrabajo17").attr("disabled", true);
            $("#txtcargojefeTrabajo17").attr("disabled", true);
            $("#txttelefonojefeTrabajo17").attr("disabled", true);
            $("#txtcorreojefeTrabajo17").attr("disabled", true);
            $("#ddlPaisTL17").attr("disabled", true);
            $("#cbotrabajoActual17").attr("disabled", true);

            $("#txtnombreEmpresa18").attr("disabled", true);
            $("#txtcargoTrabajo18").attr("disabled", true);
            $("#txtduracionTrabajo18").attr("disabled", true);
            $("#txtdescripcionTrabajo18").attr("disabled", true);
            $("#txtnombrejefeTrabajo18").attr("disabled", true);
            $("#txtcargojefeTrabajo18").attr("disabled", true);
            $("#txttelefonojefeTrabajo18").attr("disabled", true);
            $("#txtcorreojefeTrabajo18").attr("disabled", true);
            $("#ddlPaisTL18").attr("disabled", true);
            $("#cbotrabajoActual18").attr("disabled", true);

            $("#txtnombreEmpresa19").attr("disabled", true);
            $("#txtcargoTrabajo19").attr("disabled", true);
            $("#txtduracionTrabajo19").attr("disabled", true);
            $("#txtdescripcionTrabajo19").attr("disabled", true);
            $("#txtnombrejefeTrabajo19").attr("disabled", true);
            $("#txtcargojefeTrabajo19").attr("disabled", true);
            $("#txttelefonojefeTrabajo19").attr("disabled", true);
            $("#txtcorreojefeTrabajo19").attr("disabled", true);
            $("#ddlPaisTL19").attr("disabled", true);
            $("#cbotrabajoActual19").attr("disabled", true);

            $("#txtnombreEmpresa20").attr("disabled", true);
            $("#txtcargoTrabajo20").attr("disabled", true);
            $("#txtduracionTrabajo20").attr("disabled", true);
            $("#txtdescripcionTrabajo20").attr("disabled", true);
            $("#txtnombrejefeTrabajo20").attr("disabled", true);
            $("#txtcargojefeTrabajo20").attr("disabled", true);
            $("#txttelefonojefeTrabajo20").attr("disabled", true);
            $("#txtcorreojefeTrabajo20").attr("disabled", true);
            $("#ddlPaisTL20").attr("disabled", true);
            $("#cbotrabajoActual20").attr("disabled", true);
        }

        function mostrarBotonesTL() {
            $("#btncancelarTL").show();
            $("#btnagregarTL").show();
            $("#btneditarTL").hide();
        }

        function ocultarBotonesTL() {
            $("#btncancelarTL").hide();
            $("#btnagregarTL").hide();
            $("#btneditarTL").show();
        }

        function ocultaragregarTL() {
            $("#btnagregarTL").hide();
        }

        function camposVaciosRL() {
            $("#dialogincompletoTL").dialog({
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

        function exitoRL() {
            $("#dialogexitoTL").dialog({
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

        function incompletoRL() {
            $("#dialogvalidacionTL").dialog({
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

        function ocultarTrabajo2() {
            $("#Trabajo2").hide();
        }

        function ocultarTrabajo3() {
            $("#Trabajo3").hide();
        }

        function ocultarTrabajo4() {
            $("#Trabajo4").hide();
        }

        function ocultarTrabajo5() {
            $("#Trabajo5").hide();
        }

        function ocultarTrabajo6() {
            $("#Trabajo6").hide();
        }

        function ocultarTrabajo7() {
            $("#Trabajo7").hide();
        }

        function ocultarTrabajo8() {
            $("#Trabajo8").hide();
        }

        function ocultarTrabajo9() {
            $("#Trabajo9").hide();
        }

        function ocultarTrabajo10() {
            $("#Trabajo10").hide();
        }

        function ocultarTrabajo11() {
            $("#Trabajo11").hide();
        }

        function ocultarTrabajo12() {
            $("#Trabajo12").hide();
        }

        function ocultarTrabajo13() {
            $("#Trabajo13").hide();
        }

        function ocultarTrabajo14() {
            $("#Trabajo14").hide();
        }

        function ocultarTrabajo15() {
            $("#Trabajo15").hide();
        }

        function ocultarTrabajo16() {
            $("#Trabajo16").hide();
        }

        function ocultarTrabajo17() {
            $("#Trabajo17").hide();
        }

        function ocultarTrabajo18() {
            $("#Trabajo18").hide();
        }

        function ocultarTrabajo19() {
            $("#Trabajo19").hide();
        }

        function ocultarTrabajo20() {
            $("#Trabajo20").hide();
        }

        //-- Aptitudes e Intereses --//

        function editarapt() {
            $("#btnguardarapt").show();
            $("#btncancelarapt").show();
            $("#txtapt").show();
            $("#btnagregarapt").hide();
        }

        function mostrarapt() {
            $("#btninsertarapt").show();
            $("#btncancelarapt").show();
            $("#txtapt").show();
            $("#btnagregarapt").hide();
        }

        function ocultarapt() {
            $("#btninsertarapt").hide();
            $("#btnguardarapt").hide();
            $("#btncancelarapt").hide();
            $("#txtapt").hide();
            $("#btnagregarapt").show();
        }

        function preguntaeliminarapt() {
            $("#dialogpreguntaaptitud").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close")
                        //eliminarapt();
                        $("#botoneliminarAptitudes").click();
                        return true;
                    },
                    "Cancelar": function () {
                        $(this).dialog("close")
                        return false;
                    },
                },
                modal: true
            }).css("font-size", "12px");
        }

        function eliminarapt() {
            $("#dialogconfirmacionaptitud").dialog({
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

        function mensajeagregarapt() {
            $("#dialoginsertaraptitud").dialog({
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

        function mensajeeditarapt() {
            $("#dialogactualizaraptitud").dialog({
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

        function editarint() {
            $("#btnguardarint").show();
            $("#btncancelarint").show();
            $("#txtint").show();
            $("#btnagregarint").hide();
        }

        function mostrarint() {
            $("#btninsertarint").show();
            $("#btncancelarint").show();
            $("#txtint").show();
            $("#btnagregarint").hide();
        }

        function ocultarint() {
            $("#btninsertarint").hide();
            $("#btnguardarint").hide();
            $("#btncancelarint").hide();
            $("#txtint").hide();
            $("#btnagregarint").show();
        }

        function preguntaeliminarint() {
            $("#dialogpreguntainteres").dialog({
                height: 200,
                widht: 1800,
                title: "Seguimiento de egresados",
                buttons: {
                    "Aceptar": function () {
                        $(this).dialog("close")
                        //eliminarint();
                        $("#botoneliminarIntereses").click();
                    },
                    "Cancelar": function () {
                        $(this).dialog("close")
                    },
                },
                modal: true
            }).css("font-size", "12px");
        }

        function eliminarint() {
            $("#dialogconfirmacioninteres").dialog({
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

        function mensajeagregarinteres() {
            $("#dialoginsertarinteres").dialog({
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

        function mensajeeditarinteres() {
            $("#dialogactualizarinteres").dialog({
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

        //-- FuncionesToogle --//

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
                                <img alt="" style="height: 19px; width: 17px" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                <span class="username" id="spanNombre">Nombre</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <div class="log-arrow-up"></div>
                                <%--<li><a href="#"><i class=" icon-suitcase"></i>Profile</a></li>--%>
                                <li><a href="#"><i class="icon-cog"></i>Cambiar Contraseña</a></li>
                                <%--<li><a href="#"><i class="icon-bell-alt"></i>Notification</a></li>--%>
                                <li><a href="login.aspx"><i class="icon-key"></i>Cerrar sesión</a></li>
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
                <h3>Actualizar de datos del Egresado</h3>
            </header>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <form id="swegrform" class="cmxform form-horizontal tasi-form" runat="server">
                            <asp:HiddenField  ID="NombreHidden" runat="server"/>
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

                            <%--<asp:UpdatePanel ID="upDatosEgresado" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>--%>
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
                                  Género
                                            </label>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="ddlGenero" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
 <%--
                          <asp:UpdatePanel ID="UpdatePanel_Imagen" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>--%>
                                     <div class="cold-sm-2">
                                            <div class="row">
                                                <asp:Image ID="contenedorfoto" runat="server"  style="height: 135px; width: 135px; margin-left: 30px;" class="img-thumbnail"  />   
                                            <asp:FileUpload ID="CargaImagen" runat="server" Visible="false"/>
                                            <%--<asp:Button ID="CargarFoto" runat="server" Text="Cargar archivo" OnClick="CargarFoto_Click" />--%>
                                        </div>
                                    </div>
                                  <%-- </ContentTemplate>
                               </asp:UpdatePanel>--%>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">
                                        Fecha de Nacimiento
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


                                <div class="form-group" id="btneditarDP">
                                    <asp:UpdatePanel ID="upbtneditar" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-sm-10">
                                                <asp:Button ID="btneditar" runat="server" Text="Editar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btneditar_Click" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="form-group" hidden="hidden" id="btncancelarDP">
                                    <asp:UpdatePanel ID="upbtncancelar" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate> 
                                            <div class="col-sm-10">
                                                <asp:Button ID="btncancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger pull-right"  type="submit" OnClick="btncancelar_Click" autopostback="false"/>
                                                <label class="pull-right">&nbsp&nbsp&nbsp</label>
                                                <asp:Button ID="btnguardar" runat="server" Text="Guardar" CssClass="btn btn-danger pull-right"  type="submit" OnClick="btnguardar_Click" autopostback="false"/>
                                            </div>
                                        </ContentTemplate>

                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="btnguardar" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>

                                <%--<div class="form-group" hidden="hidden" id="btnguardarDP">
                                    <asp:UpdatePanel ID="upbtnguardar" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                    <div class="col-sm-10">
                                        <asp:Button ID="btnguardar" runat="server" Text="Guardar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnguardar_Click" />
                                    </div>
                                    </ContentTemplate>
                            </asp:UpdatePanel>
                                </div>--%>
                            </div>
                            <%--</ContentTemplate>
                            </asp:UpdatePanel>--%>

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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso2" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA2" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso3" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA3" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso4" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA4" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso5" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA5" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso6" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA6" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso7" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA7" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso8" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA8" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso9" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA9" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso10" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA10" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso11" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA11" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso12" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA12" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso13" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA13" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso14" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA14" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso15" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA15" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso16" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA16" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso17" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA17" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso18" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA18" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso19" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA19" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div id="Curso20" hidden="hidden">
                                    <hr />
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

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTA20" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <%--botones--%>
                                <div class="form-group" id="btneditarTA">
                                    <asp:UpdatePanel ID="upeditarTA" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-sm-10">
                                                <asp:Button ID="btneditarRA" runat="server" Text="Editar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btneditarRA_Click" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="form-group" hidden="hidden" id="btncancelarTA">
                                    <asp:UpdatePanel ID="upcancelarTA" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-sm-10">
                                                <asp:Button ID="btncancelarRA" runat="server" Text="Cancelar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btncancelarRA_Click" />
                                                <label class="pull-right">&nbsp&nbsp&nbsp</label>

                                                <asp:Button ID="btnguardarRA" runat="server" Text="Guardar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnguardarRA_Click" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="form-group" hidden="hidden" id="btnagregarTA">
                                    <asp:UpdatePanel ID="upagregarTA" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-sm-10">
                                                <asp:Button ID="btnagregarRA" runat="server" Text="Agregar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnagregarRA_Click" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>

                            <div class="form-group">
                                <div id="dialogincompletoTA" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">Debe ingresar todos los campos necesarios para actualizar sus datos.</b>
                                </div>

                                <div id="dialogvalidacionTA" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">El formato de algunos campos es incorrecto.</b>
                                </div>

                                <div id="dialogexitoTA" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">Sus datos han sido guardados satisfactoriamente.</b>
                                </div>
                            </div>

                            <%-- Trayectoria Laboral --%>
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL2" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL3" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL4" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL5" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL6" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL7" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL8" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL9" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL10" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL11" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL12" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL13" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL14" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL15" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL16" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL17" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL18" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL19" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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
                                    <hr />
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
                                            País
                                        </label>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlPaisTL20" runat="server" AutoPostBack="false" Enabled="false" CssClass="form-control"></asp:DropDownList>
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

                                <%--botones--%>
                                <div class="form-group" id="btneditarTL">
                                    <asp:UpdatePanel ID="upeditarTL" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-sm-10">
                                                <asp:Button ID="btneditarRL" runat="server" Text="Editar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btneditarRL_Click" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="form-group" hidden="hidden" id="btncancelarTL">
                                    <asp:UpdatePanel ID="upcancelarTL" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-sm-10">
                                                <asp:Button ID="btncancelarRL" runat="server" Text="Cancelar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btncancelarRL_Click" />
                                                <label class="pull-right">&nbsp&nbsp&nbsp</label>

                                                <asp:Button ID="btnguardarRL" runat="server" Text="Guardar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnguardarRL_Click" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="form-group" hidden="hidden" id="btnagregarTL">
                                    <asp:UpdatePanel ID="upagregarTL" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-sm-10">
                                                <asp:Button ID="btnagregarRL" runat="server" Text="Agregar" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnagregarRL_Click" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>

                            <div class="form-group">
                                <div id="dialogincompletoTL" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">Debe ingresar todos los campos necesarios para actualizar sus datos.</b>
                                </div>

                                <div id="dialogvalidacionTL" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">El formato de algunos campos es incorrecto.</b>
                                </div>

                                <div id="dialogexitoTL" style="text-align: justify; display: none" runat="server">
                                    <b style="text-align: center">Sus datos han sido guardados satisfactoriamente.</b>
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
                                    
                                    <div class="col-md-6">
                                        <div class="col-sm12">
                                            <asp:UpdatePanel ID="upgrdAptitudes" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:GridView ID="grdAptitudes" runat="server" AutoGenerateColumns="false" OnRowCommand="grdAptitudes_RowCommand" CssClass="table  pull-left">
                                                        <Columns>
                                                            <asp:BoundField HeaderText="Aptitud" DataField="Nombreaptitud" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                            <asp:TemplateField HeaderText="Editar" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:UpdatePanel ID="upbtnEditarAptitud" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <div id="diveditarapt">
                                                                                <asp:ImageButton ID="btnEditarAptitud" runat="server" CommandName="cmdEditar" ImageUrl="Images/edit.png" Width="16" Height="16" CommandArgument='<%# Eval("Idaptitud") %>' />
                                                                            </div>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:UpdatePanel ID="upbtnEliminarAptitud" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:ImageButton ID="btnEliminarAptitud" runat="server" CommandName="cmdEliminar" ImageUrl="Images/delete.png" Width="16" Height="16" CommandArgument='<%# Eval("Idaptitud") %>' />
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <HeaderStyle BackColor="#626262" ForeColor="White" />
                                                    </asp:GridView>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <br />
                                        <div class="form-group" hidden="hidden">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button ID="botoneliminarAptitudes" runat="server" OnClick="botoneliminarAptitudes_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="form-group" id="btnagregarapt">
                                            <asp:UpdatePanel ID="upAgregaraptitud" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="col-sm-8">
                                                        <asp:Button ID="btnAgregaraptitud" runat="server" Text="+ Agregar Aptitud" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnAgregaraptitud_Click" />
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="form-group" id="txtapt" hidden="hidden">
                                            <label class="col-sm-2 col-sm-2 control-label">
                                                Aptitud:
                                            </label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="txtAptitud" runat="server" CssClass="form-control" type="text" placeholder="Escriba la aptitud"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group" id="btninsertarapt" hidden="hidden">
                                            <asp:UpdatePanel ID="upinsertaraptitud" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>

                                                    <asp:Button ID="btnInsertaraptitud" runat="server" Text="Agregar" CssClass="btn btn-danger" type="submit" OnClick="btnInsertaraptitud_Click" />
                                                    &nbsp;
                                                        <asp:Button ID="btnCancelaraptitud" runat="server" Text="Cancelar" CssClass="btn btn-danger" type="submit" OnClick="btnCancelaraptitud_Click" />

                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                    </div>

                                    <div class="col-md-6">
                                        <div class="col-sm12">
                                            <asp:UpdatePanel ID="upgrdIntereses" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:GridView ID="grdIntereses" runat="server" AutoGenerateColumns="false" OnRowCommand="grdIntereses_RowCommand" CssClass="table">
                                                        <Columns>
                                                            <asp:BoundField HeaderText="Interes" DataField="Nombreinteres" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                            <asp:TemplateField HeaderText="Editar" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:UpdatePanel ID="upbtnEditarInteres" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:ImageButton ID="btnEditarInteres" runat="server" CommandName="cmdEditar" ImageUrl="Images/edit.png" Width="16" Height="16" CommandArgument='<%# Eval("Idinteres") %>' />
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:UpdatePanel ID="upbtnEliminarInteres" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:ImageButton ID="btnEliminarInteres" runat="server" CommandName="cmdEliminar" ImageUrl="Images/delete.png" Width="16" Height="16" CommandArgument='<%# Eval("Idinteres") %>' />
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <HeaderStyle BackColor="#626262" ForeColor="White" />
                                                    </asp:GridView>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <br />
                                        <div class="form-group" hidden="hidden">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button ID="botoneliminarIntereses" runat="server" OnClick="botoneliminarIntereses_Click" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="form-group" id="btnagregarint">
                                            <asp:UpdatePanel ID="upAgregarinteres" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="col-sm-8">
                                                        <asp:Button ID="btnAgregarinteres" runat="server" Text="+ Agregar Interés" CssClass="btn btn-danger pull-right" type="submit" OnClick="btnAgregarinteres_Click" />
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="form-group" id="txtint" hidden="hidden">
                                            <label class="col-sm-2 col-sm-2 control-label">
                                                Interes:
                                            </label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="txtInteres" runat="server" CssClass="form-control" type="text" placeholder="Escriba el interes"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group" id="btninsertarint" hidden="hidden">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>

                                                    <asp:Button ID="btnInsertarinteres" runat="server" Text="Guardar" CssClass="btn btn-danger" type="submit" OnClick="btnInsertarinteres_Click" />
                                                    &nbsp;                                                        
                                                        <asp:Button ID="btnCancelarinteres" runat="server" Text="Cancelar" CssClass="btn btn-danger" type="submit" OnClick="btnCancelarinteres_Click" />

                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>

                                </div>

                            </div>

                            <div class="form-group">

                                <div id="dialoginsertaraptitud" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">Aptitud agregada exitosamente</b>
                                </div>

                                <div id="dialogactualizaraptitud" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">Aptitud actualizada exitosamente</b>
                                </div>

                                <div id="dialogpreguntaaptitud" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">¿Estás seguro de eliminar la aptitud?</b>
                                </div>

                                <div id="dialogconfirmacionaptitud" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">La aptitud ha sido eliminada satisfactoriamente</b>
                                </div>

                                <div id="dialoginsertarinteres" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">Interes agregado exitosamente</b>
                                </div>

                                <div id="dialogactualizarinteres" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">Interes actualizado exitosamente</b>
                                </div>

                                <div id="dialogpreguntainteres" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">¿Estás seguro de eliminar el interes?</b>
                                </div>

                                <div id="dialogconfirmacioninteres" style="text-align: center; display: none" runat="server">
                                    <b style="text-align: center">El interes ha sido eliminado satisfactoriamente</b>
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