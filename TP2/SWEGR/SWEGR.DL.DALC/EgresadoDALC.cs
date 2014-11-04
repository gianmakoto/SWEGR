using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SWEGR.BL.BE;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using SSIAAutenticador;

namespace SWEGR.DL.DALC
{
    public class EgresadoDALC
    {
        public String logincito(String usuario, String contra)
        {
            try
            {String nombrecito;

             SSIAAutenticadorBE autentificador_Datos = new SSIAAutenticadorBE();
                    autentificador_Datos.Usuario =  usuario;
                    autentificador_Datos.Contraseña = contra;
                    SSIAAutenticador.SSIAAutenticador autentificador_Clase =  new SSIAAutenticador.SSIAAutenticador();
                    autentificador_Datos =  autentificador_Clase.autenticar(autentificador_Datos);

                    nombrecito = autentificador_Datos.Nombre;

                    return nombrecito;
            }
            catch (Exception)
            {
                
                throw;
            }
            

       

        }

        public EgresadoBE obtenerEgresadoxCodigo(string codigo)
        {
            String sqlobteneregresado;

            SqlConnection conn;
            SqlCommand cmdobteneregresado;
            SqlParameter prmcodigo;
            SqlDataReader dregresado;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlobteneregresado = "SWEGR_obtenerEgresadoxCodigoUniv";
                cmdobteneregresado = new SqlCommand(sqlobteneregresado, conn);
                cmdobteneregresado.CommandType = CommandType.StoredProcedure;

                prmcodigo = new SqlParameter();
                prmcodigo.ParameterName = "@codigouniversitario";
                prmcodigo.SqlDbType = SqlDbType.VarChar;
                prmcodigo.Size = 10;
                prmcodigo.Value = codigo;

                cmdobteneregresado.Parameters.Add(prmcodigo);
                cmdobteneregresado.Connection.Open();

                EgresadoBE objetoEgresadoBE;
                objetoEgresadoBE = new EgresadoBE();

                dregresado = cmdobteneregresado.ExecuteReader();

                if (dregresado.Read())
                {
                    objetoEgresadoBE.Idegresado = dregresado.GetInt32(0);
                    objetoEgresadoBE.Nombrecompletoegresado = dregresado.GetString(1);
                    objetoEgresadoBE.Edadegresado = dregresado.GetByte(2);
                    objetoEgresadoBE.Sexoegresado = Convert.ToChar(dregresado.GetString(3));
                    objetoEgresadoBE.Telefonoprinegresado = dregresado.GetString(4);
                    objetoEgresadoBE.Telefonoaltegresado = dregresado.GetString(5);
                    objetoEgresadoBE.Dniegresado = dregresado.GetString(6);
                    objetoEgresadoBE.Correoegresado = dregresado.GetString(7);
                    objetoEgresadoBE.Correoaltegresado = dregresado.GetString(8);
                    objetoEgresadoBE.Direccionegresado = dregresado.GetString(9);
                    objetoEgresadoBE.Distritoegresado = dregresado.GetString(10);
                    objetoEgresadoBE.Departamentoegresado = dregresado.GetString(11);
                    objetoEgresadoBE.Idpaisegresado = dregresado.GetInt32(12);
                    objetoEgresadoBE.Perfillinkedinegresado = dregresado.GetString(13);
                    objetoEgresadoBE.Perfilfacebookegresado = dregresado.GetString(14);
                    objetoEgresadoBE.Fechanacimientoegresado = dregresado.GetDateTime(15);
                    objetoEgresadoBE.Tipoegresado = Convert.ToChar(dregresado.GetString(16));
                    objetoEgresadoBE.Idfotoegresado = dregresado.GetInt32(17);
                    objetoEgresadoBE.Contrasenaegresado = dregresado.GetString(18);
                    objetoEgresadoBE.Contrasenadinamicaegresado = dregresado.GetString(19);
                    objetoEgresadoBE.Cambiocontrasenaegresado = dregresado.GetBoolean(20);
                    objetoEgresadoBE.Cicloegresado = dregresado.GetString(21);
                    objetoEgresadoBE.Codigouniversitarioegresado = dregresado.GetString(22);
                    objetoEgresadoBE.Carreraegresado = dregresado.GetString(23);
                }
                cmdobteneregresado.Connection.Close();

                return objetoEgresadoBE;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<EgresadoBE> listarEgresado()
        {
            String sqllistaregresado;

            SqlConnection conn;
            SqlCommand cmdlistaregresado;
            SqlDataReader dregresado;

            try
            {
                List<EgresadoBE> lstEgresadoBE;
                EgresadoBE objetoEgresadoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaregresado = "SWEGR_listarEgresado";
                cmdlistaregresado = new SqlCommand(sqllistaregresado, conn);
                cmdlistaregresado.CommandType = CommandType.StoredProcedure;

                cmdlistaregresado.Connection.Open();
                dregresado = cmdlistaregresado.ExecuteReader();
                lstEgresadoBE = new List<EgresadoBE>();

                while (dregresado.Read())
                {
                    objetoEgresadoBE = new EgresadoBE();
                    objetoEgresadoBE.Idegresado = dregresado.GetInt32(0);
                    objetoEgresadoBE.Nombrecompletoegresado = dregresado.GetString(1);
                    objetoEgresadoBE.Edadegresado = dregresado.GetByte(2);
                    objetoEgresadoBE.Sexoegresado = Convert.ToChar(dregresado.GetString(3));
                    objetoEgresadoBE.Telefonoprinegresado = dregresado.GetString(4);
                    objetoEgresadoBE.Telefonoaltegresado = dregresado.GetString(5);
                    objetoEgresadoBE.Dniegresado = dregresado.GetString(6);
                    objetoEgresadoBE.Correoegresado = dregresado.GetString(7);
                    objetoEgresadoBE.Correoaltegresado = dregresado.GetString(8);
                    objetoEgresadoBE.Direccionegresado = dregresado.GetString(9);
                    objetoEgresadoBE.Distritoegresado = dregresado.GetString(10);
                    objetoEgresadoBE.Departamentoegresado = dregresado.GetString(11);
                    objetoEgresadoBE.Idpaisegresado = dregresado.GetInt32(12);
                    objetoEgresadoBE.Perfillinkedinegresado = dregresado.GetString(13);
                    objetoEgresadoBE.Perfilfacebookegresado = dregresado.GetString(14);
                    objetoEgresadoBE.Fechanacimientoegresado = dregresado.GetDateTime(15);
                    objetoEgresadoBE.Tipoegresado = Convert.ToChar(dregresado.GetString(16));
                    objetoEgresadoBE.Idfotoegresado = dregresado.GetInt32(17);
                    objetoEgresadoBE.Contrasenaegresado = dregresado.GetString(18);
                    objetoEgresadoBE.Contrasenadinamicaegresado = dregresado.GetString(19);
                    objetoEgresadoBE.Cambiocontrasenaegresado = dregresado.GetBoolean(20);
                    objetoEgresadoBE.Cicloegresado = dregresado.GetString(21);
                    objetoEgresadoBE.Codigouniversitarioegresado = dregresado.GetString(22);
                    objetoEgresadoBE.Carreraegresado = dregresado.GetString(23);

                    lstEgresadoBE.Add(objetoEgresadoBE);
                }
                cmdlistaregresado.Connection.Close();
                return lstEgresadoBE;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<EgresadoBE> listarEgresado_Lista(String nombre, String carrera, int anioInicio, int anioFin, String codigoUniversitario)
        {
            String sqllistaregresado;

            SqlConnection conn;
            SqlCommand cmdlistaregresado;
            SqlDataReader dregresado;
            SqlParameter prmNombre;
            SqlParameter prmAnioInicio;
            SqlParameter prmAnioFin;
            SqlParameter prmCodigo;
            SqlParameter prmCarrera;

            try
            {
                List<EgresadoBE> lstEgresadoBE;
                EgresadoBE objetoEgresadoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaregresado = "SWEGR_listarEgresado_Lista";
                cmdlistaregresado = new SqlCommand(sqllistaregresado, conn);
                cmdlistaregresado.CommandType = CommandType.StoredProcedure;

                prmNombre = new SqlParameter();
                prmNombre.ParameterName = "@nombre";
                prmNombre.SqlDbType = SqlDbType.VarChar;
                prmNombre.Size = 50;
                prmNombre.Value = nombre;
                prmNombre.Direction = ParameterDirection.Input;


                prmCodigo = new SqlParameter();
                prmCodigo.ParameterName = "@codigoUniversitario";
                prmCodigo.SqlDbType = SqlDbType.VarChar;
                prmCodigo.Size = 10;
                prmCodigo.Value = codigoUniversitario;
                prmCodigo.Direction = ParameterDirection.Input;

                prmCarrera = new SqlParameter();
                prmCarrera.ParameterName = "@Carrera";
                prmCarrera.SqlDbType = SqlDbType.VarChar;
                prmCarrera.Size = 50;
                prmCarrera.Value = carrera;
                prmCarrera.Direction = ParameterDirection.Input;

                prmAnioInicio = new SqlParameter();
                prmAnioInicio.ParameterName = "@anioinicio";
                prmAnioInicio.SqlDbType = SqlDbType.Int;
                prmAnioInicio.Value = anioInicio;
                prmAnioInicio.Direction = ParameterDirection.Input;

                prmAnioFin= new SqlParameter();
                prmAnioFin.ParameterName = "@aniofin";
                prmAnioFin.SqlDbType = SqlDbType.Int;
                prmAnioFin.Value = anioFin;
                prmAnioFin.Direction = ParameterDirection.Input;

               
                cmdlistaregresado.Parameters.Add(prmNombre);
                cmdlistaregresado.Parameters.Add(prmCodigo);
                cmdlistaregresado.Parameters.Add(prmCarrera);
                cmdlistaregresado.Parameters.Add(prmAnioInicio);
                cmdlistaregresado.Parameters.Add(prmAnioFin);
                
                cmdlistaregresado.Connection.Open();
                dregresado = cmdlistaregresado.ExecuteReader();
                lstEgresadoBE = new List<EgresadoBE>();

               while (dregresado.Read())
                {
                    objetoEgresadoBE = new EgresadoBE();
                    objetoEgresadoBE.Idegresado = dregresado.GetInt32(0);
                    objetoEgresadoBE.Codigouniversitarioegresado = dregresado.GetString(1);
                    objetoEgresadoBE.Nombrecompletoegresado = dregresado.GetString(2);
                    objetoEgresadoBE.Carreraegresado = dregresado.GetString(3);
                    objetoEgresadoBE.Cicloegresado = dregresado.GetString(4);               

                    lstEgresadoBE.Add(objetoEgresadoBE);
               }
                cmdlistaregresado.Connection.Close();
                return lstEgresadoBE;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public EgresadoBE obtenerEgresado(int idegresado)
        {
            String sqlobteneregresado;

            SqlConnection conn;
            SqlCommand cmdobteneregresado;
            SqlParameter prmidegresado;
            SqlDataReader dregresado;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlobteneregresado = "SWEGR_obtenerEgresado";
                cmdobteneregresado = new SqlCommand(sqlobteneregresado, conn);
                cmdobteneregresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                cmdobteneregresado.Parameters.Add(prmidegresado);
                cmdobteneregresado.Connection.Open();

                EgresadoBE objetoEgresadoBE;
                objetoEgresadoBE = new EgresadoBE();

                dregresado = cmdobteneregresado.ExecuteReader();              

                if (dregresado.Read())
                {
                    objetoEgresadoBE.Idegresado = dregresado.GetInt32(0);
                    objetoEgresadoBE.Nombrecompletoegresado = dregresado.GetString(1);
                    objetoEgresadoBE.Edadegresado = dregresado.GetByte(2);
                    objetoEgresadoBE.Sexoegresado = Convert.ToChar(dregresado.GetString(3));
                    objetoEgresadoBE.Telefonoprinegresado = dregresado.GetString(4);
                    objetoEgresadoBE.Telefonoaltegresado = dregresado.GetString(5);
                    objetoEgresadoBE.Dniegresado = dregresado.GetString(6);
                    objetoEgresadoBE.Correoegresado = dregresado.GetString(7);
                    objetoEgresadoBE.Correoaltegresado = dregresado.GetString(8);
                    objetoEgresadoBE.Direccionegresado = dregresado.GetString(9);
                    objetoEgresadoBE.Distritoegresado = dregresado.GetString(10);
                    objetoEgresadoBE.Departamentoegresado = dregresado.GetString(11);
                    objetoEgresadoBE.Idpaisegresado = dregresado.GetInt32(12);
                    objetoEgresadoBE.Perfillinkedinegresado = dregresado.GetString(13);
                    objetoEgresadoBE.Perfilfacebookegresado = dregresado.GetString(14);
                    objetoEgresadoBE.Fechanacimientoegresado = dregresado.GetDateTime(15);
                    objetoEgresadoBE.Tipoegresado = Convert.ToChar(dregresado.GetString(16));
                    objetoEgresadoBE.Idfotoegresado = dregresado.GetInt32(17);
                    objetoEgresadoBE.Contrasenaegresado = dregresado.GetString(18);
                    objetoEgresadoBE.Contrasenadinamicaegresado = dregresado.GetString(19);
                    objetoEgresadoBE.Cambiocontrasenaegresado = dregresado.GetBoolean(20);
                    objetoEgresadoBE.Cicloegresado = dregresado.GetString(21);
                    objetoEgresadoBE.Codigouniversitarioegresado = dregresado.GetString(22);
                    objetoEgresadoBE.Carreraegresado = dregresado.GetString(23);
                }
                cmdobteneregresado.Connection.Close();

                return objetoEgresadoBE;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool actualizarEgresado(EgresadoBE objetoEgresadoBE)
        {
            String sqlactualizaregresado;

            SqlConnection conn;
            SqlCommand cmdactualizaregresado;
            SqlParameter prmidegresado;
            SqlParameter prmnombrecompletoegresado;
            SqlParameter prmedadegresado;
            SqlParameter prmsexoegresado;
            SqlParameter prmtelefonoprinegresado;
            SqlParameter prmtelefonoaltegresado;
            SqlParameter prmdniegresado;
            SqlParameter prmcorreoegresado;
            SqlParameter prmcorreoaltegresado;
            SqlParameter prmdireccionegresado;
            SqlParameter prmdistritoegresado;
            SqlParameter prmdepartamentoegresado;
            SqlParameter prmidpaisesgresado;
            SqlParameter prmperfilinkedinegresado;
            SqlParameter prmperfilfacebookegresado;
            SqlParameter prmfechanacimientoegresado;
            SqlParameter prmtipoegresado;
            SqlParameter prmidfotoegresado;
            SqlParameter prmcontrasenaegresado;
            SqlParameter prmcontrasenadinamicaegresado;
            SqlParameter prmcambiocontrasenaegresado;
            SqlParameter prmcicloegresado;
            SqlParameter prmcodigouniversitarioegresado;
            SqlParameter prmcarreraegresado;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlactualizaregresado = "SWEGR_actualizarEgresado";
                cmdactualizaregresado = new SqlCommand(sqlactualizaregresado, conn);
                cmdactualizaregresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = objetoEgresadoBE.Idegresado;

                prmnombrecompletoegresado = new SqlParameter();
                prmnombrecompletoegresado.ParameterName = "@nombrecompletoegresado";
                prmnombrecompletoegresado.SqlDbType = SqlDbType.VarChar;
                prmnombrecompletoegresado.Size = 100;
                prmnombrecompletoegresado.Value = objetoEgresadoBE.Nombrecompletoegresado;

                prmedadegresado = new SqlParameter();
                prmedadegresado.ParameterName = "@edadegresado";
                prmedadegresado.SqlDbType = SqlDbType.TinyInt;
                prmedadegresado.Value = objetoEgresadoBE.Edadegresado;

                prmsexoegresado = new SqlParameter();
                prmsexoegresado.ParameterName = "@sexoegresado";
                prmsexoegresado.SqlDbType = SqlDbType.Char;
                prmsexoegresado.Size = 1;
                prmsexoegresado.Value = objetoEgresadoBE.Sexoegresado;

                prmtelefonoprinegresado = new SqlParameter();
                prmtelefonoprinegresado.ParameterName = "@telefonoprinegresado";
                prmtelefonoprinegresado.SqlDbType = SqlDbType.VarChar;
                prmtelefonoprinegresado.Size = 9;
                prmtelefonoprinegresado.Value = objetoEgresadoBE.Telefonoprinegresado;

                prmtelefonoaltegresado = new SqlParameter();
                prmtelefonoaltegresado.ParameterName = "@telefonoaltegresado";
                prmtelefonoaltegresado.SqlDbType = SqlDbType.VarChar;
                prmtelefonoaltegresado.Size = 9;
                prmtelefonoaltegresado.Value = objetoEgresadoBE.Telefonoaltegresado;

                prmdniegresado = new SqlParameter();
                prmdniegresado.ParameterName = "@dniegresado";
                prmdniegresado.SqlDbType = SqlDbType.VarChar;
                prmdniegresado.Size = 8;
                prmdniegresado.Value = objetoEgresadoBE.Dniegresado;

                prmcorreoegresado = new SqlParameter();
                prmcorreoegresado.ParameterName = "@correoegresado";
                prmcorreoegresado.SqlDbType = SqlDbType.VarChar;
                prmcorreoegresado.Size = 50;
                prmcorreoegresado.Value = objetoEgresadoBE.Correoegresado;

                prmcorreoaltegresado = new SqlParameter();
                prmcorreoaltegresado.ParameterName = "@correoaltegresado";
                prmcorreoaltegresado.SqlDbType = SqlDbType.VarChar;
                prmcorreoaltegresado.Size = 50;
                prmcorreoaltegresado.Value = objetoEgresadoBE.Correoaltegresado;

                prmdireccionegresado = new SqlParameter();
                prmdireccionegresado.ParameterName = "@direccionegresado";
                prmdireccionegresado.SqlDbType = SqlDbType.VarChar;
                prmdireccionegresado.Size = 100;
                prmdireccionegresado.Value = objetoEgresadoBE.Direccionegresado;

                prmdistritoegresado = new SqlParameter();
                prmdistritoegresado.ParameterName = "@distritoegresado";
                prmdistritoegresado.SqlDbType = SqlDbType.VarChar;
                prmdistritoegresado.Size = 50;
                prmdistritoegresado.Value = objetoEgresadoBE.Distritoegresado;

                prmdepartamentoegresado = new SqlParameter();
                prmdepartamentoegresado.ParameterName = "@departamentoegresado";
                prmdepartamentoegresado.SqlDbType = SqlDbType.VarChar;
                prmdepartamentoegresado.Size = 50;
                prmdepartamentoegresado.Value = objetoEgresadoBE.Departamentoegresado;

                prmidpaisesgresado = new SqlParameter();
                prmidpaisesgresado.ParameterName = "@idpaisegresado";
                prmidpaisesgresado.SqlDbType = SqlDbType.Int;
                prmidpaisesgresado.Value = objetoEgresadoBE.Idpaisegresado;

                prmperfilinkedinegresado = new SqlParameter();
                prmperfilinkedinegresado.ParameterName = "@perfillinkedinegresado";
                prmperfilinkedinegresado.SqlDbType = SqlDbType.VarChar;
                prmperfilinkedinegresado.Size = 50;
                prmperfilinkedinegresado.Value = objetoEgresadoBE.Perfillinkedinegresado;

                prmperfilfacebookegresado = new SqlParameter();
                prmperfilfacebookegresado.ParameterName = "@perfilfacebookegresado";
                prmperfilfacebookegresado.SqlDbType = SqlDbType.VarChar;
                prmperfilfacebookegresado.Size = 50;
                prmperfilfacebookegresado.Value = objetoEgresadoBE.Perfilfacebookegresado;

                prmfechanacimientoegresado = new SqlParameter();
                prmfechanacimientoegresado.ParameterName = "@fechanacimientoegresado";
                prmfechanacimientoegresado.SqlDbType = SqlDbType.Date;
                prmfechanacimientoegresado.Value = objetoEgresadoBE.Fechanacimientoegresado;

                prmtipoegresado = new SqlParameter();
                prmtipoegresado.ParameterName = "@tipoegresado";
                prmtipoegresado.SqlDbType = SqlDbType.Char;
                prmtipoegresado.Size = 1;
                prmtipoegresado.Value = objetoEgresadoBE.Tipoegresado;

                prmidfotoegresado = new SqlParameter();
                prmidfotoegresado.ParameterName = "@idfotoegresado";
                prmidfotoegresado.SqlDbType = SqlDbType.Int;
                prmidfotoegresado.Value = objetoEgresadoBE.Idfotoegresado;

                prmcontrasenaegresado = new SqlParameter();
                prmcontrasenaegresado.ParameterName = "@contrasenaegresado";
                prmcontrasenaegresado.SqlDbType = SqlDbType.VarChar;
                prmcontrasenaegresado.Size = 50;
                prmcontrasenaegresado.Value = objetoEgresadoBE.Contrasenaegresado;

                prmcontrasenadinamicaegresado = new SqlParameter();
                prmcontrasenadinamicaegresado.ParameterName = "@contrasenadinamicaegresado";
                prmcontrasenadinamicaegresado.SqlDbType = SqlDbType.VarChar;
                prmcontrasenadinamicaegresado.Size = 50;
                prmcontrasenadinamicaegresado.Value = objetoEgresadoBE.Contrasenadinamicaegresado;

                prmcambiocontrasenaegresado = new SqlParameter();
                prmcambiocontrasenaegresado.ParameterName = "@cambiocontrasenaegresado";
                prmcambiocontrasenaegresado.SqlDbType = SqlDbType.Bit;
                prmcambiocontrasenaegresado.Value = objetoEgresadoBE.Cambiocontrasenaegresado;

                prmcicloegresado = new SqlParameter();
                prmcicloegresado.ParameterName = "@cicloegresado";
                prmcicloegresado.SqlDbType = SqlDbType.VarChar;
                prmcicloegresado.Size = 10;
                prmcicloegresado.Value = objetoEgresadoBE.Cicloegresado;

                prmcodigouniversitarioegresado = new SqlParameter();
                prmcodigouniversitarioegresado.ParameterName = "@codigouniversitarioegresado";
                prmcodigouniversitarioegresado.SqlDbType = SqlDbType.VarChar;
                prmcodigouniversitarioegresado.Size = 10;
                prmcodigouniversitarioegresado.Value = objetoEgresadoBE.Codigouniversitarioegresado;

                prmcarreraegresado = new SqlParameter();
                prmcarreraegresado.ParameterName = "@carrera";
                prmcarreraegresado.SqlDbType = SqlDbType.VarChar;
                prmcarreraegresado.Size = 50;
                prmcarreraegresado.Value = objetoEgresadoBE.Carreraegresado;

                cmdactualizaregresado.Parameters.Add(prmidegresado);
                cmdactualizaregresado.Parameters.Add(prmnombrecompletoegresado);
                cmdactualizaregresado.Parameters.Add(prmedadegresado);
                cmdactualizaregresado.Parameters.Add(prmsexoegresado);
                cmdactualizaregresado.Parameters.Add(prmtelefonoprinegresado);
                cmdactualizaregresado.Parameters.Add(prmtelefonoaltegresado);
                cmdactualizaregresado.Parameters.Add(prmdniegresado);
                cmdactualizaregresado.Parameters.Add(prmcorreoegresado);
                cmdactualizaregresado.Parameters.Add(prmcorreoaltegresado);
                cmdactualizaregresado.Parameters.Add(prmdireccionegresado);
                cmdactualizaregresado.Parameters.Add(prmdistritoegresado);
                cmdactualizaregresado.Parameters.Add(prmdepartamentoegresado);
                cmdactualizaregresado.Parameters.Add(prmidpaisesgresado);
                cmdactualizaregresado.Parameters.Add(prmperfilinkedinegresado);
                cmdactualizaregresado.Parameters.Add(prmperfilfacebookegresado);
                cmdactualizaregresado.Parameters.Add(prmfechanacimientoegresado);
                cmdactualizaregresado.Parameters.Add(prmtipoegresado);
                cmdactualizaregresado.Parameters.Add(prmidfotoegresado);
                cmdactualizaregresado.Parameters.Add(prmcontrasenaegresado);
                cmdactualizaregresado.Parameters.Add(prmcontrasenadinamicaegresado);
                cmdactualizaregresado.Parameters.Add(prmcambiocontrasenaegresado);
                cmdactualizaregresado.Parameters.Add(prmcicloegresado);
                cmdactualizaregresado.Parameters.Add(prmcodigouniversitarioegresado);
                cmdactualizaregresado.Parameters.Add(prmcarreraegresado);


                cmdactualizaregresado.Connection.Open();
                cmdactualizaregresado.ExecuteNonQuery();
                cmdactualizaregresado.Connection.Close();

                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<int> listaraptitudxegresado(int idegresado)
        {
            String sqllistaraptitud;
            SqlConnection conn;
            SqlCommand cmdlistaraptitud;
            SqlParameter prmidegresado;
            DataTable dtegresado = new DataTable();
            int idaptitud;

            try 
	        {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaraptitud = "SWEGR_obtenerAptitudxEgresado";
                cmdlistaraptitud = new SqlCommand(sqllistaraptitud, conn);
                cmdlistaraptitud.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                cmdlistaraptitud.Parameters.Add(prmidegresado);

                cmdlistaraptitud.Connection.Open();

                List<int> listaIdAptitudes = new List<int>();

                dtegresado.Load(cmdlistaraptitud.ExecuteReader());

                foreach (DataRow drwegresado in dtegresado.Rows)
                {
                    idaptitud = Convert.ToInt32(drwegresado["AptitudID"]);

                    listaIdAptitudes.Add(idaptitud);
                }

                cmdlistaraptitud.Connection.Close();
                return listaIdAptitudes;
		    }
	        catch (Exception ex)
	        {
                throw;
	        }
        }

        public List<int> listarinteresxegresado(int idegresado)
        {
            String sqllistarinteres;
            SqlConnection conn;
            SqlCommand cmdlistarinteres;
            SqlParameter prmidegresado;
            DataTable dtegresado = new DataTable();
            int idinteres;

            try 
	        {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistarinteres = "SWEGR_obtenerInteresxEgresado";
                cmdlistarinteres = new SqlCommand(sqllistarinteres, conn);
                cmdlistarinteres.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                cmdlistarinteres.Parameters.Add(prmidegresado);

                cmdlistarinteres.Connection.Open();

                List<int> listaIdAptitudes = new List<int>();

                dtegresado.Load(cmdlistarinteres.ExecuteReader());

                foreach (DataRow drwegresado in dtegresado.Rows)
                {
                    idinteres = Convert.ToInt32(drwegresado["InteresesID"]);

                    listaIdAptitudes.Add(idinteres);
                }

                cmdlistarinteres.Connection.Close();
                return listaIdAptitudes;
		    }
	        catch (Exception ex)
	        {
                throw;
	        }
        }

        public bool insertarAptitudxEgresado(int idegresado, int idaptitud)
        {
            String sqlinsertaraptitudxegresado;

            SqlConnection conn;
            SqlCommand cmdinsertaraptitudxegresado;
            SqlParameter prmidegresado;
            SqlParameter prmidaptitud;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlinsertaraptitudxegresado = "SWEGR_insertarAptitudxEgresado";
                cmdinsertaraptitudxegresado = new SqlCommand(sqlinsertaraptitudxegresado, conn);
                cmdinsertaraptitudxegresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                prmidaptitud = new SqlParameter();
                prmidaptitud.ParameterName = "@idaptitud";
                prmidaptitud.SqlDbType = SqlDbType.Int;
                prmidaptitud.Value = idaptitud;

                cmdinsertaraptitudxegresado.Parameters.Add(prmidegresado);
                cmdinsertaraptitudxegresado.Parameters.Add(prmidaptitud);

                cmdinsertaraptitudxegresado.Connection.Open();
                cmdinsertaraptitudxegresado.ExecuteNonQuery();

                cmdinsertaraptitudxegresado.Connection.Close();

                return true;

            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool insertarInteresxEgresado(int idegresado, int idinteres)
        {
            String sqlinsertaraptitudxegresado;

            SqlConnection conn;
            SqlCommand cmdinsertarinteresxegresado;
            SqlParameter prmidegresado;
            SqlParameter prmidinteres;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlinsertaraptitudxegresado = "SWEGR_insertarInteresxEgresado";
                cmdinsertarinteresxegresado = new SqlCommand(sqlinsertaraptitudxegresado, conn);
                cmdinsertarinteresxegresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                prmidinteres = new SqlParameter();
                prmidinteres.ParameterName = "@idinteres";
                prmidinteres.SqlDbType = SqlDbType.Int;
                prmidinteres.Value = idinteres;

                cmdinsertarinteresxegresado.Parameters.Add(prmidegresado);
                cmdinsertarinteresxegresado.Parameters.Add(prmidinteres);

                cmdinsertarinteresxegresado.Connection.Open();
                cmdinsertarinteresxegresado.ExecuteNonQuery();

                cmdinsertarinteresxegresado.Connection.Close();

                return true;

            }
            catch (Exception)
            {
                throw;
            }
        }

        public void eliminarAptitudxEgresado(int idegresado, int idaptitud)
        {
            String sqleliminaraptitudxegresado;

            SqlConnection conn;
            SqlCommand cmdeliminaraptitudxegresado;
            SqlParameter prmidegresado;
            SqlParameter prmidaptitud;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqleliminaraptitudxegresado = "SWEGR_eliminarAptitudxEgresado";
                cmdeliminaraptitudxegresado = new SqlCommand(sqleliminaraptitudxegresado, conn);
                cmdeliminaraptitudxegresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                prmidaptitud = new SqlParameter();
                prmidaptitud.ParameterName = "@idaptitud";
                prmidaptitud.SqlDbType = SqlDbType.Int;
                prmidaptitud.Value = idaptitud;

                cmdeliminaraptitudxegresado.Parameters.Add(prmidegresado);
                cmdeliminaraptitudxegresado.Parameters.Add(prmidaptitud);

                cmdeliminaraptitudxegresado.Connection.Open();
                cmdeliminaraptitudxegresado.ExecuteNonQuery();

                cmdeliminaraptitudxegresado.Connection.Close();

            }
            catch (Exception)
            {
                throw;
            }
        }

        public void eliminarInteresxEgresado(int idegresado, int idinteres)
        {
            String sqleliminaraptitudxegresado;

            SqlConnection conn;
            SqlCommand cmdeliminarinteresxegresado;
            SqlParameter prmidegresado;
            SqlParameter prmidinteres;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqleliminaraptitudxegresado = "SWEGR_eliminarInteresxEgresado";
                cmdeliminarinteresxegresado = new SqlCommand(sqleliminaraptitudxegresado, conn);
                cmdeliminarinteresxegresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                prmidinteres = new SqlParameter();
                prmidinteres.ParameterName = "@idinteres";
                prmidinteres.SqlDbType = SqlDbType.Int;
                prmidinteres.Value = idinteres;

                cmdeliminarinteresxegresado.Parameters.Add(prmidegresado);
                cmdeliminarinteresxegresado.Parameters.Add(prmidinteres);

                cmdeliminarinteresxegresado.Connection.Open();
                cmdeliminarinteresxegresado.ExecuteNonQuery();

                cmdeliminarinteresxegresado.Connection.Close();

            }
            catch (Exception)
            {
                throw;
            }
        }

        public String[] obtenerLinksEgresado(int idegresado)
        {
            String sqlobteneregresado;

            SqlConnection conn;
            SqlCommand cmdobteneregresado;
            SqlParameter prmidegresado;
            SqlDataReader dregresado;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlobteneregresado = "SWEGR_obtenerLinksEgresado";
                cmdobteneregresado = new SqlCommand(sqlobteneregresado, conn);
                cmdobteneregresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                cmdobteneregresado.Parameters.Add(prmidegresado);
                cmdobteneregresado.Connection.Open();

                String[] linksEgresado = new String[2];

                dregresado = cmdobteneregresado.ExecuteReader();

                if (dregresado.Read())
                {
                    linksEgresado[0] = dregresado.GetString(0);
                    linksEgresado[1] = dregresado.GetString(1);
                }
                cmdobteneregresado.Connection.Close();

                return linksEgresado;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<String> listarAniosEgresados()
        {
            String sqllistaranios;
            SqlConnection conn;
            SqlCommand cmdlistaranios;
            SqlDataReader dranios;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaranios = "SWEGR_listarEgresadoAnios";
                cmdlistaranios = new SqlCommand(sqllistaranios, conn);
                cmdlistaranios.CommandType = CommandType.StoredProcedure;

                cmdlistaranios.Connection.Open();

                List<String> listaanios = new List<String>();

                dranios = cmdlistaranios.ExecuteReader();

                while (dranios.Read())
                {
                    listaanios.Add(Convert.ToString(dranios.GetInt32(0)));
                }

                cmdlistaranios.Connection.Close();

                return listaanios;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public int insertarEgresadodesdeEgresadoDesvinculado(EgresadoBE objEgresadoBE)
        {
            String sqlinsertaregresadodesdeedes;

            SqlConnection conn;
            SqlCommand cmdinsertaregresadodesdeedes;
            SqlParameter prmidegresado;
            SqlParameter prmnombrecompletoegresado;
            SqlParameter prmcorreoegresado;
            SqlParameter prmcontrasenaegresado;
            SqlParameter prmcodigouniversitario;
            SqlParameter prmcarrera;
            SqlParameter prmcicloegreso;
            SqlParameter prmcontrasenadinamica;
            SqlParameter prmcambiocontrasena;
            SqlParameter prmtipoegresado;
            SqlParameter prmidefotoegresado;

            int idegresado;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlinsertaregresadodesdeedes = "SWEGR_insertarEgresadodesdeEgresadoDesv";
                cmdinsertaregresadodesdeedes = new SqlCommand(sqlinsertaregresadodesdeedes, conn);
                cmdinsertaregresadodesdeedes.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.Direction = ParameterDirection.ReturnValue;
                prmidegresado.SqlDbType = SqlDbType.Int;

                prmnombrecompletoegresado = new SqlParameter();
                prmnombrecompletoegresado.ParameterName = "@nombrecompleto";
                prmnombrecompletoegresado.SqlDbType = SqlDbType.VarChar;
                prmnombrecompletoegresado.Size = 100;
                prmnombrecompletoegresado.Value = objEgresadoBE.Nombrecompletoegresado;

                prmcorreoegresado = new SqlParameter();
                prmcorreoegresado.ParameterName = "@correo";
                prmcorreoegresado.SqlDbType = SqlDbType.VarChar;
                prmcorreoegresado.Size = 50;
                prmcorreoegresado.Value = objEgresadoBE.Correoegresado;

                prmcodigouniversitario = new SqlParameter();
                prmcodigouniversitario.ParameterName = "@codigo";
                prmcodigouniversitario.SqlDbType = SqlDbType.VarChar;
                prmcodigouniversitario.Size = 10;
                prmcodigouniversitario.Value = objEgresadoBE.Codigouniversitarioegresado;

                prmcontrasenaegresado = new SqlParameter();
                prmcontrasenaegresado.ParameterName = "@contrasena";
                prmcontrasenaegresado.SqlDbType = SqlDbType.VarChar;
                prmcontrasenaegresado.Size = 50;
                prmcontrasenaegresado.Value = objEgresadoBE.Contrasenaegresado;

                prmcarrera = new SqlParameter();
                prmcarrera.ParameterName = "@carrera";
                prmcarrera.SqlDbType = SqlDbType.VarChar;
                prmcarrera.Size = 50;
                prmcarrera.Value = objEgresadoBE.Carreraegresado;

                prmcicloegreso = new SqlParameter();
                prmcicloegreso.ParameterName = "@cicloegreso";
                prmcicloegreso.SqlDbType = SqlDbType.VarChar;
                prmcicloegreso.Size = 10;
                prmcicloegreso.Value = objEgresadoBE.Cicloegresado;

                prmcontrasenadinamica = new SqlParameter();
                prmcontrasenadinamica.ParameterName = "@contrasenadinamica";
                prmcontrasenadinamica.SqlDbType = SqlDbType.VarChar;
                prmcontrasenadinamica.Size = 100;
                prmcontrasenadinamica.Value = objEgresadoBE.Contrasenadinamicaegresado;

                prmcambiocontrasena = new SqlParameter();
                prmcambiocontrasena.ParameterName = "@cambiocontrasena";
                prmcambiocontrasena.SqlDbType = SqlDbType.Bit;
                prmcambiocontrasena.Value = objEgresadoBE.Cambiocontrasenaegresado;

                prmtipoegresado = new SqlParameter();
                prmtipoegresado.ParameterName = "@tipoegresado";
                prmtipoegresado.SqlDbType = SqlDbType.Char;
                prmtipoegresado.Size = 1;
                prmtipoegresado.Value = objEgresadoBE.Tipoegresado;

                prmidefotoegresado = new SqlParameter();
                prmidefotoegresado.ParameterName = "@idfotoegresado";
                prmidefotoegresado.SqlDbType = SqlDbType.Int;
                prmidefotoegresado.Value = objEgresadoBE.Idfotoegresado;

                cmdinsertaregresadodesdeedes.Parameters.Add(prmnombrecompletoegresado);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmcorreoegresado);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmcodigouniversitario);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmcontrasenaegresado);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmcarrera);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmcicloegreso);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmcontrasenadinamica);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmcambiocontrasena);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmtipoegresado);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmidefotoegresado);

