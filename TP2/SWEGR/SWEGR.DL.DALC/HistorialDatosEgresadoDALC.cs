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
    public class HistorialDatosEgresadoDALC
    {
        public int insertarhistdategresado(HistorialDatosEgresadoBE objetohistdategresado)
        {
            String sqlinsertarhistdategresado;

            SqlConnection conn;
            SqlCommand cmdinsertarhistdategresado;
            SqlParameter prmidhistdategresado;
            SqlParameter prmidegresado;
            SqlParameter prmcampoactualizado;
            SqlParameter prmvalornuevo;
            SqlParameter prmfechaactualizacion;
            SqlParameter prmorigen;

            int idhistdategresado;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlinsertarhistdategresado = "SWEGR_insertarHistorialDatosEgresado";
                cmdinsertarhistdategresado = new SqlCommand(sqlinsertarhistdategresado, conn);
                cmdinsertarhistdategresado.CommandType = CommandType.StoredProcedure;

                prmidhistdategresado = new SqlParameter();
                prmidhistdategresado.Direction = ParameterDirection.ReturnValue;
                prmidhistdategresado.SqlDbType = SqlDbType.Int;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@egresadoid";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = objetohistdategresado.Idegresado;

                prmcampoactualizado = new SqlParameter();
                prmcampoactualizado.ParameterName = "@campoactualizado";
                prmcampoactualizado.SqlDbType = SqlDbType.VarChar;
                prmcampoactualizado.Size = 30;
                prmcampoactualizado.Value = objetohistdategresado.Campoactualizado;

                prmvalornuevo = new SqlParameter();
                prmvalornuevo.ParameterName = "@valornuevo";
                prmvalornuevo.SqlDbType = SqlDbType.VarChar;
                prmvalornuevo.Size = 500;
                prmvalornuevo.Value = objetohistdategresado.Valornuevo;

                prmfechaactualizacion = new SqlParameter();
                prmfechaactualizacion.ParameterName = "@fechaactualizacion";
                prmfechaactualizacion.SqlDbType = SqlDbType.DateTime;
                prmfechaactualizacion.Value = objetohistdategresado.Fechaactualizacion;

                prmorigen = new SqlParameter();
                prmorigen.ParameterName = "@origen";
                prmorigen.SqlDbType = SqlDbType.Char;
                prmorigen.Size = 1;
                prmorigen.Value = objetohistdategresado.Origen;

                cmdinsertarhistdategresado.Parameters.Add(prmidhistdategresado);
                cmdinsertarhistdategresado.Parameters.Add(prmidegresado);
                cmdinsertarhistdategresado.Parameters.Add(prmcampoactualizado);
                cmdinsertarhistdategresado.Parameters.Add(prmvalornuevo);
                cmdinsertarhistdategresado.Parameters.Add(prmfechaactualizacion);
                cmdinsertarhistdategresado.Parameters.Add(prmorigen);

                cmdinsertarhistdategresado.Connection.Open();
                cmdinsertarhistdategresado.ExecuteNonQuery();
                idhistdategresado = Convert.ToInt32(prmidhistdategresado.Value);
                cmdinsertarhistdategresado.Connection.Close();

                return idhistdategresado;

            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
