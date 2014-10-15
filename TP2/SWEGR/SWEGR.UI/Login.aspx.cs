using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWEGR.UI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void boton_Click(object sender, EventArgs e)
        {
            if (txtid.Text == "rosario.villalta" && txtpass.Text == "12345")
                Response.Redirect("listarEgresadosUI.aspx");

            if (txtid.Text == "u912916" && txtpass.Text == "12345")
            {
                Session["IDusuario"] = 1;
                Response.Redirect("ActualizargraduandoUI.aspx");
            }

            if (txtid.Text == "u920283" && txtpass.Text == "12345")
            {
                Session["IDusuario"] = 2;
                Response.Redirect("ActualizaregresadoUI.aspx");
            }

        }



    }
}