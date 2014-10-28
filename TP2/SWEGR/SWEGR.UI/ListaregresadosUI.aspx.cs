using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Security;
using SWEGR.BL.BC;
using SWEGR.BL.BE;


using System.IO;
using System.Data;
using System.Data.SqlClient;

using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;


//extraccion de datos de redes sociales
using mshtml;
using System.Threading;
using System.Configuration;


namespace SWEGR.UI
{
    public partial class ListaregresadosUI : System.Web.UI.Page
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

                    ViewState["nombre"] = "";
                    ViewState["carrera"] = "";
                    ViewState["anioInicio"] = 0;
                    ViewState["anioFin"] = 0;
                    ViewState["codigouniversitario"] = "";
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
                objEgresado.EgresadoID = objEgresadoBE.Idegresado ;

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

            if (lstEgresados.Count == 0)
                ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
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

            lstEgresadoBE = metodosEgresado.listarEgresado_Lista(nombre,carrera,anioInicio,anioFin,codigoUniversitario);

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

            if(lstEgresados.Count == 0)
                ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
        }

        //public bool gredEgresadosxNombreoCodigo(string busqueda)
        //{
        //    List<Egresados> lstEgresados = new List<Egresados>();
        //    Egresados objEgresado;

        //    RegistroLaboralBE objRegistroLaboralBE;
        //    List<RegistroLaboralBE> lstRegistroLaboralBE;
        //    EgresadoBE objEgresadoBE;
        //    List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

        //    EgresadoBC metodosEgresado = new EgresadoBC();
        //    RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

        //    lstEgresadoBE = metodosEgresado.listarEgresadoxNombreoCodigo(busqueda);

        //    for (int i = 0; i < lstEgresadoBE.Count(); i++)
        //    {
        //        objEgresado = new Egresados();
        //        lstRegistroLaboralBE = new List<RegistroLaboralBE>();
        //        objEgresadoBE = new EgresadoBE();

        //        objEgresadoBE = lstEgresadoBE[i];

        //        objEgresado.Codigo = objEgresadoBE.Codigouniversitarioegresado;
        //        objEgresado.Nombre = objEgresadoBE.Nombrecompletoegresado;
        //        objEgresado.Carrera = objEgresadoBE.Carreraegresado;
        //        objEgresado.Cicloegreso = objEgresadoBE.Cicloegresado;

        //        lstRegistroLaboralBE = metodosRegistroLaboral.listarregistrolaobral(objEgresadoBE.Idegresado);
        //        if (lstRegistroLaboralBE.Count() != 0)
        //        {
        //            for (int k = 0; k < lstRegistroLaboralBE.Count(); k++)
        //            {
        //                objRegistroLaboralBE = new RegistroLaboralBE();

        //                if (lstRegistroLaboralBE[k].Trabajoactual == true)
        //                {
        //                    objRegistroLaboralBE.Nombretrabajo = lstRegistroLaboralBE[k].Nombretrabajo;
        //                    objRegistroLaboralBE.Nombrejefetrabajo = lstRegistroLaboralBE[k].Nombrejefetrabajo;
        //                    objRegistroLaboralBE.Cargojefetrabajo = lstRegistroLaboralBE[k].Cargojefetrabajo;
        //                    objRegistroLaboralBE.Telefonojefetrabajo = lstRegistroLaboralBE[k].Telefonojefetrabajo;
        //                    objRegistroLaboralBE.Correojefetrabajo = lstRegistroLaboralBE[k].Correojefetrabajo;

        //                    objEgresado.Trabajoactual = objRegistroLaboralBE.Nombretrabajo;
        //                    objEgresado.Nombrejefe = objRegistroLaboralBE.Nombrejefetrabajo;
        //                    objEgresado.Cargojefe = objRegistroLaboralBE.Cargojefetrabajo;
        //                    objEgresado.Telefonojefe = objRegistroLaboralBE.Telefonojefetrabajo;
        //                    objEgresado.Correojefe = objRegistroLaboralBE.Correojefetrabajo;
        //                }
        //                else
        //                    continue;
        //            }
        //        }
        //        else
        //        {
        //            objEgresado.Trabajoactual = "";
        //            objEgresado.Nombrejefe = "";
        //            objEgresado.Cargojefe = "";
        //            objEgresado.Telefonojefe = "";
        //            objEgresado.Correojefe = "";
        //        }

        //        lstEgresados.Add(objEgresado);
        //    }

        //    if (lstEgresados.Count == 0)
        //        return false;

        //    grdEgresados.DataSource = lstEgresados;
        //    grdEgresados.DataBind();

        //    return true;
        //}

        //public bool gredEgresadosxCiclo(string busqueda)
        //{
        //    List<Egresados> lstEgresados = new List<Egresados>();
        //    Egresados objEgresado;

        //    RegistroLaboralBE objRegistroLaboralBE;
        //    List<RegistroLaboralBE> lstRegistroLaboralBE;
        //    EgresadoBE objEgresadoBE;
        //    List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

        //    EgresadoBC metodosEgresado = new EgresadoBC();
        //    RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

        //    lstEgresadoBE = metodosEgresado.listarEgresadoxCiclo(busqueda);

        //    for (int i = 0; i < lstEgresadoBE.Count(); i++)
        //    {
        //        objEgresado = new Egresados();
        //        lstRegistroLaboralBE = new List<RegistroLaboralBE>();
        //        objEgresadoBE = new EgresadoBE();

        //        objEgresadoBE = lstEgresadoBE[i];

        //        objEgresado.Codigo = objEgresadoBE.Codigouniversitarioegresado;
        //        objEgresado.Nombre = objEgresadoBE.Nombrecompletoegresado;
        //        objEgresado.Carrera = objEgresadoBE.Carreraegresado;
        //        objEgresado.Cicloegreso = objEgresadoBE.Cicloegresado;

        //        lstRegistroLaboralBE = metodosRegistroLaboral.listarregistrolaobral(objEgresadoBE.Idegresado);
        //        if (lstRegistroLaboralBE.Count() != 0)
        //        {
        //            for (int k = 0; k < lstRegistroLaboralBE.Count(); k++)
        //            {
        //                objRegistroLaboralBE = new RegistroLaboralBE();

        //                if (lstRegistroLaboralBE[k].Trabajoactual == true)
        //                {
        //                    objRegistroLaboralBE.Nombretrabajo = lstRegistroLaboralBE[k].Nombretrabajo;
        //                    objRegistroLaboralBE.Nombrejefetrabajo = lstRegistroLaboralBE[k].Nombrejefetrabajo;
        //                    objRegistroLaboralBE.Cargojefetrabajo = lstRegistroLaboralBE[k].Cargojefetrabajo;
        //                    objRegistroLaboralBE.Telefonojefetrabajo = lstRegistroLaboralBE[k].Telefonojefetrabajo;
        //                    objRegistroLaboralBE.Correojefetrabajo = lstRegistroLaboralBE[k].Correojefetrabajo;

        //                    objEgresado.Trabajoactual = objRegistroLaboralBE.Nombretrabajo;
        //                    objEgresado.Nombrejefe = objRegistroLaboralBE.Nombrejefetrabajo;
        //                    objEgresado.Cargojefe = objRegistroLaboralBE.Cargojefetrabajo;
        //                    objEgresado.Telefonojefe = objRegistroLaboralBE.Telefonojefetrabajo;
        //                    objEgresado.Correojefe = objRegistroLaboralBE.Correojefetrabajo;
        //                }
        //                else
        //                    continue;
        //            }
        //        }
        //        else
        //        {
        //            objEgresado.Trabajoactual = "";
        //            objEgresado.Nombrejefe = "";
        //            objEgresado.Cargojefe = "";
        //            objEgresado.Telefonojefe = "";
        //            objEgresado.Correojefe = "";
        //        }

        //        lstEgresados.Add(objEgresado);
        //    }

        //    if (lstEgresados.Count == 0)
        //        return false;

        //    grdEgresados.DataSource = lstEgresados;
        //    grdEgresados.DataBind();

        //    return true;
        //}

        //public bool gredEgresadosxCarrera(string busqueda)
        //{
        //    List<Egresados> lstEgresados = new List<Egresados>();
        //    Egresados objEgresado;

        //    RegistroLaboralBE objRegistroLaboralBE;
        //    List<RegistroLaboralBE> lstRegistroLaboralBE;
        //    EgresadoBE objEgresadoBE;
        //    List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

        //    EgresadoBC metodosEgresado = new EgresadoBC();
        //    RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

        //    lstEgresadoBE = metodosEgresado.listarEgresadoxCarrera(busqueda);

        //    for (int i = 0; i < lstEgresadoBE.Count(); i++)
        //    {
        //        objEgresado = new Egresados();
        //        lstRegistroLaboralBE = new List<RegistroLaboralBE>();
        //        objEgresadoBE = new EgresadoBE();

        //        objEgresadoBE = lstEgresadoBE[i];

        //        objEgresado.Codigo = objEgresadoBE.Codigouniversitarioegresado;
        //        objEgresado.Nombre = objEgresadoBE.Nombrecompletoegresado;
        //        objEgresado.Carrera = objEgresadoBE.Carreraegresado;
        //        objEgresado.Cicloegreso = objEgresadoBE.Cicloegresado;

        //        lstRegistroLaboralBE = metodosRegistroLaboral.listarregistrolaobral(objEgresadoBE.Idegresado);
        //        if (lstRegistroLaboralBE.Count() != 0)
        //        {
        //            for (int k = 0; k < lstRegistroLaboralBE.Count(); k++)
        //            {
        //                objRegistroLaboralBE = new RegistroLaboralBE();

        //                if (lstRegistroLaboralBE[k].Trabajoactual == true)
        //                {
        //                    objRegistroLaboralBE.Nombretrabajo = lstRegistroLaboralBE[k].Nombretrabajo;
        //                    objRegistroLaboralBE.Nombrejefetrabajo = lstRegistroLaboralBE[k].Nombrejefetrabajo;
        //                    objRegistroLaboralBE.Cargojefetrabajo = lstRegistroLaboralBE[k].Cargojefetrabajo;
        //                    objRegistroLaboralBE.Telefonojefetrabajo = lstRegistroLaboralBE[k].Telefonojefetrabajo;
        //                    objRegistroLaboralBE.Correojefetrabajo = lstRegistroLaboralBE[k].Correojefetrabajo;

        //                    objEgresado.Trabajoactual = objRegistroLaboralBE.Nombretrabajo;
        //                    objEgresado.Nombrejefe = objRegistroLaboralBE.Nombrejefetrabajo;
        //                    objEgresado.Cargojefe = objRegistroLaboralBE.Cargojefetrabajo;
        //                    objEgresado.Telefonojefe = objRegistroLaboralBE.Telefonojefetrabajo;
        //                    objEgresado.Correojefe = objRegistroLaboralBE.Correojefetrabajo;
        //                }
        //                else
        //                    continue;
        //            }
        //        }
        //        else
        //        {
        //            objEgresado.Trabajoactual = "";
        //            objEgresado.Nombrejefe = "";
        //            objEgresado.Cargojefe = "";
        //            objEgresado.Telefonojefe = "";
        //            objEgresado.Correojefe = "";
        //        }

        //        lstEgresados.Add(objEgresado);
        //    }

        //    if (lstEgresados.Count == 0)
        //        return false;

        //    grdEgresados.DataSource = lstEgresados;
        //    grdEgresados.DataBind();

        //    return true;
        //}

        //public bool gredEgresadosxNombreoCodigoyCiclo(string busqueda, string año)
        //{
        //    List<Egresados> lstEgresados = new List<Egresados>();
        //    Egresados objEgresado;

        //    RegistroLaboralBE objRegistroLaboralBE;
        //    List<RegistroLaboralBE> lstRegistroLaboralBE;
        //    EgresadoBE objEgresadoBE;
        //    List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

        //    EgresadoBC metodosEgresado = new EgresadoBC();
        //    RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

        //    lstEgresadoBE = metodosEgresado.listarEgresadoxNombreoCodigoyCiclo(busqueda, año);

        //    for (int i = 0; i < lstEgresadoBE.Count(); i++)
        //    {
        //        objEgresado = new Egresados();
        //        lstRegistroLaboralBE = new List<RegistroLaboralBE>();
        //        objEgresadoBE = new EgresadoBE();

        //        objEgresadoBE = lstEgresadoBE[i];

        //        objEgresado.Codigo = objEgresadoBE.Codigouniversitarioegresado;
        //        objEgresado.Nombre = objEgresadoBE.Nombrecompletoegresado;
        //        objEgresado.Carrera = objEgresadoBE.Carreraegresado;
        //        objEgresado.Cicloegreso = objEgresadoBE.Cicloegresado;

        //        lstRegistroLaboralBE = metodosRegistroLaboral.listarregistrolaobral(objEgresadoBE.Idegresado);
        //        if (lstRegistroLaboralBE.Count() != 0)
        //        {
        //            for (int k = 0; k < lstRegistroLaboralBE.Count(); k++)
        //            {
        //                objRegistroLaboralBE = new RegistroLaboralBE();

        //                if (lstRegistroLaboralBE[k].Trabajoactual == true)
        //                {
        //                    objRegistroLaboralBE.Nombretrabajo = lstRegistroLaboralBE[k].Nombretrabajo;
        //                    objRegistroLaboralBE.Nombrejefetrabajo = lstRegistroLaboralBE[k].Nombrejefetrabajo;
        //                    objRegistroLaboralBE.Cargojefetrabajo = lstRegistroLaboralBE[k].Cargojefetrabajo;
        //                    objRegistroLaboralBE.Telefonojefetrabajo = lstRegistroLaboralBE[k].Telefonojefetrabajo;
        //                    objRegistroLaboralBE.Correojefetrabajo = lstRegistroLaboralBE[k].Correojefetrabajo;

        //                    objEgresado.Trabajoactual = objRegistroLaboralBE.Nombretrabajo;
        //                    objEgresado.Nombrejefe = objRegistroLaboralBE.Nombrejefetrabajo;
        //                    objEgresado.Cargojefe = objRegistroLaboralBE.Cargojefetrabajo;
        //                    objEgresado.Telefonojefe = objRegistroLaboralBE.Telefonojefetrabajo;
        //                    objEgresado.Correojefe = objRegistroLaboralBE.Correojefetrabajo;
        //                }
        //                else
        //                    continue;
        //            }
        //        }
        //        else
        //        {
        //            objEgresado.Trabajoactual = "";
        //            objEgresado.Nombrejefe = "";
        //            objEgresado.Cargojefe = "";
        //            objEgresado.Telefonojefe = "";
        //            objEgresado.Correojefe = "";
        //        }

        //        lstEgresados.Add(objEgresado);
        //    }

        //    if (lstEgresados.Count == 0)
        //        return false;

        //    grdEgresados.DataSource = lstEgresados;
        //    grdEgresados.DataBind();

        //    return true;
        //}

        //public bool gredEgresadosxNombreoCodigoyCarrera(string busqueda, string carrera)
        //{
        //    List<Egresados> lstEgresados = new List<Egresados>();
        //    Egresados objEgresado;

        //    RegistroLaboralBE objRegistroLaboralBE;
        //    List<RegistroLaboralBE> lstRegistroLaboralBE;
        //    EgresadoBE objEgresadoBE;
        //    List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

        //    EgresadoBC metodosEgresado = new EgresadoBC();
        //    RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

        //    lstEgresadoBE = metodosEgresado.listarEgresadoxNombreoCodigoyCarrera(busqueda, carrera);

        //    for (int i = 0; i < lstEgresadoBE.Count(); i++)
        //    {
        //        objEgresado = new Egresados();
        //        lstRegistroLaboralBE = new List<RegistroLaboralBE>();
        //        objEgresadoBE = new EgresadoBE();

        //        objEgresadoBE = lstEgresadoBE[i];

        //        objEgresado.Codigo = objEgresadoBE.Codigouniversitarioegresado;
        //        objEgresado.Nombre = objEgresadoBE.Nombrecompletoegresado;
        //        objEgresado.Carrera = objEgresadoBE.Carreraegresado;
        //        objEgresado.Cicloegreso = objEgresadoBE.Cicloegresado;

        //        lstRegistroLaboralBE = metodosRegistroLaboral.listarregistrolaobral(objEgresadoBE.Idegresado);
        //        if (lstRegistroLaboralBE.Count() != 0)
        //        {
        //            for (int k = 0; k < lstRegistroLaboralBE.Count(); k++)
        //            {
        //                objRegistroLaboralBE = new RegistroLaboralBE();

        //                if (lstRegistroLaboralBE[k].Trabajoactual == true)
        //                {
        //                    objRegistroLaboralBE.Nombretrabajo = lstRegistroLaboralBE[k].Nombretrabajo;
        //                    objRegistroLaboralBE.Nombrejefetrabajo = lstRegistroLaboralBE[k].Nombrejefetrabajo;
        //                    objRegistroLaboralBE.Cargojefetrabajo = lstRegistroLaboralBE[k].Cargojefetrabajo;
        //                    objRegistroLaboralBE.Telefonojefetrabajo = lstRegistroLaboralBE[k].Telefonojefetrabajo;
        //                    objRegistroLaboralBE.Correojefetrabajo = lstRegistroLaboralBE[k].Correojefetrabajo;

        //                    objEgresado.Trabajoactual = objRegistroLaboralBE.Nombretrabajo;
        //                    objEgresado.Nombrejefe = objRegistroLaboralBE.Nombrejefetrabajo;
        //                    objEgresado.Cargojefe = objRegistroLaboralBE.Cargojefetrabajo;
        //                    objEgresado.Telefonojefe = objRegistroLaboralBE.Telefonojefetrabajo;
        //                    objEgresado.Correojefe = objRegistroLaboralBE.Correojefetrabajo;
        //                }
        //                else
        //                    continue;
        //            }
        //        }
        //        else
        //        {
        //            objEgresado.Trabajoactual = "";
        //            objEgresado.Nombrejefe = "";
        //            objEgresado.Cargojefe = "";
        //            objEgresado.Telefonojefe = "";
        //            objEgresado.Correojefe = "";
        //        }

        //        lstEgresados.Add(objEgresado);
        //    }

        //    if (lstEgresados.Count == 0)
        //        return false;

        //    grdEgresados.DataSource = lstEgresados;
        //    grdEgresados.DataBind();

        //    return true;
        //}

        //public bool gredEgresadosxCicloyCarrera(string año, string carrera)
        //{
        //    List<Egresados> lstEgresados = new List<Egresados>();
        //    Egresados objEgresado;

        //    RegistroLaboralBE objRegistroLaboralBE;
        //    List<RegistroLaboralBE> lstRegistroLaboralBE;
        //    EgresadoBE objEgresadoBE;
        //    List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

        //    EgresadoBC metodosEgresado = new EgresadoBC();
        //    RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

        //    lstEgresadoBE = metodosEgresado.listarEgresadoxCicloyCarera(año, carrera);

        //    for (int i = 0; i < lstEgresadoBE.Count(); i++)
        //    {
        //        objEgresado = new Egresados();
        //        lstRegistroLaboralBE = new List<RegistroLaboralBE>();
        //        objEgresadoBE = new EgresadoBE();

        //        objEgresadoBE = lstEgresadoBE[i];

        //        objEgresado.Codigo = objEgresadoBE.Codigouniversitarioegresado;
        //        objEgresado.Nombre = objEgresadoBE.Nombrecompletoegresado;
        //        objEgresado.Carrera = objEgresadoBE.Carreraegresado;
        //        objEgresado.Cicloegreso = objEgresadoBE.Cicloegresado;

        //        lstRegistroLaboralBE = metodosRegistroLaboral.listarregistrolaobral(objEgresadoBE.Idegresado);
        //        if (lstRegistroLaboralBE.Count() != 0)
        //        {
        //            for (int k = 0; k < lstRegistroLaboralBE.Count(); k++)
        //            {
        //                objRegistroLaboralBE = new RegistroLaboralBE();

        //                if (lstRegistroLaboralBE[k].Trabajoactual == true)
        //                {
        //                    objRegistroLaboralBE.Nombretrabajo = lstRegistroLaboralBE[k].Nombretrabajo;
        //                    objRegistroLaboralBE.Nombrejefetrabajo = lstRegistroLaboralBE[k].Nombrejefetrabajo;
        //                    objRegistroLaboralBE.Cargojefetrabajo = lstRegistroLaboralBE[k].Cargojefetrabajo;
        //                    objRegistroLaboralBE.Telefonojefetrabajo = lstRegistroLaboralBE[k].Telefonojefetrabajo;
        //                    objRegistroLaboralBE.Correojefetrabajo = lstRegistroLaboralBE[k].Correojefetrabajo;

        //                    objEgresado.Trabajoactual = objRegistroLaboralBE.Nombretrabajo;
        //                    objEgresado.Nombrejefe = objRegistroLaboralBE.Nombrejefetrabajo;
        //                    objEgresado.Cargojefe = objRegistroLaboralBE.Cargojefetrabajo;
        //                    objEgresado.Telefonojefe = objRegistroLaboralBE.Telefonojefetrabajo;
        //                    objEgresado.Correojefe = objRegistroLaboralBE.Correojefetrabajo;
        //                }
        //                else
        //                    continue;
        //            }
        //        }
        //        else
        //        {
        //            objEgresado.Trabajoactual = "";
        //            objEgresado.Nombrejefe = "";
        //            objEgresado.Cargojefe = "";
        //            objEgresado.Telefonojefe = "";
        //            objEgresado.Correojefe = "";
        //        }

        //        lstEgresados.Add(objEgresado);
        //    }

        //    if (lstEgresados.Count == 0)
        //        return false;

        //    grdEgresados.DataSource = lstEgresados;
        //    grdEgresados.DataBind();

        //    return true;
        //}

        //public bool gredEgresadosxNombreoCodigoyCicloyCarrera(string busqueda, string año, string carrera)
        //{
        //    List<Egresados> lstEgresados = new List<Egresados>();
        //    Egresados objEgresado;

        //    RegistroLaboralBE objRegistroLaboralBE;
        //    List<RegistroLaboralBE> lstRegistroLaboralBE;
        //    EgresadoBE objEgresadoBE;
        //    List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

        //    EgresadoBC metodosEgresado = new EgresadoBC();
        //    RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

        //    lstEgresadoBE = metodosEgresado.listarEgresadoxNombreoCodigoyCicloyCarera(busqueda, año, carrera);

        //    for (int i = 0; i < lstEgresadoBE.Count(); i++)
        //    {
        //        objEgresado = new Egresados();
        //        lstRegistroLaboralBE = new List<RegistroLaboralBE>();
        //        objEgresadoBE = new EgresadoBE();

        //        objEgresadoBE = lstEgresadoBE[i];

        //        objEgresado.Codigo = objEgresadoBE.Codigouniversitarioegresado;
        //        objEgresado.Nombre = objEgresadoBE.Nombrecompletoegresado;
        //        objEgresado.Carrera = objEgresadoBE.Carreraegresado;
        //        objEgresado.Cicloegreso = objEgresadoBE.Cicloegresado;

        //        lstRegistroLaboralBE = metodosRegistroLaboral.listarregistrolaobral(objEgresadoBE.Idegresado);
        //        if (lstRegistroLaboralBE.Count() != 0)
        //        {
        //            for (int k = 0; k < lstRegistroLaboralBE.Count(); k++)
        //            {
        //                objRegistroLaboralBE = new RegistroLaboralBE();

        //                if (lstRegistroLaboralBE[k].Trabajoactual == true)
        //                {
        //                    objRegistroLaboralBE.Nombretrabajo = lstRegistroLaboralBE[k].Nombretrabajo;
        //                    objRegistroLaboralBE.Nombrejefetrabajo = lstRegistroLaboralBE[k].Nombrejefetrabajo;
        //                    objRegistroLaboralBE.Cargojefetrabajo = lstRegistroLaboralBE[k].Cargojefetrabajo;
        //                    objRegistroLaboralBE.Telefonojefetrabajo = lstRegistroLaboralBE[k].Telefonojefetrabajo;
        //                    objRegistroLaboralBE.Correojefetrabajo = lstRegistroLaboralBE[k].Correojefetrabajo;

        //                    objEgresado.Trabajoactual = objRegistroLaboralBE.Nombretrabajo;
        //                    objEgresado.Nombrejefe = objRegistroLaboralBE.Nombrejefetrabajo;
        //                    objEgresado.Cargojefe = objRegistroLaboralBE.Cargojefetrabajo;
        //                    objEgresado.Telefonojefe = objRegistroLaboralBE.Telefonojefetrabajo;
        //                    objEgresado.Correojefe = objRegistroLaboralBE.Correojefetrabajo;
        //                }
        //                else
        //                    continue;
        //            }
        //        }
        //        else
        //        {
        //            objEgresado.Trabajoactual = "";
        //            objEgresado.Nombrejefe = "";
        //            objEgresado.Cargojefe = "";
        //            objEgresado.Telefonojefe = "";
        //            objEgresado.Correojefe = "";
        //        }

        //        lstEgresados.Add(objEgresado);
        //    }

        //    if (lstEgresados.Count == 0)
        //        return false;

        //    grdEgresados.DataSource = lstEgresados;
        //    grdEgresados.DataBind();

        //    return true;
        //}

        //public void grdEgresadosVacio()
        //{
        //    List<Egresados> lstEgresados = new List<Egresados>();

        //    grdEgresados.DataSource = lstEgresados;
        //    grdEgresados.DataBind();
        //}

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string nombreBuscar="";
            string codigoUniversitarioBuscar="";
            int anioInicioBuscar=0;
            int anioFinBuscar=0;
            string carreraBuscar="";
          
            nombreBuscar=txtNombreCodigo.Text;
            codigoUniversitarioBuscar=txtNombreCodigo.Text;

            if (ddlInicio.SelectedIndex != 0 )
                anioInicioBuscar=Convert.ToInt32( ddlInicio.Text);


            if (ddlFin.SelectedIndex != 0)
                anioFinBuscar = Convert.ToInt32(ddlFin.Text);

            if (ddlCarrera.SelectedIndex != 0)
                carreraBuscar=ddlCarrera.Text;

            ViewState["nombre"] = nombreBuscar;
            ViewState["carrera"] = carreraBuscar;
            ViewState["anioInicio"] = anioInicioBuscar;
            ViewState["anioFin"] = anioFinBuscar;
            ViewState["codigouniversitario"] = codigoUniversitarioBuscar;

            if (anioInicioBuscar > anioFinBuscar)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "menor", "menor();", true);
                return;
            }
            
            grdEgresadosDataBind_Lista(nombreBuscar, carreraBuscar, anioInicioBuscar, anioFinBuscar, codigoUniversitarioBuscar);


        }

        protected void grdEgresados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("cmdVer"))
            {
                int IDEgresadoSeleccionado = Convert.ToInt32(e.CommandArgument);
                Session.Add("IDEgresadoSeleccionado", IDEgresadoSeleccionado);
                Response.Redirect("VisualizarEgresadoUI.aspx");
            }
            else if (e.CommandName.Equals("cmdExtraer"))
            {
                //Mostrar mensaje
               // ScriptManager.RegisterStartupScript(this, GetType(), "visualizarInfoCompleta", "mensaje_extraccion_datos();", true);

                int IDEgresadoSeleccionado = Convert.ToInt32(e.CommandArgument);
                DatosObtenidosBE objetoDatosObtenidosBE = new DatosObtenidosBE();

                objetoDatosObtenidosBE = extraerDatos(IDEgresadoSeleccionado);


                //Mostrar en PopUp

                //String codigo = grdEgresados.Rows[index].Cells[0].Text;

                EgresadoBC egresadoBC = new EgresadoBC();
                EgresadoBE egresadoBE = new EgresadoBE();

                egresadoBE = egresadoBC.obtenerEgresado(IDEgresadoSeleccionado);
                // ASPusername.Value = "salio";
                //datosObtenidos.DatosUsuario.Nombrecompletoegresado
                if (objetoDatosObtenidosBE != null && objetoDatosObtenidosBE.DatosUsuario != null && objetoDatosObtenidosBE.ListaRegistroLaboral != null)
                {
                    PNombre.Value = egresadoBE.Nombrecompletoegresado;
                    PTelf1.Value = objetoDatosObtenidosBE.DatosUsuario.Telefonoprinegresado;
                    Ptelf2.Value = objetoDatosObtenidosBE.DatosUsuario.Telefonoaltegresado;
                    PCorreo1.Value = objetoDatosObtenidosBE.DatosUsuario.Correoegresado;
                    Pcorreo2.Value = objetoDatosObtenidosBE.DatosUsuario.Correoaltegresado;
                    PDireccion.Value = objetoDatosObtenidosBE.DatosUsuario.Direccionegresado;

                    tbegresadoTrabajos.DataSource = objetoDatosObtenidosBE.ListaRegistroLaboral;
                    tbegresadoTrabajos.DataBind();

                    tbegresadoEstudios.DataSource = objetoDatosObtenidosBE.ListaRegistroAcademico;
                    tbegresadoEstudios.DataBind();

                    tbegresadoIntereses.DataSource = objetoDatosObtenidosBE.ListaIntereses;
                    tbegresadoIntereses.DataBind();

                    tbegresadoAptitudes.DataSource = objetoDatosObtenidosBE.ListaAptitudes;
                    tbegresadoAptitudes.DataBind();

                    if (objetoDatosObtenidosBE.DatosUsuario.Fotoegresado_url.Equals(""))
                        objetoDatosObtenidosBE.DatosUsuario.Fotoegresado_url = "https://ssl.gstatic.com/accounts/ui/avatar_2x.png";
                    fotoEgresadoURL.Src = objetoDatosObtenidosBE.DatosUsuario.Fotoegresado_url;

                    up_dialog.Update();
                    //    tbegresadoIntereses.Columns.[0].HeaderText = "Interes";
                    //  tbegresadoAptitudes.Columns[0].HeaderText = "Aptitud";

                    //Agregar Datos
                    objetoDatosObtenidosBE.DatosUsuario.Idegresado = egresadoBE.Idegresado;
                    //Guardar en VIewState
                    Session.Add("datosUsuaioBE", objetoDatosObtenidosBE.DatosUsuario);
                    Session.Add("registroLaboralBE", objetoDatosObtenidosBE.ListaRegistroLaboral);
                    Session.Add("registroAcademicoBE", objetoDatosObtenidosBE.ListaRegistroAcademico);
                    Session.Add("aptitudesBE", objetoDatosObtenidosBE.ListaAptitudes);
                    Session.Add("interesesBE", objetoDatosObtenidosBE.ListaIntereses);

                    ScriptManager.RegisterStartupScript(this, GetType(), "visualizarInfoCompleta", "visualizarInfoCompleta();", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "error_mensaje('" + objetoDatosObtenidosBE.Mensaje + "');", true);

                    //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('" + objetoDatosObtenidosBE.Mensaje + "');", true);

                    /*if (!esContactoLinkedIn)
                    {
                        if (profile_Facebook.Equals("") && profile_LinkedIn.Equals(""))
                            mensaje = "El usuario no ha registrado sus cuentas de Facebook ni de LinkedIn";
                        else
                            mensaje = "El usuario no es contacto en LinkedIn";
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('" + mensaje + "');", true);
                    }*/
                }
                
            }
        }

        //protected void btnExtraerDatos_Click(object sender, ImageClickEventArgs e)
        //{

        //}

        //protected void btnVer_Click(object sender, ImageClickEventArgs e)
        //{
            
        //}

        protected void Imprimir_Click(object sender, EventArgs e)
        {
            ExportGridToPDF();
        }

        public DatosObtenidosBE extraerDatos(int codigoEgresado)
        {
            try
            {
                String profile_LinkedIn = "";
                String profile_Facebook = "";
                String mensaje = "";


                EgresadoBC objetoEgresadoBC = new EgresadoBC();
                String[] linksEgresado = objetoEgresadoBC.obtenerLinksEgresado(codigoEgresado);
                if (linksEgresado[0] != null && linksEgresado[1] != null)
                {

                    profile_LinkedIn = linksEgresado[0];
                    profile_Facebook = linksEgresado[1];

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

                    DatosObtenidosBE datosObtenidos = null;
                    Boolean esContactoLinkedIn = false;
                    if (!profile_LinkedIn.Equals(""))
                    {

                        Boolean accedio_LinkedIn = obtenerDataBR.autenticarse_LinkedIn(usuario_LinkedIn, password_LinkedIn, IE);

                        Thread.Sleep(1000);
                        if (accedio_LinkedIn)
                        {
                            datosObtenidos = obtenerDataBR.extraerDatos_Personal_LinkedIn(IE, profile_LinkedIn);
                        }
                        obtenerDataBR.logOut_LinkedIn(IE);
                        Thread.Sleep(2000);
                        if (datosObtenidos != null)
                            esContactoLinkedIn = true;

                    }

                    if (!profile_Facebook.Equals(""))
                    {
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

                    }
                    IE.Quit();

                    //Los datos extraidos de LinkedIn y Fb se guardan en "datosObtenidos"
                    if (datosObtenidos != null)
                    {
                        //Mostrar datos obtenidos
                        /*correoTextBox.Text = datosObtenidos.DatosUsuario.Correoegresado;
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
                        aptitudes.DataBind();*/
                    }

                    if (!esContactoLinkedIn)
                    {
                        datosObtenidos = new DatosObtenidosBE();
                        if (profile_Facebook.Equals("") && profile_LinkedIn.Equals(""))
                            datosObtenidos.Mensaje = "El usuario no ha registrado sus cuentas de las redes sociales";
                        //mensaje = "El usuario no ha registrado sus cuentas de Facebook ni de LinkedIn";
                        else
                            datosObtenidos.Mensaje = "El usuario no es contacto en LinkedIn";
                        //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('" + mensaje + "');", true);
                    }
                    return datosObtenidos;

                }
                else
                {
                    // datosObtenidos.Mensaje = "El egresado no existe";
                    // ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('" + mensaje + "');", true);

                }
                return null;



            }
            catch (Exception ex)
            {
                IE.Quit();
                throw;
                //return "Vuelva a intentar";
                //ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Error. Vuelva a intentar');", true);
            }
        }
        protected void GuardarDatosExtraidosButton_Click(object sender, EventArgs e)
        {


        }

        protected void GuardarDatosExtraidosButton_Click1(object sender, EventArgs e)
        {
            try
            {
                EgresadoBE egresadoBe = new EgresadoBE();
                egresadoBe = (EgresadoBE)Session["datosUsuaioBE"];
                List<RegistroLaboralBE> listaregistrolaboral = new List<RegistroLaboralBE>();
                listaregistrolaboral = (List<RegistroLaboralBE>)Session["registroLaboralBE"];
                List<RegistroAcademicoBE> listaregistroacademico = new List<RegistroAcademicoBE>();
                listaregistroacademico = (List<RegistroAcademicoBE>)Session["registroAcademicoBE"];
                List<String> listaaptitud = new List<string>();
                listaaptitud = (List<String>)Session["aptitudesBE"];
                List<String> listainteres = new List<string>();
                listainteres = (List<String>)Session["interesesBE"];


                //ViewState["datosUsuaioBE"] = objetoDatosObtenidosBE.DatosUsuario;
                //ViewState["registroLaboralBE"] = objetoDatosObtenidosBE.ListaRegistroLaboral;
                //ViewState["registroAcademicoBE"] = objetoDatosObtenidosBE.ListaRegistroAcademico;
                //ViewState["aptitudesBE"] = objetoDatosObtenidosBE.ListaAptitudes;
                //ViewState["interesesBE"] = objetoDatosObtenidosBE.ListaIntereses;


                InteresBC interesbc = new InteresBC();
                AptitudBC aptitudbc = new AptitudBC();
                RegistroAcademicoBC registroabc = new RegistroAcademicoBC();
                RegistroLaboralBC registrolbc = new RegistroLaboralBC();
                EgresadoBC egresadobc = new EgresadoBC();


                //Comparar datos anteriores
                EgresadoBE egresadoAlmacenadoBE = new EgresadoBE();
                egresadoAlmacenadoBE = egresadobc.obtenerEgresado(egresadoBe.Idegresado);

                //Si esta lleno
                if (!egresadoAlmacenadoBE.Telefonoprinegresado.Equals(""))
                {
                    egresadoBe.Telefonoprinegresado = egresadoAlmacenadoBE.Telefonoprinegresado;
                }
                /*if ((egresadoBe.Telefonoprinegresado == null || egresadoBe.Telefonoprinegresado.Trim().Equals("")))
                {
                    egresadoBe.Telefonoprinegresado = egresadoAlmacenadoBE.Telefonoprinegresado;                    
                }*/

                if (!egresadoAlmacenadoBE.Telefonoaltegresado.Equals(""))
                    egresadoBe.Telefonoaltegresado = egresadoAlmacenadoBE.Telefonoaltegresado;

                /*  if ((egresadoBe.Telefonoaltegresado == null || egresadoBe.Telefonoaltegresado.Trim().Equals("")) && 
                  {
                      egresadoBe.Telefonoaltegresado = egresadoAlmacenadoBE.Telefonoaltegresado;
                  }*/
                if (!egresadoAlmacenadoBE.Correoegresado.Equals(""))
                    egresadoBe.Correoegresado = egresadoAlmacenadoBE.Correoegresado;

                /*
                if ((egresadoBe.Correoegresado == null || egresadoBe.Correoegresado.Trim().Equals("")) && 
                {
                    egresadoBe.Correoegresado = egresadoAlmacenadoBE.Correoegresado;
                }
                */

                if (!egresadoAlmacenadoBE.Correoaltegresado.Equals(""))
                    egresadoBe.Correoaltegresado = egresadoAlmacenadoBE.Correoaltegresado;

                /*
                if ((egresadoBe.Correoaltegresado == null || egresadoBe.Correoaltegresado.Trim().Equals("")) &&     !egresadoAlmacenadoBE.Correoaltegresado.Equals(""))
                {
                    egresadoBe.Correoaltegresado = egresadoAlmacenadoBE.Correoaltegresado;
                }
                */

                if (!egresadoAlmacenadoBE.Direccionegresado.Equals(""))
                    egresadoBe.Direccionegresado = egresadoAlmacenadoBE.Direccionegresado;

                /*
                if ((egresadoBe.Direccionegresado == null || egresadoBe.Direccionegresado.Trim().Equals("")) && !egresadoAlmacenadoBE.Direccionegresado.Equals(""))
                {
                    egresadoBe.Direccionegresado = egresadoAlmacenadoBE.Direccionegresado;
                }*/

                /*
                PNombre.Value = egresadoBE.Nombrecompletoegresado;
                PTelf1.Value = objetoDatosObtenidosBE.DatosUsuario.Telefonoprinegresado;
                Ptelf2.Value = objetoDatosObtenidosBE.DatosUsuario.Telefonoaltegresado;
                PCorreo1.Value = objetoDatosObtenidosBE.DatosUsuario.Correoegresado;
                Pcorreo2.Value = objetoDatosObtenidosBE.DatosUsuario.Correoaltegresado;
                PDireccion.Value = objetoDatosObtenidosBE.DatosUsuario.Direccionegresado;
                */

                egresadobc.actualizarEgresado_DatosExtraidos(egresadoBe);
                int idegresado = egresadoBe.Idegresado;

                if (listaregistrolaboral != null)
                {
                    for (int i = 0; i < listaregistrolaboral.Count(); i++)
                    {
                        listaregistrolaboral[i].Idegresado = idegresado;
                        listaregistrolaboral[i].Cargojefetrabajo = "";
                        listaregistrolaboral[i].Correojefetrabajo = "";

                        registrolbc.insertarregistrolaboral_DatosExtraidos(listaregistrolaboral[i]);
                    }
                }

                if (listaregistroacademico != null)
                {
                    for (int i = 0; i < listaregistroacademico.Count(); i++)
                    {
                        listaregistroacademico[i].Idegresado = idegresado;
                        registroabc.insertarregistroacademico_DatosExtraidos(listaregistroacademico[i]);
                    }
                }

                AptitudBE aptitudbe = new AptitudBE();
                InteresBE interesbe = new InteresBE();


                if (listaaptitud != null)
                {
                    for (int i = 0; i < listaaptitud.Count(); i++)
                    {
                        aptitudbe = new AptitudBE();
                        aptitudbe.Nombreaptitud = listaaptitud[i];
                        int idaptitud = aptitudbc.insertarAptitud(aptitudbe);
                        egresadobc.insertarAptitudxEgresado(idegresado, idaptitud);
                    }
                }

                if (listainteres != null)
                {
                    for (int i = 0; i < listainteres.Count(); i++)
                    {
                        interesbe = new InteresBE();
                        interesbe.Nombreinteres = listainteres[i];
                        int idinteres = interesbc.insertarInteres(interesbe);
                        egresadobc.insertarInteresxEgresado(idegresado, idinteres);
                    }
                }
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "error_mensaje('" + "Se ha actualizado los datos" + "');", true);

            }

            catch (Exception ex)

            { }
        }

        protected void grdEgresados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdEgresados.PageIndex = e.NewPageIndex;

            string nombreBuscar = (string)ViewState["nombre"];
            string codigoUniversitarioBuscar = (string)ViewState["codigouniversitario"];
            int anioInicioBuscar = (int)ViewState["anioInicio"];
            int anioFinBuscar = (int)ViewState["anioFin"];
            string carreraBuscar = (string)ViewState["carrera"];

            grdEgresadosDataBind_Lista(nombreBuscar, carreraBuscar, anioInicioBuscar, anioFinBuscar, codigoUniversitarioBuscar);
            
        }

        private void ExportGridToPDF()
        {
            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-disposition", "attachment;filename=Vithal_Wadje.pdf");
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);
            //grdEgresados.RenderControl(hw);
            //StringReader sr = new StringReader(sw.ToString());
            //iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document(iTextSharp.text.PageSize.A4, 10f, 10f, 10f, 0f);
            //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //pdfDoc.Open();
            //htmlparser.Parse(sr);
            //pdfDoc.Close();
            //Response.Write(pdfDoc);
            //Response.End();
            //grdEgresados.AllowPaging = true;
            //grdEgresados.DataBind();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    //To Export all pages
                    grdEgresados.AllowPaging = false;

                    string nombreBuscar = (string)ViewState["nombre"];
                    string codigoUniversitarioBuscar = (string)ViewState["codigouniversitario"];
                    int anioInicioBuscar = (int)ViewState["anioInicio"];
                    int anioFinBuscar = (int)ViewState["anioFin"];
                    string carreraBuscar = (string)ViewState["carrera"];

                    grdEgresadosDataBind_Lista(nombreBuscar, carreraBuscar, anioInicioBuscar, anioFinBuscar, codigoUniversitarioBuscar);

                    grdEgresados.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document(iTextSharp.text.PageSize.A2, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }  
    }
}