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
    public partial class VisualizargraduandoUI : System.Web.UI.Page
    {
        String TipoUsuarioLogueado;
        int IDEgresado;
        char TUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //IDEgresado = Convert.ToInt32(Request.QueryString["IDEgresado"]);
                if (Session["TipoUsuarioLogueado"].ToString() == null)
                    TipoUsuarioLogueado = "";
                TipoUsuarioLogueado = Session["TipoUsuarioLogueado"].ToString();

                if (Convert.ToChar(Session["TipoUsuario"]) == null)
                    TUsuario = 'F';

                TUsuario = Convert.ToChar(Session["TipoUsuario"]);
                if (TUsuario == 'E')
                {
                    Response.Redirect("Loginprueba.aspx");
                    return;
                }


                if (!TipoUsuarioLogueado.Equals("comite"))
                {
                    Response.Redirect("Loginprueba.aspx");
                    return;
                }

                if (!IsPostBack)
                {
                    if (Convert.ToInt32(Session["IDEgresadoSeleccionado"].ToString()) == null)
                        IDEgresado = 0;
                    IDEgresado = Convert.ToInt32(Session["IDEgresadoSeleccionado"].ToString());

                    ddlGenero.DataSource = listagenero();
                    ddlGenero.DataBind();
                    ddlGenero.Items.Insert(0, new ListItem("Seleccione el genero", ""));

                    ddlDepartamento.DataSource = listadepartamento();
                    ddlDepartamento.DataBind();
                    ddlDepartamento.Items.Insert(0, new ListItem("Seleccione el departamento", ""));

                    EgresadoBC objEgresadoBC = new EgresadoBC();
                    EgresadoBE graduando = objEgresadoBC.obtenerEgresado(IDEgresado);

                    txtnombrecompleto.Text = graduando.Nombrecompletoegresado;
                    txtdni.Text = graduando.Dniegresado;
                    txtfechanacimiento.Text = graduando.Fechanacimientoegresado.Day.ToString() + "/" + graduando.Fechanacimientoegresado.Month.ToString() + "/" + graduando.Fechanacimientoegresado.Year.ToString();
                    txtCarrera.Text = graduando.Carreraegresado;
                    txttelefonoprincipal.Text = graduando.Telefonoprinegresado;
                    txttelefonoalternativo.Text = graduando.Telefonoaltegresado;
                    txtdireccion.Text = graduando.Direccionegresado;
                    txtdistrito.Text = graduando.Distritoegresado;
                    txtcorreo.Text = graduando.Correoegresado;
                    txtcorreoalternativo.Text = graduando.Correoaltegresado;
                    txtperfillinkedin.Text = graduando.Perfillinkedinegresado;
                    txtperfilfacebook.Text = graduando.Perfilfacebookegresado;
                    NombreHidden.Value = graduando.Nombrecompletoegresado;
                    if (graduando.Sexoegresado == 'M')
                        ddlGenero.SelectedIndex = 1;
                    else
                        ddlGenero.SelectedIndex = 2;

                    if (graduando.Departamentoegresado == "")
                        ddlDepartamento.SelectedIndex = -1;
                    else
                        ddlDepartamento.Text = graduando.Departamentoegresado;

                    obtenerFoto(graduando.Idfotoegresado);
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
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

        protected void obtenerFoto(int codigoFoto)
        {
            if (codigoFoto == 1 || codigoFoto == null)
                return;

            FotoBC metodosFoto = new FotoBC();
            var objetoFoto = metodosFoto.obtenerFoto(codigoFoto);
            contenedorfoto.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(objetoFoto.ImagenBytes);
        }
    }
}