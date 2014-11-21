using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Security;
using SWEGR.BL.BC;
using SWEGR.BL.BE;

namespace SWEGR.UI
{
    public partial class VisualizaregresadoUI : System.Web.UI.Page
    {
        int IDEgresadoSeleccionado;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
            char TUsuario;
            String Nombrecitow;
            int IDEgresado;
            IDEgresado = Convert.ToInt32(Session["IDusuario"]);
            TUsuario = Convert.ToChar(Session["TipoUsusario"]);
            Nombrecitow = Convert.ToString(Session["NOmbrezazo"]);
            NombreHidden.Value = Nombrecitow;
            try
            {

                if(Convert.ToChar(Session["TipoUsuario"]) == null)
                    TUsuario = 'F';

                TUsuario = Convert.ToChar(Session["TipoUsuario"]);
                if (TUsuario == 'G')
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                if (!IsPostBack)
                {
                    if (Convert.ToInt32(Session["IDEgresadoSeleccionado"].ToString()) == null)
                        IDEgresadoSeleccionado = 0;
                    IDEgresadoSeleccionado = Convert.ToInt32(Session["IDEgresadoSeleccionado"].ToString());
                    

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
                    EgresadoBE egresado = objEgresadoBC.obtenerEgresado(IDEgresadoSeleccionado);

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

                    llenarregistroacademico(IDEgresadoSeleccionado);
                    llenarregistrolaboral(IDEgresadoSeleccionado);

                    grdAptitudesDataBind();
                    grdInteresesDataBind();

                    obtenerFoto(egresado.Idfotoegresado);
                }
            }
            catch (Exception ex)
            {
               // throw;
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        public void grdAptitudesDataBind()
        {
            grdAptitudes.DataSource = listaaptitudbe(IDEgresadoSeleccionado);
            grdAptitudes.DataBind();
            upgrdAptitudes.Update();
        }

        public void grdInteresesDataBind()
        {
            grdIntereses.DataSource = listainteresbe(IDEgresadoSeleccionado);
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

        protected void obtenerFoto(int codigoFoto)
        {
            FotoBC metodosFoto = new FotoBC();
            var objetoFoto = metodosFoto.obtenerFoto(codigoFoto);
            contenedorfoto.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(objetoFoto.ImagenBytes);
        }
    }
}