                cmdinsertaregresadodesdeedes.Connection.Open();
                cmdinsertaregresadodesdeedes.ExecuteNonQuery();
                idegresado = Convert.ToInt32(prmidegresado.Value);
                cmdinsertaregresadodesdeedes.Connection.Close();
            }
            catch (Exception)
            {
                throw;
            }

            return idegresado;

        }

        public bool actualizarEgresado_DatosExtraidos(EgresadoBE objetoEgresadoBE)
        {
            String sqlactualizaregresado;

            SqlConnection conn;
            SqlCommand cmdactualizaregresado;
            SqlParameter prmidegresado;
            SqlParameter prmtelefonoprinegresado;
            SqlParameter prmtelefonoaltegresado;
            SqlParameter prmcorreoegresado;
            SqlParameter prmcorreoaltegresado;
            SqlParameter prmdireccionegresado;
            SqlParameter prmfotoegresado;


            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlactualizaregresado = "SWEGR_actualizarEgresado_DatosExtraidos";
                cmdactualizaregresado = new SqlCommand(sqlactualizaregresado, conn);
                cmdactualizaregresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = objetoEgresadoBE.Idegresado;

                prmtelefonoaltegresado = new SqlParameter();
                prmtelefonoaltegresado.ParameterName = "@telefonoaltegresado";
                prmtelefonoaltegresado.SqlDbType = SqlDbType.VarChar;
                prmtelefonoaltegresado.Size = 15;
                if (objetoEgresadoBE.Telefonoaltegresado == null)
                    prmtelefonoaltegresado.Value = "";
                else
                    prmtelefonoaltegresado.Value = objetoEgresadoBE.Telefonoaltegresado;



                prmtelefonoprinegresado = new SqlParameter();
                prmtelefonoprinegresado.ParameterName = "@telefonoprinegresado";
                prmtelefonoprinegresado.SqlDbType = SqlDbType.VarChar;
                prmtelefonoprinegresado.Size = 15;
                if (objetoEgresadoBE.Telefonoprinegresado == null)
                    prmtelefonoprinegresado.Value = "";
                else
                    prmtelefonoprinegresado.Value = objetoEgresadoBE.Telefonoprinegresado;



                prmcorreoegresado = new SqlParameter();
                prmcorreoegresado.ParameterName = "@correoegresado";
                prmcorreoegresado.SqlDbType = SqlDbType.VarChar;
                prmcorreoegresado.Size = 50;
                if (objetoEgresadoBE.Correoegresado == null)
                    prmcorreoegresado.Value = "";
                else
                    prmcorreoegresado.Value = objetoEgresadoBE.Correoegresado;


                prmcorreoaltegresado = new SqlParameter();
                prmcorreoaltegresado.ParameterName = "@correoaltegresado";
                prmcorreoaltegresado.SqlDbType = SqlDbType.VarChar;
                prmcorreoaltegresado.Size = 50;
                if (objetoEgresadoBE.Correoaltegresado == null)
                    prmcorreoaltegresado.Value = "";
                else
                    prmcorreoaltegresado.Value = objetoEgresadoBE.Correoaltegresado;

                prmdireccionegresado = new SqlParameter();
                prmdireccionegresado.ParameterName = "@direccionegresado";
                prmdireccionegresado.SqlDbType = SqlDbType.VarChar;
                prmdireccionegresado.Size = 100;
                if (objetoEgresadoBE.Direccionegresado == null)
                    prmdireccionegresado.Value = "";
                else
                    prmdireccionegresado.Value = objetoEgresadoBE.Direccionegresado;

            /*    prmfotoegresado = new SqlParameter();
                prmfotoegresado.ParameterName = "@fotoegresado";
                prmfotoegresado.SqlDbType = SqlDbType.Image;
                prmfotoegresado.Value = objetoEgresadoBE.Fotoegresado;
*/

                cmdactualizaregresado.Parameters.Add(prmidegresado);
                cmdactualizaregresado.Parameters.Add(prmtelefonoprinegresado);
                cmdactualizaregresado.Parameters.Add(prmtelefonoaltegresado);
                cmdactualizaregresado.Parameters.Add(prmcorreoegresado);
                cmdactualizaregresado.Parameters.Add(prmcorreoaltegresado);
                cmdactualizaregresado.Parameters.Add(prmdireccionegresado);
                // cmdactualizaregresado.Parameters.Add(prmfotoegresado);


                cmdactualizaregresado.Connection.Open();
                cmdactualizaregresado.ExecuteNonQuery();
                cmdactualizaregresado.Connection.Close();

                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        
        public bool insertarFotoxEgresado(int idegresado, int idfoto)
        {
            String sqlinsertarfotoxegresado;

            SqlConnection conn;
            SqlCommand cmdinsertarfotoxegresado;
            SqlParameter prmidegresado;
            SqlParameter prmidfoto;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlinsertarfotoxegresado = "SWEGR_insertarFotoxEgresado";
                cmdinsertarfotoxegresado = new SqlCommand(sqlinsertarfotoxegresado, conn);
                cmdinsertarfotoxegresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                prmidfoto = new SqlParameter();
                prmidfoto.ParameterName = "@idfoto";
                prmidfoto.SqlDbType = SqlDbType.Int;
                prmidfoto.Value = idfoto;

                cmdinsertarfotoxegresado.Parameters.Add(prmidegresado);
                cmdinsertarfotoxegresado.Parameters.Add(prmidfoto);

                cmdinsertarfotoxegresado.Connection.Open();
                cmdinsertarfotoxegresado.ExecuteNonQuery();

                cmdinsertarfotoxegresado.Connection.Close();

                return true;

            }
            catch (Exception)
            {
                throw;
            }
        }

        public void eliminarFotoxEgresado(int idegresado, int idfoto)
        {
            String sqleliminarfotoxegresado;

            SqlConnection conn;
            SqlCommand cmdeliminarfotoxegresado;
            SqlParameter prmidegresado;
            SqlParameter prmidfoto;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqleliminarfotoxegresado = "SWEGR_insertarFotoxEgresado";
                cmdeliminarfotoxegresado = new SqlCommand(sqleliminarfotoxegresado, conn);
                cmdeliminarfotoxegresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                prmidfoto = new SqlParameter();
                prmidfoto.ParameterName = "@idfoto";
                prmidfoto.SqlDbType = SqlDbType.Int;
                prmidfoto.Value = idfoto;

                cmdeliminarfotoxegresado.Parameters.Add(prmidegresado);
                cmdeliminarfotoxegresado.Parameters.Add(prmidfoto);

                cmdeliminarfotoxegresado.Connection.Open();
                cmdeliminarfotoxegresado.ExecuteNonQuery();

                cmdeliminarfotoxegresado.Connection.Close();

            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}