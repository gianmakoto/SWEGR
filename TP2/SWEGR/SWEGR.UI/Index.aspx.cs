using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWEGR.UI
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int IDEgresado;
            char TUsuario;
            String Nombrecitow;
            IDEgresado = Convert.ToInt32(Session["IDusuario"]);
            TUsuario = Convert.ToChar(Session["TipoUsusario"]);
            Nombrecitow = Convert.ToString(Session["NOmbrezazo"]);
           
            if (TUsuario == 'G')
            {
                Response.Redirect("Login.aspx");
                return;
            }

           

            if (IDEgresado == 0)
            {
                Response.Redirect("Login.aspx");
                return;
            }



            NombreHidden.Value = Nombrecitow;
           

        }
    }
}