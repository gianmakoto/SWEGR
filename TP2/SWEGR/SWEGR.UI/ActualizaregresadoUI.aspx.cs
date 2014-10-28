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
        int IDInteres;
        int IDAptitud;
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
                IDEgresado = Convert.ToInt32(Session["IDusuario"]);
                TUsuario = Convert.ToChar(Session["TipoUsusario"]);

                if (TUsuario == 'G')
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                if (TUsuario == 'D')
                {
                    txtdni.Enabled = true;
                    ddlGenero.Enabled = true;
                    txtfechanacimiento.Enabled = true;
                }

                if (IDEgresado == 0)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                if (!IsPostBack)
                {
                    ddlGenero.DataSource = listagenero();
                    ddlGenero.DataBind();
                    ddlGenero.Items.Insert(0, new ListItem("Seleccione el género", ""));

                    ddlDepartamento.DataSource = listadepartamento();
                    ddlDepartamento.DataBind();
                    ddlDepartamento.Items.Insert(0, new ListItem("Seleccione el departamento", ""));

                    PaisBC objetoPaisBC = new PaisBC();
                    List<String> lsPaisBE = new List<string>();
                    lsPaisBE = objetoPaisBC.listarPais();

                    ddlPais.DataSource = lsPaisBE;
                    ddlPais.DataBind();
                    ddlPais.Items.Insert(0, new ListItem("Seleccione el país", ""));

                    llenarPaisesTA();
                    llenarPaisesTL();

                    EgresadoBC objEgresadoBC = new EgresadoBC();
                    EgresadoBE egresado = objEgresadoBC.obtenerEgresado(IDEgresado);

                    txtnombrecompleto.Text = egresado.Nombrecompletoegresado;
                    txtdni.Text = egresado.Dniegresado;
                    txtfechanacimiento.Text = egresado.Fechanacimientoegresado.Day.ToString() + "/" + egresado.Fechanacimientoegresado.Month.ToString() + "/" + egresado.Fechanacimientoegresado.Year.ToString();
                    txtCarrera.Text = egresado.Carreraegresado;
                    txttelefonoprincipal.Text = egresado.Telefonoprinegresado;
                    txttelefonoalternativo.Text = egresado.Telefonoaltegresado;
                    txtdireccion.Text = egresado.Direccionegresado;
                    txtdistrito.Text = egresado.Distritoegresado;
                    txtcorreo.Text = egresado.Correoegresado;
                    txtcorreoalternativo.Text = egresado.Correoaltegresado;
                    txtperfillinkedin.Text = egresado.Perfillinkedinegresado;
                    txtperfilfacebook.Text = egresado.Perfilfacebookegresado;
                    NombreHidden.Value = egresado.Nombrecompletoegresado;

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

                    grdAptitudesDataBind();
                    grdInteresesDataBind();

                    obtenerFoto(egresado.Idfotoegresado);
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        public void grdAptitudesDataBind()
        {
            grdAptitudes.DataSource = listaaptitudbe(IDEgresado);
            grdAptitudes.DataBind();
            upgrdAptitudes.Update();
        }

        public void grdInteresesDataBind()
        {
            grdIntereses.DataSource = listainteresbe(IDEgresado);
            grdIntereses.DataBind();
            upgrdIntereses.Update();
        }

        public void llenarregistroacademico(int idegresado)
        {
            PaisBC objetoPaisBC = new PaisBC();
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
            String pais = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

            if (objRegistroAcademicoBE.Idpais == 0)
                ddlPaisTA.SelectedIndex = -1;
            else
                ddlPaisTA.Text = pais;

            if (cantidad > 1)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[1];

                txtcentroEstudios2.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio2.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio2.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio2.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio2.Text = objRegistroAcademicoBE.Descripcionestudio;
                String paisTA2 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA2.SelectedIndex = -1;
                else
                    ddlPaisTA2.Text = paisTA2;

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
                String paisTA3 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA3.SelectedIndex = -1;
                else
                    ddlPaisTA3.Text = paisTA3;

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
                String paisTA4 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA4.SelectedIndex = -1;
                else
                    ddlPaisTA4.Text = paisTA4;

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
                String paisTA5 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA5.SelectedIndex = -1;
                else
                    ddlPaisTA5.Text = paisTA5;

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
                String paisTA6 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA6.SelectedIndex = -1;
                else
                    ddlPaisTA6.Text = paisTA6;

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
                String paisTA7 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA7.SelectedIndex = -1;
                else
                    ddlPaisTA7.Text = paisTA7;

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
                String paisTA8 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA8.SelectedIndex = -1;
                else
                    ddlPaisTA8.Text = paisTA8;

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
                String paisTA9 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA9.SelectedIndex = -1;
                else
                    ddlPaisTA9.Text = paisTA9;

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
                String paisTA10 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA10.SelectedIndex = -1;
                else
                    ddlPaisTA10.Text = paisTA10;

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
                String paisTA11 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA11.SelectedIndex = -1;
                else
                    ddlPaisTA11.Text = paisTA11;

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
                String paisTA12 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA12.SelectedIndex = -1;
                else
                    ddlPaisTA12.Text = paisTA12;

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
                String paisTA13 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA13.SelectedIndex = -1;
                else
                    ddlPaisTA13.Text = paisTA13;

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
                String paisTA14 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA14.SelectedIndex = -1;
                else
                    ddlPaisTA14.Text = paisTA14;

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
                String paisTA15 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA15.SelectedIndex = -1;
                else
                    ddlPaisTA15.Text = paisTA15;

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
                String paisTA16 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA16.SelectedIndex = -1;
                else
                    ddlPaisTA16.Text = paisTA16;

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
                String paisTA17 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA17.SelectedIndex = -1;
                else
                    ddlPaisTA17.Text = paisTA17;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso17", "mostrarCurso17();", true);
            }
            else
                return;

            if (cantidad > 17)
            {
                objRegistroAcademicoBE = listaRegistroAcademicoBE[17];

                txtcentroEstudios18.Text = objRegistroAcademicoBE.Nombreinstitucion;
                txtduracionEstudio18.Text = objRegistroAcademicoBE.Duracionestudio;
                txttipoEstudio18.Text = objRegistroAcademicoBE.Tipoestudio;
                txtnombreEstudio18.Text = objRegistroAcademicoBE.Nombreestudio;
                txtdescripcionEstudio18.Text = objRegistroAcademicoBE.Descripcionestudio;
                String paisTA18 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA18.SelectedIndex = -1;
                else
                    ddlPaisTA18.Text = paisTA18;

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
                String paisTA19 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA19.SelectedIndex = -1;
                else
                    ddlPaisTA19.Text = paisTA19;

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
                String paisTA20 = objetoPaisBC.obtenerPais(objRegistroAcademicoBE.Idpais);

                if (objRegistroAcademicoBE.Idpais == 0)
                    ddlPaisTA20.SelectedIndex = -1;
                else
                    ddlPaisTA20.Text = paisTA20;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarCurso20", "mostrarCurso20();", true);
            }
            else
                return;

        }

        public void llenarregistrolaboral(int idegresado)
        {
            PaisBC objetoPaisBC = new PaisBC();
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
            String pais = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

            if (objRegistroLaboralBE.Idpais == 0)
                ddlPaisTL.SelectedIndex = -1;
            else
                ddlPaisTL.Text = pais;


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
                String paisTL2 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL2.SelectedIndex = -1;
                else
                    ddlPaisTL2.Text = paisTL2;

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
                String paisTL3 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL3.SelectedIndex = -1;
                else
                    ddlPaisTL3.Text = paisTL3;

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
                String paisTL4 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL4.SelectedIndex = -1;
                else
                    ddlPaisTL4.Text = paisTL4;

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
                String paisTL5 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL5.SelectedIndex = -1;
                else
                    ddlPaisTL5.Text = paisTL5;

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
                String paisTL6 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL6.SelectedIndex = -1;
                else
                    ddlPaisTL6.Text = paisTL6;

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
                String paisTL7 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL7.SelectedIndex = -1;
                else
                    ddlPaisTL7.Text = paisTL7;

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
                String paisTL8 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL8.SelectedIndex = -1;
                else
                    ddlPaisTL8.Text = paisTL8;

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
                String paisTL9 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL9.SelectedIndex = -1;
                else
                    ddlPaisTL9.Text = paisTL9;

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
                String paisTL10 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL10.SelectedIndex = -1;
                else
                    ddlPaisTL10.Text = paisTL10;

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
                String paisTL11 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL11.SelectedIndex = -1;
                else
                    ddlPaisTL11.Text = paisTL11;

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
                String paisTL12 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL12.SelectedIndex = -1;
                else
                    ddlPaisTL12.Text = paisTL12;

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
                String paisTL13 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL13.SelectedIndex = -1;
                else
                    ddlPaisTL13.Text = paisTL13;

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
                String paisTL14 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL14.SelectedIndex = -1;
                else
                    ddlPaisTL14.Text = paisTL14;

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
                String paisTL15 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL15.SelectedIndex = -1;
                else
                    ddlPaisTL15.Text = paisTL15;

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
                String paisTL16 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL16.SelectedIndex = -1;
                else
                    ddlPaisTL16.Text = paisTL16;

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
                String paisTL17 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL17.SelectedIndex = -1;
                else
                    ddlPaisTL17.Text = paisTL17;

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
                String paisTL18 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL18.SelectedIndex = -1;
                else
                    ddlPaisTL18.Text = paisTL18;

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
                String paisTL19 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL19.SelectedIndex = -1;
                else
                    ddlPaisTL19.Text = paisTL19;

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
                String paisTL20 = objetoPaisBC.obtenerPais(objRegistroLaboralBE.Idpais);

                if (objRegistroLaboralBE.Idpais == 0)
                    ddlPaisTL20.SelectedIndex = -1;
                else
                    ddlPaisTL20.Text = paisTL20;

                if (objRegistroLaboralBE.Trabajoactual == true)
                    cbotrabajoActual20.Checked = true;

                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo20", "mostrarTrabajo20();", true);
            }
            else
                return;
        }

        public List<AptitudBE> listaaptitudbe(int idegresado)
        {
            List<AptitudBE> lstaptitudes = new List<AptitudBE>();
            List<int> idaptitudes = new List<int>();
            AptitudBE objAptitudBE = new AptitudBE();
            AptitudBC objAptitudBC = new AptitudBC();

            EgresadoBC objetoEgresadoBC = new EgresadoBC();
            idaptitudes = objetoEgresadoBC.listaraptitudxegresado(idegresado);

            for (int i = 0; i < idaptitudes.Count(); i++)
            {
                int aptitudid = idaptitudes[i];

                objAptitudBE = objAptitudBC.obtenerAptitud(aptitudid);

                lstaptitudes.Add(objAptitudBE);
            }
            return lstaptitudes;

        }

        public List<InteresBE> listainteresbe(int idegresado)
        {
            List<InteresBE> lstintereses = new List<InteresBE>();
            List<int> idintereses = new List<int>();
            InteresBE objInteresBE = new InteresBE();
            InteresBC objInteresBC = new InteresBC();


            EgresadoBC objetoEgresadoBC = new EgresadoBC();
            idintereses = objetoEgresadoBC.listarinteresxegresado(idegresado);

            for (int i = 0; i < idintereses.Count(); i++)
            {
                int interesid = idintereses[i];

                objInteresBE = objInteresBC.obtenerInteres(interesid);

                lstintereses.Add(objInteresBE);
            }
            return lstintereses;
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

        public void llenarPaisesTA()
        {
            PaisBC objetoPaisBC = new PaisBC();
            List<String> lsPaisBE = new List<string>();
            lsPaisBE = objetoPaisBC.listarPais();

            ddlPaisTA.DataSource = lsPaisBE;
            ddlPaisTA.DataBind();
            ddlPaisTA.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA2.DataSource = lsPaisBE;
            ddlPaisTA2.DataBind();
            ddlPaisTA2.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA3.DataSource = lsPaisBE;
            ddlPaisTA3.DataBind();
            ddlPaisTA3.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA4.DataSource = lsPaisBE;
            ddlPaisTA4.DataBind();
            ddlPaisTA4.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA5.DataSource = lsPaisBE;
            ddlPaisTA5.DataBind();
            ddlPaisTA5.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA6.DataSource = lsPaisBE;
            ddlPaisTA6.DataBind();
            ddlPaisTA6.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA7.DataSource = lsPaisBE;
            ddlPaisTA7.DataBind();
            ddlPaisTA7.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA8.DataSource = lsPaisBE;
            ddlPaisTA8.DataBind();
            ddlPaisTA8.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA9.DataSource = lsPaisBE;
            ddlPaisTA9.DataBind();
            ddlPaisTA9.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA10.DataSource = lsPaisBE;
            ddlPaisTA10.DataBind();
            ddlPaisTA10.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA11.DataSource = lsPaisBE;
            ddlPaisTA11.DataBind();
            ddlPaisTA11.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA12.DataSource = lsPaisBE;
            ddlPaisTA12.DataBind();
            ddlPaisTA12.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA13.DataSource = lsPaisBE;
            ddlPaisTA13.DataBind();
            ddlPaisTA13.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA14.DataSource = lsPaisBE;
            ddlPaisTA14.DataBind();
            ddlPaisTA14.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA15.DataSource = lsPaisBE;
            ddlPaisTA15.DataBind();
            ddlPaisTA15.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA16.DataSource = lsPaisBE;
            ddlPaisTA16.DataBind();
            ddlPaisTA16.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA17.DataSource = lsPaisBE;
            ddlPaisTA17.DataBind();
            ddlPaisTA17.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA18.DataSource = lsPaisBE;
            ddlPaisTA18.DataBind();
            ddlPaisTA18.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA19.DataSource = lsPaisBE;
            ddlPaisTA19.DataBind();
            ddlPaisTA19.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTA20.DataSource = lsPaisBE;
            ddlPaisTA20.DataBind();
            ddlPaisTA20.Items.Insert(0, new ListItem("Seleccione el país", ""));
        }

        public void llenarPaisesTL()
        {
            PaisBC objetoPaisBC = new PaisBC();
            List<String> lsPaisBE = new List<string>();
            lsPaisBE = objetoPaisBC.listarPais();

            ddlPaisTL.DataSource = lsPaisBE;
            ddlPaisTL.DataBind();
            ddlPaisTL.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL2.DataSource = lsPaisBE;
            ddlPaisTL2.DataBind();
            ddlPaisTL2.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL3.DataSource = lsPaisBE;
            ddlPaisTL3.DataBind();
            ddlPaisTL3.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL4.DataSource = lsPaisBE;
            ddlPaisTL4.DataBind();
            ddlPaisTL4.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL5.DataSource = lsPaisBE;
            ddlPaisTL5.DataBind();
            ddlPaisTL5.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL6.DataSource = lsPaisBE;
            ddlPaisTL6.DataBind();
            ddlPaisTL6.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL7.DataSource = lsPaisBE;
            ddlPaisTL7.DataBind();
            ddlPaisTL7.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL8.DataSource = lsPaisBE;
            ddlPaisTL8.DataBind();
            ddlPaisTL8.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL9.DataSource = lsPaisBE;
            ddlPaisTL9.DataBind();
            ddlPaisTL9.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL10.DataSource = lsPaisBE;
            ddlPaisTL10.DataBind();
            ddlPaisTL10.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL11.DataSource = lsPaisBE;
            ddlPaisTL11.DataBind();
            ddlPaisTL11.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL12.DataSource = lsPaisBE;
            ddlPaisTL12.DataBind();
            ddlPaisTL12.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL13.DataSource = lsPaisBE;
            ddlPaisTL13.DataBind();
            ddlPaisTL13.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL14.DataSource = lsPaisBE;
            ddlPaisTL14.DataBind();
            ddlPaisTL14.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL15.DataSource = lsPaisBE;
            ddlPaisTL15.DataBind();
            ddlPaisTL15.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL16.DataSource = lsPaisBE;
            ddlPaisTL16.DataBind();
            ddlPaisTL16.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL17.DataSource = lsPaisBE;
            ddlPaisTL17.DataBind();
            ddlPaisTL17.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL18.DataSource = lsPaisBE;
            ddlPaisTL18.DataBind();
            ddlPaisTL18.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL19.DataSource = lsPaisBE;
            ddlPaisTL19.DataBind();
            ddlPaisTL19.Items.Insert(0, new ListItem("Seleccione el país", ""));

            ddlPaisTL20.DataSource = lsPaisBE;
            ddlPaisTL20.DataBind();
            ddlPaisTL20.Items.Insert(0, new ListItem("Seleccione el país", ""));
        }

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

        //*** Datos Personales ***//

        public bool actualizarEgresado()
        {
            EgresadoBC objEgresadoBC = new EgresadoBC();
            EgresadoBE egresado = objEgresadoBC.obtenerEgresado(IDEgresado);
            PaisBC objetoPaisBC = new PaisBC();
            FotoBC metodosFoto = new FotoBC();

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
            egresado.Idpaisegresado = objetoPaisBC.obtenerPaisID(ddlPais.Text);

            var objFoto = new FotoBE { ImagenBytes = CargaImagen.FileBytes };

            if (egresado.Idfotoegresado == 1 || egresado.Idfotoegresado == null)
                egresado.Idfotoegresado = metodosFoto.insertarFoto(objFoto);
            else
                metodosFoto.actualizarFoto(objFoto);

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
            PaisBC objetoPaisBC = new PaisBC();
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
                    objRegistroAcademicoBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA.Text);

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
                    objRegistroAcademicoBE2.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA2.Text);

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
                    objRegistroAcademicoBE3.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA3.Text);

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
                    objRegistroAcademicoBE4.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA4.Text);

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
                    objRegistroAcademicoBE5.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA5.Text);

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
                    objRegistroAcademicoBE6.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA6.Text);

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
                    objRegistroAcademicoBE7.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA7.Text);

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
                    objRegistroAcademicoBE8.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA8.Text);

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
                    objRegistroAcademicoBE9.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA9.Text);

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
                    objRegistroAcademicoBE10.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA10.Text);


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
                    objRegistroAcademicoBE11.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA11.Text);

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
                    objRegistroAcademicoBE12.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA12.Text);

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
                    objRegistroAcademicoBE13.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA13.Text);

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
                    objRegistroAcademicoBE14.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA14.Text);

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
                    objRegistroAcademicoBE15.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA15.Text);

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
                    objRegistroAcademicoBE16.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA16.Text);

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
                    objRegistroAcademicoBE17.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA17.Text);

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
                    objRegistroAcademicoBE18.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA18.Text);

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
                    objRegistroAcademicoBE19.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA19.Text);

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
                    objRegistroAcademicoBE20.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA20.Text);

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
            PaisBC objetoPaisBC = new PaisBC();
            RegistroAcademicoBE objRegistroAcademicoBE = new RegistroAcademicoBE();
            List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();
            RegistroAcademicoBC objRegistroAcademicoBC = new RegistroAcademicoBC();

            listaRegistroAcademicoBE = objRegistroAcademicoBC.listarregistroacademico(idegresado);
            int cantidad = listaRegistroAcademicoBE.Count;

            if (cantidad == 0)
                return false;

            objRegistroAcademicoBE.Idregistroacademico = listaRegistroAcademicoBE[0].Idregistroacademico;
            objRegistroAcademicoBE.Idegresado = idegresado;
            objRegistroAcademicoBE.Nombreinstitucion = txtcentroEstudios.Text;
            objRegistroAcademicoBE.Duracionestudio = txtduracionEstudio.Text;
            objRegistroAcademicoBE.Tipoestudio = txttipoEstudio.Text;
            objRegistroAcademicoBE.Nombreestudio = txtnombreEstudio.Text;
            objRegistroAcademicoBE.Descripcionestudio = txtdescripcionEstudio.Text;
            objRegistroAcademicoBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA.Text);

            if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE))
                exito = true;
            else
                return false;

            if (cantidad > 1)
            {
                RegistroAcademicoBE objRegistroAcademicoBE2 = new RegistroAcademicoBE();
                objRegistroAcademicoBE2.Idregistroacademico = listaRegistroAcademicoBE[1].Idregistroacademico;
                objRegistroAcademicoBE2.Idegresado = idegresado;
                objRegistroAcademicoBE2.Nombreinstitucion = txtcentroEstudios2.Text;
                objRegistroAcademicoBE2.Duracionestudio = txtduracionEstudio2.Text;
                objRegistroAcademicoBE2.Tipoestudio = txttipoEstudio2.Text;
                objRegistroAcademicoBE2.Nombreestudio = txtnombreEstudio2.Text;
                objRegistroAcademicoBE2.Descripcionestudio = txtdescripcionEstudio2.Text;
                objRegistroAcademicoBE2.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA2.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE2))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 2)
            {
                RegistroAcademicoBE objRegistroAcademicoBE3 = new RegistroAcademicoBE();
                objRegistroAcademicoBE3.Idregistroacademico = listaRegistroAcademicoBE[2].Idregistroacademico;
                objRegistroAcademicoBE3.Idegresado = idegresado;
                objRegistroAcademicoBE3.Nombreinstitucion = txtcentroEstudios3.Text;
                objRegistroAcademicoBE3.Duracionestudio = txtduracionEstudio3.Text;
                objRegistroAcademicoBE3.Tipoestudio = txttipoEstudio3.Text;
                objRegistroAcademicoBE3.Nombreestudio = txtnombreEstudio3.Text;
                objRegistroAcademicoBE3.Descripcionestudio = txtdescripcionEstudio3.Text;
                objRegistroAcademicoBE3.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA3.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE3))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 3)
            {
                RegistroAcademicoBE objRegistroAcademicoBE4 = new RegistroAcademicoBE();
                objRegistroAcademicoBE4.Idregistroacademico = listaRegistroAcademicoBE[3].Idregistroacademico;
                objRegistroAcademicoBE4.Idegresado = idegresado;
                objRegistroAcademicoBE4.Nombreinstitucion = txtcentroEstudios4.Text;
                objRegistroAcademicoBE4.Duracionestudio = txtduracionEstudio4.Text;
                objRegistroAcademicoBE4.Tipoestudio = txttipoEstudio4.Text;
                objRegistroAcademicoBE4.Nombreestudio = txtnombreEstudio4.Text;
                objRegistroAcademicoBE4.Descripcionestudio = txtdescripcionEstudio4.Text;
                objRegistroAcademicoBE4.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA4.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE4))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 4)
            {
                RegistroAcademicoBE objRegistroAcademicoBE5 = new RegistroAcademicoBE();
                objRegistroAcademicoBE5.Idregistroacademico = listaRegistroAcademicoBE[4].Idregistroacademico;
                objRegistroAcademicoBE5.Idegresado = idegresado;
                objRegistroAcademicoBE5.Nombreinstitucion = txtcentroEstudios5.Text;
                objRegistroAcademicoBE5.Duracionestudio = txtduracionEstudio5.Text;
                objRegistroAcademicoBE5.Tipoestudio = txttipoEstudio5.Text;
                objRegistroAcademicoBE5.Nombreestudio = txtnombreEstudio5.Text;
                objRegistroAcademicoBE5.Descripcionestudio = txtdescripcionEstudio5.Text;
                objRegistroAcademicoBE5.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA5.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE5))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 5)
            {
                RegistroAcademicoBE objRegistroAcademicoBE6 = new RegistroAcademicoBE();
                objRegistroAcademicoBE6.Idregistroacademico = listaRegistroAcademicoBE[5].Idregistroacademico;
                objRegistroAcademicoBE6.Idegresado = idegresado;
                objRegistroAcademicoBE6.Nombreinstitucion = txtcentroEstudios6.Text;
                objRegistroAcademicoBE6.Duracionestudio = txtduracionEstudio6.Text;
                objRegistroAcademicoBE6.Tipoestudio = txttipoEstudio6.Text;
                objRegistroAcademicoBE6.Nombreestudio = txtnombreEstudio6.Text;
                objRegistroAcademicoBE6.Descripcionestudio = txtdescripcionEstudio6.Text;
                objRegistroAcademicoBE6.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA6.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE6))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 6)
            {
                RegistroAcademicoBE objRegistroAcademicoBE7 = new RegistroAcademicoBE();
                objRegistroAcademicoBE7.Idregistroacademico = listaRegistroAcademicoBE[6].Idregistroacademico;
                objRegistroAcademicoBE7.Idegresado = idegresado;
                objRegistroAcademicoBE7.Nombreinstitucion = txtcentroEstudios7.Text;
                objRegistroAcademicoBE7.Duracionestudio = txtduracionEstudio7.Text;
                objRegistroAcademicoBE7.Tipoestudio = txttipoEstudio7.Text;
                objRegistroAcademicoBE7.Nombreestudio = txtnombreEstudio7.Text;
                objRegistroAcademicoBE7.Descripcionestudio = txtdescripcionEstudio7.Text;
                objRegistroAcademicoBE7.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA7.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE7))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 7)
            {
                RegistroAcademicoBE objRegistroAcademicoBE8 = new RegistroAcademicoBE();
                objRegistroAcademicoBE8.Idregistroacademico = listaRegistroAcademicoBE[7].Idregistroacademico;
                objRegistroAcademicoBE8.Idegresado = idegresado;
                objRegistroAcademicoBE8.Nombreinstitucion = txtcentroEstudios8.Text;
                objRegistroAcademicoBE8.Duracionestudio = txtduracionEstudio8.Text;
                objRegistroAcademicoBE8.Tipoestudio = txttipoEstudio8.Text;
                objRegistroAcademicoBE8.Nombreestudio = txtnombreEstudio8.Text;
                objRegistroAcademicoBE8.Descripcionestudio = txtdescripcionEstudio8.Text;
                objRegistroAcademicoBE8.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA8.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE8))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 8)
            {
                RegistroAcademicoBE objRegistroAcademicoBE9 = new RegistroAcademicoBE();
                objRegistroAcademicoBE9.Idregistroacademico = listaRegistroAcademicoBE[8].Idregistroacademico;
                objRegistroAcademicoBE9.Idegresado = idegresado;
                objRegistroAcademicoBE9.Nombreinstitucion = txtcentroEstudios9.Text;
                objRegistroAcademicoBE9.Duracionestudio = txtduracionEstudio9.Text;
                objRegistroAcademicoBE9.Tipoestudio = txttipoEstudio9.Text;
                objRegistroAcademicoBE9.Nombreestudio = txtnombreEstudio9.Text;
                objRegistroAcademicoBE9.Descripcionestudio = txtdescripcionEstudio9.Text;
                objRegistroAcademicoBE9.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA9.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE9))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 9)
            {
                RegistroAcademicoBE objRegistroAcademicoBE10 = new RegistroAcademicoBE();
                objRegistroAcademicoBE10.Idregistroacademico = listaRegistroAcademicoBE[9].Idregistroacademico;
                objRegistroAcademicoBE10.Idegresado = idegresado;
                objRegistroAcademicoBE10.Nombreinstitucion = txtcentroEstudios10.Text;
                objRegistroAcademicoBE10.Duracionestudio = txtduracionEstudio10.Text;
                objRegistroAcademicoBE10.Tipoestudio = txttipoEstudio10.Text;
                objRegistroAcademicoBE10.Nombreestudio = txtnombreEstudio10.Text;
                objRegistroAcademicoBE10.Descripcionestudio = txtdescripcionEstudio10.Text;
                objRegistroAcademicoBE10.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA10.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE10))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 10)
            {
                RegistroAcademicoBE objRegistroAcademicoBE11 = new RegistroAcademicoBE();
                objRegistroAcademicoBE11.Idregistroacademico = listaRegistroAcademicoBE[10].Idregistroacademico;
                objRegistroAcademicoBE11.Idegresado = idegresado;
                objRegistroAcademicoBE11.Nombreinstitucion = txtcentroEstudios11.Text;
                objRegistroAcademicoBE11.Duracionestudio = txtduracionEstudio11.Text;
                objRegistroAcademicoBE11.Tipoestudio = txttipoEstudio11.Text;
                objRegistroAcademicoBE11.Nombreestudio = txtnombreEstudio11.Text;
                objRegistroAcademicoBE11.Descripcionestudio = txtdescripcionEstudio11.Text;
                objRegistroAcademicoBE11.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA11.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE11))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 11)
            {
                RegistroAcademicoBE objRegistroAcademicoBE12 = new RegistroAcademicoBE();
                objRegistroAcademicoBE12.Idregistroacademico = listaRegistroAcademicoBE[11].Idregistroacademico;
                objRegistroAcademicoBE12.Idegresado = idegresado;
                objRegistroAcademicoBE12.Nombreinstitucion = txtcentroEstudios12.Text;
                objRegistroAcademicoBE12.Duracionestudio = txtduracionEstudio12.Text;
                objRegistroAcademicoBE12.Tipoestudio = txttipoEstudio12.Text;
                objRegistroAcademicoBE12.Nombreestudio = txtnombreEstudio12.Text;
                objRegistroAcademicoBE12.Descripcionestudio = txtdescripcionEstudio12.Text;
                objRegistroAcademicoBE12.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA12.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE12))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 12)
            {
                RegistroAcademicoBE objRegistroAcademicoBE13 = new RegistroAcademicoBE();
                objRegistroAcademicoBE13.Idregistroacademico = listaRegistroAcademicoBE[12].Idregistroacademico;
                objRegistroAcademicoBE13.Idegresado = idegresado;
                objRegistroAcademicoBE13.Nombreinstitucion = txtcentroEstudios13.Text;
                objRegistroAcademicoBE13.Duracionestudio = txtduracionEstudio13.Text;
                objRegistroAcademicoBE13.Tipoestudio = txttipoEstudio13.Text;
                objRegistroAcademicoBE13.Nombreestudio = txtnombreEstudio13.Text;
                objRegistroAcademicoBE13.Descripcionestudio = txtdescripcionEstudio13.Text;
                objRegistroAcademicoBE13.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA13.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE13))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 13)
            {
                RegistroAcademicoBE objRegistroAcademicoBE14 = new RegistroAcademicoBE();
                objRegistroAcademicoBE14.Idregistroacademico = listaRegistroAcademicoBE[13].Idregistroacademico;
                objRegistroAcademicoBE14.Idegresado = idegresado;
                objRegistroAcademicoBE14.Nombreinstitucion = txtcentroEstudios14.Text;
                objRegistroAcademicoBE14.Duracionestudio = txtduracionEstudio14.Text;
                objRegistroAcademicoBE14.Tipoestudio = txttipoEstudio14.Text;
                objRegistroAcademicoBE14.Nombreestudio = txtnombreEstudio14.Text;
                objRegistroAcademicoBE14.Descripcionestudio = txtdescripcionEstudio14.Text;
                objRegistroAcademicoBE14.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA14.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE14))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 14)
            {
                RegistroAcademicoBE objRegistroAcademicoBE15 = new RegistroAcademicoBE();
                objRegistroAcademicoBE15.Idregistroacademico = listaRegistroAcademicoBE[14].Idregistroacademico;
                objRegistroAcademicoBE15.Idegresado = idegresado;
                objRegistroAcademicoBE15.Nombreinstitucion = txtcentroEstudios15.Text;
                objRegistroAcademicoBE15.Duracionestudio = txtduracionEstudio15.Text;
                objRegistroAcademicoBE15.Tipoestudio = txttipoEstudio15.Text;
                objRegistroAcademicoBE15.Nombreestudio = txtnombreEstudio15.Text;
                objRegistroAcademicoBE15.Descripcionestudio = txtdescripcionEstudio15.Text;
                objRegistroAcademicoBE15.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA15.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE15))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 15)
            {
                RegistroAcademicoBE objRegistroAcademicoBE16 = new RegistroAcademicoBE();
                objRegistroAcademicoBE16.Idregistroacademico = listaRegistroAcademicoBE[15].Idregistroacademico;
                objRegistroAcademicoBE16.Idegresado = idegresado;
                objRegistroAcademicoBE16.Nombreinstitucion = txtcentroEstudios16.Text;
                objRegistroAcademicoBE16.Duracionestudio = txtduracionEstudio16.Text;
                objRegistroAcademicoBE16.Tipoestudio = txttipoEstudio16.Text;
                objRegistroAcademicoBE16.Nombreestudio = txtnombreEstudio16.Text;
                objRegistroAcademicoBE16.Descripcionestudio = txtdescripcionEstudio16.Text;
                objRegistroAcademicoBE16.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA16.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE16))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 16)
            {
                RegistroAcademicoBE objRegistroAcademicoBE17 = new RegistroAcademicoBE();
                objRegistroAcademicoBE17.Idregistroacademico = listaRegistroAcademicoBE[16].Idregistroacademico;
                objRegistroAcademicoBE17.Idegresado = idegresado;
                objRegistroAcademicoBE17.Nombreinstitucion = txtcentroEstudios17.Text;
                objRegistroAcademicoBE17.Duracionestudio = txtduracionEstudio17.Text;
                objRegistroAcademicoBE17.Tipoestudio = txttipoEstudio17.Text;
                objRegistroAcademicoBE17.Nombreestudio = txtnombreEstudio17.Text;
                objRegistroAcademicoBE17.Descripcionestudio = txtdescripcionEstudio17.Text;
                objRegistroAcademicoBE17.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA17.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE17))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 17)
            {
                RegistroAcademicoBE objRegistroAcademicoBE18 = new RegistroAcademicoBE();
                objRegistroAcademicoBE18.Idregistroacademico = listaRegistroAcademicoBE[17].Idregistroacademico;
                objRegistroAcademicoBE18.Idegresado = idegresado;
                objRegistroAcademicoBE18.Nombreinstitucion = txtcentroEstudios18.Text;
                objRegistroAcademicoBE18.Duracionestudio = txtduracionEstudio18.Text;
                objRegistroAcademicoBE18.Tipoestudio = txttipoEstudio18.Text;
                objRegistroAcademicoBE18.Nombreestudio = txtnombreEstudio18.Text;
                objRegistroAcademicoBE18.Descripcionestudio = txtdescripcionEstudio18.Text;
                objRegistroAcademicoBE18.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA18.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE18))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 18)
            {
                RegistroAcademicoBE objRegistroAcademicoBE19 = new RegistroAcademicoBE();
                objRegistroAcademicoBE19.Idregistroacademico = listaRegistroAcademicoBE[18].Idregistroacademico;
                objRegistroAcademicoBE19.Idegresado = idegresado;
                objRegistroAcademicoBE19.Nombreinstitucion = txtcentroEstudios19.Text;
                objRegistroAcademicoBE19.Duracionestudio = txtduracionEstudio19.Text;
                objRegistroAcademicoBE19.Tipoestudio = txttipoEstudio19.Text;
                objRegistroAcademicoBE19.Nombreestudio = txtnombreEstudio19.Text;
                objRegistroAcademicoBE19.Descripcionestudio = txtdescripcionEstudio19.Text;
                objRegistroAcademicoBE19.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA19.Text);

                if (objRegistroAcademicoBC.actualizarregistroacademico(objRegistroAcademicoBE19))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 19)
            {
                RegistroAcademicoBE objRegistroAcademicoBE20 = new RegistroAcademicoBE();
                objRegistroAcademicoBE20.Idregistroacademico = listaRegistroAcademicoBE[19].Idregistroacademico;
                objRegistroAcademicoBE20.Idegresado = idegresado;
                objRegistroAcademicoBE20.Nombreinstitucion = txtcentroEstudios20.Text;
                objRegistroAcademicoBE20.Duracionestudio = txtduracionEstudio20.Text;
                objRegistroAcademicoBE20.Tipoestudio = txttipoEstudio20.Text;
                objRegistroAcademicoBE20.Nombreestudio = txtnombreEstudio20.Text;
                objRegistroAcademicoBE20.Descripcionestudio = txtdescripcionEstudio20.Text;
                objRegistroAcademicoBE20.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTA20.Text);

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
            
            int activadoagregar = (int)ViewState["RAActivado"];
            int activado = activadoagregar;

            listaRegistroAcademicoBE = objRegistroAcademicoBC.listarregistroacademico(idegresado);
            int cantidad = listaRegistroAcademicoBE.Count;
            

            if (txtcentroEstudios.Text == "" || txtcentroEstudios.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                txtcentroEstudios.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtcentroEstudios.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtduracionEstudio.Text == "" || txtduracionEstudio.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                txtduracionEstudio.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtduracionEstudio.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txttipoEstudio.Text == "" || txttipoEstudio.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                txttipoEstudio.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txttipoEstudio.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtnombreEstudio.Text == "" || txtnombreEstudio.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                txtnombreEstudio.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtnombreEstudio.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtdescripcionEstudio.Text == "" || txtdescripcionEstudio.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                txtdescripcionEstudio.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtdescripcionEstudio.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            //**//
            if ((cantidad + activado) > 1)
            {
                if (txtcentroEstudios2.Text == "" || txtcentroEstudios2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio2.Text == "" || txtduracionEstudio2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio2.Text == "" || txttipoEstudio2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio2.Text == "" || txtnombreEstudio2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio2.Text == "" || txtdescripcionEstudio2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 2)
            {
                if (txtcentroEstudios3.Text == "" || txtcentroEstudios3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio3.Text == "" || txtduracionEstudio3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio3.Text == "" || txttipoEstudio3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio3.Text == "" || txtnombreEstudio3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio3.Text == "" || txtdescripcionEstudio3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 3)
            {
                if (txtcentroEstudios4.Text == "" || txtcentroEstudios4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio4.Text == "" || txtduracionEstudio4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio4.Text == "" || txttipoEstudio4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio4.Text == "" || txtnombreEstudio4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio4.Text == "" || txtdescripcionEstudio4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 4)
            {
                if (txtcentroEstudios5.Text == "" || txtcentroEstudios5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio5.Text == "" || txtduracionEstudio5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio5.Text == "" || txttipoEstudio5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio5.Text == "" || txtnombreEstudio5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio5.Text == "" || txtdescripcionEstudio5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 5)
            {
                if (txtcentroEstudios6.Text == "" || txtcentroEstudios6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio6.Text == "" || txtduracionEstudio6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio6.Text == "" || txttipoEstudio6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio6.Text == "" || txtnombreEstudio6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio6.Text == "" || txtdescripcionEstudio6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 6)
            {
                if (txtcentroEstudios7.Text == "" || txtcentroEstudios7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio7.Text == "" || txtduracionEstudio7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio7.Text == "" || txttipoEstudio7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio7.Text == "" || txtnombreEstudio7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio7.Text == "" || txtdescripcionEstudio7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 7)
            {
                if (txtcentroEstudios8.Text == "" || txtcentroEstudios8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio8.Text == "" || txtduracionEstudio8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio8.Text == "" || txttipoEstudio8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio8.Text == "" || txtnombreEstudio8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio8.Text == "" || txtdescripcionEstudio8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 8)
            {
                if (txtcentroEstudios9.Text == "" || txtcentroEstudios9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio9.Text == "" || txtduracionEstudio9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio9.Text == "" || txttipoEstudio9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio9.Text == "" || txtnombreEstudio9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio9.Text == "" || txtdescripcionEstudio9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 9)
            {
                if (txtcentroEstudios10.Text == "" || txtcentroEstudios10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio10.Text == "" || txtduracionEstudio10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio10.Text == "" || txttipoEstudio10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio10.Text == "" || txtnombreEstudio10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio10.Text == "" || txtdescripcionEstudio10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 10)
            {
                if (txtcentroEstudios11.Text == "" || txtcentroEstudios11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio11.Text == "" || txtduracionEstudio.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio11.Text == "" || txttipoEstudio11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio11.Text == "" || txtnombreEstudio11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio11.Text == "" || txtdescripcionEstudio11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 11)
            {
                if (txtcentroEstudios12.Text == "" || txtcentroEstudios12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio12.Text == "" || txtduracionEstudio12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio12.Text == "" || txttipoEstudio12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio12.Text == "" || txtnombreEstudio12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio12.Text == "" || txtdescripcionEstudio12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 12)
            {
                if (txtcentroEstudios13.Text == "" || txtcentroEstudios13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio13.Text == "" || txtduracionEstudio13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio13.Text == "" || txttipoEstudio13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio13.Text == "" || txtnombreEstudio13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio13.Text == "" || txtdescripcionEstudio13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 13)
            {
                if (txtcentroEstudios14.Text == "" || txtcentroEstudios14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio14.Text == "" || txtduracionEstudio14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio14.Text == "" || txttipoEstudio14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio14.Text == "" || txtnombreEstudio14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio14.Text == "" || txtdescripcionEstudio14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 14)
            {
                if (txtcentroEstudios15.Text == "" || txtcentroEstudios15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio15.Text == "" || txtduracionEstudio.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio15.Text == "" || txttipoEstudio15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio15.Text == "" || txtnombreEstudio15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio15.Text == "" || txtdescripcionEstudio15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 15)
            {
                if (txtcentroEstudios16.Text == "" || txtcentroEstudios16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio16.Text == "" || txtduracionEstudio16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio16.Text == "" || txttipoEstudio16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio16.Text == "" || txtnombreEstudio16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio16.Text == "" || txtdescripcionEstudio.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 16)
            {
                if (txtcentroEstudios17.Text == "" || txtcentroEstudios17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio17.Text == "" || txtduracionEstudio17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio17.Text == "" || txttipoEstudio.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio17.Text == "" || txtnombreEstudio17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio17.Text == "" || txtdescripcionEstudio17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 17)
            {
                if (txtcentroEstudios18.Text == "" || txtcentroEstudios18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio18.Text == "" || txtduracionEstudio18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio18.Text == "" || txttipoEstudio18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio18.Text == "" || txtnombreEstudio18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio18.Text == "" || txtdescripcionEstudio18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 18)
            {
                if (txtcentroEstudios19.Text == "" || txtcentroEstudios19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio19.Text == "" || txtduracionEstudio19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio19.Text == "" || txttipoEstudio19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio19.Text == "" || txtnombreEstudio19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio19.Text == "" || txtdescripcionEstudio19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtdescripcionEstudio19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**//
            if ((cantidad + activado) > 19)
            {
                if (txtcentroEstudios20.Text == "" || txtcentroEstudios20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtcentroEstudios20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcentroEstudios20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio20.Text == "" || txtduracionEstudio20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtduracionEstudio20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttipoEstudio20.Text == "" || txttipoEstudio.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txttipoEstudio20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttipoEstudio20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombreEstudio20.Text == "" || txtnombreEstudio20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "camposVaciosRA", "camposVaciosRA();", true);
                    txtnombreEstudio20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEstudio20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio20.Text == "" || txtdescripcionEstudio20.Text == null)
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
            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultaragregarTA", "ocultaragregarTA();", true);
            
            int idegresado = IDEgresado;
            ViewState["RAActivado"] = 1;
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
            ViewState["RAActivado"] = 0;
            RegistroAcademicoBE objRegistroAcademicoBE = new RegistroAcademicoBE();
            List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();
            RegistroAcademicoBC objRegistroAcademicoBC = new RegistroAcademicoBC();

            listaRegistroAcademicoBE = objRegistroAcademicoBC.listarregistroacademico(idegresado);
            int cantidad = listaRegistroAcademicoBE.Count;

            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarBotonesTA", "ocultarBotonesTA();", true);
            ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTODOTryacetoriaAcademica", "deshabilitarTODOTryacetoriaAcademica();", true);

            if (cantidad == 1)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso2", "ocultarCurso2();", true);

            if (cantidad == 2)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso3", "ocultarCurso3();", true);

            if (cantidad == 3)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarCurso4", "ocultarCurso4();", true); 

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
                            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarBotonesTA", "ocultarBotonesTA();", true);
                            ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTODOTryacetoriaAcademica", "deshabilitarTODOTryacetoriaAcademica();", true);
                                ViewState["RAActivado"] = 0;
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
            int idegresado = IDEgresado;
            PaisBC objetoPaisBC = new PaisBC();
            RegistroLaboralBE objRegistroLaboralBE = new RegistroLaboralBE();
            List<RegistroLaboralBE> listaRegistroLaboralBE = new List<RegistroLaboralBE>();
            RegistroLaboralBC objRegistroLaboralBC = new RegistroLaboralBC();

            listaRegistroLaboralBE = objRegistroLaboralBC.listarregistrolaobral(idegresado);
            int cantidad = listaRegistroLaboralBE.Count;

            if (cantidad == 0)
            {
                if (txtnombreEmpresa.Text != null && txtnombreEmpresa.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL.Text);

                    if (cbotrabajoActual.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 1)
            {
                if (txtnombreEmpresa2.Text != null && txtnombreEmpresa2.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa2.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo2.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo2.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo2.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo2.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo2.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo2.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo2.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL2.Text);

                    if (cbotrabajoActual2.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 2)
            {
                if (txtnombreEmpresa3.Text != null && txtnombreEmpresa3.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa3.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo3.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo3.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo3.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo3.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo3.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo3.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo3.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL3.Text);

                    if (cbotrabajoActual3.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 3)
            {
                if (txtnombreEmpresa4.Text != null && txtnombreEmpresa4.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa4.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo4.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo4.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo4.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo4.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo4.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo4.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo4.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL4.Text);

                    if (cbotrabajoActual4.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 4)
            {
                if (txtnombreEmpresa5.Text != null && txtnombreEmpresa5.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa5.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo5.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo5.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo5.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo5.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo5.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo5.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo5.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL5.Text);

                    if (cbotrabajoActual5.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 5)
            {
                if (txtnombreEmpresa6.Text != null && txtnombreEmpresa6.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa6.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo6.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo6.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo6.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo6.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo6.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo6.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo6.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL6.Text);

                    if (cbotrabajoActual6.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 6)
            {
                if (txtnombreEmpresa7.Text != null && txtnombreEmpresa7.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa7.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo7.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo7.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo7.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo7.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo7.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo7.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo7.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL7.Text);

                    if (cbotrabajoActual7.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 7)
            {
                if (txtnombreEmpresa8.Text != null && txtnombreEmpresa8.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa8.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo8.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo8.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo8.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo8.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo8.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo8.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo8.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL8.Text);

                    if (cbotrabajoActual8.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 8)
            {
                if (txtnombreEmpresa9.Text != null && txtnombreEmpresa9.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa9.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo9.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo9.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo9.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo9.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo9.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo9.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo9.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL9.Text);

                    if (cbotrabajoActual9.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 9)
            {
                if (txtnombreEmpresa10.Text != null && txtnombreEmpresa10.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa10.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo10.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo10.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo10.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo10.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo10.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo10.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo10.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL10.Text);

                    if (cbotrabajoActual10.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 10)
            {
                if (txtnombreEmpresa11.Text != null && txtnombreEmpresa11.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa11.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo11.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo11.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo11.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo11.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo11.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo11.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo11.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL11.Text);

                    if (cbotrabajoActual11.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 11)
            {
                if (txtnombreEmpresa12.Text != null && txtnombreEmpresa12.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa12.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo12.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo12.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo12.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo12.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo12.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo12.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo12.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL12.Text);

                    if (cbotrabajoActual2.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 12)
            {
                if (txtnombreEmpresa13.Text != null && txtnombreEmpresa13.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa13.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo13.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo13.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo13.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo13.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo13.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo13.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo13.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL13.Text);

                    if (cbotrabajoActual13.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 13)
            {
                if (txtnombreEmpresa14.Text != null && txtnombreEmpresa14.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa14.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo14.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo14.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo14.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo14.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo14.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo14.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo14.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL14.Text);

                    if (cbotrabajoActual14.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 14)
            {
                if (txtnombreEmpresa15.Text != null && txtnombreEmpresa15.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa15.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo15.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo15.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo15.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo15.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo15.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo15.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo15.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL15.Text);

                    if (cbotrabajoActual15.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 15)
            {
                if (txtnombreEmpresa16.Text != null && txtnombreEmpresa16.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa16.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo16.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo16.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo16.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo16.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo16.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo16.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo16.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL16.Text);

                    if (cbotrabajoActual16.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 16)
            {
                if (txtnombreEmpresa17.Text != null && txtnombreEmpresa17.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa17.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo17.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo17.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo17.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo17.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo17.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo17.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo17.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL17.Text);

                    if (cbotrabajoActual17.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 17)
            {
                if (txtnombreEmpresa18.Text != null && txtnombreEmpresa18.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa18.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo18.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo18.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo18.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo18.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo18.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo18.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo18.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL18.Text);

                    if (cbotrabajoActual18.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 18)
            {
                if (txtnombreEmpresa19.Text != null && txtnombreEmpresa19.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa19.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo19.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo19.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo19.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo19.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo19.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo19.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo19.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL19.Text);

                    if (cbotrabajoActual19.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }

            if (cantidad == 19)
            {
                if (txtnombreEmpresa20.Text != null && txtnombreEmpresa20.Text != "")
                {
                    objRegistroLaboralBE.Idegresado = idegresado;
                    objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa20.Text;
                    objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo20.Text;
                    objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo20.Text;
                    objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo20.Text;
                    objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo20.Text;
                    objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo20.Text;
                    objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo20.Text;
                    objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo20.Text;
                    objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL20.Text);

                    if (cbotrabajoActual20.Checked)
                        objRegistroLaboralBE.Trabajoactual = true;
                    else
                        objRegistroLaboralBE.Trabajoactual = false;

                    if (objRegistroLaboralBC.insertarregistrolaboral(objRegistroLaboralBE) != 0)
                        exito = 1;
                    else
                        exito = 0;
                }
            }


            return exito;
        }

        public bool actualizarRegistroLaboral()
        {
            bool exito = false;
            int idegresado = IDEgresado;
            PaisBC objetoPaisBC = new PaisBC();
            RegistroLaboralBE objRegistroLaboralBE = new RegistroLaboralBE();
            List<RegistroLaboralBE> listaRegistroLaboralBE = new List<RegistroLaboralBE>();
            RegistroLaboralBC objRegistroLaboralBC = new RegistroLaboralBC();

            listaRegistroLaboralBE = objRegistroLaboralBC.listarregistrolaobral(idegresado);
            int cantidad = listaRegistroLaboralBE.Count;

            if (cantidad == 0)
                return false;

            objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[0].Idregistrolaboral;
            objRegistroLaboralBE.Idegresado = idegresado;
            objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa.Text;
            objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo.Text;
            objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo.Text;
            objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo.Text;
            objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo.Text;
            objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo.Text;
            objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo.Text;
            objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo.Text;
            objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL.Text);

            if (cbotrabajoActual.Checked)
                objRegistroLaboralBE.Trabajoactual = true;
            else
                objRegistroLaboralBE.Trabajoactual = false;

            if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                exito = true;
            else
                return false;

            if (cantidad > 1)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[1].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa2.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo2.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo2.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo2.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo2.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo2.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo2.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo2.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL2.Text);

                if (cbotrabajoActual2.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 2)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[2].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa3.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo3.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo3.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo3.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo3.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo3.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo3.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo3.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL3.Text);

                if (cbotrabajoActual3.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 3)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[3].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa4.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo4.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo4.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo4.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo4.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo4.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo4.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo4.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL4.Text);

                if (cbotrabajoActual4.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 4)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[4].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa5.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo5.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo5.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo5.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo5.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo5.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo5.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo5.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL5.Text);

                if (cbotrabajoActual5.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 5)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[5].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa6.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo6.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo6.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo6.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo6.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo6.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo6.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo6.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL6.Text);

                if (cbotrabajoActual6.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 6)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[6].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa7.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo7.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo7.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo7.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo7.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo7.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo7.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo7.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL7.Text);

                if (cbotrabajoActual7.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 7)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[7].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa8.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo8.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo8.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo8.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo8.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo8.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo8.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo8.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL8.Text);

                if (cbotrabajoActual8.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 8)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[8].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa9.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo9.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo9.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo9.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo9.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo9.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo9.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo9.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL9.Text);

                if (cbotrabajoActual9.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 9)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[9].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa10.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo10.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo10.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo10.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo10.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo10.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo10.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo10.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL10.Text);

                if (cbotrabajoActual10.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 10)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[10].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa11.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo11.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo11.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo11.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo11.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo11.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo11.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo11.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL11.Text);

                if (cbotrabajoActual11.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 11)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[11].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa12.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo12.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo12.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo12.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo12.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo12.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo12.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo12.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL12.Text);

                if (cbotrabajoActual12.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 12)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[12].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa13.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo13.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo13.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo13.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo13.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo13.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo13.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo13.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL13.Text);

                if (cbotrabajoActual13.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 13)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[13].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa14.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo14.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo14.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo14.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo14.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo14.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo14.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo14.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL14.Text);

                if (cbotrabajoActual14.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 14)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[14].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa15.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo15.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo15.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo15.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo15.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo15.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo15.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo15.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL15.Text);

                if (cbotrabajoActual15.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 15)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[15].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa16.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo16.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo16.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo16.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo16.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo16.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo16.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo16.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL16.Text);

                if (cbotrabajoActual16.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 16)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[16].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa17.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo17.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo17.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo17.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo17.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo17.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo17.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo17.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL17.Text);

                if (cbotrabajoActual17.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 17)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[17].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa18.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo18.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo18.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo18.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo18.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo18.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo18.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo18.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL18.Text);

                if (cbotrabajoActual18.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 18)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[18].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa19.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo19.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo19.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo19.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo19.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo19.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo19.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo19.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL19.Text);

                if (cbotrabajoActual19.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            if (cantidad > 19)
            {
                objRegistroLaboralBE.Idregistrolaboral = listaRegistroLaboralBE[19].Idregistrolaboral;
                objRegistroLaboralBE.Idegresado = idegresado;
                objRegistroLaboralBE.Nombretrabajo = txtnombreEmpresa20.Text;
                objRegistroLaboralBE.Cargotrabajo = txtcargoTrabajo20.Text;
                objRegistroLaboralBE.Duraciontrabajo = txtduracionTrabajo20.Text;
                objRegistroLaboralBE.Descripciontrabajo = txtdescripcionTrabajo20.Text;
                objRegistroLaboralBE.Nombrejefetrabajo = txtnombrejefeTrabajo20.Text;
                objRegistroLaboralBE.Cargojefetrabajo = txtcargojefeTrabajo20.Text;
                objRegistroLaboralBE.Telefonojefetrabajo = txttelefonojefeTrabajo20.Text;
                objRegistroLaboralBE.Correojefetrabajo = txtcorreojefeTrabajo20.Text;
                objRegistroLaboralBE.Idpais = objetoPaisBC.obtenerPaisID(ddlPaisTL20.Text);

                if (cbotrabajoActual20.Checked)
                    objRegistroLaboralBE.Trabajoactual = true;
                else
                    objRegistroLaboralBE.Trabajoactual = false;

                if (objRegistroLaboralBC.actualizarregistrolaboral(objRegistroLaboralBE))
                    exito = true;
                else
                    return false;
            }

            return exito;
        }

        public bool validarcamposRL()
        {
            bool error = false;
            bool correojefe1;
            bool correojefe2;
            bool correojefe3;
            bool correojefe4;
            bool correojefe5;
            bool correojefe6;
            bool correojefe7;
            bool correojefe8;
            bool correojefe9;
            bool correojefe10;
            bool correojefe11;
            bool correojefe12;
            bool correojefe13;
            bool correojefe14;
            bool correojefe15;
            bool correojefe16;
            bool correojefe17;
            bool correojefe18;
            bool correojefe19;
            bool correojefe20;
            int agregarActivado = (int)ViewState["RLActivado"];
            int activado = agregarActivado;

            int idegresado = IDEgresado;
            RegistroLaboralBE objRegistroLaboralBE = new RegistroLaboralBE();
            List<RegistroLaboralBE> listaRegistroLaboralBE = new List<RegistroLaboralBE>();
            RegistroLaboralBC objRegistroLaboralBC = new RegistroLaboralBC();

            listaRegistroLaboralBE = objRegistroLaboralBC.listarregistrolaobral(idegresado);
            int cantidad = listaRegistroLaboralBE.Count;

            ValidarCorreo objetovalidarcorreo = new ValidarCorreo();
            correojefe1 = objetovalidarcorreo.IsValidEmail(txtcorreojefeTrabajo.Text.Trim());

            if (!correojefe1)
            {
                txtcorreojefeTrabajo.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }

            if ((cantidad + activado) > 1)
            {
                ValidarCorreo objetovalidarcorreo2 = new ValidarCorreo();
                correojefe2 = objetovalidarcorreo2.IsValidEmail(txtcorreojefeTrabajo2.Text.Trim());

                if (!correojefe2)
                {
                    txtcorreojefeTrabajo2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 2)
            {
                ValidarCorreo objetovalidarcorreo3 = new ValidarCorreo();
                correojefe3 = objetovalidarcorreo3.IsValidEmail(txtcorreojefeTrabajo3.Text.Trim());

                if (!correojefe3)
                {
                    txtcorreojefeTrabajo3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 3)
            {
                ValidarCorreo objetovalidarcorreo4 = new ValidarCorreo();
                correojefe4 = objetovalidarcorreo4.IsValidEmail(txtcorreojefeTrabajo4.Text.Trim());

                if (!correojefe4)
                {
                    txtcorreojefeTrabajo4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 4)
            {
                ValidarCorreo objetovalidarcorreo5 = new ValidarCorreo();
                correojefe5 = objetovalidarcorreo5.IsValidEmail(txtcorreojefeTrabajo5.Text.Trim());

                if (!correojefe5)
                {
                    txtcorreojefeTrabajo5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 5)
            {
                ValidarCorreo objetovalidarcorreo6 = new ValidarCorreo();
                correojefe6 = objetovalidarcorreo6.IsValidEmail(txtcorreojefeTrabajo6.Text.Trim());

                if (!correojefe6)
                {
                    txtcorreojefeTrabajo6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 6)
            {
                ValidarCorreo objetovalidarcorreo7 = new ValidarCorreo();
                correojefe7 = objetovalidarcorreo7.IsValidEmail(txtcorreojefeTrabajo7.Text.Trim());

                if (!correojefe7)
                {
                    txtcorreojefeTrabajo7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 7)
            {
                ValidarCorreo objetovalidarcorreo8 = new ValidarCorreo();
                correojefe8 = objetovalidarcorreo8.IsValidEmail(txtcorreojefeTrabajo8.Text.Trim());

                if (!correojefe8)
                {
                    txtcorreojefeTrabajo8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 8)
            {
                ValidarCorreo objetovalidarcorreo9 = new ValidarCorreo();
                correojefe9 = objetovalidarcorreo9.IsValidEmail(txtcorreojefeTrabajo9.Text.Trim());

                if (!correojefe9)
                {
                    txtcorreojefeTrabajo9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 9)
            {
                ValidarCorreo objetovalidarcorreo10 = new ValidarCorreo();
                correojefe10 = objetovalidarcorreo10.IsValidEmail(txtcorreojefeTrabajo10.Text.Trim());

                if (!correojefe10)
                {
                    txtcorreojefeTrabajo10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 10)
            {
                ValidarCorreo objetovalidarcorreo11 = new ValidarCorreo();
                correojefe11 = objetovalidarcorreo11.IsValidEmail(txtcorreojefeTrabajo11.Text.Trim());

                if (!correojefe11)
                {
                    txtcorreojefeTrabajo11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 11)
            {
                ValidarCorreo objetovalidarcorreo12 = new ValidarCorreo();
                correojefe12 = objetovalidarcorreo12.IsValidEmail(txtcorreojefeTrabajo12.Text.Trim());

                if (!correojefe12)
                {
                    txtcorreojefeTrabajo12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 12)
            {
                ValidarCorreo objetovalidarcorreo13 = new ValidarCorreo();
                correojefe13 = objetovalidarcorreo13.IsValidEmail(txtcorreojefeTrabajo13.Text.Trim());

                if (!correojefe13)
                {
                    txtcorreojefeTrabajo13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 13)
            {
                ValidarCorreo objetovalidarcorreo14 = new ValidarCorreo();
                correojefe14 = objetovalidarcorreo14.IsValidEmail(txtcorreojefeTrabajo14.Text.Trim());

                if (!correojefe14)
                {
                    txtcorreojefeTrabajo14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 14)
            {
                ValidarCorreo objetovalidarcorreo15 = new ValidarCorreo();
                correojefe15 = objetovalidarcorreo15.IsValidEmail(txtcorreojefeTrabajo15.Text.Trim());

                if (!correojefe15)
                {
                    txtcorreojefeTrabajo15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 15)
            {
                ValidarCorreo objetovalidarcorreo16 = new ValidarCorreo();
                correojefe16 = objetovalidarcorreo16.IsValidEmail(txtcorreojefeTrabajo16.Text.Trim());

                if (!correojefe16)
                {
                    txtcorreojefeTrabajo16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 16)
            {
                ValidarCorreo objetovalidarcorreo17 = new ValidarCorreo();
                correojefe17 = objetovalidarcorreo17.IsValidEmail(txtcorreojefeTrabajo17.Text.Trim());

                if (!correojefe17)
                {
                    txtcorreojefeTrabajo17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 17)
            {
                ValidarCorreo objetovalidarcorreo18 = new ValidarCorreo();
                correojefe18 = objetovalidarcorreo18.IsValidEmail(txtcorreojefeTrabajo18.Text.Trim());

                if (!correojefe18)
                {
                    txtcorreojefeTrabajo18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 18)
            {
                ValidarCorreo objetovalidarcorreo19 = new ValidarCorreo();
                correojefe19 = objetovalidarcorreo19.IsValidEmail(txtcorreojefeTrabajo19.Text.Trim());

                if (!correojefe19)
                {
                    txtcorreojefeTrabajo19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
            }

            if ((cantidad + activado) > 19)
            {
                ValidarCorreo objetovalidarcorreo20 = new ValidarCorreo();
                correojefe20 = objetovalidarcorreo20.IsValidEmail(txtcorreojefeTrabajo20.Text.Trim());

                if (!correojefe20)
                {
                    txtcorreojefeTrabajo20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }

                if (error)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "incompletoRL", "incompletoRL();", true);
                    return false;
                }
            }

            return true;
        }

        public bool validarformRegistroLaboral()
        {
            bool error = false;
            int idegresado = IDEgresado;
            PaisBC objetoPaisBC = new PaisBC();
            RegistroLaboralBE objRegistroLaboralBE = new RegistroLaboralBE();
            List<RegistroLaboralBE> listaRegistroLaboralBE = new List<RegistroLaboralBE>();
            RegistroLaboralBC objRegistroLaboralBC = new RegistroLaboralBC();

            int agregarActivado = (int)ViewState["RLActivado"];
            int activado = agregarActivado;

            listaRegistroLaboralBE = objRegistroLaboralBC.listarregistrolaobral(idegresado);
            int cantidad = listaRegistroLaboralBE.Count;

            if (txtnombreEmpresa.Text == "" || txtnombreEmpresa.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa", "camposVaciosRL();", true);
                txtnombreEmpresa.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtnombreEmpresa.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtcargoTrabajo.Text == "" || txtcargoTrabajo.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo", "camposVaciosRL();", true);
                txtcargoTrabajo.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtcargoTrabajo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if(txtduracionEstudio.Text == "" || txtduracionEstudio.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio", "camposVaciosRL();", true);
                txtduracionEstudio.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtduracionEstudio.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtdescripcionEstudio.Text == "" || txtdescripcionEstudio.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio", "camposVaciosRL();", true);
                txtdescripcionEstudio.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtdescripcionEstudio.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtnombrejefeTrabajo.Text == "" || txtnombrejefeTrabajo.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo", "camposVaciosRL();", true);
                txtnombrejefeTrabajo.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtnombrejefeTrabajo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtcargojefeTrabajo.Text == "" || txtcargojefeTrabajo.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo", "camposVaciosRL();", true);
                txtcargojefeTrabajo.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtcargojefeTrabajo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txttelefonojefeTrabajo.Text == "" || txttelefonojefeTrabajo.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo", "camposVaciosRL();", true);
                txttelefonojefeTrabajo.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txttelefonojefeTrabajo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtcorreojefeTrabajo.Text == "" || txtcorreojefeTrabajo.Text == null)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo", "camposVaciosRL();", true);
                txtcorreojefeTrabajo.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;
            }
            else
                txtcorreojefeTrabajo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            //**--**//
            if ((cantidad + activado) > 1)
            {
                if (txtnombreEmpresa2.Text == "" || txtnombreEmpresa2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa2", "camposVaciosRL();", true);
                    txtnombreEmpresa2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo2.Text == "" || txtcargoTrabajo2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo2", "camposVaciosRL();", true);
                    txtcargoTrabajo2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio2.Text == "" || txtduracionEstudio2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio2", "camposVaciosRL();", true);
                    txtduracionEstudio2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio2.Text == "" || txtdescripcionEstudio2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio2", "camposVaciosRL();", true);
                    txtdescripcionEstudio2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo2.Text == "" || txtnombrejefeTrabajo2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo2", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo2.Text == "" || txtcargojefeTrabajo2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo2", "camposVaciosRL();", true);
                    txtcargojefeTrabajo2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo2.Text == "" || txttelefonojefeTrabajo2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo2", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo2.Text == "" || txtcorreojefeTrabajo2.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo2", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo2.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 2)
            {
                if (txtnombreEmpresa3.Text == "" || txtnombreEmpresa3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa3", "camposVaciosRL();", true);
                    txtnombreEmpresa3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo3.Text == "" || txtcargoTrabajo3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo3", "camposVaciosRL();", true);
                    txtcargoTrabajo3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio3.Text == "" || txtduracionEstudio3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio3", "camposVaciosRL();", true);
                    txtduracionEstudio3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio3.Text == "" || txtdescripcionEstudio3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio3", "camposVaciosRL();", true);
                    txtdescripcionEstudio3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo3.Text == "" || txtnombrejefeTrabajo3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo3", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo3.Text == "" || txtcargojefeTrabajo3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo3", "camposVaciosRL();", true);
                    txtcargojefeTrabajo3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo3.Text == "" || txttelefonojefeTrabajo3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo3", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo3.Text == "" || txtcorreojefeTrabajo3.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo3", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo3.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo3.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 3)
            {
                if (txtnombreEmpresa4.Text == "" || txtnombreEmpresa4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa4", "camposVaciosRL();", true);
                    txtnombreEmpresa4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo4.Text == "" || txtcargoTrabajo4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo4", "camposVaciosRL();", true);
                    txtcargoTrabajo4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio4.Text == "" || txtduracionEstudio4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio4", "camposVaciosRL();", true);
                    txtduracionEstudio4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio4.Text == "" || txtdescripcionEstudio4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio4", "camposVaciosRL();", true);
                    txtdescripcionEstudio4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo4.Text == "" || txtnombrejefeTrabajo4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo4", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo4.Text == "" || txtcargojefeTrabajo4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo4", "camposVaciosRL();", true);
                    txtcargojefeTrabajo4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo4.Text == "" || txttelefonojefeTrabajo4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo4", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo4.Text == "" || txtcorreojefeTrabajo4.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo4", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo4.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo4.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 4)
            {
                if (txtnombreEmpresa5.Text == "" || txtnombreEmpresa5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa5", "camposVaciosRL();", true);
                    txtnombreEmpresa5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo5.Text == "" || txtcargoTrabajo5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo5", "camposVaciosRL();", true);
                    txtcargoTrabajo5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio5.Text == "" || txtduracionEstudio5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio5", "camposVaciosRL();", true);
                    txtduracionEstudio5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio5.Text == "" || txtdescripcionEstudio5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio5", "camposVaciosRL();", true);
                    txtdescripcionEstudio5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo5.Text == "" || txtnombrejefeTrabajo5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo5", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo5.Text == "" || txtcargojefeTrabajo5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo5", "camposVaciosRL();", true);
                    txtcargojefeTrabajo5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo5.Text == "" || txttelefonojefeTrabajo5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo5", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo5.Text == "" || txtcorreojefeTrabajo5.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo5", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo5.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo5.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 5)
            {
                if (txtnombreEmpresa6.Text == "" || txtnombreEmpresa6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa6", "camposVaciosRL();", true);
                    txtnombreEmpresa6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo6.Text == "" || txtcargoTrabajo6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo6", "camposVaciosRL();", true);
                    txtcargoTrabajo6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio6.Text == "" || txtduracionEstudio6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio6", "camposVaciosRL();", true);
                    txtduracionEstudio6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio6.Text == "" || txtdescripcionEstudio6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio6", "camposVaciosRL();", true);
                    txtdescripcionEstudio6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo6.Text == "" || txtnombrejefeTrabajo6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo6", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo6.Text == "" || txtcargojefeTrabajo6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo6", "camposVaciosRL();", true);
                    txtcargojefeTrabajo6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo6.Text == "" || txttelefonojefeTrabajo6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo6", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo6.Text == "" || txtcorreojefeTrabajo6.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo6", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo6.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo6.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 6)
            {
                if (txtnombreEmpresa7.Text == "" || txtnombreEmpresa7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa7", "camposVaciosRL();", true);
                    txtnombreEmpresa7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo7.Text == "" || txtcargoTrabajo7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo7", "camposVaciosRL();", true);
                    txtcargoTrabajo7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio7.Text == "" || txtduracionEstudio7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio7", "camposVaciosRL();", true);
                    txtduracionEstudio7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio7.Text == "" || txtdescripcionEstudio7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio7", "camposVaciosRL();", true);
                    txtdescripcionEstudio7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo7.Text == "" || txtnombrejefeTrabajo7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo7", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo7.Text == "" || txtcargojefeTrabajo7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo7", "camposVaciosRL();", true);
                    txtcargojefeTrabajo7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo7.Text == "" || txttelefonojefeTrabajo7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo7", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo7.Text == "" || txtcorreojefeTrabajo7.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo7", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo7.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo7.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 7)
            {
                if (txtnombreEmpresa8.Text == "" || txtnombreEmpresa8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa8", "camposVaciosRL();", true);
                    txtnombreEmpresa8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo8.Text == "" || txtcargoTrabajo8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo8", "camposVaciosRL();", true);
                    txtcargoTrabajo8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio8.Text == "" || txtduracionEstudio8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio8", "camposVaciosRL();", true);
                    txtduracionEstudio8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio8.Text == "" || txtdescripcionEstudio8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio8", "camposVaciosRL();", true);
                    txtdescripcionEstudio8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo8.Text == "" || txtnombrejefeTrabajo8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo8", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo8.Text == "" || txtcargojefeTrabajo8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo8", "camposVaciosRL();", true);
                    txtcargojefeTrabajo8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo8.Text == "" || txttelefonojefeTrabajo8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo8", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo8.Text == "" || txtcorreojefeTrabajo8.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo8", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo8.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo8.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 8)
            {
                if (txtnombreEmpresa9.Text == "" || txtnombreEmpresa9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa9", "camposVaciosRL();", true);
                    txtnombreEmpresa9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo9.Text == "" || txtcargoTrabajo9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo9", "camposVaciosRL();", true);
                    txtcargoTrabajo9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio9.Text == "" || txtduracionEstudio9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio9", "camposVaciosRL();", true);
                    txtduracionEstudio9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio9.Text == "" || txtdescripcionEstudio9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio9", "camposVaciosRL();", true);
                    txtdescripcionEstudio9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo9.Text == "" || txtnombrejefeTrabajo9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo9", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo9.Text == "" || txtcargojefeTrabajo9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo9", "camposVaciosRL();", true);
                    txtcargojefeTrabajo9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo9.Text == "" || txttelefonojefeTrabajo9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo9", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo9.Text == "" || txtcorreojefeTrabajo9.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo9", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo9.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo9.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 9)
            {
                if (txtnombreEmpresa10.Text == "" || txtnombreEmpresa10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa10", "camposVaciosRL();", true);
                    txtnombreEmpresa10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo10.Text == "" || txtcargoTrabajo10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo10", "camposVaciosRL();", true);
                    txtcargoTrabajo10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio10.Text == "" || txtduracionEstudio10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio10", "camposVaciosRL();", true);
                    txtduracionEstudio10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio10.Text == "" || txtdescripcionEstudio10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio10", "camposVaciosRL();", true);
                    txtdescripcionEstudio10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo10.Text == "" || txtnombrejefeTrabajo10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo10", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo10.Text == "" || txtcargojefeTrabajo10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo10", "camposVaciosRL();", true);
                    txtcargojefeTrabajo10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo10.Text == "" || txttelefonojefeTrabajo10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo10", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo10.Text == "" || txtcorreojefeTrabajo10.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo10", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo10.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo10.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 10)
            {
                if (txtnombreEmpresa11.Text == "" || txtnombreEmpresa11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa11", "camposVaciosRL();", true);
                    txtnombreEmpresa11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo11.Text == "" || txtcargoTrabajo11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo11", "camposVaciosRL();", true);
                    txtcargoTrabajo11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio11.Text == "" || txtduracionEstudio11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio11", "camposVaciosRL();", true);
                    txtduracionEstudio11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio11.Text == "" || txtdescripcionEstudio11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio11", "camposVaciosRL();", true);
                    txtdescripcionEstudio11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo11.Text == "" || txtnombrejefeTrabajo11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo11", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo11.Text == "" || txtcargojefeTrabajo11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo11", "camposVaciosRL();", true);
                    txtcargojefeTrabajo11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo11.Text == "" || txttelefonojefeTrabajo11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo11", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo11.Text == "" || txtcorreojefeTrabajo11.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo11", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo11.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo11.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 11)
            {
                if (txtnombreEmpresa12.Text == "" || txtnombreEmpresa12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa12", "camposVaciosRL();", true);
                    txtnombreEmpresa12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo12.Text == "" || txtcargoTrabajo12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo12", "camposVaciosRL();", true);
                    txtcargoTrabajo12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio12.Text == "" || txtduracionEstudio12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio12", "camposVaciosRL();", true);
                    txtduracionEstudio12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio12.Text == "" || txtdescripcionEstudio12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio12", "camposVaciosRL();", true);
                    txtdescripcionEstudio12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo12.Text == "" || txtnombrejefeTrabajo12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo12", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo12.Text == "" || txtcargojefeTrabajo12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo12", "camposVaciosRL();", true);
                    txtcargojefeTrabajo12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo12.Text == "" || txttelefonojefeTrabajo12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo12", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo12.Text == "" || txtcorreojefeTrabajo12.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo12", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo12.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo12.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 12)
            {
                if (txtnombreEmpresa13.Text == "" || txtnombreEmpresa13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa13", "camposVaciosRL();", true);
                    txtnombreEmpresa13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo13.Text == "" || txtcargoTrabajo13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo13", "camposVaciosRL();", true);
                    txtcargoTrabajo13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio13.Text == "" || txtduracionEstudio13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio13", "camposVaciosRL();", true);
                    txtduracionEstudio13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio13.Text == "" || txtdescripcionEstudio13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio13", "camposVaciosRL();", true);
                    txtdescripcionEstudio13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo13.Text == "" || txtnombrejefeTrabajo13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo13", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo13.Text == "" || txtcargojefeTrabajo13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo13", "camposVaciosRL();", true);
                    txtcargojefeTrabajo13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo13.Text == "" || txttelefonojefeTrabajo13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo13", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo13.Text == "" || txtcorreojefeTrabajo13.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo13", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo13.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo13.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 13)
            {
                if (txtnombreEmpresa14.Text == "" || txtnombreEmpresa14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa14", "camposVaciosRL();", true);
                    txtnombreEmpresa14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo14.Text == "" || txtcargoTrabajo14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo14", "camposVaciosRL();", true);
                    txtcargoTrabajo14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio14.Text == "" || txtduracionEstudio14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio14", "camposVaciosRL();", true);
                    txtduracionEstudio14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio14.Text == "" || txtdescripcionEstudio14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio14", "camposVaciosRL();", true);
                    txtdescripcionEstudio14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo14.Text == "" || txtnombrejefeTrabajo14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo14", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo14.Text == "" || txtcargojefeTrabajo14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo14", "camposVaciosRL();", true);
                    txtcargojefeTrabajo14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo14.Text == "" || txttelefonojefeTrabajo14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo14", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo14.Text == "" || txtcorreojefeTrabajo14.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo14", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo14.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo14.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 14)
            {
                if (txtnombreEmpresa15.Text == "" || txtnombreEmpresa15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa15", "camposVaciosRL();", true);
                    txtnombreEmpresa15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo15.Text == "" || txtcargoTrabajo15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo15", "camposVaciosRL();", true);
                    txtcargoTrabajo15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio15.Text == "" || txtduracionEstudio15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio15", "camposVaciosRL();", true);
                    txtduracionEstudio15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio15.Text == "" || txtdescripcionEstudio15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio15", "camposVaciosRL();", true);
                    txtdescripcionEstudio15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo15.Text == "" || txtnombrejefeTrabajo15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo15", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo15.Text == "" || txtcargojefeTrabajo15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo15", "camposVaciosRL();", true);
                    txtcargojefeTrabajo15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo15.Text == "" || txttelefonojefeTrabajo15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo15", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo15.Text == "" || txtcorreojefeTrabajo15.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo15", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo15.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo15.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 15)
            {
                if (txtnombreEmpresa16.Text == "" || txtnombreEmpresa16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa16", "camposVaciosRL();", true);
                    txtnombreEmpresa16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo16.Text == "" || txtcargoTrabajo16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo16", "camposVaciosRL();", true);
                    txtcargoTrabajo16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio16.Text == "" || txtduracionEstudio16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio16", "camposVaciosRL();", true);
                    txtduracionEstudio16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio16.Text == "" || txtdescripcionEstudio16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio16", "camposVaciosRL();", true);
                    txtdescripcionEstudio16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo16.Text == "" || txtnombrejefeTrabajo16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo16", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo16.Text == "" || txtcargojefeTrabajo16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo16", "camposVaciosRL();", true);
                    txtcargojefeTrabajo16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo16.Text == "" || txttelefonojefeTrabajo16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo16", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo16.Text == "" || txtcorreojefeTrabajo16.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo16", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo16.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo16.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 16)
            {
                if (txtnombreEmpresa17.Text == "" || txtnombreEmpresa17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa17", "camposVaciosRL();", true);
                    txtnombreEmpresa17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo17.Text == "" || txtcargoTrabajo17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo17", "camposVaciosRL();", true);
                    txtcargoTrabajo17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio17.Text == "" || txtduracionEstudio17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio17", "camposVaciosRL();", true);
                    txtduracionEstudio17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio17.Text == "" || txtdescripcionEstudio17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio17", "camposVaciosRL();", true);
                    txtdescripcionEstudio17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo17.Text == "" || txtnombrejefeTrabajo17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo17", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo17.Text == "" || txtcargojefeTrabajo17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo17", "camposVaciosRL();", true);
                    txtcargojefeTrabajo17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo17.Text == "" || txttelefonojefeTrabajo17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo17", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo17.Text == "" || txtcorreojefeTrabajo17.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo17", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo17.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo17.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 17)
            {
                if (txtnombreEmpresa18.Text == "" || txtnombreEmpresa18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa18", "camposVaciosRL();", true);
                    txtnombreEmpresa18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo18.Text == "" || txtcargoTrabajo18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo18", "camposVaciosRL();", true);
                    txtcargoTrabajo18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio18.Text == "" || txtduracionEstudio18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio18", "camposVaciosRL();", true);
                    txtduracionEstudio18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio18.Text == "" || txtdescripcionEstudio18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio18", "camposVaciosRL();", true);
                    txtdescripcionEstudio18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo18.Text == "" || txtnombrejefeTrabajo18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo18", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo18.Text == "" || txtcargojefeTrabajo18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo18", "camposVaciosRL();", true);
                    txtcargojefeTrabajo18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo18.Text == "" || txttelefonojefeTrabajo18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo18", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo18.Text == "" || txtcorreojefeTrabajo18.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo18", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo18.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo18.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 18)
            {
                if (txtnombreEmpresa19.Text == "" || txtnombreEmpresa19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa19", "camposVaciosRL();", true);
                    txtnombreEmpresa19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo19.Text == "" || txtcargoTrabajo19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo19", "camposVaciosRL();", true);
                    txtcargoTrabajo19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio19.Text == "" || txtduracionEstudio19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio19", "camposVaciosRL();", true);
                    txtduracionEstudio19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio19.Text == "" || txtdescripcionEstudio19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio19", "camposVaciosRL();", true);
                    txtdescripcionEstudio19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo19.Text == "" || txtnombrejefeTrabajo19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo19", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo19.Text == "" || txtcargojefeTrabajo19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo19", "camposVaciosRL();", true);
                    txtcargojefeTrabajo19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo19.Text == "" || txttelefonojefeTrabajo19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo19", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo19.Text == "" || txtcorreojefeTrabajo19.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo19", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo19.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo19.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }
            //**--**//
            if ((cantidad + activado) > 19)
            {
                if (txtnombreEmpresa20.Text == "" || txtnombreEmpresa20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombreEmpresa20", "camposVaciosRL();", true);
                    txtnombreEmpresa20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombreEmpresa20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargoTrabajo20.Text == "" || txtcargoTrabajo20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargoTrabajo20", "camposVaciosRL();", true);
                    txtcargoTrabajo20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargoTrabajo20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtduracionEstudio20.Text == "" || txtduracionEstudio20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtduracionEstudio20", "camposVaciosRL();", true);
                    txtduracionEstudio20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtduracionEstudio20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtdescripcionEstudio20.Text == "" || txtdescripcionEstudio20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtdescripcionEstudio20", "camposVaciosRL();", true);
                    txtdescripcionEstudio20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtdescripcionEstudio20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtnombrejefeTrabajo20.Text == "" || txtnombrejefeTrabajo20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtnombrejefeTrabajo20", "camposVaciosRL();", true);
                    txtnombrejefeTrabajo20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtnombrejefeTrabajo20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcargojefeTrabajo20.Text == "" || txtcargojefeTrabajo20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcargojefeTrabajo20", "camposVaciosRL();", true);
                    txtcargojefeTrabajo20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcargojefeTrabajo20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txttelefonojefeTrabajo20.Text == "" || txttelefonojefeTrabajo20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txttelefonojefeTrabajo20", "camposVaciosRL();", true);
                    txttelefonojefeTrabajo20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txttelefonojefeTrabajo20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

                if (txtcorreojefeTrabajo20.Text == "" || txtcorreojefeTrabajo20.Text == null)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "txtcorreojefeTrabajo20", "camposVaciosRL();", true);
                    txtcorreojefeTrabajo20.BorderColor = System.Drawing.Color.OrangeRed;
                    error = true;
                }
                else
                    txtcorreojefeTrabajo20.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
            }

            if (error)
                return false;

            return true;
        }

        protected void btneditarRL_Click(object sender, EventArgs e)
        {
            int idegresado = IDEgresado;
            RegistroLaboralBE objRegistroLaboralBE = new RegistroLaboralBE();
            List<RegistroLaboralBE> listaRegistroLaboralBE = new List<RegistroLaboralBE>();
            RegistroLaboralBC objRegistroLaboralBC = new RegistroLaboralBC();

            listaRegistroLaboralBE = objRegistroLaboralBC.listarregistrolaobral(idegresado);
            int cantidad = listaRegistroLaboralBE.Count;

            ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarBotonesTL", "mostrarBotonesTL();", true);
            ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral1", "habilitarTrayectoriaLaboral1();", true);

            if (cantidad > 1)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral2", "habilitarTrayectoriaLaboral2();", true);

            if (cantidad > 2)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral3", "habilitarTrayectoriaLaboral3();", true);

            if (cantidad > 3)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral4", "habilitarTrayectoriaLaboral4();", true);

            if (cantidad > 4)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral5", "habilitarTrayectoriaLaboral5();", true);

            if (cantidad > 5)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral6", "habilitarTrayectoriaLaboral6();", true);

            if (cantidad > 6)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral7", "habilitarTrayectoriaLaboral7();", true);

            if (cantidad > 7)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral8", "habilitarTrayectoriaLaboral8();", true);

            if (cantidad > 8)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral9", "habilitarTrayectoriaLaboral9();", true);

            if (cantidad > 9)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral10", "habilitarTrayectoriaLaboral10();", true);

            if (cantidad > 10)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral11", "habilitarTrayectoriaLaboral11();", true);

            if (cantidad > 11)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral12", "habilitarTrayectoriaLaboral12();", true);

            if (cantidad > 12)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral13", "habilitarTrayectoriaLaboral13();", true);

            if (cantidad > 13)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral14", "habilitarTrayectoriaLaboral14();", true);

            if (cantidad > 14)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral15", "habilitarTrayectoriaLaboral15();", true);

            if (cantidad > 15)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral16", "habilitarTrayectoriaLaboral16();", true);

            if (cantidad > 16)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral17", "habilitarTrayectoriaLaboral17();", true);

            if (cantidad > 17)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral18", "habilitarTrayectoriaLaboral18();", true);

            if (cantidad > 18)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral19", "habilitarTrayectoriaLaboral19();", true);

            if (cantidad > 19)
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral20", "habilitarTrayectoriaLaboral20();", true);
        }

        protected void btncancelarRL_Click(object sender, EventArgs e)
        {
            int idegresado = IDEgresado;
            ViewState["RLActivado"] = 0;
            RegistroLaboralBE objRegistroLaboralBE = new RegistroLaboralBE();
            List<RegistroLaboralBE> listaRegistroLaboralBE = new List<RegistroLaboralBE>();
            RegistroLaboralBC objRegistroLaboralBC = new RegistroLaboralBC();

            listaRegistroLaboralBE = objRegistroLaboralBC.listarregistrolaobral(idegresado);
            int cantidad = listaRegistroLaboralBE.Count;

            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarBotonesTL", "ocultarBotonesTL();", true);
            ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTODOTrayectoriaLaboral", "deshabilitarTODOTrayectoriaLaboral();", true);
            
            if (cantidad == 1)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo2", "ocultarTrabajo2();", true);

            if (cantidad == 2)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo3", "ocultarTrabajo3();", true);

            if (cantidad == 3)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo4", "ocultarTrabajo4();", true);

            if (cantidad == 4)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo5", "ocultarTrabajo5();", true);

            if (cantidad == 5)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo6", "ocultarTrabajo6();", true);

            if (cantidad == 6)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo7", "ocultarTrabajo7();", true);

            if (cantidad == 7)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo8", "ocultarTrabajo8();", true);

            if (cantidad == 8)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo9", "ocultarTrabajo9();", true);

            if (cantidad == 9)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo10", "ocultarTrabajo10();", true);

            if (cantidad == 10)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo11", "ocultarTrabajo11();", true);

            if (cantidad == 11)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo12", "ocultarTrabajo12();", true);

            if (cantidad == 12)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo13", "ocultarTrabajo13();", true);

            if (cantidad == 13)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo14", "ocultarTrabajo14();", true);

            if (cantidad == 14)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo15", "ocultarTrabajo15();", true);

            if (cantidad == 15)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo16", "ocultarTrabajo16();", true);

            if (cantidad == 16)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo17", "ocultarTrabajo17();", true);

            if (cantidad == 17)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo18", "ocultarTrabajo18();", true);

            if (cantidad == 18)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo19", "ocultarTrabajo19();", true);

            if (cantidad == 19)
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarTrabajo20", "ocultarTrabajo20();", true);
        }

        protected void btnguardarRL_Click(object sender, EventArgs e)
        {
            try
            {
                if (validarformRegistroLaboral())
                {
                    if (validarcamposRL())
                    {
                        if (guardarRegistroLaboral() != 0)
                        {
                            if (actualizarRegistroLaboral())
                            {
                                ScriptManager.RegisterStartupScript(Page, GetType(), "exitoRL", "exitoRL();", true);
                                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarBotonesTL", "ocultarBotonesTL();", true);
                                ScriptManager.RegisterStartupScript(Page, GetType(), "deshabilitarTODOTrayectoriaLaboral", "deshabilitarTODOTrayectoriaLaboral();", true);
                                ViewState["RLActivado"] = 0;
                            }
                            else
                                ClientScript.RegisterClientScriptBlock(GetType(), "erroractualizarRL", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
                        }
                        else
                        {
                            ClientScript.RegisterClientScriptBlock(GetType(), "errorregistrarRL", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
                        }
                    }
                    else
                        btnguardarRL.Focus();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "errorguardarRL", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        protected void btnagregarRL_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultaragregarTL", "ocultaragregarTL();", true);

            int idegresado = IDEgresado;
            ViewState["RLActivado"] = 1;
            RegistroLaboralBE objRegistroLaboralBE = new RegistroLaboralBE();
            List<RegistroLaboralBE> listaRegistroLaboralBE = new List<RegistroLaboralBE>();
            RegistroLaboralBC objRegistroLaboralBC = new RegistroLaboralBC();

            listaRegistroLaboralBE = objRegistroLaboralBC.listarregistrolaobral(idegresado);
            int cantidad = listaRegistroLaboralBE.Count;

            if (cantidad == 1)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo2", "mostrarTrabajo2();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral2", "habilitarTrayectoriaLaboral2();", true);
            }

            if (cantidad == 2)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo3", "mostrarTrabajo3();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral3", "habilitarTrayectoriaLaboral3();", true);
            }

            if (cantidad == 3)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo4", "mostrarTrabajo4();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral4", "habilitarTrayectoriaLaboral4();", true);
            }

            if (cantidad == 4)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo5", "mostrarTrabajo5();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral5", "habilitarTrayectoriaLaboral5();", true);
            }

            if (cantidad == 5)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo6", "mostrarTrabajo6();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral6", "habilitarTrayectoriaLaboral6();", true);
            }

            if (cantidad == 6)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo7", "mostrarTrabajo7();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral7", "habilitarTrayectoriaLaboral7();", true);
            }

            if (cantidad == 7)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo8", "mostrarTrabajo8();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral8", "habilitarTrayectoriaLaboral8();", true);
            }

            if (cantidad == 8)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo9", "mostrarTrabajo9();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral9", "habilitarTrayectoriaLaboral9();", true);
            }

            if (cantidad == 9)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo10", "mostrarTrabajo10();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral10", "habilitarTrayectoriaLaboral10();", true);
            }

            if (cantidad == 10)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo11", "mostrarTrabajo11();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral11", "habilitarTrayectoriaLaboral11();", true);
            }

            if (cantidad == 11)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo12", "mostrarTrabajo12();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral12", "habilitarTrayectoriaLaboral12();", true);
            }

            if (cantidad == 12)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo13", "mostrarTrabajo13();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral13", "habilitarTrayectoriaLaboral13();", true);
            }

            if (cantidad == 13)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo14", "mostrarTrabajo14();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral14", "habilitarTrayectoriaLaboral14();", true);
            }

            if (cantidad == 14)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo15", "mostrarTrabajo15();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral15", "habilitarTrayectoriaLaboral15();", true);
            }

            if (cantidad == 15)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo16", "mostrarTrabajo16();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral16", "habilitarTrayectoriaLaboral16();", true);
            }

            if (cantidad == 16)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo17", "mostrarTrabajo17();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral17", "habilitarTrayectoriaLaboral17();", true);
            }

            if (cantidad == 17)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo18", "mostrarTrabajo18();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral18", "habilitarTrayectoriaLaboral18();", true);
            }

            if (cantidad == 18)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo19", "mostrarTrabajo19();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral19", "habilitarTrayectoriaLaboral19();", true);
            }

            if (cantidad == 19)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarTrabajo20", "mostrarTrabajo20();", true);
                ScriptManager.RegisterStartupScript(Page, GetType(), "habilitarTrayectoriaLaboral20", "habilitarTrayectoriaLaboral20();", true);
            }
        }

        //*** Aptitudes e intereses ***//

        protected void grdAptitudes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToUpper().Equals("CMDEDITAR"))
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "editarapt", "editarapt();", true);
                IDAptitud = Convert.ToInt32(e.CommandArgument.ToString());
                ViewState["IDAptitud"] = IDAptitud;
            }
            else if (e.CommandName.ToUpper().Equals("CMDELIMINAR"))
            {
                //Refresacar la grilla
                ScriptManager.RegisterStartupScript(Page, GetType(), "preguntaeliminarapt", "preguntaeliminarapt();", true);
                IDAptitud = Convert.ToInt32(e.CommandArgument.ToString());
                ViewState["CodigoAptitud"] = IDAptitud;
            }
        }

        public String NombreFormatear(String sNombre)
        {
            if (sNombre.Length < 21)
            {
                return sNombre;
            }
            else
            {
                return sNombre.Substring(0, 21) + "...";
            }
        }

        protected void grdIntereses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToUpper().Equals("CMDEDITAR"))
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "editarint", "editarint();", true);
                IDInteres = Convert.ToInt32(e.CommandArgument.ToString());
                ViewState["IDInteres"] = IDInteres;
            }
            else if (e.CommandName.ToUpper().Equals("CMDELIMINAR"))
            {
                //Refresacar la grilla
                ScriptManager.RegisterStartupScript(Page, GetType(), "preguntaeliminarint", "preguntaeliminarint();", true);
                IDInteres = Convert.ToInt32(e.CommandArgument.ToString());
                ViewState["CodigoInteres"] = IDInteres;
            }
        }

        public void InsertarAptitud()
        {
            AptitudBE objAptitudBE = new AptitudBE();
            AptitudBC objAptitudBC = new AptitudBC();
            EgresadoBC objEgresadoBC = new EgresadoBC();
            int idegresado = IDEgresado;
            int idaptitud;

            objAptitudBE.Nombreaptitud = txtAptitud.Text;
            idaptitud = objAptitudBC.insertarAptitud(objAptitudBE);

            objEgresadoBC.insertarAptitudxEgresado(idegresado, idaptitud);
        }

        public bool ActualizarAptitud(int idaptitud)
        {
            AptitudBE objAptitudBE = new AptitudBE();
            AptitudBC objAptitudBC = new AptitudBC();

            objAptitudBE.Idaptitud = idaptitud;
            objAptitudBE.Nombreaptitud = txtAptitud.Text;

            if(objAptitudBC.actualizarAptitud(objAptitudBE))
                return true;
            
            return false;
        }

        public void InsertarInteres()
        {
            InteresBE objInteresBE = new InteresBE();
            InteresBC objInteresBC = new InteresBC();
            EgresadoBC objEgresadoBC = new EgresadoBC();
            int idegresado = IDEgresado;
            int idinteres;

            objInteresBE.Nombreinteres = txtInteres.Text;
            idinteres = objInteresBC.insertarInteres(objInteresBE);

            objEgresadoBC.insertarInteresxEgresado(idegresado, idinteres);
        }

        public bool ActualizarInteres(int idinteres)
        {
            InteresBE objInteresBE = new InteresBE();
            InteresBC objInteresBC = new InteresBC();

            objInteresBE.Idinteres = idinteres;
            objInteresBE.Nombreinteres = txtInteres.Text;

            if (objInteresBC.actualizarInteres(objInteresBE))
                return true;

            return false;
        }

        public void EliminarAptitud(int IDAptitud)
        {
            EgresadoBC objEgresadoBC = new EgresadoBC();
            AptitudBC objAptitudBC = new AptitudBC();

            objEgresadoBC.eliminarAptitudxEgresado(IDEgresado, IDAptitud);
            objAptitudBC.eliminarAptitud(IDAptitud);
        }

        public void EliminarInteres(int IDInteres)
        {
            EgresadoBC objEgresadoBC = new EgresadoBC();
            InteresBC objInteresBC = new InteresBC();

            objEgresadoBC.eliminarInteresxEgresado(IDEgresado, IDInteres);
            objInteresBC.eliminarInteres(IDInteres);
        }


        //////////*Botones Apitudes*////////

        protected void btnAgregaraptitud_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarapt", "mostrarapt();", true);
        }

        protected void btnCancelaraptitud_Click(object sender, EventArgs e)
        {
            txtAptitud.Text = "";
            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarapt", "ocultarapt();", true);
        }

        protected void btnGuardaraptitud_Click(object sender, EventArgs e)
        {
            if (txtAptitud.Text != "" && txtAptitud.Text != null)
            {
                int aptitudid = (int)ViewState["IDAptitud"];
                ActualizarAptitud(aptitudid);
                grdAptitudesDataBind();
                ScriptManager.RegisterStartupScript(Page, GetType(), "mensajeeditarapt", "mensajeeditarapt();", true);
                txtAptitud.Text = "";
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarapt", "ocultarapt();", true);
            }
            else
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarapt", "ocultarapt();", true);
        }

        protected void btnInsertaraptitud_Click(object sender, EventArgs e)
        {
            if (txtAptitud.Text != "" && txtAptitud.Text != null)
            {
                InsertarAptitud();
                grdAptitudesDataBind();
                ScriptManager.RegisterStartupScript(Page, GetType(), "mensajeagregarapt", "mensajeagregarapt();", true);
                txtAptitud.Text = "";
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarapt", "ocultarapt();", true);
            }
            // Insertar aptitud()
            else
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarapt", "ocultarapt();", true);
        }

        protected void botoneliminarAptitudes_Click(object sender, EventArgs e)
        {
            int idaptitud = (int)ViewState["CodigoAptitud"];
            EliminarAptitud(idaptitud);
            ScriptManager.RegisterStartupScript(Page, GetType(), "eliminarapt", "eliminarapt();", true);
            grdAptitudesDataBind();
            txtAptitud.Text = "";
            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarapt", "ocultarapt();", true);
        }

        //////////*Botones Intereses*//////////

        protected void btnAgregarinteres_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, GetType(), "mostrarint", "mostrarint();", true);
        }

        protected void btnCancelarinteres_Click(object sender, EventArgs e)
        {
            txtInteres.Text = "";
            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarint", "ocultarint();", true);
        }

        protected void btnGuardarinteres_Click(object sender, EventArgs e)
        {
            if (txtInteres.Text != "" && txtInteres.Text != null)
            {
                int interesid = (int)ViewState["IDInteres"];
                ActualizarInteres(interesid);
                grdInteresesDataBind();
                ScriptManager.RegisterStartupScript(Page, GetType(), "mensajeeditarinteres", "mensajeeditarinteres();", true);

                txtInteres.Text = "";
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarint", "ocultarint();", true);
            }
            else
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarint", "ocultarint();", true);
        }

        protected void btnInsertarinteres_Click(object sender, EventArgs e)
        {
            if (txtInteres.Text != "" && txtInteres.Text != null)
            {
                InsertarInteres();
                grdInteresesDataBind();
                ScriptManager.RegisterStartupScript(Page, GetType(), "mensajeagregarinteres", "mensajeagregarinteres();", true);

                txtInteres.Text = "";
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarint", "ocultarint();", true);
            }
            else
                ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarint", "ocultarint();", true);
        }

        protected void botoneliminarIntereses_Click(object sender, EventArgs e)
        {
            int interes = (int)ViewState["CodigoInteres"];
            EliminarInteres(interes);
            ScriptManager.RegisterStartupScript(Page, GetType(), "eliminarint", "eliminarint();", true);
            grdInteresesDataBind();
            txtInteres.Text = "";
            ScriptManager.RegisterStartupScript(Page, GetType(), "ocultarint", "ocultarint();", true);
        }

        protected void CargarFoto_Click(object sender, EventArgs e)
        {
            //int codigo;
            FotoBC metodosFoto = new FotoBC();
            EgresadoBC metodosEgresado = new EgresadoBC();
            EgresadoBE objEgresadoBE = new EgresadoBE();
            var objFoto = new FotoBE { ImagenBytes = CargaImagen.FileBytes };

            objEgresadoBE = metodosEgresado.obtenerEgresado(IDEgresado);

            if (objEgresadoBE.Idfotoegresado == 1 || objEgresadoBE.Idfotoegresado == null)
            {
                objFoto.Idfoto = metodosFoto.insertarFoto(objFoto);

                objEgresadoBE.Idfotoegresado = objFoto.Idfoto;

                metodosEgresado.actualizarEgresado(objEgresadoBE);
            }
            else
                metodosFoto.actualizarFoto(objFoto);

            //codigo = objFoto.Idfoto;

            //obtenerFoto(codigo);
            ////upDatosEgresado.Update();
        }

        protected void obtenerFoto(int codigoFoto)
        {
            if(codigoFoto == 1 || codigoFoto == null)
                return;

            FotoBC metodosFoto = new FotoBC();
            var objetoFoto = metodosFoto.obtenerFoto(codigoFoto);
            contenedorfoto.Src = "data:image/jpg;base64," + Convert.ToBase64String(objetoFoto.ImagenBytes);
        }
        
    }
}