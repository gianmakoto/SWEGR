using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SWEGR.BL.BE;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SWEGR.DL.DALC
{
    public class EgresadoDALC
    {
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
                    objetoEgresadoBE.Fotoegresado = null;
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
                    objetoEgresadoBE.Fotoegresado = null;
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

        public List<EgresadoBE> listarEgresadoxNombreoCodigo(string busqueda)
        {
            String sqllistaregresado;

            SqlConnection conn;
            SqlCommand cmdlistaregresado;
            SqlDataReader dregresado;
            SqlParameter prmbusqueda;

            try
            {
                List<EgresadoBE> lstEgresadoBE;
                EgresadoBE objetoEgresadoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaregresado = "SWEGR_listarEgresadoxNombreoCodigo";
                cmdlistaregresado = new SqlCommand(sqllistaregresado, conn);
                cmdlistaregresado.CommandType = CommandType.StoredProcedure;

                prmbusqueda = new SqlParameter();
                prmbusqueda.ParameterName = "@nombre";
                prmbusqueda.SqlDbType = SqlDbType.VarChar;
                prmbusqueda.Size = 100;
                prmbusqueda.Value = busqueda;

                cmdlistaregresado.Parameters.Add(prmbusqueda);
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
                    objetoEgresadoBE.Fotoegresado = null;
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

        public List<EgresadoBE> listarEgresadoxCiclo(string busqueda)
        {
            String sqllistaregresado;

            SqlConnection conn;
            SqlCommand cmdlistaregresado;
            SqlDataReader dregresado;
            SqlParameter prmbusqueda;

            try
            {
                List<EgresadoBE> lstEgresadoBE;
                EgresadoBE objetoEgresadoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaregresado = "SWEGR_listarEgresadoxCiclo";
                cmdlistaregresado = new SqlCommand(sqllistaregresado, conn);
                cmdlistaregresado.CommandType = CommandType.StoredProcedure;

                prmbusqueda = new SqlParameter();
                prmbusqueda.ParameterName = "@busqueda";
                prmbusqueda.SqlDbType = SqlDbType.VarChar;
                prmbusqueda.Size = 10;
                prmbusqueda.Value = busqueda;

                cmdlistaregresado.Parameters.Add(prmbusqueda);
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
                    objetoEgresadoBE.Fotoegresado = null;
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

        public List<EgresadoBE> listarEgresadoxCarrera(string busqueda)
        {
            String sqllistaregresado;

            SqlConnection conn;
            SqlCommand cmdlistaregresado;
            SqlDataReader dregresado;
            SqlParameter prmbusqueda;

            try
            {
                List<EgresadoBE> lstEgresadoBE;
                EgresadoBE objetoEgresadoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaregresado = "SWEGR_listarEgresadoxCarrera";
                cmdlistaregresado = new SqlCommand(sqllistaregresado, conn);
                cmdlistaregresado.CommandType = CommandType.StoredProcedure;

                prmbusqueda = new SqlParameter();
                prmbusqueda.ParameterName = "@busqueda";
                prmbusqueda.SqlDbType = SqlDbType.VarChar;
                prmbusqueda.Size = 50;
                prmbusqueda.Value = busqueda;

                cmdlistaregresado.Parameters.Add(prmbusqueda);
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
                    objetoEgresadoBE.Fotoegresado = null;
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

        public List<EgresadoBE> listarEgresadoxNombreoCodigoyCiclo(string busqueda, string ciclo)
        {
            String sqllistaregresado;

            SqlConnection conn;
            SqlCommand cmdlistaregresado;
            SqlDataReader dregresado;
            SqlParameter prmbusqueda;
            SqlParameter prmciclo;

            try
            {
                List<EgresadoBE> lstEgresadoBE;
                EgresadoBE objetoEgresadoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaregresado = "SWEGR_listarEgresadoxNombreoCodigoyCiclo";
                cmdlistaregresado = new SqlCommand(sqllistaregresado, conn);
                cmdlistaregresado.CommandType = CommandType.StoredProcedure;

                prmbusqueda = new SqlParameter();
                prmbusqueda.ParameterName = "@busqueda";
                prmbusqueda.SqlDbType = SqlDbType.VarChar;
                prmbusqueda.Size = 100;
                prmbusqueda.Value = busqueda;

                prmciclo = new SqlParameter();
                prmciclo.ParameterName = "@ciclo";
                prmciclo.SqlDbType = SqlDbType.VarChar;
                prmciclo.Size = 10;
                prmciclo.Value = ciclo;

                cmdlistaregresado.Parameters.Add(prmbusqueda);
                cmdlistaregresado.Parameters.Add(prmciclo);
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
                    objetoEgresadoBE.Fotoegresado = null;
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

        public List<EgresadoBE> listarEgresadoxNombreoCodigoyCarrera(string busqueda, string carrera)
        {
            String sqllistaregresado;

            SqlConnection conn;
            SqlCommand cmdlistaregresado;
            SqlDataReader dregresado;
            SqlParameter prmbusqueda;
            SqlParameter prmcarrera;

            try
            {
                List<EgresadoBE> lstEgresadoBE;
                EgresadoBE objetoEgresadoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaregresado = "SWEGR_listarEgresadoxNombreoCodigoyCarrera";
                cmdlistaregresado = new SqlCommand(sqllistaregresado, conn);
                cmdlistaregresado.CommandType = CommandType.StoredProcedure;

                prmbusqueda = new SqlParameter();
                prmbusqueda.ParameterName = "@busqueda";
                prmbusqueda.SqlDbType = SqlDbType.VarChar;
                prmbusqueda.Size = 100;
                prmbusqueda.Value = busqueda;

                prmcarrera = new SqlParameter();
                prmcarrera.ParameterName = "@carrera";
                prmcarrera.SqlDbType = SqlDbType.VarChar;
                prmcarrera.Size = 50;
                prmcarrera.Value = carrera;

                cmdlistaregresado.Parameters.Add(prmbusqueda);
                cmdlistaregresado.Parameters.Add(prmcarrera);
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
                    objetoEgresadoBE.Fotoegresado = null;
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

        public List<EgresadoBE> listarEgresadoxNombreoCodigoyCicloyCarera(string busqueda, string ciclo, string carrera)
        {
            String sqllistaregresado;

            SqlConnection conn;
            SqlCommand cmdlistaregresado;
            SqlDataReader dregresado;
            SqlParameter prmbusqueda;
            SqlParameter prmciclo;
            SqlParameter prmcarrera;

            try
            {
                List<EgresadoBE> lstEgresadoBE;
                EgresadoBE objetoEgresadoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaregresado = "SWEGR_listarEgresadoxNombreoCodigoyCicloyCarrera";
                cmdlistaregresado = new SqlCommand(sqllistaregresado, conn);
                cmdlistaregresado.CommandType = CommandType.StoredProcedure;

                prmbusqueda = new SqlParameter();
                prmbusqueda.ParameterName = "@busqueda";
                prmbusqueda.SqlDbType = SqlDbType.VarChar;
                prmbusqueda.Size = 100;
                prmbusqueda.Value = busqueda;

                prmciclo = new SqlParameter();
                prmciclo.ParameterName = "@ciclo";
                prmciclo.SqlDbType = SqlDbType.VarChar;
                prmciclo.Size = 10;
                prmciclo.Value = ciclo;

                prmcarrera = new SqlParameter();
                prmcarrera.ParameterName = "@carrera";
                prmcarrera.SqlDbType = SqlDbType.VarChar;
                prmcarrera.Size = 50;
                prmcarrera.Value = carrera;

                cmdlistaregresado.Parameters.Add(prmbusqueda);
                cmdlistaregresado.Parameters.Add(prmciclo);
                cmdlistaregresado.Parameters.Add(prmcarrera);
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
                    objetoEgresadoBE.Fotoegresado = null;
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

        public List<EgresadoBE> listarEgresadoxCicloyCarera(string ciclo, string carrera)
        {
            String sqllistaregresado;

            SqlConnection conn;
            SqlCommand cmdlistaregresado;
            SqlDataReader dregresado;
            SqlParameter prmciclo;
            SqlParameter prmcarrera;

            try
            {
                List<EgresadoBE> lstEgresadoBE;
                EgresadoBE objetoEgresadoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistaregresado = "SWEGR_listarEgresadoxCicloyCarrera";
                cmdlistaregresado = new SqlCommand(sqllistaregresado, conn);
                cmdlistaregresado.CommandType = CommandType.StoredProcedure;

                prmciclo = new SqlParameter();
                prmciclo.ParameterName = "@ciclo";
                prmciclo.SqlDbType = SqlDbType.VarChar;
                prmciclo.Size = 10;
                prmciclo.Value = ciclo;

                prmcarrera = new SqlParameter();
                prmcarrera.ParameterName = "@carrera";
                prmcarrera.SqlDbType = SqlDbType.VarChar;
                prmcarrera.Size = 50;
                prmcarrera.Value = carrera;

                cmdlistaregresado.Parameters.Add(prmciclo);
                cmdlistaregresado.Parameters.Add(prmcarrera);
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
                    objetoEgresadoBE.Fotoegresado = null;
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
                    objetoEgresadoBE.Fotoegresado = null;
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
            SqlParameter prmfotoegresado;
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

                prmfotoegresado = new SqlParameter();
                prmfotoegresado.ParameterName = "@fotoegresado";
                prmfotoegresado.SqlDbType = SqlDbType.Image;
                prmfotoegresado.Value = objetoEgresadoBE.Fotoegresado;

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
                cmdactualizaregresado.Parameters.Add(prmfotoegresado);
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

                cmdinsertaregresadodesdeedes.Parameters.Add(prmnombrecompletoegresado);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmcorreoegresado);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmcodigouniversitario);
                cmdinsertaregresadodesdeedes.Parameters.Add(prmcontrasenaegresado);

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

    }
}