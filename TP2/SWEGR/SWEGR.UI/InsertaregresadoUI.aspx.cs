using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;


using System.Web.Security;
using SWEGR.BL.BC;
using SWEGR.BL.BE;


namespace SWEGR.UI
{
    public partial class InsertaregresadoUI : System.Web.UI.Page
    {
        string CarreraED;
        string CicloEgresoED;
        string ContrasenaDinamicaED;
        bool CambioContrasenaED;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            EgresadoBE objEgresadoBE = new EgresadoBE();
            EgresadoBC objEgresadoBC = new EgresadoBC();


            string contrasena = txtcontrasena.Text;
            if (txtCodigo.Text == "" || txtcorreo.Text == "" || txtcontrasena.Text == "")
                ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
            else
            {
                if (txtcontrasena.Text != txtconfirmarcontrasena.Text)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "ocurrencia", "ocurrencia();", true);
                }
                else
                {
                    string carrera = (string)ViewState["CarreraED"];
                    string cicloegreso = (string)ViewState["CicloEgresoED"];
                    string contrasenadinamica = (string)ViewState["ContrasenaDinamicaED"];
                    bool cambiocontrasena = (bool)ViewState["CambioContrasenaED"];

                    string contrasenaEncriptada = Encriptar(txtcontrasena.Text);

                    objEgresadoBE.Codigouniversitarioegresado = txtCodigo.Text;
                    objEgresadoBE.Nombrecompletoegresado = txtnombre.Text;
                    objEgresadoBE.Correoegresado = txtcorreo.Text;
                    objEgresadoBE.Contrasenaegresado = contrasenaEncriptada;
                    objEgresadoBE.Carreraegresado = carrera;
                    objEgresadoBE.Cicloegresado = cicloegreso;
                    objEgresadoBE.Contrasenadinamicaegresado = contrasenadinamica;
                    objEgresadoBE.Cambiocontrasenaegresado = cambiocontrasena;
                    objEgresadoBE.Tipoegresado = 'D';
                    objEgresadoBE.Idfotoegresado = 1;

                    objEgresadoBC.insertarEgresadodesdeEgresadoDesvinculado(objEgresadoBE);

                    ActualizarEgresadoDesvinculado(txtCodigo.Text);
                    ScriptManager.RegisterStartupScript(Page, GetType(), "exito", "exito();", true);
                    Limpiar();
                }
            }
        }

        public void Limpiar()
        {
            txtCodigo.Text = "";
            txtnombre.Text = "";
            txtcorreo.Text = "";
            txtcontrasena.Text = "";
            txtconfirmarcontrasena.Text = "";

            txtCodigo.Enabled = true;

            txtCodigo.Focus();
            btnRegistrar.Enabled = false;
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            EgresadoDesvinculadoBE objEgresadoDesvinculadoBE = new EgresadoDesvinculadoBE();
            EgresadoBC objEgresadoBC = new EgresadoBC();

            objEgresadoDesvinculadoBE = objEgresadoBC.obtenerEgresadoDesvinculado(txtCodigo.Text);

            if (objEgresadoDesvinculadoBE.Estaregistrado == false)
            {
                txtnombre.Text = objEgresadoDesvinculadoBE.Nombrecompleto;

                CarreraED = objEgresadoDesvinculadoBE.Carrera;
                CicloEgresoED = objEgresadoDesvinculadoBE.Cicloegreso;
                ContrasenaDinamicaED = objEgresadoDesvinculadoBE.Contrasenadinamica;
                CambioContrasenaED = objEgresadoDesvinculadoBE.Cambiocontrasena;

                ViewState["CarreraED"] = CarreraED;
                ViewState["CicloEgresoED"] = CicloEgresoED;
                ViewState["ContrasenaDinamicaED"] = ContrasenaDinamicaED;
                ViewState["CambioContrasenaED"] = CambioContrasenaED;

                if(txtnombre.Text != "")
                {
                    txtCodigo.Enabled = false;
                    btnRegistrar.Enabled = true;
                }
                else
                    ScriptManager.RegisterStartupScript(Page, GetType(), "egresadonoencontrado", "egresadonoencontrado();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "egresadorepetido", "egresadorepetido();", true);
                Limpiar();
            }
        }

        public void ActualizarEgresadoDesvinculado(string codigo)
        {
            EgresadoDesvinculadoBE objEgresadoDesvinculadoBE = new EgresadoDesvinculadoBE();
            EgresadoBC objEgresadoBC = new EgresadoBC();

            objEgresadoDesvinculadoBE = objEgresadoBC.obtenerEgresadoDesvinculado(codigo);
            objEgresadoDesvinculadoBE.Estaregistrado = true;
            objEgresadoDesvinculadoBE.Codigo = codigo;

            objEgresadoBC.ActualizarEgresadoDesvinclado(objEgresadoDesvinculadoBE);
        }

        private string Encriptar(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
    }
}