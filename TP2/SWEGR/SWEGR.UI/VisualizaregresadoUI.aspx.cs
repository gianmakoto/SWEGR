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

                    //ddlPaís.DataSource = listapais();
                    //ddlPaís.DataBind();
                    ddlPaís.Items.Insert(0, new ListItem("Seleccione el país", ""));

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

        //public List<String> listapais()
        //{
        //    List<String> lspais = new List<string>();

        //    lspais.Add("Andorra");
        //    lspais.Add("Emiratos Árabes Unidos");
        //    lspais.Add("Afganistn");
        //    lspais.Add("Antigua y Barbados");
        //    lspais.Add("Anguilla");
        //    lspais.Add("Albania");
        //    lspais.Add("Armenia");
        //    lspais.Add("Antillas holandesas");
        //    lspais.Add("Angola");
        //    lspais.Add("Antrtida");
        //    lspais.Add("Argentina");
        //    lspais.Add("Samoa americana");
        //    lspais.Add("Austria");
        //    lspais.Add("Australia");
        //    lspais.Add("Aruba");
        //    lspais.Add("Azerbaijn");
        //    lspais.Add("Bosnia/Herzegovina");
        //    lspais.Add("Barbados");
        //    lspais.Add("Bangladesh");
        //    lspais.Add("Belgica");
        //    lspais.Add("Burkina Faso");
        //    lspais.Add("Bulgaria");
        //    lspais.Add("Bahrain");
        //    lspais.Add("Burundi");
        //    lspais.Add("Benin");
        //    lspais.Add("Bermudas");
        //    lspais.Add("Brunei");
        //    lspais.Add("Bolivia");
        //    lspais.Add("Brasil");
        //    lspais.Add("Bahamas");
        //    lspais.Add("Butn");
        //    lspais.Add("Isla Bouvet");
        //    lspais.Add("Botsuana");
        //    lspais.Add("Bielorrusia");
        //    lspais.Add("Belice");
        //    lspais.Add("Canada");
        //    lspais.Add("Islas Cocos");
        //    lspais.Add("Republica Centroafricana");
        //    lspais.Add("Congo");
        //    lspais.Add("Suiza");
        //    lspais.Add("Costa de Marfil");
        //    lspais.Add("Islas Cook");
        //    lspais.Add("Chile");
        //    lspais.Add("Camerun");
        //    lspais.Add("China");
        //    lspais.Add("Colombia");
        //    lspais.Add("Costa Rica");
        //    lspais.Add("Cuba");
        //    lspais.Add("Cabo Verde");
        //    lspais.Add("Isla de Navidad");
        //    lspais.Add("Chipre");
        //    lspais.Add("Repblica Checa");
        //    lspais.Add("Alemania");
        //    lspais.Add("Yibuti");
        //    lspais.Add("Dinamarca");
        //    lspais.Add("Dominica");
        //    lspais.Add("Repblica Dominicana");
        //    lspais.Add("Argelia");
        //    lspais.Add("Ecuador");
        //    lspais.Add("Estonia");
        //    lspais.Add("Egipto");
        //    lspais.Add("Shara Occidental");
        //    lspais.Add("Eritrea");
        //    lspais.Add("España");
        //    lspais.Add("Etiopa");
        //    lspais.Add("Finlandia");
        //    lspais.Add("Fiyi");
        //    lspais.Add("Islas Malvinas");
        //    lspais.Add("Micronesia");
        //    lspais.Add("Islas Faroe");
        //    lspais.Add("Francia");
        //    lspais.Add("Gabon");
        //    lspais.Add("Granada");
        //    lspais.Add("Georgia");
        //    lspais.Add("Guinea Francesa");
        //    lspais.Add("Ghana");
        //    lspais.Add("Gibraltar");
        //    lspais.Add("Groenlandia");
        //    lspais.Add("Gambia");
        //    lspais.Add("Guinea");
        //    lspais.Add("Guadalupe");
        //    lspais.Add("Guinea Ecuatorial");
        //    lspais.Add("Grecia");
        //    lspais.Add("Islas Georgia y Sandwich del Sur");
        //    lspais.Add("Guatemala");
        //    lspais.Add("Guam");
        //    lspais.Add("GuinBissau");
        //    lspais.Add("Guyana");
        //    lspais.Add("Hong Kong");
        //    lspais.Add("Islas Heard y McDonald");
        //    lspais.Add("Honduras");
        //    lspais.Add("Croacia");
        //    lspais.Add("Hait");
        //    lspais.Add("Hungria");
        //    lspais.Add("Indonesia");
        //    lspais.Add("Irlanda");
        //    lspais.Add("Israel");
        //    lspais.Add("India");
        //    lspais.Add("Territorio Britanico del Oceano Indico");
        //    lspais.Add("Irak");
        //    lspais.Add("Iran");
        //    lspais.Add("Islandia");
        //    lspais.Add("Italia");
        //    lspais.Add("Jamaica");
        //    lspais.Add("Jordania");
        //    lspais.Add("Japon");
        //    lspais.Add("Kenia");
        //    lspais.Add("Kirguizistn");
        //    lspais.Add("Camboya");
        //    lspais.Add("Kiribati");
        //    lspais.Add("Comorosi");
        //    lspais.Add("San Cristbal y Nevis, Islas");
        //    lspais.Add("Corea del Norte");
        //    lspais.Add("Corea del Sur");
        //    lspais.Add("Kuwait");
        //    lspais.Add("Islas Caimn");
        //    lspais.Add("Kazajistn");
        //    lspais.Add("Laos");
        //    lspais.Add("Libano");
        //    lspais.Add("Santa Luca");
        //    lspais.Add("Liechtenstein");
        //    lspais.Add("Sri Lanka");
        //    lspais.Add("Liberia");
        //    lspais.Add("Lesoto");
        //    lspais.Add("Lituania");
        //    lspais.Add("Luxemburgo");
        //    lspais.Add("Letonia");
        //    lspais.Add("Libia");
        //    lspais.Add("Marruecos");
        //    lspais.Add("Monaco");
        //    lspais.Add("Moldavia");
        //    lspais.Add("Madagascar");
        //    lspais.Add("Islas Marshall");
        //    lspais.Add("Macedonia");
        //    lspais.Add("Mali");
        //    lspais.Add("Myanmar");
        //    lspais.Add("Mongolia");
        //    lspais.Add("Macao");
        //    lspais.Add("Islas Marianas del Norte");
        //    lspais.Add("Martinica");
        //    lspais.Add("Mauritania");
        //    lspais.Add("Monserrat");
        //    lspais.Add("Malta");
        //    lspais.Add("Mauricio");
        //    lspais.Add("Maldivas");
        //    lspais.Add("Malaui");
        //    lspais.Add("Mexico");
        //    lspais.Add("Malasia");
        //    lspais.Add("Mozambique");
        //    lspais.Add("Namibia");
        //    lspais.Add("Nueva Caledonia");
        //    lspais.Add("Niger");
        //    lspais.Add("Islas Norfolk");
        //    lspais.Add("Nigeria");
        //    lspais.Add("Nicaragua");
        //    lspais.Add("Paises Bajos");
        //    lspais.Add("Noruega");
        //    lspais.Add("Nepal");
        //    lspais.Add("Nauru");
        //    lspais.Add("Nueva Zelanda");
        //    lspais.Add("Omen");
        //    lspais.Add("Panama");
        //    lspais.Add("Peru");
        //    lspais.Add("Polinesia Francesa");
        //    lspais.Add("Papa Nueva Guinea");
        //    lspais.Add("Filipinas");
        //    lspais.Add("Pakistan");
        //    lspais.Add("Polonia");
        //    lspais.Add("St. Pierre y Miquelon");
        //    lspais.Add("Puerto Rico");
        //    lspais.Add("Portugal");
        //    lspais.Add("Palau");
        //    lspais.Add("Paraguay");
        //    lspais.Add("Qatar");
        //    lspais.Add("Rumana");
        //    lspais.Add("Rusia");
        //    lspais.Add("Ruanda");
        //    lspais.Add("Arabia Saudi");
        //    lspais.Add("Seychelles");
        //    lspais.Add("Sudan");
        //    lspais.Add("Suecia");
        //    lspais.Add("Singapur");
        //    lspais.Add("Santa Helena");
        //    lspais.Add("Eslovenia");
        //    lspais.Add("Eslovaquia");
        //    lspais.Add("Sierra Leona");
        //    lspais.Add("San Marino");
        //    lspais.Add("Senegal");
        //    lspais.Add("Somalia");
        //    lspais.Add("Surinam");
        //    lspais.Add("El Salvador");
        //    lspais.Add("Siria");
        //    lspais.Add("Islas Turks y Caicos");
        //    lspais.Add("Togo");
        //    lspais.Add("Tailandia");
        //    lspais.Add("Tajikistan");
        //    lspais.Add("Tokelau");
        //    lspais.Add("Turkmenistan");
        //    lspais.Add("Tunez");
        //    lspais.Add("Tonga");
        //    lspais.Add("Timor Oriental");
        //    lspais.Add("Turquia");
        //    lspais.Add("Trinidad y Tobago");
        //    lspais.Add("Tuvalu");
        //    lspais.Add("Taiwan");
        //    lspais.Add("Tanzania");
        //    lspais.Add("Ucrania");
        //    lspais.Add("Uganda");
        //    lspais.Add("Reino Unido");
        //    lspais.Add("US Minor Outlying Islands");
        //    lspais.Add("Estados Unidos de America");
        //    lspais.Add("Uruguay");
        //    lspais.Add("Uzbekistn");
        //    lspais.Add("Ciudad del Vaticano");
        //    lspais.Add("San Vicente y Granadinas");
        //    lspais.Add("Venezuela");
        //    lspais.Add("Islas vrgenes britnicas");
        //    lspais.Add("Islas Vrgenes");
        //    lspais.Add("Vietnam");
        //    lspais.Add("Vanuatu");
        //    lspais.Add("Islas Wallis y Futuna");
        //    lspais.Add("Samoa");
        //    lspais.Add("Yemen");
        //    lspais.Add("Mayote");
        //    lspais.Add("Sudafrica");
        //    lspais.Add("Zambia");
        //    lspais.Add("Zaire");
        //    lspais.Add("Zimbabue");
        //    return lspais;
        //}

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
    }
}