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
    public partial class ListaregresadosUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            grdEgresadosDataBind();


            try
            {
                if (!IsPostBack)
                {
                    ddlFin.DataSource = listaciclo();
                    ddlFin.DataBind();
                    ddlFin.Items.Insert(0, new ListItem("Seleccione el Año", ""));

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

        public List<String> listaciclo()
        {
            List<String> lsciclos = new List<String>();

            lsciclos.Add("199810");
            lsciclos.Add("199820");
            lsciclos.Add("199910");
            lsciclos.Add("199920");
            lsciclos.Add("200010");
            lsciclos.Add("200020");
            lsciclos.Add("200110");
            lsciclos.Add("200120");
            lsciclos.Add("200210");
            lsciclos.Add("200220");
            lsciclos.Add("200310");
            lsciclos.Add("200320");
            lsciclos.Add("200410");
            lsciclos.Add("200420");
            lsciclos.Add("200510");
            lsciclos.Add("200520");
            lsciclos.Add("200610");
            lsciclos.Add("200620");
            lsciclos.Add("200710");
            lsciclos.Add("200720");
            lsciclos.Add("200810");
            lsciclos.Add("200820");
            lsciclos.Add("200910");
            lsciclos.Add("200920");
            lsciclos.Add("201010");
            lsciclos.Add("201020");
            lsciclos.Add("201110");
            lsciclos.Add("201120");
            lsciclos.Add("201210");
            lsciclos.Add("201220");
            lsciclos.Add("201310");
            lsciclos.Add("201320");
            lsciclos.Add("201410");
            lsciclos.Add("201420");

            return lsciclos;
        }

        public List<String> listacarrera()
        {
            List<String> lscarreras = new List<string>();

            lscarreras.Add("Arquitectura");
            lscarreras.Add("Escuela Música");
            lscarreras.Add("Medicina");
            lscarreras.Add("Nutrición y Dietética");
            lscarreras.Add("Odontología");
            lscarreras.Add("Terapia Física");
            lscarreras.Add("Psicología");
            lscarreras.Add("Traducción e Interpretación Profesional");
            lscarreras.Add("Comunicación e Imagen Empresarial");
            lscarreras.Add("Comunicación y Marketing");
            lscarreras.Add("Comunicación y Periodismo");
            lscarreras.Add("Comunicación y Publicidad");
            lscarreras.Add("Derecho");
            lscarreras.Add("Diseño Profesional de Interiores");
            lscarreras.Add("Diseño Profesional Gráfico");
            lscarreras.Add("Diseño y Gestión en Moda");
            lscarreras.Add("Economía y Finanzas");
            lscarreras.Add("Economía y Negocios Internacionales");
            lscarreras.Add("Economía Gerencial");
            lscarreras.Add("Educación y Gestión del Aprendizaje");
            lscarreras.Add("Ingeniería Civil");
            lscarreras.Add("Ingeniería Electrónica");
            lscarreras.Add("Ingeniería Industrial");
            lscarreras.Add("Ingeniería de Sistemas de Información");
            lscarreras.Add("Ingeniería de Software");
            lscarreras.Add("Ingeniería de Telecomunicaciones y Redes");
            lscarreras.Add("Ingeniería de Gestión Empresarial");
            lscarreras.Add("Ciencias de la Computación");
            lscarreras.Add("Ingeniería Mecatrónica");
            lscarreras.Add("Ingeniería de Gestión Minera");
            lscarreras.Add("Supply Chain Management");
            lscarreras.Add("Administración y Agronegocios");
            lscarreras.Add("Administración y Finanzas");
            lscarreras.Add("Administración y Marketing");
            lscarreras.Add("Administración y Negocios Internacionales");
            lscarreras.Add("Administración y Recursos Humanos");
            lscarreras.Add("Contabilidad y Administración");
            lscarreras.Add("Administración y Negocios del Deporte");

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

        public bool gredEgresadosxNombreoCodigo(string busqueda)
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            Egresados objEgresado;

            RegistroLaboralBE objRegistroLaboralBE;
            List<RegistroLaboralBE> lstRegistroLaboralBE;
            EgresadoBE objEgresadoBE;
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarEgresadoxNombreoCodigo(busqueda);

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

            if (lstEgresados.Count == 0)
                return false;

            grdEgresados.DataSource = lstEgresados;
            grdEgresados.DataBind();

            return true;
        }

        public bool gredEgresadosxCiclo(string busqueda)
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            Egresados objEgresado;

            RegistroLaboralBE objRegistroLaboralBE;
            List<RegistroLaboralBE> lstRegistroLaboralBE;
            EgresadoBE objEgresadoBE;
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarEgresadoxCiclo(busqueda);

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

            if (lstEgresados.Count == 0)
                return false;

            grdEgresados.DataSource = lstEgresados;
            grdEgresados.DataBind();

            return true;
        }

        public bool gredEgresadosxCarrera(string busqueda)
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            Egresados objEgresado;

            RegistroLaboralBE objRegistroLaboralBE;
            List<RegistroLaboralBE> lstRegistroLaboralBE;
            EgresadoBE objEgresadoBE;
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarEgresadoxCarrera(busqueda);

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

            if (lstEgresados.Count == 0)
                return false;

            grdEgresados.DataSource = lstEgresados;
            grdEgresados.DataBind();

            return true;
        }

        public bool gredEgresadosxNombreoCodigoyCiclo(string busqueda, string año)
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            Egresados objEgresado;

            RegistroLaboralBE objRegistroLaboralBE;
            List<RegistroLaboralBE> lstRegistroLaboralBE;
            EgresadoBE objEgresadoBE;
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarEgresadoxNombreoCodigoyCiclo(busqueda, año);

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

            if (lstEgresados.Count == 0)
                return false;

            grdEgresados.DataSource = lstEgresados;
            grdEgresados.DataBind();

            return true;
        }

        public bool gredEgresadosxNombreoCodigoyCarrera(string busqueda, string carrera)
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            Egresados objEgresado;

            RegistroLaboralBE objRegistroLaboralBE;
            List<RegistroLaboralBE> lstRegistroLaboralBE;
            EgresadoBE objEgresadoBE;
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarEgresadoxNombreoCodigoyCarrera(busqueda, carrera);

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

            if (lstEgresados.Count == 0)
                return false;

            grdEgresados.DataSource = lstEgresados;
            grdEgresados.DataBind();

            return true;
        }

        public bool gredEgresadosxCicloyCarrera(string año, string carrera)
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            Egresados objEgresado;

            RegistroLaboralBE objRegistroLaboralBE;
            List<RegistroLaboralBE> lstRegistroLaboralBE;
            EgresadoBE objEgresadoBE;
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarEgresadoxCicloyCarera(año, carrera);

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

            if (lstEgresados.Count == 0)
                return false;

            grdEgresados.DataSource = lstEgresados;
            grdEgresados.DataBind();

            return true;
        }

        public bool gredEgresadosxNombreoCodigoyCicloyCarrera(string busqueda, string año, string carrera)
        {
            List<Egresados> lstEgresados = new List<Egresados>();
            Egresados objEgresado;

            RegistroLaboralBE objRegistroLaboralBE;
            List<RegistroLaboralBE> lstRegistroLaboralBE;
            EgresadoBE objEgresadoBE;
            List<EgresadoBE> lstEgresadoBE = new List<EgresadoBE>();

            EgresadoBC metodosEgresado = new EgresadoBC();
            RegistroLaboralBC metodosRegistroLaboral = new RegistroLaboralBC();

            lstEgresadoBE = metodosEgresado.listarEgresadoxNombreoCodigoyCicloyCarera(busqueda, año, carrera);

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

            if (lstEgresados.Count == 0)
                return false;

            grdEgresados.DataSource = lstEgresados;
            grdEgresados.DataBind();

            return true;
        }

        public void grdEgresadosVacio()
        {
            List<Egresados> lstEgresados = new List<Egresados>();

            grdEgresados.DataSource = lstEgresados;
            grdEgresados.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string busqueda;
            string año;
            string carrera;

            if (txtNombreCodigo.Text == "" && ddlCarrera.Text == "" && ddlFin.Text == "")
            {
                grdEgresadosDataBind();
            }
            else
            {
                if (txtNombreCodigo.Text != "" && ddlCarrera.Text == "" && ddlFin.Text == "")
                {
                    busqueda = txtNombreCodigo.Text;

                    if (!gredEgresadosxNombreoCodigo(busqueda))
                    {
                        grdEgresadosVacio();
                        ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
                    }
                }
                else
                {
                    if (txtNombreCodigo.Text == "" && ddlCarrera.Text == "" && ddlFin.Text != "")
                    {
                        busqueda = ddlFin.Text;

                        if (!gredEgresadosxCiclo(busqueda))
                        {
                            grdEgresadosVacio();
                            ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
                        }
                    }
                    else
                    {
                        if (txtNombreCodigo.Text == "" && ddlCarrera.Text != "" && ddlFin.Text == "")
                        {
                            busqueda = ddlCarrera.Text;

                            if (!gredEgresadosxCarrera(busqueda))
                            {
                                grdEgresadosVacio();
                                ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
                            }
                        }
                        else
                        {
                            if (txtNombreCodigo.Text != "" && ddlCarrera.Text == "" && ddlFin.Text != "")
                            {
                                busqueda = txtNombreCodigo.Text;
                                año = ddlFin.Text;

                                if (!gredEgresadosxNombreoCodigoyCiclo(busqueda, año))
                                {
                                    grdEgresadosVacio();
                                    ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
                                }
                            }
                            else
                            {
                                if (txtNombreCodigo.Text != "" && ddlCarrera.Text != "" && ddlFin.Text == "")
                                {
                                    busqueda = txtNombreCodigo.Text;
                                    carrera = ddlCarrera.Text;

                                    if (!gredEgresadosxNombreoCodigoyCarrera(busqueda, carrera))
                                    {
                                        grdEgresadosVacio();
                                        ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
                                    }
                                }
                                else
                                {
                                    if (txtNombreCodigo.Text == "" && ddlCarrera.Text != "" && ddlFin.Text != "")
                                    {
                                        año = ddlFin.Text;
                                        carrera = ddlCarrera.Text;

                                        if (!gredEgresadosxCicloyCarrera(año, carrera))
                                        {
                                            grdEgresadosVacio();
                                            ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
                                        }
                                    }
                                    else
                                    {
                                        busqueda = txtNombreCodigo.Text;
                                        año = ddlFin.Text;
                                        carrera = ddlCarrera.Text;

                                        if (!gredEgresadosxNombreoCodigoyCicloyCarrera(busqueda, año, carrera))
                                        {
                                            grdEgresadosVacio();
                                            ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

      


        protected void grdEgresados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("cmdVer"))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                String codigo = grdEgresados.Rows[index].Cells[0].Text;

                EgresadoBC egresadoBC = new EgresadoBC();


                ScriptManager.RegisterStartupScript(this, GetType(), "visualizarInfoCompleta", "visualizarInfoCompleta();", true);
            }
            else if (e.CommandName.Equals("cmdExtraer"))
            {

            }
        }

        protected void btnExtraerDatos_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnVer_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {

        }
    }
}