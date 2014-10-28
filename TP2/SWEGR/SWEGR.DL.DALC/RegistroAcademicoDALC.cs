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
    public class RegistroAcademicoDALC
    {
        public List<RegistroAcademicoBE> listarregistroacademico(int idegresado)
        {
            String sqllistarregistroacad;
            SqlConnection conn;
            SqlCommand cmdlistarregistroacad;
            SqlParameter prmidegresado;
            SqlDataReader drregistroacademico;

            try
            {
                RegistroAcademicoBE objetoRegistroAcademicoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistarregistroacad = "SWEGR_listarRegistroAcademico";
                cmdlistarregistroacad = new SqlCommand(sqllistarregistroacad, conn);
                cmdlistarregistroacad.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                cmdlistarregistroacad.Parameters.Add(prmidegresado);
                cmdlistarregistroacad.Connection.Open();
                drregistroacademico = cmdlistarregistroacad.ExecuteReader();
                List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();

                while (drregistroacademico.Read())
                {
                    objetoRegistroAcademicoBE = new RegistroAcademicoBE();

                    objetoRegistroAcademicoBE.Idregistroacademico = drregistroacademico.GetInt32(0);
                    objetoRegistroAcademicoBE.Nombreinstitucion = drregistroacademico.GetString(1);
                    objetoRegistroAcademicoBE.Nombreestudio = drregistroacademico.GetString(2);
                    objetoRegistroAcademicoBE.Duracionestudio = drregistroacademico.GetString(3);
                    objetoRegistroAcademicoBE.Descripcionestudio = drregistroacademico.GetString(4);
                    objetoRegistroAcademicoBE.Tipoestudio = drregistroacademico.GetString(5);
                    objetoRegistroAcademicoBE.Idpais = drregistroacademico.GetInt32(6);

                    listaRegistroAcademicoBE.Add(objetoRegistroAcademicoBE);
                }

                cmdlistarregistroacad.Connection.Close();
                return listaRegistroAcademicoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int insertarregistroacademico(RegistroAcademicoBE objetoregistroacademico)
        {
            String sqlinsertarregistroacademico;

            SqlConnection conn;
            SqlCommand cmdinsertarregistroacademico;
            SqlParameter prmidregistroacademico;
            SqlParameter prmidegresado;
            SqlParameter prmnombreinstitucion;
            SqlParameter prmnombre;
            SqlParameter prmduracion;
            SqlParameter prmdescripcion;
            SqlParameter prmtipoestudio;
            SqlParameter prmidpais;

            int idregistroacademico;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlinsertarregistroacademico = "SWEGR_insertarRegistroAcademico";
                cmdinsertarregistroacademico = new SqlCommand(sqlinsertarregistroacademico, conn);
                cmdinsertarregistroacademico.CommandType = CommandType.StoredProcedure;

                prmidregistroacademico = new SqlParameter();
                prmidregistroacademico.Direction = ParameterDirection.ReturnValue;
                prmidregistroacademico.SqlDbType = SqlDbType.Int;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = objetoregistroacademico.Idegresado;

                prmnombreinstitucion = new SqlParameter();
                prmnombreinstitucion.ParameterName = "@nombreinstitucion";
                prmnombreinstitucion.SqlDbType = SqlDbType.VarChar;
                prmnombreinstitucion.Size = 100;
                prmnombreinstitucion.Value = objetoregistroacademico.Nombreinstitucion;

                prmnombre = new SqlParameter();
                prmnombre.ParameterName = "@nombre";
                prmnombre.SqlDbType = SqlDbType.VarChar;
                prmnombre.Size = 50;
                prmnombre.Value = objetoregistroacademico.Nombreestudio;

                prmduracion = new SqlParameter();
                prmduracion.ParameterName = "@duracion";
                prmduracion.SqlDbType = SqlDbType.VarChar;
                prmduracion.Size = 30;
                prmduracion.Value = objetoregistroacademico.Duracionestudio;

                prmdescripcion = new SqlParameter();
                prmdescripcion.ParameterName = "@descripcion";
                prmdescripcion.SqlDbType = SqlDbType.VarChar;
                prmdescripcion.Size = 500;
                prmdescripcion.Value = objetoregistroacademico.Descripcionestudio;

                prmtipoestudio = new SqlParameter();
                prmtipoestudio.ParameterName = "@tipoestudio";
                prmtipoestudio.SqlDbType = SqlDbType.VarChar;
                prmtipoestudio.Size = 100;
                prmtipoestudio.Value = objetoregistroacademico.Tipoestudio;

                prmidpais = new SqlParameter();
                prmidpais.ParameterName = "@idpais";
                prmidpais.SqlDbType = SqlDbType.Int;
                prmidpais.Value = objetoregistroacademico.Idpais;

                cmdinsertarregistroacademico.Parameters.Add(prmidregistroacademico);
                cmdinsertarregistroacademico.Parameters.Add(prmidegresado);
                cmdinsertarregistroacademico.Parameters.Add(prmnombreinstitucion);
                cmdinsertarregistroacademico.Parameters.Add(prmnombre);
                cmdinsertarregistroacademico.Parameters.Add(prmduracion);
                cmdinsertarregistroacademico.Parameters.Add(prmdescripcion);
                cmdinsertarregistroacademico.Parameters.Add(prmtipoestudio);
                cmdinsertarregistroacademico.Parameters.Add(prmidpais);

                cmdinsertarregistroacademico.Connection.Open();
                cmdinsertarregistroacademico.ExecuteNonQuery();
                idregistroacademico = Convert.ToInt32(prmidregistroacademico.Value);
                cmdinsertarregistroacademico.Connection.Close();

                return idregistroacademico;

            }
            catch (Exception)
            {
                throw;
            }
        }



        public int insertarregistroacademico_DatosExtraidos(RegistroAcademicoBE objetoregistroacademico)
        {
            String sqlinsertarregistroacademico;

            SqlConnection conn;
            SqlCommand cmdinsertarregistroacademico;
            SqlParameter prmidregistroacademico;
            SqlParameter prmidegresado;
            SqlParameter prmnombreinstitucion;
            SqlParameter prmnombre;
            SqlParameter prmduracion;
            SqlParameter prmdescripcion;
            SqlParameter prmtipoestudio;
            SqlParameter prmidpais;

            int idregistroacademico;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlinsertarregistroacademico = "SWEGR_insertarRegistroAcademico_DatosExtraidos";
                cmdinsertarregistroacademico = new SqlCommand(sqlinsertarregistroacademico, conn);
                cmdinsertarregistroacademico.CommandType = CommandType.StoredProcedure;

                prmidregistroacademico = new SqlParameter();
                prmidregistroacademico.Direction = ParameterDirection.ReturnValue;
                prmidregistroacademico.SqlDbType = SqlDbType.Int;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = objetoregistroacademico.Idegresado;

                prmnombreinstitucion = new SqlParameter();
                prmnombreinstitucion.ParameterName = "@nombreinstitucion";
                prmnombreinstitucion.SqlDbType = SqlDbType.VarChar;
                prmnombreinstitucion.Size = 100;
                if (objetoregistroacademico.Nombreinstitucion == null)
                    prmnombreinstitucion.Value = "";
                else
                    prmnombreinstitucion.Value = objetoregistroacademico.Nombreinstitucion;

                prmnombre = new SqlParameter();
                prmnombre.ParameterName = "@nombre";
                prmnombre.SqlDbType = SqlDbType.VarChar;
                prmnombre.Size = 50;
                if (objetoregistroacademico.Nombreestudio == null)
                    prmnombre.Value = "";
                else
                    prmnombre.Value = objetoregistroacademico.Nombreestudio;

                prmduracion = new SqlParameter();
                prmduracion.ParameterName = "@duracion";
                prmduracion.SqlDbType = SqlDbType.VarChar;
                prmduracion.Size = 30;
                if (objetoregistroacademico.Duracionestudio == null)
                    prmduracion.Value = "";
                else
                    prmduracion.Value = objetoregistroacademico.Duracionestudio;

                prmdescripcion = new SqlParameter();
                prmdescripcion.ParameterName = "@descripcion";
                prmdescripcion.SqlDbType = SqlDbType.VarChar;
                prmdescripcion.Size = 500;
                prmdescripcion.Value = objetoregistroacademico.Descripcionestudio;
                if (objetoregistroacademico.Descripcionestudio == null)
                    prmdescripcion.Value = "";
                else
                    prmdescripcion.Value = objetoregistroacademico.Descripcionestudio;



                prmtipoestudio = new SqlParameter();
                prmtipoestudio.ParameterName = "@tipoestudio";
                prmtipoestudio.SqlDbType = SqlDbType.VarChar;
                prmtipoestudio.Size = 100;
                if (objetoregistroacademico.Tipoestudio == null)
                    prmtipoestudio.Value = "";
                else
                    prmtipoestudio.Value = objetoregistroacademico.Tipoestudio;

                prmidpais = new SqlParameter();
                prmidpais.ParameterName = "@idpais";
                prmidpais.SqlDbType = SqlDbType.Int;
                prmidpais.Value = objetoregistroacademico.Idpais;

                cmdinsertarregistroacademico.Parameters.Add(prmidregistroacademico);
                cmdinsertarregistroacademico.Parameters.Add(prmidegresado);
                cmdinsertarregistroacademico.Parameters.Add(prmnombreinstitucion);
                cmdinsertarregistroacademico.Parameters.Add(prmnombre);
                cmdinsertarregistroacademico.Parameters.Add(prmduracion);
                cmdinsertarregistroacademico.Parameters.Add(prmdescripcion);
                cmdinsertarregistroacademico.Parameters.Add(prmtipoestudio);
                cmdinsertarregistroacademico.Parameters.Add(prmidpais);

                cmdinsertarregistroacademico.Connection.Open();
                cmdinsertarregistroacademico.ExecuteNonQuery();
                idregistroacademico = Convert.ToInt32(prmidregistroacademico.Value);
                cmdinsertarregistroacademico.Connection.Close();

                return idregistroacademico;

            }
            catch (Exception)
            {
                throw;
            }
        }
        
        
        public bool actualizarregistroacademico(RegistroAcademicoBE objetoregistroacademico)
        {
            String sqlactualizarregistroacademico;

            SqlConnection conn;
            SqlCommand cmdactualizarregistroacademico;
            SqlParameter prmidregistroacademico;
            SqlParameter prmidegresado;
            SqlParameter prmnombreinstitucion;
            SqlParameter prmnombre;
            SqlParameter prmduracion;
            SqlParameter prmdescripcion;
            SqlParameter prmtipoestudio;
            SqlParameter prmidpais;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlactualizarregistroacademico = "SWEGR_actualizarRegistroAcademico";
                cmdactualizarregistroacademico = new SqlCommand(sqlactualizarregistroacademico, conn);
                cmdactualizarregistroacademico.CommandType = CommandType.StoredProcedure;

                prmidregistroacademico = new SqlParameter();
                prmidregistroacademico.ParameterName = "@idregistroacademico";
                prmidregistroacademico.SqlDbType = SqlDbType.Int;
                prmidregistroacademico.Value = objetoregistroacademico.Idregistroacademico;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = objetoregistroacademico.Idegresado;

                prmnombreinstitucion = new SqlParameter();
                prmnombreinstitucion.ParameterName = "@nombreinstitucion";
                prmnombreinstitucion.SqlDbType = SqlDbType.VarChar;
                prmnombreinstitucion.Size = 100;
                prmnombreinstitucion.Value = objetoregistroacademico.Nombreinstitucion;

                prmnombre = new SqlParameter();
                prmnombre.ParameterName = "@nombre";
                prmnombre.SqlDbType = SqlDbType.VarChar;
                prmnombre.Size = 50;
                prmnombre.Value = objetoregistroacademico.Nombreestudio;

                prmduracion = new SqlParameter();
                prmduracion.ParameterName = "@duracion";
                prmduracion.SqlDbType = SqlDbType.VarChar;
                prmduracion.Size = 30;
                prmduracion.Value = objetoregistroacademico.Duracionestudio;

                prmdescripcion = new SqlParameter();
                prmdescripcion.ParameterName = "@descripcion";
                prmdescripcion.SqlDbType = SqlDbType.VarChar;
                prmdescripcion.Size = 500;
                prmdescripcion.Value = objetoregistroacademico.Descripcionestudio;

                prmtipoestudio = new SqlParameter();
                prmtipoestudio.ParameterName = "@tipoestudio";
                prmtipoestudio.SqlDbType = SqlDbType.VarChar;
                prmtipoestudio.Size = 100;
                prmtipoestudio.Value = objetoregistroacademico.Tipoestudio;

                prmidpais = new SqlParameter();
                prmidpais.ParameterName = "@idpais";
                prmidpais.SqlDbType = SqlDbType.Int;
                prmidpais.Value = objetoregistroacademico.Idpais;

                cmdactualizarregistroacademico.Parameters.Add(prmidregistroacademico);
                cmdactualizarregistroacademico.Parameters.Add(prmidegresado);
                cmdactualizarregistroacademico.Parameters.Add(prmnombreinstitucion);
                cmdactualizarregistroacademico.Parameters.Add(prmnombre);
                cmdactualizarregistroacademico.Parameters.Add(prmduracion);
                cmdactualizarregistroacademico.Parameters.Add(prmdescripcion);
                cmdactualizarregistroacademico.Parameters.Add(prmtipoestudio);
                cmdactualizarregistroacademico.Parameters.Add(prmidpais);

                cmdactualizarregistroacademico.Connection.Open();
                cmdactualizarregistroacademico.ExecuteNonQuery();
                cmdactualizarregistroacademico.Connection.Close();

                return true;

            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
