using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWEGR.UI
{
    using System.Web.Security;
    using SWEGR.BL.BC;
    using SWEGR.BL.BE;

    public partial class ActualizaregresadoUI : System.Web.UI.Page
    {
        int IDEgresado;
        string dni;
        string telefono;
        string telefonoalternativo;
        string direccion;
        string departamento;
        string distrito;
        string correo;
        string correoalternativo;
        string perfillinkedin;
        string perfilfacebook;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                char TUsuario;
                //IDEgresado = Convert.ToInt32(Session["IDVisEgre"].ToString());
                IDEgresado = Convert.ToInt32(Session["IDusuario"].ToString());
                TUsuario = Convert.ToChar(Session["TipoUsuario"]);
                if (TUsuario == 'G')
                {
                    Response.Redirect("Loginprueba.aspx");
                    return;
                }

                if (IDEgresado == 0)
                {
                    Response.Redirect("Loginprueba.aspx");
                    return;
                }

                if (!IsPostBack)
                {
                    ddlGenero.DataSource = listagenero();
                    ddlGenero.DataBind();
                    ddlGenero.Items.Insert(0, new ListItem("Seleccione el genero", ""));

                    ddlDepartamento.DataSource = listadepartamento();
                    ddlDepartamento.DataBind();
                    ddlDepartamento.Items.Insert(0, new ListItem("Seleccione el departamento", ""));

                    PaisBC objetoPaisBC = new PaisBC();
                    List<String> lsPaisBE = new List<string>();
                    lsPaisBE = objetoPaisBC.listarPais();

                    ddlPais.DataSource = lsPaisBE;
                    ddlPais.DataBind();
                    ddlPais.Items.Insert(0, new ListItem("Seleccione el país", ""));


                    EgresadoBC objEgresadoBC = new EgresadoBC();
                    EgresadoBE egresado = objEgresadoBC.obtenerEgresado(IDEgresado);

                    txtnombrecompleto.Text = egresado.Nombrecompletoegresado;
                    txtdni.Text = egresado.Dniegresado;
                    txtfechanacimiento.Text = egresado.Fechanacimientoegresado.Day.ToString() + "/" + egresado.Fechanacimientoegresado.Month.ToString() + "/" + egresado.Fechanacimientoegresado.Year.ToString();
                    txttelefonoprincipal.Text = egresado.Telefonoprinegresado;
                    txttelefonoalternativo.Text = egresado.Telefonoaltegresado;
                    txtdireccion.Text = egresado.Direccionegresado;
                    txtdistrito.Text = egresado.Distritoegresado;
                    txtcorreo.Text = egresado.Correoegresado;
                    txtcorreoalternativo.Text = egresado.Correoaltegresado;
                    txtperfillinkedin.Text = egresado.Perfillinkedinegresado;
                    txtperfilfacebook.Text = egresado.Perfilfacebookegresado;

                    if (egresado.Sexoegresado == 'M')
                        ddlGenero.SelectedIndex = 1;
                    else
                        ddlGenero.SelectedIndex = 2;

                    String pais = objetoPaisBC.obtenerPais(egresado.Idpaisegresado);

                    if (egresado.Idpaisegresado == 0)
                        ddlPais.SelectedIndex = -1;
                    else
                        ddlPais.Text = pais;

                    if (egresado.Departamentoegresado == "")
                        ddlDepartamento.SelectedIndex = -1;
                    else
                        ddlDepartamento.Text = egresado.Departamentoegresado;

                    llenarregistroacademico(IDEgresado);
                    llenarregistrolaboral(IDEgresado);

                    lstaptitudes.DataSource = listaaptitudes(IDEgresado);
                    lstaptitudes.DataBind();

                    lstintereses.DataSource = listaintereses(IDEgresado);
                    lstintereses.DataBind();
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        public void llenarregistroacademico(int idegresado)
        {
            RegistroAcademicoBE objRegistroAcademicoBE = new RegistroAcademicoBE();
            List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();
            RegistroAcademicoBC objRegistroAcademicoBC = new RegistroAcademicoBC();

            listaRegistroAcademicoBE = objRegistroAcademicoBC.listarregistroacademico(idegresado);
            int cantidad = listaRegistroAcademicoBE.Count;

            if (cantidad == 0)
                return;

            objRegistroAcademicoBE = listaRegistroAcademicoBE[0];

            txtcentroEstudios.Text = objRegistroAcademicoBE.Nombreinstitucion;
            txtduracionEstudio.Text = objRegistroAcademicoBE.Duracionestudio;
            txttipoEstudio.Text = objRegistroAcademicoBE.Tipoestudio;
            txtnombreEstudio.Text = objRegistroAcademicoBE.Nombreestudio;
            txtdescripcionEstudio.Text = objRegistroAcademicoBE.Descripcionestudio;

            if (cantidad > 1)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[1];

                txtcentroEstudios2.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio2.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio2.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio2.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio2.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso2", "mostrarCurso2();", true);
            }
            else
                return;

            if (cantidad > 2)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[2];

                txtcentroEstudios3.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio3.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio3.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio3.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio3.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso3", "mostrarCurso3();", true);
            }
            else
                return;

            if (cantidad > 3)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[3];

                txtcentroEstudios4.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio4.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio4.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio4.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio4.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso4", "mostrarCurso4();", true);
            }
            else
                return;

            if (cantidad > 4)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[4];

                txtcentroEstudios5.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio5.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio5.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio5.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio5.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso5", "mostrarCurso5();", true);
            }
            else
                return;

            if (cantidad > 5)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[5];

                txtcentroEstudios6.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio6.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio6.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio6.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio6.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso6", "mostrarCurso6();", true);
            }
            else
                return;

            if (cantidad > 6)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[6];

                txtcentroEstudios7.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio7.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio7.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio7.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio7.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso7", "mostrarCurso7();", true);
            }
            else
                return;

            if (cantidad > 7)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[7];

                txtcentroEstudios8.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio8.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio8.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio8.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio8.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso8", "mostrarCurso8();", true);
            }
            else
                return;

            if (cantidad > 8)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[8];

                txtcentroEstudios9.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio9.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio9.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio9.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio9.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso9", "mostrarCurso9();", true);
            }
            else
                return;

            if (cantidad > 9)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[9];

                txtcentroEstudios10.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio10.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio10.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio10.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio10.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso10", "mostrarCurso10();", true);
            }
            else
                return;

            if (cantidad > 10)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[10];

                txtcentroEstudios11.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio11.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio11.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio11.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio11.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso11", "mostrarCurso11();", true);
            }
            else
                return;

            if (cantidad > 11)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[11];

                txtcentroEstudios12.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio12.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio12.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio12.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio12.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso12", "mostrarCurso12();", true);
            }
            else
                return;

            if (cantidad > 12)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[12];

                txtcentroEstudios13.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio13.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio13.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio13.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio13.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso13", "mostrarCurso13();", true);
            }
            else
                return;

            if (cantidad > 13)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[13];

                txtcentroEstudios14.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio14.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio14.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio14.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio14.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso14", "mostrarCurso14();", true);
            }
            else
                return;

            if (cantidad > 14)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[14];

                txtcentroEstudios15.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio15.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio15.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio15.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio15.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso15", "mostrarCurso15();", true);
            }
            else
                return;

            if (cantidad > 15)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[15];

                txtcentroEstudios16.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio16.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio16.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio16.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio16.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso16", "mostrarCurso16();", true);
            }
            else
                return;

            if (cantidad > 16)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[16];

                txtcentroEstudios17.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio17.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio17.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio17.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio17.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso17", "mostrarCurso17();", true);
            }
            else

                if (cantidad > 17)
                {
                    objRegistroAcademicoBE = listaRegistroAcademicoBE[17];

                    txtcentroEstudios18.Text = objRegistroAcademicoBE.Nombreinstitucion;
                    txtduracionEstudio18.Text = objRegistroAcademicoBE.Duracionestudio;
                    txttipoEstudio18.Text = objRegistroAcademicoBE.Tipoestudio;
                    txtnombreEstudio18.Text = objRegistroAcademicoBE.Nombreestudio;
                    txtdescripcionEstudio18.Text = objRegistroAcademicoBE.Descripcionestudio;

                    ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso18", "mostrarCurso18();", true);
                }
                else
                    return;

            if (cantidad > 18)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[18];

                txtcentroEstudios19.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio19.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio19.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio19.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio19.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso19", "mostrarCurso19();", true);
            }
            else
                return;

            if (cantidad > 19)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[19];

                txtcentroEstudios20.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio20.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio20.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio20.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio20.Text = objRegistroAcademicoBE.Descripcionestudio;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso20", "mostrarCurso20();", true);
            }
            else
                return;

        }

        public void llenarregistrolaboral(int idegresado)
        {
            RegistroLaboralBE objRegistroLaboralBE = new RegistroLaboralBE();
            List<RegistroLaboralBE> listaRegistroLaboralBE = new List<RegistroLaboralBE>();
            RegistroLaboralBC objRegistroLaboralBC = new RegistroLaboralBC();

            listaRegistroLaboralBE = objRegistroLaboralBC.listarregistrolaobral(idegresado);
            int cantidad = listaRegistroLaboralBE.Count;

            if (cantidad == 0)
                return;

            objRegistroLaboralBE = listaRegistroLaboralBE[0];

            txtnombreEmpresa.Text = objRegistroLaboralBE.Nombretrabajo;
            txtcargoTrabajo.Text = objRegistroLaboralBE.Cargotrabajo;
            txtduracionTrabajo.Text = objRegistroLaboralBE.Duraciontrabajo;
            txtdescripcionTrabajo.Text = objRegistroLaboralBE.Descripciontrabajo;
            txtnombrejefeTrabajo.Text = objRegistroLaboralBE.Nombrejefetrabajo;
            txtcargojefeTrabajo.Text = objRegistroLaboralBE.Cargojefetrabajo;
            txttelefonojefeTrabajo.Text = objRegistroLaboralBE.Telefonojefetrabajo;
            txtcorreojefeTrabajo.Text = objRegistroLaboralBE.Correojefetrabajo;

            if (objRegistroLaboralBE.Trabajoactual == true)
                cbotrabajoActual.Checked = true;

            if (cantidad > 1)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[1];

                txtnombreEmpresa2.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo2.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo2.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo2.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo2.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo2.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo2.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo2.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual2.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo2", "mostrarTrabajo2();", true);
            }
            else
                return;

            if (cantidad > 2)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[2];

                txtnombreEmpresa3.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo3.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo3.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo3.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo3.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo3.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo3.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo3.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual3.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo3", "mostrarTrabajo3();", true);
            }
            else
                return;

            if (cantidad > 3)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[3];

                txtnombreEmpresa4.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo4.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo4.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo4.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo4.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo4.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo4.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo4.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual4.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo4", "mostrarTrabajo4();", true);
            }
            else
                return;

            if (cantidad > 4)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[4];

                txtnombreEmpresa5.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo5.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo5.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo5.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo5.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo5.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo5.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo5.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual5.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo5", "mostrarTrabajo5();", true);
            }
            else
                return;

            if (cantidad > 5)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[5];

                txtnombreEmpresa6.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo6.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo6.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo6.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo6.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo6.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo6.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo6.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual6.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo6", "mostrarTrabajo6();", true);
            }
            else
                return;

            if (cantidad > 6)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[6];

                txtnombreEmpresa7.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo7.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo7.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo7.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo7.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo7.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo7.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo7.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual7.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo7", "mostrarTrabajo7();", true);
            }
            else
                return;

            if (cantidad > 7)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[7];

                txtnombreEmpresa8.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo8.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo8.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo8.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo8.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo8.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo8.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo8.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual8.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo8", "mostrarTrabajo8();", true);
            }
            else
                return;

            if (cantidad > 8)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[8];

                txtnombreEmpresa9.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo9.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo9.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo9.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo9.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo9.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo9.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo9.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual9.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo9", "mostrarTrabajo9();", true);
            }
            else
                return;

            if (cantidad > 9)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[9];

                txtnombreEmpresa10.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo10.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo10.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo10.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo10.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo10.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo10.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo10.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual10.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo10", "mostrarTrabajo10();", true);
            }
            else
                return;

            if (cantidad > 10)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[10];

                txtnombreEmpresa11.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo11.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo11.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo11.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo11.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo11.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo11.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo11.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual11.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo11", "mostrarTrabajo11();", true);
            }
            else
                return;

            if (cantidad > 11)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[11];

                txtnombreEmpresa12.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo12.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo12.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo12.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo12.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo12.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo12.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo12.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual12.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo12", "mostrarTrabajo12();", true);
            }
            else
                return;

            if (cantidad > 12)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[12];

                txtnombreEmpresa13.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo13.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo13.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo13.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo13.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo13.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo13.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo13.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual13.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo13", "mostrarTrabajo13();", true);
            }
            else
                return;

            if (cantidad > 13)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[13];

                txtnombreEmpresa14.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo14.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo14.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo14.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo14.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo14.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo14.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo14.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual14.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo14", "mostrarTrabajo14();", true);
            }
            else
                return;

            if (cantidad > 14)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[14];

                txtnombreEmpresa15.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo15.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo15.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo15.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo15.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo15.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo15.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo15.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual15.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo15", "mostrarTrabajo15();", true);
            }
            else
                return;

            if (cantidad > 15)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[15];

                txtnombreEmpresa16.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo16.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo16.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo16.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo16.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo16.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo16.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo16.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual16.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo16", "mostrarTrabajo16();", true);
            }
            else
                return;

            if (cantidad > 16)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[16];

                txtnombreEmpresa17.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo17.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo17.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo17.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo17.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo17.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo17.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo17.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual17.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo17", "mostrarTrabajo17();", true);
            }
            else
                return;

            if (cantidad > 17)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[17];

                txtnombreEmpresa18.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo18.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo18.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo18.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo18.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo18.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo18.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo18.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual18.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo18", "mostrarTrabajo18();", true);
            }
            else
                return;

            if (cantidad > 18)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[18];

                txtnombreEmpresa19.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo19.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo19.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo19.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo19.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo19.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo19.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo19.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual19.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo19", "mostrarTrabajo19();", true);
            }
            else
                return;

            if (cantidad > 19)
            {
                objRegistroLaboralBE = listaRegistroLaboralBE[19];

                txtnombreEmpresa20.Text = objRegistroLaboralBE.Nombretrabajo;
                txtcargoTrabajo20.Text = objRegistroLaboralBE.Cargotrabajo;
                txtduracionTrabajo20.Text = objRegistroLaboralBE.Duraciontrabajo;
                txtdescripcionTrabajo20.Text = objRegistroLaboralBE.Descripciontrabajo;
                txtnombrejefeTrabajo20.Text = objRegistroLaboralBE.Nombrejefetrabajo;
                txtcargojefeTrabajo20.Text = objRegistroLaboralBE.Cargojefetrabajo;
                txttelefonojefeTrabajo20.Text = objRegistroLaboralBE.Telefonojefetrabajo;
                txtcorreojefeTrabajo20.Text = objRegistroLaboralBE.Correojefetrabajo;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual20.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo20", "mostrarTrabajo20();", true);
            }
            else
                return;
        }

        public List<String> listaaptitudes(int idegresado)
        {
            List<String> lsaptitudes = new List<string>();
            List<int> idaptitudes = new List<int>();
            AptitudBE objetoAptitudBE = new AptitudBE();
            AptitudBC objetoAptitudBC = new AptitudBC();


            EgresadoBC objetoEgresadoBC = new EgresadoBC();
            idaptitudes = objetoEgresadoBC.listaraptitudxegresado(idegresado);

            for (int i = 0; i < idaptitudes.Count(); i++)
            {
                int aptitudid = idaptitudes[i];

                objetoAptitudBE = objetoAptitudBC.obtenerAptitud(aptitudid);

                lsaptitudes.Add(objetoAptitudBE.Nombreaptitud);
            }
            return lsaptitudes;
        }

        public List<String> listaintereses(int idegresado)
        {
            List<String> lsintereses = new List<string>();
            List<int> idintereses = new List<int>();
            InteresBE objetoInteresBE = new InteresBE();
            InteresBC objetoInteresBC = new InteresBC();


            EgresadoBC objetoEgresadoBC = new EgresadoBC();
            idintereses = objetoEgresadoBC.listaraptitudxegresado(idegresado);

            for (int i = 0; i < idintereses.Count(); i++)
            {
                int interesid = idintereses[i];

                objetoInteresBE = objetoInteresBC.obtenerInteres(interesid);

                lsintereses.Add(objetoInteresBE.Nombreinteres);
            }
            return lsintereses;
        }

        public List<String> listagenero()
        {
            List<String> lsgenero = new List<string>();

            lsgenero.Add("Masculino");
            lsgenero.Add("Femenino");

            return lsgenero;
        }

        public List<String> listadepartamento()
        {
            List<String> lsdepartamento = new List<string>();

            lsdepartamento.Add("Amazonas");
            lsdepartamento.Add("Ancash");
            lsdepartamento.Add("Apurimac");
            lsdepartamento.Add("Arequipa");
            lsdepartamento.Add("Ayacucho");
            lsdepartamento.Add("Cajamarca");
            lsdepartamento.Add("Callao");
            lsdepartamento.Add("Cusco");
            lsdepartamento.Add("Huancavelica");
            lsdepartamento.Add("Huanuco");
            lsdepartamento.Add("Ica");
            lsdepartamento.Add("Junin");
            lsdepartamento.Add("La Libertad");
            lsdepartamento.Add("Lambayeque");
            lsdepartamento.Add("Lima");
            lsdepartamento.Add("Loreto");
            lsdepartamento.Add("Madre De Dios");
            lsdepartamento.Add("Moquegua");
            lsdepartamento.Add("Pasco");
            lsdepartamento.Add("Piura");
            lsdepartamento.Add("Puno");
            lsdepartamento.Add("San Martin");
            lsdepartamento.Add("Tacna");
            lsdepartamento.Add("Tumbes");
            lsdepartamento.Add("Ucayali");

            return lsdepartamento;
        }

        //*** Datos Personales ***//

        public bool actualizarEgresado()
        {
            EgresadoBC objEgresadoBC = new EgresadoBC();
            EgresadoBE egresado = objEgresadoBC.obtenerEgresado(IDEgresado);

            dni = egresado.Dniegresado;
            telefono = egresado.Telefonoprinegresado;
            telefonoalternativo = egresado.Telefonoaltegresado;
            direccion = egresado.Direccionegresado;
            departamento = egresado.Departamentoegresado;
            distrito = egresado.Distritoegresado;
            correo = egresado.Correoegresado;
            correoalternativo = egresado.Correoaltegresado;
            perfillinkedin = egresado.Perfillinkedinegresado;
            perfilfacebook = egresado.Perfilfacebookegresado;

            egresado.Dniegresado = txtdni.Text;
            egresado.Telefonoprinegresado = txttelefonoprincipal.Text;
            egresado.Telefonoaltegresado = txttelefonoalternativo.Text;
            egresado.Direccionegresado = txtdireccion.Text;
            egresado.Departamentoegresado = Convert.ToString(ddlDepartamento.SelectedValue);
            egresado.Distritoegresado = txtdistrito.Text;
            egresado.Correoegresado = txtcorreo.Text;
            egresado.Correoaltegresado = txtcorreoalternativo.Text;
            egresado.Perfillinkedinegresado = txtperfillinkedin.Text;
            egresado.Perfilfacebookegresado = txtperfilfacebook.Text;

            if (objEgresadoBC.actualizarEgresado(egresado))
                return true;
            else
                return false;
        }

        public void guardarHistorial()
        {
            try
            {
                EgresadoBC objEgresadoBC = new EgresadoBC();
                EgresadoBE validagraduando = objEgresadoBC.obtenerEgresado(IDEgresado);
                HistorialDatosEgresadoBE objHistorialDatosEgresadoBE = new HistorialDatosEgresadoBE();

                if (validagraduando.Dniegresado != dni)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "DNI";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Dniegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Telefonoprinegresado != telefono)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "TelefonoPrincipal";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Telefonoprinegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Telefonoaltegresado != telefonoalternativo)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "TelefonoAlternativo";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Telefonoaltegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Direccionegresado != direccion)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "Direccion";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Direccionegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Departamentoegresado != departamento)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "Departamento";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Departamentoegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Distritoegresado != distrito)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "Distrito";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Distritoegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Correoegresado != correo)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "Correo";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Correoegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Correoaltegresado != correoalternativo)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "CorreoAlternativo";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Correoaltegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Perfillinkedinegresado != perfillinkedin)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "PerfilLinkedIn";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Perfillinkedinegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Perfilfacebookegresado != perfilfacebook)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "PerfilFacebook";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Perfilfacebookegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        public bool validarFormulario()
        {
            bool errorcito = false;

            if (txtdni.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "dnivacio", "dnivacio();", true);
                txtdni.BorderColor = System.Drawing.Color.OrangeRed;
                errorcito = true;
            }
            else
                txtdni.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txttelefonoprincipal.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "telefonovacio", "telefonovacio();", true);
                txttelefonoprincipal.BorderColor = System.Drawing.Color.OrangeRed;
                errorcito = true;
            }
            else
                txttelefonoprincipal.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtcorreo.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "correovacio", "correovacio();", true);
                txtcorreo.BorderColor = System.Drawing.Color.OrangeRed;
                errorcito = true;
            }
            else
                txtcorreo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtperfillinkedin.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "perfillinkedinvacio", "perfillinkedinvacio();", true);
                txtperfillinkedin.BorderColor = System.Drawing.Color.OrangeRed;
                errorcito = true;
            }
            else
                txtperfillinkedin.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (errorcito)
                return false;

            return true;
        }

        public bool validarCampos()
        {
            bool validacorreo = false;
            bool validacorreoalterno = false;
            bool validaurllinkedin = false;
            bool validaurlfacebook = false;
            bool error = false;


            ValidarCorreo objetovalidarcorreo = new ValidarCorreo();
            validacorreo = objetovalidarcorreo.IsValidEmail(txtcorreo.Text.Trim());

            ValidarURL objetovalidarurl = new ValidarURL();
            validaurllinkedin = objetovalidarurl.ValidateUrl(txtperfillinkedin.Text);

            ValidarURL objetovalidarfb = new ValidarURL();
            validaurlfacebook = objetovalidarfb.ValidateUrl(txtperfilfacebook.Text.Trim());

            if (ddlDepartamento.SelectedIndex == 0)
            {
                ddlDepartamento.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                ddlDepartamento.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtdni.Text.Length != 8)
            {
                txtdni.BorderColor = System.Drawing.Color.OrangeRed;

                error = true;
            }
            else
                txtdni.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txttelefonoprincipal.Text.Length > 16 || txttelefonoprincipal.Text.Length < 8)
            {
                txttelefonoprincipal.BorderColor = System.Drawing.Color.OrangeRed;

                error = true;
            }
            else
                txttelefonoprincipal.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txttelefonoalternativo.Text.Length > 16 && txttelefonoalternativo.Text.Length < 8)
            {
                txttelefonoalternativo.BorderColor = System.Drawing.Color.OrangeRed;

                error = true;
            }
            else
                txttelefonoalternativo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (!validacorreo)
            {
                txtcorreo.BorderColor = System.Drawing.Color.OrangeRed;

                error = true;
            }
            else
                txtcorreo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");


            if (!validaurllinkedin)
            {
                txtperfillinkedin.BorderColor = System.Drawing.Color.OrangeRed;

                error = true;
            }
            else
                txtperfillinkedin.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            string correoalternativo = txtcorreoalternativo.Text;

            if (correoalternativo != null && correoalternativo != "")
            {
                validacorreoalterno = objetovalidarcorreo.IsValidEmail(txtcorreoalternativo.Text);
                if (!validacorreoalterno)
                {
                    txtcorreoalternativo.BorderColor = System.Drawing.Color.OrangeRed;

                    error = true;
                }
                else
                    txtcorreoalternativo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            else
                txtcorreoalternativo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtperfilfacebook.Text.Length != 0)
            {
                if (!validaurlfacebook)
                {
                    txtperfilfacebook.BorderColor = System.Drawing.Color.OrangeRed;

                    error = true;
                }
                else
                    txtperfilfacebook.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            else
                txtperfilfacebook.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (error)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "incompleto", "incompleto();", true);
                return false;
            }
            return true;
        }
        
        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (validarFormulario())
                {
                    if (validarCampos())
                    {
                        if (actualizarEgresado())
                        {
                            ScriptManager.RegisterStartupScript(Page, GetType(), "exito", "exito();", true);
                            guardarHistorial();

                        }
                        else
                            ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
                    }
                    else
                    {
                        btnguardar.Focus();
                    }

                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarBotonesDP", "ocultarBotonesDP();", true);
            ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarDatosPersonales", "deshabilitarDatosPersonales();", true);
            //DeshabilitarCampos();
        }

        protected void btneditar_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarBotonesDP", "mostrarBotonesDP();", true);
            ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarDatosPersonales", "habilitarDatosPersonales();", true);
            //HabilitarCampos();
        }

        //*** Registro Academico ***//

        public int guardarRegistroAcademico()
        {
            int exito = 9;
            int idegresado = IDEgresado;
            RegistroAcademicoBE objRegistroAcademicoBE = new RegistroAcademicoBE();
            List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();
            RegistroAcademicoBC objRegistroAcademicoBC = new RegistroAcademicoBC();

            listaRegistroAcademicoBE = objRegistroAcademicoBC.listarregistroacademico(idegresado);
            int cantidad = listaRegistroAcademicoBE.Count;

            if (cantidad == 0)
            {
                if (txtcentroEstudios.Text != null && txtcentroEstudios.Text != "")
                {
                    objRegistroAcademicoBE.Idegresado = idegresado;
                    objRegistroAcademicoBE.Nombreinstitucion = txtcentroEstudios.Text;
                    objRegistroAcademicoBE.Duracionestudio = txtduracionEstudio.Text;
                    objRegistroAcademicoBE.Tipoestudio = txttipoEstudio.Text;
                    objRegistroAcademicoBE.Nombreestudio = txtnombreEstudio.Text;
                    objRegistroAcademicoBE.Descripcionestudio = txtdescripcionEstudio.Text;
                    objRegistroAcademicoBE.Idpais = 173;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 1)
            {
                if (txtcentroEstudios2.Text != null && txtcentroEstudios2.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE2 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE2.Idegresado = idegresado;
                    objRegistroAcademicoBE2.Nombreinstitucion = txtcentroEstudios2.Text;
                    objRegistroAcademicoBE2.Duracionestudio = txtduracionEstudio2.Text;
                    objRegistroAcademicoBE2.Tipoestudio = txttipoEstudio2.Text;
                    objRegistroAcademicoBE2.Nombreestudio = txtnombreEstudio2.Text;
                    objRegistroAcademicoBE2.Descripcionestudio = txtdescripcionEstudio2.Text;
                    objRegistroAcademicoBE2.Idpais = 173;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE2) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 2)
            {
                if (txtcentroEstudios3.Text != null && txtcentroEstudios3.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE3 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE3.Idegresado = idegresado;
                    objRegistroAcademicoBE3.Nombreinstitucion = txtcentroEstudios3.Text;
                    objRegistroAcademicoBE3.Duracionestudio = txtduracionEstudio3.Text;
                    objRegistroAcademicoBE3.Tipoestudio = txttipoEstudio3.Text;
                    objRegistroAcademicoBE3.Nombreestudio = txtnombreEstudio3.Text;
                    objRegistroAcademicoBE3.Descripcionestudio = txtdescripcionEstudio3.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE3) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 3)
            {
                if (txtcentroEstudios4.Text != null && txtcentroEstudios4.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE4 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE4.Idegresado = idegresado;
                    objRegistroAcademicoBE4.Nombreinstitucion = txtcentroEstudios4.Text;
                    objRegistroAcademicoBE4.Duracionestudio = txtduracionEstudio4.Text;
                    objRegistroAcademicoBE4.Tipoestudio = txttipoEstudio4.Text;
                    objRegistroAcademicoBE4.Nombreestudio = txtnombreEstudio4.Text;
                    objRegistroAcademicoBE4.Descripcionestudio = txtdescripcionEstudio4.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE4) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 4)
            {
                if (txtcentroEstudios5.Text != null && txtcentroEstudios5.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE5 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE5.Idegresado = idegresado;
                    objRegistroAcademicoBE5.Nombreinstitucion = txtcentroEstudios5.Text;
                    objRegistroAcademicoBE5.Duracionestudio = txtduracionEstudio5.Text;
                    objRegistroAcademicoBE5.Tipoestudio = txttipoEstudio5.Text;
                    objRegistroAcademicoBE5.Nombreestudio = txtnombreEstudio5.Text;
                    objRegistroAcademicoBE5.Descripcionestudio = txtdescripcionEstudio5.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE5) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 5)
            {
                if (txtcentroEstudios6.Text != null && txtcentroEstudios6.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE6 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE6.Idegresado = idegresado;
                    objRegistroAcademicoBE6.Nombreinstitucion = txtcentroEstudios6.Text;
                    objRegistroAcademicoBE6.Duracionestudio = txtduracionEstudio6.Text;
                    objRegistroAcademicoBE6.Tipoestudio = txttipoEstudio6.Text;
                    objRegistroAcademicoBE6.Nombreestudio = txtnombreEstudio6.Text;
                    objRegistroAcademicoBE6.Descripcionestudio = txtdescripcionEstudio6.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE6) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 6)
            {
                if (txtcentroEstudios7.Text != null && txtcentroEstudios7.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE7 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE7.Idegresado = idegresado;
                    objRegistroAcademicoBE7.Nombreinstitucion = txtcentroEstudios7.Text;
                    objRegistroAcademicoBE7.Duracionestudio = txtduracionEstudio7.Text;
                    objRegistroAcademicoBE7.Tipoestudio = txttipoEstudio7.Text;
                    objRegistroAcademicoBE7.Nombreestudio = txtnombreEstudio7.Text;
                    objRegistroAcademicoBE7.Descripcionestudio = txtdescripcionEstudio7.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE7) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 7)
            {
                if (txtcentroEstudios8.Text != null && txtcentroEstudios8.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE8 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE8.Idegresado = idegresado;
                    objRegistroAcademicoBE8.Nombreinstitucion = txtcentroEstudios8.Text;
                    objRegistroAcademicoBE8.Duracionestudio = txtduracionEstudio8.Text;
                    objRegistroAcademicoBE8.Tipoestudio = txttipoEstudio8.Text;
                    objRegistroAcademicoBE8.Nombreestudio = txtnombreEstudio8.Text;
                    objRegistroAcademicoBE8.Descripcionestudio = txtdescripcionEstudio8.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE8) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 8)
            {
                if (txtcentroEstudios9.Text != null && txtcentroEstudios9.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE9 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE9.Idegresado = idegresado;
                    objRegistroAcademicoBE9.Nombreinstitucion = txtcentroEstudios9.Text;
                    objRegistroAcademicoBE9.Duracionestudio = txtduracionEstudio9.Text;
                    objRegistroAcademicoBE9.Tipoestudio = txttipoEstudio9.Text;
                    objRegistroAcademicoBE9.Nombreestudio = txtnombreEstudio9.Text;
                    objRegistroAcademicoBE9.Descripcionestudio = txtdescripcionEstudio9.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE9) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 9)
            {
                if (txtcentroEstudios10.Text != null && txtcentroEstudios10.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE10 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE10.Idegresado = idegresado;
                    objRegistroAcademicoBE10.Nombreinstitucion = txtcentroEstudios10.Text;
                    objRegistroAcademicoBE10.Duracionestudio = txtduracionEstudio10.Text;
                    objRegistroAcademicoBE10.Tipoestudio = txttipoEstudio10.Text;
                    objRegistroAcademicoBE10.Nombreestudio = txtnombreEstudio10.Text;
                    objRegistroAcademicoBE10.Descripcionestudio = txtdescripcionEstudio10.Text;


                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE10) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 10)
            {
                if (txtcentroEstudios11.Text != null && txtcentroEstudios11.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE11 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE11.Idegresado = idegresado;
                    objRegistroAcademicoBE11.Nombreinstitucion = txtcentroEstudios11.Text;
                    objRegistroAcademicoBE11.Duracionestudio = txtduracionEstudio11.Text;
                    objRegistroAcademicoBE11.Tipoestudio = txttipoEstudio11.Text;
                    objRegistroAcademicoBE11.Nombreestudio = txtnombreEstudio11.Text;
                    objRegistroAcademicoBE11.Descripcionestudio = txtdescripcionEstudio11.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE11) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 11)
            {
                if (txtcentroEstudios12.Text != null && txtcentroEstudios12.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE12 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE12.Idegresado = idegresado;
                    objRegistroAcademicoBE12.Nombreinstitucion = txtcentroEstudios12.Text;
                    objRegistroAcademicoBE12.Duracionestudio = txtduracionEstudio12.Text;
                    objRegistroAcademicoBE12.Tipoestudio = txttipoEstudio12.Text;
                    objRegistroAcademicoBE12.Nombreestudio = txtnombreEstudio12.Text;
                    objRegistroAcademicoBE12.Descripcionestudio = txtdescripcionEstudio12.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE12) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 12)
            {
                if (txtcentroEstudios13.Text != null && txtcentroEstudios13.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE13 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE13.Idegresado = idegresado;
                    objRegistroAcademicoBE13.Nombreinstitucion = txtcentroEstudios13.Text;
                    objRegistroAcademicoBE13.Duracionestudio = txtduracionEstudio13.Text;
                    objRegistroAcademicoBE13.Tipoestudio = txttipoEstudio13.Text;
                    objRegistroAcademicoBE13.Nombreestudio = txtnombreEstudio13.Text;
                    objRegistroAcademicoBE13.Descripcionestudio = txtdescripcionEstudio13.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE13) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 13)
            {
                if (txtcentroEstudios14.Text != null && txtcentroEstudios14.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE14 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE14.Idegresado = idegresado;
                    objRegistroAcademicoBE14.Nombreinstitucion = txtcentroEstudios14.Text;
                    objRegistroAcademicoBE14.Duracionestudio = txtduracionEstudio14.Text;
                    objRegistroAcademicoBE14.Tipoestudio = txttipoEstudio14.Text;
                    objRegistroAcademicoBE14.Nombreestudio = txtnombreEstudio14.Text;
                    objRegistroAcademicoBE14.Descripcionestudio = txtdescripcionEstudio14.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE14) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 14)
            {
                if (txtcentroEstudios15.Text != null && txtcentroEstudios15.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE15 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE15.Idegresado = idegresado;
                    objRegistroAcademicoBE15.Nombreinstitucion = txtcentroEstudios15.Text;
                    objRegistroAcademicoBE15.Duracionestudio = txtduracionEstudio15.Text;
                    objRegistroAcademicoBE15.Tipoestudio = txttipoEstudio15.Text;
                    objRegistroAcademicoBE15.Nombreestudio = txtnombreEstudio15.Text;
                    objRegistroAcademicoBE15.Descripcionestudio = txtdescripcionEstudio15.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE15) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 15)
            {
                if (txtcentroEstudios16.Text != null && txtcentroEstudios16.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE16 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE16.Idegresado = idegresado;
                    objRegistroAcademicoBE16.Nombreinstitucion = txtcentroEstudios16.Text;
                    objRegistroAcademicoBE16.Duracionestudio = txtduracionEstudio16.Text;
                    objRegistroAcademicoBE16.Tipoestudio = txttipoEstudio16.Text;
                    objRegistroAcademicoBE16.Nombreestudio = txtnombreEstudio16.Text;
                    objRegistroAcademicoBE16.Descripcionestudio = txtdescripcionEstudio16.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE16) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 16)
            {
                if (txtcentroEstudios17.Text != null && txtcentroEstudios17.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE17 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE17.Idegresado = idegresado;
                    objRegistroAcademicoBE17.Nombreinstitucion = txtcentroEstudios17.Text;
                    objRegistroAcademicoBE17.Duracionestudio = txtduracionEstudio17.Text;
                    objRegistroAcademicoBE17.Tipoestudio = txttipoEstudio17.Text;
                    objRegistroAcademicoBE17.Nombreestudio = txtnombreEstudio17.Text;
                    objRegistroAcademicoBE17.Descripcionestudio = txtdescripcionEstudio17.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE17) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 17)
            {
                if (txtcentroEstudios18.Text != null && txtcentroEstudios18.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE18 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE18.Idegresado = idegresado;
                    objRegistroAcademicoBE18.Nombreinstitucion = txtcentroEstudios18.Text;
                    objRegistroAcademicoBE18.Duracionestudio = txtduracionEstudio18.Text;
                    objRegistroAcademicoBE18.Tipoestudio = txttipoEstudio18.Text;
                    objRegistroAcademicoBE18.Nombreestudio = txtnombreEstudio18.Text;
                    objRegistroAcademicoBE18.Descripcionestudio = txtdescripcionEstudio18.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE18) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 18)
            {
                if (txtcentroEstudios19.Text != null && txtcentroEstudios19.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE19 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE19.Idegresado = idegresado;
                    objRegistroAcademicoBE19.Nombreinstitucion = txtcentroEstudios19.Text;
                    objRegistroAcademicoBE19.Duracionestudio = txtduracionEstudio19.Text;
                    objRegistroAcademicoBE19.Tipoestudio = txttipoEstudio19.Text;
                    objRegistroAcademicoBE19.Nombreestudio = txtnombreEstudio19.Text;
                    objRegistroAcademicoBE19.Descripcionestudio = txtdescripcionEstudio19.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE19) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 19)
            {
                if (txtcentroEstudios20.Text != null && txtcentroEstudios20.Text != "")
                {
                    RegistroAcademicoBE objRegistroAcademicoBE20 = new RegistroAcademicoBE();
                    objRegistroAcademicoBE20.Idegresado = idegresado;
                    objRegistroAcademicoBE20.Nombreinstitucion = txtcentroEstudios20.Text;
                    objRegistroAcademicoBE20.Duracionestudio = txtduracionEstudio20.Text;
                    objRegistroAcademicoBE20.Tipoestudio = txttipoEstudio20.Text;
                    objRegistroAcademicoBE20.Nombreestudio = txtnombreEstudio20.Text;
                    objRegistroAcademicoBE20.Descripcionestudio = txtdescripcionEstudio20.Text;

                    if (objRegistroAcademicoBC.insertarregistroacademico(objRegistroAcademicoBE20) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            return exito;
        }

        public bool actualizarRegistroAcademico()
        {
            bool exito = false;
            int idegresado = IDEgresado;
            RegistroAcademicoBE objRegistroAcademicoBE = new RegistroAcademicoBE();
            List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();
            RegistroAcademicoBC objRegistroAcademicoBC = new RegistroAcademicoBC();

            listaRegistroAcademicoBE = objRegistroAcademicoBC.listarregistroacademico(idegresado);
            int cantidad = listaRegistroAcademicoBE.Count;

            if (cantidad == 0)
                return false;

            objRegistroAcademicoBE.Idegresado = idegresado;
            objRegistroAcademicoBE.Nombreinstitucion = txtcentroEstudios.Text;
            objRegistroAcademicoBE.Duracionestudio = txtduracionEstudio.Text;
            objRegistroAcademicoBE.Tipoestudio = txttipoEstudio.Text;
            objRegistroAcademicoBE.Nombreestudio = txtnombreEstudio.Text;
            objRegistroAcademicoBE.Descripcionestudio = txtdescripcionEstudio.Text;
            objRegistroAcademicoBE.Idpais = 173;

            if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE))
                exito = true;
            else
                return false;

            if (cantidad > 1)
            {
                RegistroAcademicoBE objRegistroAcademicoBE2 = new RegistroAcademicoBE();
                objRegistroAcademicoBE2.Idegresado = idegresado;
                objRegistroAcademicoBE2.Nombreinstitucion = txtcentroEstudios2.Text;
                objRegistroAcademicoBE2.Duracionestudio = txtduracionEstudio2.Text;
                objRegistroAcademicoBE2.Tipoestudio = txttipoEstudio2.Text;
                objRegistroAcademicoBE2.Nombreestudio = txtnombreEstudio2.Text;
                objRegistroAcademicoBE2.Descripcionestudio = txtdescripcionEstudio2.Text;
                objRegistroAcademicoBE2.Idpais = 173;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE2))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 2)
            {
                RegistroAcademicoBE objRegistroAcademicoBE3 = new RegistroAcademicoBE();
                objRegistroAcademicoBE3.Idegresado = idegresado;
                objRegistroAcademicoBE3.Nombreinstitucion = txtcentroEstudios3.Text;
                objRegistroAcademicoBE3.Duracionestudio = txtduracionEstudio3.Text;
                objRegistroAcademicoBE3.Tipoestudio = txttipoEstudio3.Text;
                objRegistroAcademicoBE3.Nombreestudio = txtnombreEstudio3.Text;
                objRegistroAcademicoBE3.Descripcionestudio = txtdescripcionEstudio3.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE3))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 3)
            {
                RegistroAcademicoBE objRegistroAcademicoBE4 = new RegistroAcademicoBE();
                objRegistroAcademicoBE4.Idegresado = idegresado;
                objRegistroAcademicoBE4.Nombreinstitucion = txtcentroEstudios4.Text;
                objRegistroAcademicoBE4.Duracionestudio = txtduracionEstudio4.Text;
                objRegistroAcademicoBE4.Tipoestudio = txttipoEstudio4.Text;
                objRegistroAcademicoBE4.Nombreestudio = txtnombreEstudio4.Text;
                objRegistroAcademicoBE4.Descripcionestudio = txtdescripcionEstudio4.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE4))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 4)
            {
                RegistroAcademicoBE objRegistroAcademicoBE5 = new RegistroAcademicoBE();
                objRegistroAcademicoBE5.Idegresado = idegresado;
                objRegistroAcademicoBE5.Nombreinstitucion = txtcentroEstudios5.Text;
                objRegistroAcademicoBE5.Duracionestudio = txtduracionEstudio5.Text;
                objRegistroAcademicoBE5.Tipoestudio = txttipoEstudio5.Text;
                objRegistroAcademicoBE5.Nombreestudio = txtnombreEstudio5.Text;
                objRegistroAcademicoBE5.Descripcionestudio = txtdescripcionEstudio5.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE5))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 5)
            {
                RegistroAcademicoBE objRegistroAcademicoBE6 = new RegistroAcademicoBE();
                objRegistroAcademicoBE6.Idegresado = idegresado;
                objRegistroAcademicoBE6.Nombreinstitucion = txtcentroEstudios6.Text;
                objRegistroAcademicoBE6.Duracionestudio = txtduracionEstudio6.Text;
                objRegistroAcademicoBE6.Tipoestudio = txttipoEstudio6.Text;
                objRegistroAcademicoBE6.Nombreestudio = txtnombreEstudio6.Text;
                objRegistroAcademicoBE6.Descripcionestudio = txtdescripcionEstudio6.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE6))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 6)
            {
                RegistroAcademicoBE objRegistroAcademicoBE7 = new RegistroAcademicoBE();
                objRegistroAcademicoBE7.Idegresado = idegresado;
                objRegistroAcademicoBE7.Nombreinstitucion = txtcentroEstudios7.Text;
                objRegistroAcademicoBE7.Duracionestudio = txtduracionEstudio7.Text;
                objRegistroAcademicoBE7.Tipoestudio = txttipoEstudio7.Text;
                objRegistroAcademicoBE7.Nombreestudio = txtnombreEstudio7.Text;
                objRegistroAcademicoBE7.Descripcionestudio = txtdescripcionEstudio7.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE7))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 7)
            {
                RegistroAcademicoBE objRegistroAcademicoBE8 = new RegistroAcademicoBE();
                objRegistroAcademicoBE8.Idegresado = idegresado;
                objRegistroAcademicoBE8.Nombreinstitucion = txtcentroEstudios8.Text;
                objRegistroAcademicoBE8.Duracionestudio = txtduracionEstudio8.Text;
                objRegistroAcademicoBE8.Tipoestudio = txttipoEstudio8.Text;
                objRegistroAcademicoBE8.Nombreestudio = txtnombreEstudio8.Text;
                objRegistroAcademicoBE8.Descripcionestudio = txtdescripcionEstudio8.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE8))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 8)
            {
                RegistroAcademicoBE objRegistroAcademicoBE9 = new RegistroAcademicoBE();
                objRegistroAcademicoBE9.Idegresado = idegresado;
                objRegistroAcademicoBE9.Nombreinstitucion = txtcentroEstudios9.Text;
                objRegistroAcademicoBE9.Duracionestudio = txtduracionEstudio9.Text;
                objRegistroAcademicoBE9.Tipoestudio = txttipoEstudio9.Text;
                objRegistroAcademicoBE9.Nombreestudio = txtnombreEstudio9.Text;
                objRegistroAcademicoBE9.Descripcionestudio = txtdescripcionEstudio9.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE9))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 9)
            {
                RegistroAcademicoBE objRegistroAcademicoBE10 = new RegistroAcademicoBE();
                objRegistroAcademicoBE10.Idegresado = idegresado;
                objRegistroAcademicoBE10.Nombreinstitucion = txtcentroEstudios10.Text;
                objRegistroAcademicoBE10.Duracionestudio = txtduracionEstudio10.Text;
                objRegistroAcademicoBE10.Tipoestudio = txttipoEstudio10.Text;
                objRegistroAcademicoBE10.Nombreestudio = txtnombreEstudio10.Text;
                objRegistroAcademicoBE10.Descripcionestudio = txtdescripcionEstudio10.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE10))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 10)
            {
                RegistroAcademicoBE objRegistroAcademicoBE11 = new RegistroAcademicoBE();
                objRegistroAcademicoBE11.Idegresado = idegresado;
                objRegistroAcademicoBE11.Nombreinstitucion = txtcentroEstudios11.Text;
                objRegistroAcademicoBE11.Duracionestudio = txtduracionEstudio11.Text;
                objRegistroAcademicoBE11.Tipoestudio = txttipoEstudio11.Text;
                objRegistroAcademicoBE11.Nombreestudio = txtnombreEstudio11.Text;
                objRegistroAcademicoBE11.Descripcionestudio = txtdescripcionEstudio11.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE11))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 11)
            {
                RegistroAcademicoBE objRegistroAcademicoBE12 = new RegistroAcademicoBE();
                objRegistroAcademicoBE12.Idegresado = idegresado;
                objRegistroAcademicoBE12.Nombreinstitucion = txtcentroEstudios12.Text;
                objRegistroAcademicoBE12.Duracionestudio = txtduracionEstudio12.Text;
                objRegistroAcademicoBE12.Tipoestudio = txttipoEstudio12.Text;
                objRegistroAcademicoBE12.Nombreestudio = txtnombreEstudio12.Text;
                objRegistroAcademicoBE12.Descripcionestudio = txtdescripcionEstudio12.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE12))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 12)
            {
                RegistroAcademicoBE objRegistroAcademicoBE13 = new RegistroAcademicoBE();
                objRegistroAcademicoBE13.Idegresado = idegresado;
                objRegistroAcademicoBE13.Nombreinstitucion = txtcentroEstudios13.Text;
                objRegistroAcademicoBE13.Duracionestudio = txtduracionEstudio13.Text;
                objRegistroAcademicoBE13.Tipoestudio = txttipoEstudio13.Text;
                objRegistroAcademicoBE13.Nombreestudio = txtnombreEstudio13.Text;
                objRegistroAcademicoBE13.Descripcionestudio = txtdescripcionEstudio13.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE13))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 13)
            {
                RegistroAcademicoBE objRegistroAcademicoBE14 = new RegistroAcademicoBE();
                objRegistroAcademicoBE14.Idegresado = idegresado;
                objRegistroAcademicoBE14.Nombreinstitucion = txtcentroEstudios14.Text;
                objRegistroAcademicoBE14.Duracionestudio = txtduracionEstudio14.Text;
                objRegistroAcademicoBE14.Tipoestudio = txttipoEstudio14.Text;
                objRegistroAcademicoBE14.Nombreestudio = txtnombreEstudio14.Text;
                objRegistroAcademicoBE14.Descripcionestudio = txtdescripcionEstudio14.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE14))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 14)
            {
                RegistroAcademicoBE objRegistroAcademicoBE15 = new RegistroAcademicoBE();
                objRegistroAcademicoBE15.Idegresado = idegresado;
                objRegistroAcademicoBE15.Nombreinstitucion = txtcentroEstudios15.Text;
                objRegistroAcademicoBE15.Duracionestudio = txtduracionEstudio15.Text;
                objRegistroAcademicoBE15.Tipoestudio = txttipoEstudio15.Text;
                objRegistroAcademicoBE15.Nombreestudio = txtnombreEstudio15.Text;
                objRegistroAcademicoBE15.Descripcionestudio = txtdescripcionEstudio15.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE15))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 15)
            {
                RegistroAcademicoBE objRegistroAcademicoBE16 = new RegistroAcademicoBE();
                objRegistroAcademicoBE16.Idegresado = idegresado;
                objRegistroAcademicoBE16.Nombreinstitucion = txtcentroEstudios16.Text;
                objRegistroAcademicoBE16.Duracionestudio = txtduracionEstudio16.Text;
                objRegistroAcademicoBE16.Tipoestudio = txttipoEstudio16.Text;
                objRegistroAcademicoBE16.Nombreestudio = txtnombreEstudio16.Text;
                objRegistroAcademicoBE16.Descripcionestudio = txtdescripcionEstudio16.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE16))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 16)
            {
                RegistroAcademicoBE objRegistroAcademicoBE17 = new RegistroAcademicoBE();
                objRegistroAcademicoBE17.Idegresado = idegresado;
                objRegistroAcademicoBE17.Nombreinstitucion = txtcentroEstudios17.Text;
                objRegistroAcademicoBE17.Duracionestudio = txtduracionEstudio17.Text;
                objRegistroAcademicoBE17.Tipoestudio = txttipoEstudio17.Text;
                objRegistroAcademicoBE17.Nombreestudio = txtnombreEstudio17.Text;
                objRegistroAcademicoBE17.Descripcionestudio = txtdescripcionEstudio17.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE17))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 17)
            {
                RegistroAcademicoBE objRegistroAcademicoBE18 = new RegistroAcademicoBE();
                objRegistroAcademicoBE18.Idegresado = idegresado;
                objRegistroAcademicoBE18.Nombreinstitucion = txtcentroEstudios18.Text;
                objRegistroAcademicoBE18.Duracionestudio = txtduracionEstudio18.Text;
                objRegistroAcademicoBE18.Tipoestudio = txttipoEstudio18.Text;
                objRegistroAcademicoBE18.Nombreestudio = txtnombreEstudio18.Text;
                objRegistroAcademicoBE18.Descripcionestudio = txtdescripcionEstudio18.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE18))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 18)
            {
                RegistroAcademicoBE objRegistroAcademicoBE19 = new RegistroAcademicoBE();
                objRegistroAcademicoBE19.Idegresado = idegresado;
                objRegistroAcademicoBE19.Nombreinstitucion = txtcentroEstudios19.Text;
                objRegistroAcademicoBE19.Duracionestudio = txtduracionEstudio19.Text;
                objRegistroAcademicoBE19.Tipoestudio = txttipoEstudio19.Text;
                objRegistroAcademicoBE19.Nombreestudio = txtnombreEstudio19.Text;
                objRegistroAcademicoBE19.Descripcionestudio = txtdescripcionEstudio19.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE19))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 19)
            {
                RegistroAcademicoBE objRegistroAcademicoBE20 = new RegistroAcademicoBE();
                objRegistroAcademicoBE20.Idegresado = idegresado;
                objRegistroAcademicoBE20.Nombreinstitucion = txtcentroEstudios20.Text;
                objRegistroAcademicoBE20.Duracionestudio = txtduracionEstudio20.Text;
                objRegistroAcademicoBE20.Tipoestudio = txttipoEstudio20.Text;
                objRegistroAcademicoBE20.Nombreestudio = txtnombreEstudio20.Text;
                objRegistroAcademicoBE20.Descripcionestudio = txtdescripcionEstudio20.Text;

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE20))
                    exito = true;
                else
                    return false;
            }

            return exito;
        }

        public bool validarformRegistroAcademico()
        {
            bool error = false;

            int idegresado = IDEgresado;
            RegistroAcademicoBE objRegistroAcademicoBE = new RegistroAcademicoBE();
            List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();
            RegistroAcademicoBC objRegistroAcademicoBC = new RegistroAcademicoBC();

            listaRegistroAcademicoBE = objRegistroAcademicoBC.listarregistroacademico(idegresado);
            int cantidad = listaRegistroAcademicoBE.Count;

            if (txtcentroEstudios.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                txtcentroEstudios.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtcentroEstudios.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtduracionEstudio.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                txtduracionEstudio.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtduracionEstudio.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txttipoEstudio.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                txttipoEstudio.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txttipoEstudio.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtnombreEstudio.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                txtnombreEstudio.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtnombreEstudio.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtdescripcionEstudio.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                txtdescripcionEstudio.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtdescripcionEstudio.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            //**//
            if (cantidad > 1)
            {
                if (txtcentroEstudios2.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio2.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio2.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio2.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio2.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 2)
            {
                if (txtcentroEstudios3.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio3.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio3.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio3.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio3.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 3)
            {
                if (txtcentroEstudios4.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio4.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio4.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio4.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio4.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 4)
            {
                if (txtcentroEstudios5.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio5.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio5.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio5.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio5.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 5)
            {
                if (txtcentroEstudios6.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio6.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio6.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio6.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio6.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 6)
            {
                if (txtcentroEstudios7.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio7.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio7.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio7.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio7.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 7)
            {
                if (txtcentroEstudios8.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio8.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio8.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio8.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio8.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 8)
            {
                if (txtcentroEstudios9.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio9.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio9.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio9.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio9.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 9)
            {
                if (txtcentroEstudios10.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio10.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio10.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio10.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio10.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 10)
            {
                if (txtcentroEstudios11.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio11.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio11.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio11.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio11.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 11)
            {
                if (txtcentroEstudios12.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio12.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio12.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio12.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio12.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 12)
            {
                if (txtcentroEstudios13.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio13.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio13.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio13.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio13.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 13)
            {
                if (txtcentroEstudios14.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio14.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio14.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio14.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio14.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 14)
            {
                if (txtcentroEstudios15.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio15.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio15.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio15.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio15.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 15)
            {
                if (txtcentroEstudios16.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio16.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio16.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio16.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio16.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 16)
            {
                if (txtcentroEstudios17.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio17.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio17.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio17.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio17.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 17)
            {
                if (txtcentroEstudios18.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio18.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio18.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio18.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio18.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 18)
            {
                if (txtcentroEstudios19.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio19.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio19.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio19.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio19.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if (cantidad > 19)
            {
                if (txtcentroEstudios20.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio20.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio20.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio20.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio20.Text == "")
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }

            if (error)
                return false;

            return true;
        }

        protected void btnagregarRA_Click(object sender, EventArgs e)
        {
            int idegresado = IDEgresado;
            RegistroAcademicoBE objRegistroAcademicoBE = new RegistroAcademicoBE();
            List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();
            RegistroAcademicoBC objRegistroAcademicoBC = new RegistroAcademicoBC();

            listaRegistroAcademicoBE = objRegistroAcademicoBC.listarregistroacademico(idegresado);
            int cantidad = listaRegistroAcademicoBE.Count;

            if (cantidad == 1)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso2", "mostrarCurso2();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica2", "habilitarTrayectoriaAcademica2();", true);
            }

            if (cantidad == 2)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso3", "mostrarCurso3();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica3", "habilitarTrayectoriaAcademica3();", true);
            }

            if (cantidad == 3)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso4", "mostrarCurso4();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica4", "habilitarTrayectoriaAcademica4();", true);
            }

            if (cantidad == 4)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso5", "mostrarCurso5();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica5", "habilitarTrayectoriaAcademica5();", true);
            }

            if (cantidad == 5)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso6", "mostrarCurso6();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica6", "habilitarTrayectoriaAcademica6();", true);
            }

            if (cantidad == 6)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso7", "mostrarCurso7();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica7", "habilitarTrayectoriaAcademica7();", true);
            }

            if (cantidad == 7)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso8", "mostrarCurso8();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica8", "habilitarTrayectoriaAcademica8();", true);
            }

            if (cantidad == 8)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso9", "mostrarCurso9();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica9", "habilitarTrayectoriaAcademica9();", true);
            }

            if (cantidad == 9)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso10", "mostrarCurso10();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica10", "habilitarTrayectoriaAcademica10();", true);
            }

            if (cantidad == 10)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso11", "mostrarCurso11();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica11", "habilitarTrayectoriaAcademica11();", true);
            }

            if (cantidad == 11)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso12", "mostrarCurso12();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica12", "habilitarTrayectoriaAcademica12();", true);
            }

            if (cantidad == 12)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso13", "mostrarCurso13();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica13", "habilitarTrayectoriaAcademica13();", true);
            }

            if (cantidad == 13)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso14", "mostrarCurso14();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica14", "habilitarTrayectoriaAcademica14();", true);
            }

            if (cantidad == 14)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso15", "mostrarCurso15();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica15", "habilitarTrayectoriaAcademica15();", true);
            }

            if (cantidad == 15)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso16", "mostrarCurso16();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica16", "habilitarTrayectoriaAcademica16();", true);
            }

            if (cantidad == 16)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso17", "mostrarCurso17();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica17", "habilitarTrayectoriaAcademica17();", true);
            }

            if (cantidad == 17)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso18", "mostrarCurso18();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica18", "habilitarTrayectoriaAcademica18();", true);
            }

            if (cantidad == 18)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso19", "mostrarCurso19();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica19", "habilitarTrayectoriaAcademica19();", true);
            }

            if (cantidad == 19)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso20", "mostrarCurso20();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica20", "habilitarTrayectoriaAcademica20();", true);
            }

        }

        protected void btneditarRA_Click(object sender, EventArgs e)
        {
            int idegresado = IDEgresado;
            RegistroAcademicoBE objRegistroAcademicoBE = new RegistroAcademicoBE();
            List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();
            RegistroAcademicoBC objRegistroAcademicoBC = new RegistroAcademicoBC();

            listaRegistroAcademicoBE = objRegistroAcademicoBC.listarregistroacademico(idegresado);
            int cantidad = listaRegistroAcademicoBE.Count;

            ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarBotonesTA", "mostrarBotonesTA();", true);
            ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica1", "habilitarTrayectoriaAcademica1();", true);

            if (cantidad > 1)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica2", "habilitarTrayectoriaAcademica2();", true);

            if (cantidad > 2)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica3", "habilitarTrayectoriaAcademica3();", true);

            if (cantidad > 3)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica4", "habilitarTrayectoriaAcademica4();", true);
            
            if (cantidad > 4)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica5", "habilitarTrayectoriaAcademica5();", true);
            
            if (cantidad > 5)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica6", "habilitarTrayectoriaAcademica6();", true);
            
            if (cantidad > 6)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica7", "habilitarTrayectoriaAcademica7();", true);
            
            if (cantidad > 7)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica8", "habilitarTrayectoriaAcademica8();", true);
            
            if (cantidad > 8)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica9", "habilitarTrayectoriaAcademica9();", true);
            
            if (cantidad > 9)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica10", "habilitarTrayectoriaAcademica10();", true);
            
            if (cantidad > 10)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica11", "habilitarTrayectoriaAcademica11();", true);
            
            if (cantidad > 11)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica12", "habilitarTrayectoriaAcademica12();", true);
            
            if (cantidad > 12)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica13", "habilitarTrayectoriaAcademica13();", true);
            
            if (cantidad > 13)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica14", "habilitarTrayectoriaAcademica14();", true);
            
            if (cantidad > 14)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica15", "habilitarTrayectoriaAcademica15();", true);
            
            if (cantidad > 15)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica16", "habilitarTrayectoriaAcademica16();", true);
            
            if (cantidad > 16)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica17", "habilitarTrayectoriaAcademica17();", true);
            
            if (cantidad > 17)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica18", "habilitarTrayectoriaAcademica18();", true);
            
            if (cantidad > 18)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica19", "habilitarTrayectoriaAcademica19();", true);
            
            if (cantidad > 19)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaAcademica20", "habilitarTrayectoriaAcademica20();", true);
        }

        protected void btncancelarRA_Click(object sender, EventArgs e)
        {
            int idegresado = IDEgresado;
            RegistroAcademicoBE objRegistroAcademicoBE = new RegistroAcademicoBE();
            List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();
            RegistroAcademicoBC objRegistroAcademicoBC = new RegistroAcademicoBC();

            listaRegistroAcademicoBE = objRegistroAcademicoBC.listarregistroacademico(idegresado);
            int cantidad = listaRegistroAcademicoBE.Count;

            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarBotonesTA", "ocultarBotonesTA();", true);
            ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica1", "deshabilitarTrayectoriaAcademica1();", true);

            if (cantidad > 1)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica2", "deshabilitarTrayectoriaAcademica2();", true);
            }
            if (cantidad > 2)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica3", "deshabilitarTrayectoriaAcademica3();", true);
            }
            if (cantidad > 3)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica4", "deshabilitarTrayectoriaAcademica4();", true);
            }
            if (cantidad > 4)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica5", "deshabilitarTrayectoriaAcademica5();", true);
            }
            if (cantidad > 5)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica6", "deshabilitarTrayectoriaAcademica6();", true);
            }
            if (cantidad > 6)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica7", "deshabilitarTrayectoriaAcademica7();", true);
            }
            if (cantidad > 7)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica8", "deshabilitarTrayectoriaAcademica8();", true);
            }
            if (cantidad > 8)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica9", "deshabilitarTrayectoriaAcademica9();", true);
            }
            if (cantidad > 9)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica10", "deshabilitarTrayectoriaAcademica10();", true);
            }
            if (cantidad > 10)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica11", "deshabilitarTrayectoriaAcademica11();", true);
            }
            if (cantidad > 11)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica12", "deshabilitarTrayectoriaAcademica12();", true);
            }
            if (cantidad > 12)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica13", "deshabilitarTrayectoriaAcademica13();", true);
            }
            if (cantidad > 13)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica14", "deshabilitarTrayectoriaAcademica14();", true);
            }
            if (cantidad > 14)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica15", "deshabilitarTrayectoriaAcademica15();", true);
            }
            if (cantidad > 15)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica16", "deshabilitarTrayectoriaAcademica16();", true);
            }
            if (cantidad > 16)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica17", "deshabilitarTrayectoriaAcademica17();", true);
            }
            if (cantidad > 17)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica18", "deshabilitarTrayectoriaAcademica18();", true);
            }
            if (cantidad > 18)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica19", "deshabilitarTrayectoriaAcademica19();", true);
            }
            if (cantidad > 19)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTrayectoriaAcademica20", "deshabilitarTrayectoriaAcademica20();", true);
            }

            if (cantidad == 1)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso2", "ocultarCurso2();", true);

            if (cantidad == 2)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso3", "ocultarCurso3();", true);

            if (cantidad == 3)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso4", "ocultarCurso4();", true); ;

            if (cantidad == 4)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso5", "ocultarCurso5();", true);

            if (cantidad == 5)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso6", "ocultarCurso6();", true);

            if (cantidad == 6)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso7", "ocultarCurso7();", true);

            if (cantidad == 7)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso8", "ocultarCurso8();", true);

            if (cantidad == 8)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso9", "ocultarCurso9();", true);

            if (cantidad == 9)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso10", "ocultarCurso10();", true);

            if (cantidad == 10)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso11", "ocultarCurso11();", true);

            if (cantidad == 11)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso12", "ocultarCurso12();", true);

            if (cantidad == 12)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso13", "ocultarCurso13();", true);

            if (cantidad == 13)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso14", "ocultarCurso14();", true);

            if (cantidad == 14)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso15", "ocultarCurso15();", true);

            if (cantidad == 15)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso16", "ocultarCurso16();", true);

            if (cantidad == 16)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso17", "ocultarCurso17();", true);

            if (cantidad == 17)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso18", "ocultarCurso18();", true);

            if (cantidad == 18)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso19", "ocultarCurso19();", true);

            if (cantidad == 19)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso20", "ocultarCurso20();", true);
        }

        protected void btnguardarRA_Click(object sender, EventArgs e)
        {
            try
            {
                if (validarformRegistroAcademico())
                {
                    if (guardarRegistroAcademico() != 0)
                    {
                        if (actualizarRegistroAcademico())
                        {
                            ScriptManager.RegisterStartupScript(Page, GetType(), "exitoRA", "exitoRA();", true);
                        }
                        else
                            ClientScript.RegisterClientScriptBlock(GetType(), "erroractualizarRA", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(GetType(), "errorregistrarRA", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "errorguardarRA", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        //*** Registro Laboral ***//

        public int guardarRegistroLaboral()
        {
            int exito = 9;

            return exito;
        }

        public bool actualizarRegistroLaboral()
        {
            bool exito = false;

            return exito;
        }

        public bool validarcamposRL()
        {
            bool error = false;

            if (error)
                return false;

            return true;
        }

        public bool validarformRegistroLaboral()
        {
            bool error = false;

            if (error)
                return false;

            return true;
        }

        protected void btneditarRL_Click(object sender, EventArgs e)
        {

        }

        protected void btncancelarRL_Click(object sender, EventArgs e)
        {

        }

        protected void btnguardarRL_Click(object sender, EventArgs e)
        {

        }

        protected void btnagregarRL_Click(object sender, EventArgs e)
        {

        }

        //*** Aptitudes e intereses ***//



        //*** Funcion Botones ***///

        protected void btndatosPersonales_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "datosPersonalesToggle();", true);
        }

        protected void btntrayectoriaAcad_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "trayectoriaAcadToggle();", true);
        }

        protected void btntrayectoriaProf_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "trayectoriaProfToggle();", true);

        }

        protected void btnaptitudesIntereses_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "aptitudesInteresesToggle();", true);

        }
    }
}