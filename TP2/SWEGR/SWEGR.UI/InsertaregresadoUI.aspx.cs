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
    public partial class InsertaregresadoUI : System.Web.UI.Page
    {
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
                    objEgresadoBE.Codigouniversitarioegresado = txtCodigo.Text;
                    objEgresadoBE.Nombrecompletoegresado = txtnombre.Text;
                    objEgresadoBE.Correoegresado = txtcorreo.Text;
                    objEgresadoBE.Contrasenaegresado = txtcontrasena.Text;

                    objEgresadoBC.insertarEgresadodesdeEgresadoDesvinculado(objEgresadoBE);

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

            txtnombre.Text = objEgresadoDesvinculadoBE.Nombrecompleto;

            if (txtnombre.Text != "")
            {
                txtCodigo.Enabled = false;
                btnRegistrar.Enabled = true;
            }
        }
    }
}