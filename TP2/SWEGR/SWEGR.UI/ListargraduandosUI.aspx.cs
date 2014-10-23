using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Security;
using SWEGR.BL.BC;
using SWEGR.BL.BE;


//extraccion de datos de redes sociales
using mshtml;
using System.Threading;
using System.Configuration;

namespace SWEGR.UI
{
    public partial class ListargraduandosUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    grdGraduandosDataBind();
                    uppanel.Update();


                    ddlCarrera.DataSource = listacarrera();
                    ddlCarrera.DataBind();
                    ddlCarrera.Items.Insert(0, new ListItem("Seleccione la Carrera", ""));
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        public List<String> listacarrera()
        {
            List<String> lscarreras = new List<string>();

            lscarreras.Add("Ingeniería de Sistemas de Información");
            lscarreras.Add("Ingeniería de Software");
            lscarreras.Add("Ciencias de la Computación");

            return lscarreras;
        }

        public void grdGraduandosDataBind()
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            List<EgresadoBE> lstGraduandos = new List<EgresadoBE>();
            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstGraduandos = metodosEgresado.listarGraduando();

            grdGraduandos.DataSource = lstGraduandos;
            grdGraduandos.DataBind();
        }


        public void grdGraduandosDataBind_Lista(String nombre, String carrera, String codigoUniversitario)
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarGraduando_Lista(nombre, carrera, codigoUniversitario);

            grdGraduandos.DataSource = lstEgresadoBE;
            grdGraduandos.DataBind();
        }

        protected void grdGraduandos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("cmdVer"))
            {
                int IDEgresadoSeleccionado = Convert.ToInt32(e.CommandArgument);
                Session.Add("IDGraduandoSeleccionado", IDEgresadoSeleccionado);
                Response.Redirect("VisualizargraduandoUI.aspx");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            // string busqueda;
            string nombreBuscar = "";
            string codigoUniversitarioBuscar = "";
            string carreraBuscar = "";

            nombreBuscar = txtNombreCodigo.Text;
            codigoUniversitarioBuscar = txtNombreCodigo.Text;

            if (ddlCarrera.SelectedIndex != 0)
                carreraBuscar = ddlCarrera.Text;

            grdGraduandosDataBind_Lista(nombreBuscar, carreraBuscar, codigoUniversitarioBuscar);
        }

        protected void btnVer_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {

        }
    }
}