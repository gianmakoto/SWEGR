﻿using System;
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
    public partial class ActualizargraduandoUI : System.Web.UI.Page
    {
        int IDEgresado;
        string dni;
        string telefono;
        string telefonoalternativo;
        string direccion;
        string departamento;
        string distrito;
        string correo;
        string correoalternativo;
        string perfillinkedin;
        string perfilfacebook;

        protected void Page_Load(object sender, EventArgs e)
        {
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

        public bool actualizarEgresado()
        {
            EgresadoBC objEgresadoBC = new EgresadoBC();
            EgresadoBE graduando = objEgresadoBC.obtenerEgresado(IDEgresado);

            dni = graduando.Dniegresado;
            telefono = graduando.Telefonoprinegresado;
            telefonoalternativo = graduando.Telefonoaltegresado;
            direccion = graduando.Direccionegresado;
            departamento = graduando.Departamentoegresado;
            distrito = graduando.Distritoegresado;
            correo = graduando.Correoegresado;
            correoalternativo = graduando.Correoaltegresado;
            perfillinkedin = graduando.Perfillinkedinegresado;
            perfilfacebook = graduando.Perfilfacebookegresado;

            graduando.Dniegresado = txtdni.Text;
            graduando.Telefonoprinegresado = txttelefonoprincipal.Text;
            graduando.Telefonoaltegresado = txttelefonoalternativo.Text;
            graduando.Direccionegresado = txtdireccion.Text;
            graduando.Departamentoegresado = Convert.ToString(ddlDepartamento.SelectedValue);
            graduando.Distritoegresado = txtdistrito.Text;
            graduando.Correoegresado = txtcorreo.Text;
            graduando.Correoaltegresado = txtcorreoalternativo.Text;
            graduando.Perfillinkedinegresado = txtperfillinkedin.Text;
            graduando.Perfilfacebookegresado = txtperfilfacebook.Text;

            if (objEgresadoBC.actualizarEgresado(graduando))
                return true;
            else
                return false;
        }

        public void guardarHistorial()
        {
            try
            {
                EgresadoBC objEgresadoBC = new EgresadoBC();
                EgresadoBE validagraduando = objEgresadoBC.obtenerEgresado(IDEgresado);
                HistorialDatosEgresadoBE objHistorialDatosEgresadoBE = new HistorialDatosEgresadoBE();

                if (validagraduando.Dniegresado != dni)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "DNI";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Dniegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Telefonoprinegresado != telefono)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "TelefonoPrincipal";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Telefonoprinegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Telefonoaltegresado != telefonoalternativo)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "TelefonoAlternativo";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Telefonoaltegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Direccionegresado != direccion)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "Direccion";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Direccionegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Departamentoegresado != departamento)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "Departamento";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Departamentoegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Distritoegresado != distrito)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "Distrito";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Distritoegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Correoegresado != correo)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "Correo";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Correoegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Correoaltegresado != correoalternativo)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "CorreoAlternativo";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Correoaltegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Perfillinkedinegresado != perfillinkedin)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "PerfilLinkedIn";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Perfillinkedinegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }

                if (validagraduando.Perfilfacebookegresado != perfilfacebook)
                {
                    objHistorialDatosEgresadoBE.Idegresado = IDEgresado;
                    objHistorialDatosEgresadoBE.Campoactualizado = "PerfilFacebook";
                    objHistorialDatosEgresadoBE.Valornuevo = validagraduando.Perfilfacebookegresado;
                    objHistorialDatosEgresadoBE.Fechaactualizacion = DateTime.Now;
                    objHistorialDatosEgresadoBE.Origen = 'U';

                    objEgresadoBC.insertarhistdategresado(objHistorialDatosEgresadoBE);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }

        public bool validarFormulario()
        {
            bool errorcito = false;


            //if (txtdni.Text == "" && txttelefonoprincipal.Text == "" && txtcorreo.Text == "" && txtperfillinkedin.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "formularioincompleto();", true);
            //    errorcito = true;
            //}

            //if (txtdni.Text == "" && txttelefonoprincipal.Text == "" && txtcorreo.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "dnitelcorreovacio();", true);
            //    errorcito = true;
            //}

            //if (txtdni.Text == "" && txttelefonoprincipal.Text == "" && txtperfillinkedin.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "dnitellinkedinvacio();", true);
            //    errorcito = true;
            //}

            //if (txtdni.Text == "" && txtcorreo.Text == "" && txtperfillinkedin.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "dnicorreolinkedinvacio();", true);
            //    errorcito = true;
            //}

            //if (txttelefonoprincipal.Text == "" && txtcorreo.Text == "" && txtperfillinkedin.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "telcorreolinkedinvacio();", true);
            //    errorcito = true;
            //}

            //if (txtdni.Text == "" && txttelefonoprincipal.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "dniytelefonovacio();", true);
            //    errorcito = true;
            //}

            //if (txtdni.Text == "" && txtcorreo.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "dniycorreovacio();", true);
            //    errorcito = true;
            //}

            //if (txtdni.Text == "" && txtperfillinkedin.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "dniylinkedinvacio();", true);
            //    errorcito = true;
            //}

            //if (txttelefonoprincipal.Text == "" && txtcorreo.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "telefonoycorreovacio();", true);
            //    errorcito = true;
            //}

            //if (txttelefonoprincipal.Text == "" && txtperfillinkedin.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "telefonoylinkedinvacio();", true);
            //    errorcito = true;
            //}

            //if (txtcorreo.Text == "" && txtperfillinkedin.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "correoylinkedinvacio();", true);
            //    errorcito = true;
            //}

            if (txtdni.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "dnivacio();", true);
                txtdni.BorderColor = System.Drawing.Color.OrangeRed;
                errorcito = true;
            } else
                txtdni.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txttelefonoprincipal.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "telefonovacio();", true);
                txttelefonoprincipal.BorderColor = System.Drawing.Color.OrangeRed;
                errorcito = true;
            } else
                txttelefonoprincipal.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtcorreo.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "correovacio();", true);
                txtcorreo.BorderColor = System.Drawing.Color.OrangeRed;
                errorcito = true;
            } else
                txtcorreo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtperfillinkedin.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "perfillinkedinvacio();", true);
                txtperfillinkedin.BorderColor = System.Drawing.Color.OrangeRed;
                errorcito = true;
            } else
                txtperfillinkedin.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (errorcito)
                return false;

            return true;
        }

        public bool validarCampos()
        {
            bool validacorreo = false;
            bool validacorreoalterno = false;
            bool validaurllinkedin = false;
            bool validaurlfacebook = false;
            bool error = false;
            

            ValidarCorreo objetovalidarcorreo = new ValidarCorreo();
            validacorreo = objetovalidarcorreo.IsValidEmail(txtcorreo.Text.Trim());

            ValidarURL objetovalidarurl = new ValidarURL();
            validaurllinkedin = objetovalidarurl.ValidateUrl(txtperfillinkedin.Text);

            ValidarURL objetovalidarfb = new ValidarURL();
            validaurlfacebook = objetovalidarfb.ValidateUrl(txtperfilfacebook.Text.Trim());

           if (ddlDepartamento.SelectedIndex == 0)
            {
                ddlDepartamento.BorderColor = System.Drawing.Color.OrangeRed;
                error = true;  
            }
            else
                ddlDepartamento.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txtdni.Text.Length != 8)
            {

                txtdni.BorderColor = System.Drawing.Color.OrangeRed;
                
                error = true;  
            }
            else
                txtdni.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txttelefonoprincipal.Text.Length != 9)
            {

                txttelefonoprincipal.BorderColor = System.Drawing.Color.OrangeRed;
                
                error = true;
            }
            else
                txttelefonoprincipal.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (txttelefonoalternativo.Text.Length != 9)
            {

                txttelefonoalternativo.BorderColor = System.Drawing.Color.OrangeRed;
                
                error = true;
            }
            else
                txttelefonoalternativo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4"); 

            if (!validacorreo)
            {
                
                txtcorreo.BorderColor = System.Drawing.Color.OrangeRed;
                
                error = true;
            }
            else
                txtcorreo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4"); 

         
                if (!validaurllinkedin)
                {
                   
                    txtperfillinkedin.BorderColor = System.Drawing.Color.OrangeRed;
                   
                    error = true;
                }
                else
                    txtperfillinkedin.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4"); 
           
            string correoalternativo = txtcorreoalternativo.Text;

            if (correoalternativo != null && correoalternativo != "")
            {
                

                validacorreoalterno = objetovalidarcorreo.IsValidEmail(txtcorreoalternativo.Text);
                if (!validacorreoalterno)
                {
                   
                    txtcorreoalternativo.BorderColor = System.Drawing.Color.OrangeRed;
                    
                    error = true;
                }
                else
                    txtcorreoalternativo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4"); 
            }else
                txtcorreoalternativo.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if(txtperfilfacebook.Text.Length != 0)
            {
                

            if (!validaurlfacebook)
            {
                
                txtperfilfacebook.BorderColor = System.Drawing.Color.OrangeRed;
               
                error = true;
            }
            else
                txtperfilfacebook.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");
         }
            else
                txtperfilfacebook.BorderColor = System.Drawing.ColorTranslator.FromHtml("#E2E2E4");

            if (error)
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "incompleto();", true);
                return false;
            }
            return true;
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (validarFormulario())
               {
                   if (validarCampos())
                   {
                       if (actualizarEgresado())
                       {
                           ScriptManager.RegisterStartupScript(Page, GetType(), "SWEGR", "exito();", true);
                           guardarHistorial();

                       }
                       else
                           ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
                   }
                   else 
                   {
                       btnguardar.Focus();
                   }

                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterClientScriptBlock(GetType(), "SWEGR", "<script language=\"JavaScript\"> alert(\"Ocurrió un error\")</script>", false);
            }
        }
    }
}