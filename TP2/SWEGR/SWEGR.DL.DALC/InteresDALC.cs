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
    public class InteresDALC
    {
        public InteresBE obtenerInteres(int idinteres)
        {
            String sqlobtenerinteres;
            SqlConnection conn;
            SqlCommand cmdobtenerinteres;
            SqlParameter prmidinteres;
            SqlDataReader drinteres;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlobtenerinteres = "SWEGR_obtenerInteres";
                cmdobtenerinteres = new SqlCommand(sqlobtenerinteres, conn);
                cmdobtenerinteres.CommandType = CommandType.StoredProcedure;

                prmidinteres = new SqlParameter();
                prmidinteres.ParameterName = "@idinteres";
                prmidinteres.SqlDbType = SqlDbType.Int;
                prmidinteres.Value = idinteres;

                cmdobtenerinteres.Parameters.Add(prmidinteres);
                cmdobtenerinteres.Connection.Open();

                InteresBE objetoInteresBE;
                objetoInteresBE = new InteresBE();

                drinteres = cmdobtenerinteres.ExecuteReader();

                if (drinteres.Read())
                {
                    objetoInteresBE.Idinteres = drinteres.GetInt32(0);
                    objetoInteresBE.Nombreinteres = drinteres.GetString(1);
                }
                cmdobtenerinteres.Connection.Close();

                return objetoInteresBE;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public int insertarInteres(InteresBE objetointeres)
        {
            String sqlinsertarinteres;
            SqlConnection conn;
            SqlCommand cmdinsertarinteres;
            SqlParameter prmidinteres;
            SqlParameter prmnombre;

            int idinteres;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlinsertarinteres = "SWEGR_insertarInteres";
                cmdinsertarinteres = new SqlCommand(sqlinsertarinteres, conn);
                cmdinsertarinteres.CommandType = CommandType.StoredProcedure;

                prmidinteres = new SqlParameter();
                prmidinteres.Direction = ParameterDirection.ReturnValue;
                prmidinteres.SqlDbType = SqlDbType.Int;

                prmnombre = new SqlParameter();
                prmnombre.ParameterName = "@nombre";
                prmnombre.SqlDbType = SqlDbType.VarChar;
                prmnombre.Size = 50;
                prmnombre.Value = objetointeres.Nombreinteres;

                cmdinsertarinteres.Parameters.Add(prmidinteres);
                cmdinsertarinteres.Parameters.Add(prmnombre);

                cmdinsertarinteres.Connection.Open();
                cmdinsertarinteres.ExecuteNonQuery();
                idinteres = Convert.ToInt32(prmidinteres.Value);
                cmdinsertarinteres.Connection.Close();

                return idinteres;

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool actualizarInteres(InteresBE objetointeres)
        {
            String sqlactualizarinteres;
            SqlConnection conn;
            SqlCommand cmdactualizarinteres;
            SqlParameter prmidinteres;
            SqlParameter prmnombre;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlactualizarinteres = "SWEGR_actualizarInteres";
                cmdactualizarinteres = new SqlCommand(sqlactualizarinteres, conn);
                cmdactualizarinteres.CommandType = CommandType.StoredProcedure;

                prmidinteres = new SqlParameter();
                prmidinteres.ParameterName = "@idinteres";
                prmidinteres.SqlDbType = SqlDbType.Int;

                prmnombre = new SqlParameter();
                prmnombre.ParameterName = "@nombre";
                prmnombre.SqlDbType = SqlDbType.VarChar;
                prmnombre.Size = 50;
                prmnombre.Value = objetointeres.Nombreinteres;

                cmdactualizarinteres.Parameters.Add(prmidinteres);
                cmdactualizarinteres.Parameters.Add(prmnombre);

                cmdactualizarinteres.Connection.Open();
                cmdactualizarinteres.ExecuteNonQuery();
                cmdactualizarinteres.Connection.Close();

                return true;

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void eliminarInteres(int idinteres)
        {
            String sqleliminarinteres;
            SqlConnection conn;
            SqlCommand cmdeliminarinteres;
            SqlParameter prmidinteres;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqleliminarinteres = "SWEGR_eliminarInteres";
                cmdeliminarinteres = new SqlCommand(sqleliminarinteres, conn);
                cmdeliminarinteres.CommandType = CommandType.StoredProcedure;

                prmidinteres = new SqlParameter();
                prmidinteres.ParameterName = "@idinteres";
                prmidinteres.SqlDbType = SqlDbType.Int;
                prmidinteres.Value = idinteres;

                cmdeliminarinteres.Parameters.Add(prmidinteres);
                cmdeliminarinteres.Connection.Open();
                cmdeliminarinteres.Connection.Close();

            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
