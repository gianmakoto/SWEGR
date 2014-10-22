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
                    grdEgresadosDataBind();
                    uppanel.Update();

                    ddlFin.DataSource = listaanios();
                    ddlFin.DataBind();
                    ddlFin.Items.Insert(0, new ListItem("Seleccione el año fin", ""));

                    ddlInicio.DataSource = listaanios();
                    ddlInicio.DataBind();
                    ddlInicio.Items.Insert(0, new ListItem("Seleccione el año de inicio", ""));

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

        public List<String> listaanios()
        {
            List<String> lsanios = new List<String>();
            EgresadoBC egresadoBC = new EgresadoBC();
            lsanios = egresadoBC.listaranios();
            return lsanios;
        }

        public List<String> listaciclo()
        {
            List<String> lsciclos = new List<String>();

            lsciclos.Add("199401");
            lsciclos.Add("199402");
            lsciclos.Add("199501");
            lsciclos.Add("199502");
            lsciclos.Add("199601");
            lsciclos.Add("199602");
            lsciclos.Add("199701");
            lsciclos.Add("199702");



            lsciclos.Add("199801");
            lsciclos.Add("199802");
            lsciclos.Add("199901");
            lsciclos.Add("199902");
            lsciclos.Add("200001");
            lsciclos.Add("200002");
            lsciclos.Add("200101");
            lsciclos.Add("200102");
            lsciclos.Add("200201");
            lsciclos.Add("200202");
            lsciclos.Add("200301");
            lsciclos.Add("200302");
            lsciclos.Add("200401");
            lsciclos.Add("200402");
            lsciclos.Add("200501");
            lsciclos.Add("200502");
            lsciclos.Add("200601");
            lsciclos.Add("200602");
            lsciclos.Add("200701");
            lsciclos.Add("200702");
            lsciclos.Add("200801");
            lsciclos.Add("200802");
            lsciclos.Add("200901");
            lsciclos.Add("200902");
            lsciclos.Add("201001");
            lsciclos.Add("201002");
            lsciclos.Add("201101");
            lsciclos.Add("201102");
            lsciclos.Add("201201");
            lsciclos.Add("201202");
            lsciclos.Add("201301");
            lsciclos.Add("201302");
            lsciclos.Add("201401");
            lsciclos.Add("201402");

            return lsciclos;
        }

        public List<String> listacarrera()
        {
            List<String> lscarreras = new List<string>();

            lscarreras.Add("Ingeniería de Sistemas de Información");
            lscarreras.Add("Ingeniería de Software");
            lscarreras.Add("Ciencias de la Computación");

            return lscarreras;
        }

        public void grdEgresadosDataBind()
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            Egresados objEgresado;

            RegistroLaboralBE objRegistroLaboralBE;
            List<RegistroLaboralBE> lstRegistroLaboralBE;
            EgresadoBE objEgresadoBE;
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarEgresado();

            for (int i = 0; i < lstEgresadoBE.Count(); i++)
            {
                objEgresado = new Egresados();
                lstRegistroLaboralBE = new List<RegistroLaboralBE>();
                objEgresadoBE = new EgresadoBE();

                objEgresadoBE = lstEgresadoBE[i];

                objEgresado.Codigo = objEgresadoBE.Codigouniversitarioegresado;
                objEgresado.Nombre = objEgresadoBE.Nombrecompletoegresado;
                objEgresado.Carrera = objEgresadoBE.Carreraegresado;
                objEgresado.Cicloegreso = objEgresadoBE.Cicloegresado;
                objEgresado.EgresadoID = objEgresadoBE.Idegresado;

                lstRegistroLaboralBE = metodosRegistroLaboral.listarregistrolaobral(objEgresadoBE.Idegresado);
                if (lstRegistroLaboralBE.Count() != 0)
                {
                    for (int k = 0; k < lstRegistroLaboralBE.Count(); k++)
                    {
                        objRegistroLaboralBE = new RegistroLaboralBE();

                        if (lstRegistroLaboralBE[k].Trabajoactual == true)
                        {
                            objRegistroLaboralBE.Nombretrabajo = lstRegistroLaboralBE[k].Nombretrabajo;
                            objRegistroLaboralBE.Nombrejefetrabajo = lstRegistroLaboralBE[k].Nombrejefetrabajo;
                            objRegistroLaboralBE.Cargojefetrabajo = lstRegistroLaboralBE[k].Cargojefetrabajo;
                            objRegistroLaboralBE.Telefonojefetrabajo = lstRegistroLaboralBE[k].Telefonojefetrabajo;
                            objRegistroLaboralBE.Correojefetrabajo = lstRegistroLaboralBE[k].Correojefetrabajo;

                            objEgresado.Trabajoactual = objRegistroLaboralBE.Nombretrabajo;
                            objEgresado.Nombrejefe = objRegistroLaboralBE.Nombrejefetrabajo;
                            objEgresado.Cargojefe = objRegistroLaboralBE.Cargojefetrabajo;
                            objEgresado.Telefonojefe = objRegistroLaboralBE.Telefonojefetrabajo;
                            objEgresado.Correojefe = objRegistroLaboralBE.Correojefetrabajo;

                        }
                        else
                            continue;
                    }
                }
                else
                {
                    objEgresado.Trabajoactual = "";
                    objEgresado.Nombrejefe = "";
                    objEgresado.Cargojefe = "";
                    objEgresado.Telefonojefe = "";
                    objEgresado.Correojefe = "";
                }

                lstEgresados.Add(objEgresado);
            }

            grdEgresados.DataSource = lstEgresados;
            grdEgresados.DataBind();
        }


        public void grdEgresadosDataBind_Lista(String nombre, String carrera, int anioInicio, int anioFin, String codigoUniversitario)
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            Egresados objEgresado;

            RegistroLaboralBE objRegistroLaboralBE;
            List<RegistroLaboralBE> lstRegistroLaboralBE;
            EgresadoBE objEgresadoBE;
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarEgresado_Lista(nombre, carrera, anioInicio, anioFin, codigoUniversitario);

            for (int i = 0; i < lstEgresadoBE.Count(); i++)
            {
                objEgresado = new Egresados();
                lstRegistroLaboralBE = new List<RegistroLaboralBE>();
                objEgresadoBE = new EgresadoBE();

                objEgresadoBE = lstEgresadoBE[i];

                objEgresado.Codigo = objEgresadoBE.Codigouniversitarioegresado;
                objEgresado.Nombre = objEgresadoBE.Nombrecompletoegresado;
                objEgresado.Carrera = objEgresadoBE.Carreraegresado;
                objEgresado.Cicloegreso = objEgresadoBE.Cicloegresado;
                objEgresado.EgresadoID = objEgresadoBE.Idegresado;

                lstRegistroLaboralBE = metodosRegistroLaboral.listarregistrolaobral(objEgresadoBE.Idegresado);
                if (lstRegistroLaboralBE.Count() != 0)
                {
                    for (int k = 0; k < lstRegistroLaboralBE.Count(); k++)
                    {
                        objRegistroLaboralBE = new RegistroLaboralBE();

                        if (lstRegistroLaboralBE[k].Trabajoactual == true)
                        {
                            objRegistroLaboralBE.Nombretrabajo = lstRegistroLaboralBE[k].Nombretrabajo;
                            objRegistroLaboralBE.Nombrejefetrabajo = lstRegistroLaboralBE[k].Nombrejefetrabajo;
                            objRegistroLaboralBE.Cargojefetrabajo = lstRegistroLaboralBE[k].Cargojefetrabajo;
                            objRegistroLaboralBE.Telefonojefetrabajo = lstRegistroLaboralBE[k].Telefonojefetrabajo;
                            objRegistroLaboralBE.Correojefetrabajo = lstRegistroLaboralBE[k].Correojefetrabajo;

                            objEgresado.Trabajoactual = objRegistroLaboralBE.Nombretrabajo;
                            objEgresado.Nombrejefe = objRegistroLaboralBE.Nombrejefetrabajo;
                            objEgresado.Cargojefe = objRegistroLaboralBE.Cargojefetrabajo;
                            objEgresado.Telefonojefe = objRegistroLaboralBE.Telefonojefetrabajo;
                            objEgresado.Correojefe = objRegistroLaboralBE.Correojefetrabajo;

                        }
                        else
                        {
                            //continue;
                            objEgresado.Trabajoactual = "";
                            objEgresado.Nombrejefe = "";
                            objEgresado.Cargojefe = "";
                            objEgresado.Telefonojefe = "";
                            objEgresado.Correojefe = "";
                        }
                    }
                }
                else
                {
                    objEgresado.Trabajoactual = "";
                    objEgresado.Nombrejefe = "";
                    objEgresado.Cargojefe = "";
                    objEgresado.Telefonojefe = "";
                    objEgresado.Correojefe = "";
                }

                lstEgresados.Add(objEgresado);
            }

            grdEgresados.DataSource = lstEgresados;
            grdEgresados.DataBind();
        }

        protected void grdEgresados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("cmdVer"))
            {
                int IDEgresadoSeleccionado = Convert.ToInt32(e.CommandArgument);
                Session.Add("IDEgresadoSeleccionado", IDEgresadoSeleccionado);
                Response.Redirect("VisualizarEgresadoUI.aspx");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            // string busqueda;
            string nombreBuscar = "";
            string codigoUniversitarioBuscar = "";
            int anioInicioBuscar = 0;
            int anioFinBuscar = 0;
            string carreraBuscar = "";

            nombreBuscar = txtNombreCodigo.Text;
            codigoUniversitarioBuscar = txtNombreCodigo.Text;

            if (ddlInicio.SelectedIndex != 0)
                anioInicioBuscar = Convert.ToInt32(ddlInicio.Text);


            if (ddlFin.SelectedIndex != 0)
                anioFinBuscar = Convert.ToInt32(ddlFin.Text);

            if (ddlCarrera.SelectedIndex != 0)
                carreraBuscar = ddlCarrera.Text;


            grdEgresadosDataBind_Lista(nombreBuscar, carreraBuscar, anioInicioBuscar, anioFinBuscar, codigoUniversitarioBuscar);


        }

        protected void btnVer_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {

        }
    }
}