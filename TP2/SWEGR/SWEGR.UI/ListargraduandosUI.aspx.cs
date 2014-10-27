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
using System.Data;

namespace SWEGR.UI
{
    public partial class ListargraduandosUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int IDEgresado;
                char TUsuario;
                String Nombrecitow;
                IDEgresado = Convert.ToInt32(Session["IDusuario"]);
                TUsuario = Convert.ToChar(Session["TipoUsusario"]);
                Nombrecitow = Convert.ToString(Session["NOmbrezazo"]);

                if (TUsuario != 'C')
                {
                    Response.Redirect("Login.aspx");
                    return;
                }






                NombreHidden.Value = Nombrecitow;




                if (!IsPostBack)
                {
                    grdGraduandosDataBind();
                    uppanel.Update();


                    ddlCarrera.DataSource = listacarrera();
                    ddlCarrera.DataBind();
                    ddlCarrera.Items.Insert(0, new ListItem("Seleccione la Carrera", ""));

                    ViewState["nombre"] = "";
                    ViewState["carrera"] = "";
                    ViewState["codigoUniversitario"] = "";
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

            List<int> lstIDs = new List<int>();
            for (int k = 0; k < lstGraduandos.Count; k++)
            {
                int id = lstGraduandos[k].Idegresado;
                lstIDs.Add(id);
            }

            grdGraduandos.DataSource = lstGraduandos;
            grdGraduandos.DataBind();

            if (lstGraduandos.Count == 0)
                ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
        }

        public void grdGraduandosDataBind_Lista(String nombre, String carrera, String codigoUniversitario)
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarGraduando_Lista(nombre, carrera, codigoUniversitario);

            List<int> lstIDs = new List<int>();
            for (int k = 0; k < lstEgresadoBE.Count; k++)
            {
                int id = lstEgresadoBE[k].Idegresado;
                lstIDs.Add(id);
            }

            grdGraduandos.DataSource = lstEgresadoBE;
            grdGraduandos.DataBind();

            if (lstEgresadoBE.Count == 0)
                ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
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

            ViewState["nombre"] = nombreBuscar;
            ViewState["carrera"] = carreraBuscar;
            ViewState["codigoUniversitario"] = codigoUniversitarioBuscar;

            grdGraduandosDataBind_Lista(nombreBuscar, carreraBuscar, codigoUniversitarioBuscar);
        }

        protected void btnVer_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {

        }

        protected bool VerficarCheck(string id)
        {
            int IdEgresado = Convert.ToInt32(id);
            EgresadoBE Graduando = new EgresadoBE();
            EgresadoBC Metodos = new EgresadoBC();

            Graduando = Metodos.obtenerEgresado(IdEgresado);

            if (Graduando.Telefonoprinegresado == "" || Graduando.Telefonoprinegresado == null ||
                Graduando.Correoegresado == "" || Graduando.Correoegresado == null ||
                Graduando.Perfillinkedinegresado == "" || Graduando.Perfillinkedinegresado == null)
                return false;
            else
                return true;
        }

        protected void grdGraduandos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdGraduandos.PageIndex = e.NewPageIndex;

            string nombreBuscar = (string)ViewState["nombre"];
            string codigoUniversitarioBuscar = (string)ViewState["codigoUniversitario"];
            string carreraBuscar = (string)ViewState["carrera"];

            grdGraduandosDataBind_Lista(nombreBuscar, carreraBuscar, codigoUniversitarioBuscar);
        }


    }
}