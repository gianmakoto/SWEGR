using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using SWEGR.BL.BC;
using SWEGR.BL.BE;
using System.Text;
using System.Net;
using System.IO;
using System.Drawing;
using System.Threading;
using System.Windows.Forms;
using mshtml;
using System.Threading;
using System.Configuration;

namespace SWEGR.UI
{
    public partial class ListarEgresados : System.Web.UI.Page
    {
        string url_LinkedIn = "https://www.linkedin.com";
        string url_Fb = "https://www.facebook.com";
        string usuario_LinkedIn;
        string usuario_Fb;
        string password_LinkedIn;
        string password_Fb;


        ObtenerDataBC obtenerDataBR = new ObtenerDataBC();
        SHDocVw.InternetExplorer IE;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void extraerDatosTextBox_Click(object sender, EventArgs e)
        {
            extraerDato(Convert.ToInt32(codigoEgresado.Text));
        }





        public void extraerDato(int codigoEgresado)
        {
            try
            {
                String profile_LinkedIn = "";
                String profile_Facebook = "";

                //Obtener Links de LinkedIn y Facebook del egresado CON EL CODIGO DEL EGRESADO de la BD
                //lo guarda aqui profile_LinkedIn y profile_Facebook



                //Obtener credenciales de redes sociales
                usuario_LinkedIn = System.Configuration.ConfigurationManager.AppSettings["usuario_LinkedIn"];
                usuario_Fb = System.Configuration.ConfigurationManager.AppSettings["usuario_Fb"];
                password_LinkedIn = System.Configuration.ConfigurationManager.AppSettings["password_LinkedIn"];
                password_Fb = System.Configuration.ConfigurationManager.AppSettings["password_Fb"];

                //Abrir explorador
                IE = new SHDocVw.InternetExplorer();
                //Para que no se vea IE.Visible = false;
                IE.Visible = true;
                IE.Silent = true;

                //listaProfiles.Add("https://www.linkedin.com/profile/view?id=286780780");
                //listaProfiles.Add("https://www.linkedin.com/profile/view?id=343561460");


                Boolean accedio_LinkedIn = obtenerDataBR.autenticarse_LinkedIn(usuario_LinkedIn, password_LinkedIn, IE);
                DatosObtenidosBE datosObtenidos = null;
                Boolean esContactoLinkedIn = false;

                Thread.Sleep(1000);
                if (accedio_LinkedIn)
                {
                    datosObtenidos = obtenerDataBR.extraerDatos_Personal_LinkedIn(IE, profile_LinkedIn);
                }
                obtenerDataBR.logOut_LinkedIn(IE);
                Thread.Sleep(2000);
                if (datosObtenidos != null)
                    esContactoLinkedIn = true;
                Boolean accedio_fb = obtenerDataBR.autenticarse_Facebook(usuario_Fb, password_Fb, IE);
                Thread.Sleep(1000);
                String[] datosFb = new String[5];
                if (accedio_fb)
                {
                    datosFb = obtenerDataBR.extraerDatos_Personal_Facebook(IE, profile_Facebook + "/about");
                    if (datosObtenidos != null)
                    {
                        if (datosFb[0] != null)
                            datosObtenidos.DatosUsuario.Telefonoaltegresado = datosFb[0].Replace(" ", "");
                        if (datosFb[1] != null)
                            datosObtenidos.DatosUsuario.Correoaltegresado = datosFb[1];
                        if (datosObtenidos.DatosUsuario.Direccionegresado == null || datosObtenidos.DatosUsuario.Direccionegresado.Trim().Equals(""))
                            if (datosFb[3] != null)
                                datosObtenidos.DatosUsuario.Direccionegresado = datosFb[3];
                    }
                    else
                    {
                        datosObtenidos = new DatosObtenidosBE();
                        datosObtenidos.DatosUsuario = new EgresadoBE();
                        if (datosFb[0] != null)
                            datosObtenidos.DatosUsuario.Telefonoaltegresado = datosFb[0].Replace(" ", "");
                        if (datosFb[1] != null)
                            datosObtenidos.DatosUsuario.Correoaltegresado = datosFb[1];
                        if (datosFb[3] != null)
                            datosObtenidos.DatosUsuario.Direccionegresado = datosFb[3];
                    }
                }
                obtenerDataBR.logOut_Facebook(IE);
                IE.Quit();

                //Los datos extraidos de LinkedIn y Fb se guardan en "datosObtenidos"
                if (datosObtenidos != null)
                {
                    //Mostrar datos obtenidos
                    correoTextBox.Text = datosObtenidos.DatosUsuario.Correoegresado;
                    correoAlterTextBox.Text = datosObtenidos.DatosUsuario.Correoaltegresado;
                    telefonoTextBox.Text = datosObtenidos.DatosUsuario.Telefonoprinegresado;
                    telefonoAlterTextBox.Text = datosObtenidos.DatosUsuario.Telefonoaltegresado;
                    direccionTextBox.Text = datosObtenidos.DatosUsuario.Direccionegresado;
                    //Image1.ImageUrl = datosObtenidos.DatosUsuario.Fotoegresado;

                    registrosLaborales.DataSource = datosObtenidos.ListaRegistroLaboral;
                    registrosAcademicos.DataSource = datosObtenidos.ListaRegistroAcademico;
                    intereses.DataSource = datosObtenidos.ListaIntereses;
                    aptitudes.DataSource = datosObtenidos.ListaAptitudes;

                    registrosLaborales.DataBind();
                    registrosAcademicos.DataBind();
                    intereses.DataBind();
                    aptitudes.DataBind();
                }

                if (!esContactoLinkedIn)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('El usuario no es cotnacto en LinkedIn');", true);
                }

            }
            catch (Exception ex)
            {
                IE.Quit();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Error. Vuelva a intentar');", true);
            }
        }
    }
}