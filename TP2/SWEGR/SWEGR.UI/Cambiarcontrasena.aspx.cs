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
    public partial class Cambiarcontrasena : System.Web.UI.Page
    {
        int IDEgresado;
        char TUsuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                IDEgresado = Convert.ToInt32(Session["IDusuario"]);
                TUsuario = Convert.ToChar(Session["TipoUsuario"]);
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

                objEgresadoBE = metodosGraduando.obtenerEgresado(IDEgresado);

                if (txtcontrasenaactual.Text != objEgresadoBE.Contrasenaegresado)
                    ScriptManager.RegisterStartupScript(Page, GetType(), "error", "error();", true);
                else
                {
                    if (txtnuevacontransena.Text != txtrepetircontrasena.Text)
                        ScriptManager.RegisterStartupScript(Page, GetType(), "ocurrencia", "ocurrencia();", true);
                    else
                    {
                        objEgresadoBE.Contrasenaegresado = txtnuevacontransena.Text;
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
    }
}