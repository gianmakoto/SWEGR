using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//using System.Web.Security;
using SWEGR.BL.BC;
using SWEGR.BL.BE;

namespace SWEGR.UI
{
    public partial class Loginprueba : System.Web.UI.Page
    {
        int IDEgresado;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                EgresadoBC objEgresadoBC = new EgresadoBC();
                EgresadoBE objEgresadoBE = objEgresadoBC.obtenerEgresado(Convert.ToInt32(txtidegresado.Text));
                if (objEgresadoBE.Nombrecompletoegresado != null)
                {
                    if (objEgresadoBE.Tipoegresado == 'G')
                    {
                        IDEgresado = objEgresadoBE.Idegresado;
                        Response.Redirect("ActualizargraduandoUI.aspx?IDEgresado=" + IDEgresado.ToString());
                    }
                    else
                    {
                        if (objEgresadoBE.Tipoegresado == 'E')
                        {
                            IDEgresado = objEgresadoBE.Idegresado;
                            Response.Redirect("VisualizaregresadoUI.aspx?IDEgresado=" + IDEgresado.ToString());
                        }
                        else
                            ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"El usuario presenta error\")</script>", false);
                    }
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Usuario o Contraseña no existe\")</script>", false);
                    LimpiarCampos();
                }

            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        public void LimpiarCampos()
        {
            txtidegresado.Text = "";
        }
    }
}