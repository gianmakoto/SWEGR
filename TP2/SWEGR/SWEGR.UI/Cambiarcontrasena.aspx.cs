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
    public partial class Cambiarcontrasena : System.Web.UI.Page
    {
        int IDEgresado;
        char TUsuario;
     
            String Nombrecitow;
            
            
            

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                IDEgresado = Convert.ToInt32(Session["IDusuario"]);
                TUsuario = Convert.ToChar(Session["TipoUsuario"]);
                Nombrecitow = Convert.ToString(Session["NOmbrezazo"]);
                NombreHidden.Value = Nombrecitow;
                if (TUsuario == 'G')
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                if (!IsPostBack)
                {
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if(txtcontrasenaactual.Text == "" || txtnuevacontransena.Text == "" || txtrepetircontrasena.Text == "")
                ScriptManager.RegisterStartupScript(Page, GetType(), "incompleto", "incompleto();", true);  
            else
            {
                EgresadoBC metodosGraduando = new EgresadoBC();
                EgresadoBE objEgresadoBE = new EgresadoBE();

                objEgresadoBE = metodosGraduando.obtenerEgresado(25);
                string contrasenaDesencriptada = Desencriptar(objEgresadoBE.Contrasenaegresado);
                string contrasenaEncriptada;

                if (txtcontrasenaactual.Text != contrasenaDesencriptada)
                    ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
                else
                {
                    if (txtnuevacontransena.Text != txtrepetircontrasena.Text)
                        ScriptManager.RegisterStartupScript(Page, GetType(), "ocurrencia", "ocurrencia();", true);
                    else
                    {
                        contrasenaEncriptada = Encriptar(txtnuevacontransena.Text);
                        objEgresadoBE.Contrasenaegresado = contrasenaEncriptada;
                        metodosGraduando.actualizarEgresado(objEgresadoBE);
                        ScriptManager.RegisterStartupScript(Page, GetType(), "exito", "exito();", true);
                        Limpiar();
                    }    
                }
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void Limpiar()
        {
            txtcontrasenaactual.Text = "";
            txtnuevacontransena.Text = "";
            txtrepetircontrasena.Text = "";
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

        private string Desencriptar(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
    }
}