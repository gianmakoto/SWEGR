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
    public class AptitudDALC
    {
        public AptitudBE obtenerAptitud(int idaptitud)
        {
            String sqlobteneraptitud;
            SqlConnection conn;
            SqlCommand cmdobteneraptitud;
            SqlParameter prmidaptitud;
            SqlDataReader draptitud;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlobteneraptitud = "SWEGR_obtenerAptitud";
                cmdobteneraptitud = new SqlCommand(sqlobteneraptitud, conn);
                cmdobteneraptitud.CommandType = CommandType.StoredProcedure;

                prmidaptitud = new SqlParameter();
                prmidaptitud.ParameterName = "@idaptitud";
                prmidaptitud.SqlDbType = SqlDbType.Int;
                prmidaptitud.Value = idaptitud;

                cmdobteneraptitud.Parameters.Add(prmidaptitud);
                cmdobteneraptitud.Connection.Open();

                AptitudBE objetoAptitudBE;
                objetoAptitudBE = new AptitudBE();

                draptitud = cmdobteneraptitud.ExecuteReader();

                if (draptitud.Read())
                {
                    objetoAptitudBE.Idaptitud = draptitud.GetInt32(0);
                    objetoAptitudBE.Nombreaptitud = draptitud.GetString(1);
                }
                cmdobteneraptitud.Connection.Close();

                return objetoAptitudBE;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public int insertarAptitud(AptitudBE objetoaptitud)
        {
            String sqlinsertaraptitud;
            SqlConnection conn;
            SqlCommand cmdinsertaraptitud;
            SqlParameter prmidaptitud;
            SqlParameter prmnombre;

            int idinteres;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlinsertaraptitud = "SWEGR_insertarAptitud";
                cmdinsertaraptitud = new SqlCommand(sqlinsertaraptitud, conn);
                cmdinsertaraptitud.CommandType = CommandType.StoredProcedure;

                prmidaptitud = new SqlParameter();
                prmidaptitud.Direction = ParameterDirection.ReturnValue;
                prmidaptitud.SqlDbType = SqlDbType.Int;

                prmnombre = new SqlParameter();
                prmnombre.ParameterName = "@nombre";
                prmnombre.SqlDbType = SqlDbType.VarChar;
                prmnombre.Size = 50;
                prmnombre.Value = objetoaptitud.Nombreaptitud;

                cmdinsertaraptitud.Parameters.Add(prmidaptitud);
                cmdinsertaraptitud.Parameters.Add(prmnombre);

                cmdinsertaraptitud.Connection.Open();
                cmdinsertaraptitud.ExecuteNonQuery();
                idinteres = Convert.ToInt32(prmidaptitud.Value);
                cmdinsertaraptitud.Connection.Close();

                return idinteres;

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool actualizarAptitud(AptitudBE objetoaptitud)
        {
            String sqlactualizaraptitud;
            SqlConnection conn;
            SqlCommand cmdactualizaraptitud;
            SqlParameter prmidaptitud;
            SqlParameter prmnombre;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlactualizaraptitud = "SWEGR_actualizarAptitud";
                cmdactualizaraptitud = new SqlCommand(sqlactualizaraptitud, conn);
                cmdactualizaraptitud.CommandType = CommandType.StoredProcedure;

                prmidaptitud = new SqlParameter();
                prmidaptitud.ParameterName = "@idaptitud";
                prmidaptitud.SqlDbType = SqlDbType.Int;

                prmnombre = new SqlParameter();
                prmnombre.ParameterName = "@nombre";
                prmnombre.SqlDbType = SqlDbType.VarChar;
                prmnombre.Size = 50;
                prmnombre.Value = objetoaptitud.Nombreaptitud;

                cmdactualizaraptitud.Parameters.Add(prmidaptitud);
                cmdactualizaraptitud.Parameters.Add(prmnombre);

                cmdactualizaraptitud.Connection.Open();
                cmdactualizaraptitud.ExecuteNonQuery();
                cmdactualizaraptitud.Connection.Close();

                return true;

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void eliminarAptitud(int idaptitud)
        {
            String sqleliminaraptitud;
            SqlConnection conn;
            SqlCommand cmdeliminaraptitud;
            SqlParameter prmidinteres;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqleliminaraptitud = "SWEGR_eliminarAptitud";
                cmdeliminaraptitud = new SqlCommand(sqleliminaraptitud, conn);
                cmdeliminaraptitud.CommandType = CommandType.StoredProcedure;

                prmidinteres = new SqlParameter();
                prmidinteres.ParameterName = "@idaptitud";
                prmidinteres.SqlDbType = SqlDbType.Int;
                prmidinteres.Value = idaptitud;

                cmdeliminaraptitud.Parameters.Add(prmidinteres);
                cmdeliminaraptitud.Connection.Open();
                cmdeliminaraptitud.Connection.Close();

            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
