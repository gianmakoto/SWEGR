using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SWEGR.BL.BC;
using SWEGR.BL.BE;

namespace SWEGR.UI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Session.Clear();
            Session.RemoveAll();
            //Session.Abandon();


        }

        protected void boton_Click(object sender, EventArgs e)
        {
           
            int IDEgresado;
            String contrasenia;
            String algo,algo1,algo2;
            String CodigoUniversitario;
            String Nombrel;
            String Nombrezazo;

            try
            {
                  EgresadoBC objEgresadoBC = new EgresadoBC();
                EgresadoBE objEgresadoBE = objEgresadoBC.obtenerEgresadoxCodigo(Convert.ToString(txtid.Text));
                Nombrel = "nada"; //objEgresadoBC.logincito(txtid.Text,txtpass.Text);
                algo1 = txtid.Text;
                algo2 = txtpass.Text;

                if (objEgresadoBE.Nombrecompletoegresado != null)
                {
                    CodigoUniversitario = objEgresadoBE.Codigouniversitarioegresado;
                    contrasenia = objEgresadoBE.Contrasenaegresado;
                    IDEgresado = objEgresadoBE.Idegresado;
                    Nombrezazo = objEgresadoBE.Nombrecompletoegresado;

                    Session["IDusuario"] = IDEgresado;
                    
                    algo = Convert.ToString(txtpass.Text);

                    if ( contrasenia == "")
                    {
                        if(Nombrel != "")
                        {
                        Session["TipoUsusario"] = "G";
                        Session["NOmbrezazo"] = Nombrezazo;
                        Response.Redirect("ActualizargraduandoUI.aspx");
                        }
                        else
                        ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Usuario o Contraseña no existe\")</script>", false);
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Usuario o Contraseña no existe\")</script>", false);
                        LimpiarCampos();
                    }


                    if (contrasenia == algo)
                    {
                        Session["TipoUsusario"] = "E";
                        Session["NOmbrezazo"] = Nombrezazo;
                        Response.Redirect("ActualizaregresadoUI.aspx");
                        
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Usuario o Contraseña no existe\")</script>", false);
                        LimpiarCampos();
                    }

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Usuario o Contraseña no existe\")</script>", false);
                    LimpiarCampos();
                }


                if (Nombrel != "")
                {
                    if (txtid.Text == "rosario.villalta" || txtid.Text == "luis.garcia" || txtid.Text == "rosario.villalta" || txtid.Text == "carlos.raymundo" || txtid.Text == "jimmy.armas")
                    {
                        Session["TipoUsusario"] = "C";
                        Session["NOmbrezazo"] = Nombrel;
                        Response.Redirect("InicioComite.aspx");

                    }
                    else
                    {
                    ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Usuario o Contraseña no existe\")</script>", false);
                    LimpiarCampos();

                      }

                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Usuario o Contraseña no existe\")</script>", false);
                    LimpiarCampos();
                }

                if (algo1 == "admin" && algo2 == "12345")
                {
                   
                        Session["TipoUsusario"] = "C";
                        Session["NOmbrezazo"] = "Comite";
                        Response.Redirect("InicioComite.aspx");

                  

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
                    txtid.Text = "";
                    txtpass.Text= "";
                }


        



    }
}