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
        protected void Page_Load(object sender, EventArgs e)
        {
            int IDEgresado;

            try
            {
                IDEgresado = Convert.ToInt32(Request.QueryString["IDEgresado"]);

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

                    EgresadoBC objEgresadoBC = new EgresadoBC();
                    EgresadoBE graduando = objEgresadoBC.obtenerEgresado(IDEgresado);

                    txtnombrecompleto.Text = graduando.Nombrecompletoegresado;
                    txtdni.Text = graduando.Dniegresado;
                    txtfechanacimiento.Text = graduando.Fechanacimientoegresado.Day.ToString() + "/" + graduando.Fechanacimientoegresado.Month.ToString() + "/" + graduando.Fechanacimientoegresado.Year.ToString();
                    txttelefonoprincipal.Text = graduando.Telefonoprinegresado;
                    txttelefonoalternativo.Text = graduando.Telefonoaltegresado;
                    txtdireccion.Text = graduando.Direccionegresado;
                    txtdistrito.Text = graduando.Distritoegresado;
                    txtcorreo.Text = graduando.Correoegresado;
                    txtcorreoalternativo.Text = graduando.Correoaltegresado;
                    txtperfillinkedin.Text = graduando.Perfillinkedinegresado;
                    txtperfilfacebook.Text = graduando.Perfilfacebookegresado;

                    if (graduando.Sexoegresado == 'M')
                        ddlGenero.SelectedIndex = 1;
                    else
                        ddlGenero.SelectedIndex = 2;

                    if (graduando.Departamentoegresado == "")
                        ddlDepartamento.SelectedIndex = -1;
                    else
                        ddlDepartamento.Text = graduando.Departamentoegresado;
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

        protected void btnguardar_Click(object sender, EventArgs e)
        {

        }
    }
}