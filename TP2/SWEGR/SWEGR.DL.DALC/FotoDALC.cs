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
    public class FotoDALC
    {
        public FotoBE obtenerFoto(int idfoto)
        {
            FotoBE fotobe;

            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString()))
            using (var cmd = conn.CreateCommand())
            {
                cmd.Connection.Open();
                cmd.CommandText = "SWEGR_obtenerFoto";
                cmd.CommandType = CommandType.StoredProcedure;

                var parametroFotoId = new SqlParameter
                {
                    ParameterName = "@idfoto",
                    DbType = DbType.Int32,
                    Direction = ParameterDirection.Input,
                    Value = idfoto
                };

                cmd.Parameters.Add(parametroFotoId);

                fotobe = new FotoBE();

                fotobe.ImagenBytes = (byte[])cmd.ExecuteScalar();

                if (fotobe.ImagenBytes.Length > 0)
                {
                    fotobe.Idfoto = idfoto;
                }
                else
                {
                    fotobe = null;
                }
            }

            return fotobe;
        }

        public int insertarFoto(FotoBE foto)
        {
            foto.Idfoto = 0;

            using (var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString()))
            using (var cmd = conn.CreateCommand())
            {
                cmd.Connection.Open();
                cmd.CommandText = "SWEGR_insertarFoto";
                cmd.CommandType = CommandType.StoredProcedure;

                var parametroFoto = new SqlParameter
                {
                    ParameterName = "@foto",
                    SqlDbType = SqlDbType.Binary,
                    Direction = ParameterDirection.Input,
                    Size = foto.ImagenBytes.Length,
                    Value = foto.ImagenBytes
                };

                cmd.Parameters.Add(parametroFoto);

                using (var trans = conn.BeginTransaction())
                {
                    cmd.Transaction = trans;
                    foto.Idfoto = (int)cmd.ExecuteScalar();

                    try { trans.Commit(); }
                    catch (Exception) { trans.Rollback(); throw; }
                }
            }

            return foto.Idfoto;
        }

        public bool actualizarFoto(FotoBE foto)
        {
            String sqlactualizarfoto;
            SqlConnection conn;
            SqlCommand cmdactualizarfoto;
            SqlParameter prmidfoto;
            SqlParameter prmfoto;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlactualizarfoto = "SWEGR_actualizarFoto";
                cmdactualizarfoto = new SqlCommand(sqlactualizarfoto, conn);
                cmdactualizarfoto.CommandType = CommandType.StoredProcedure;

                prmidfoto = new SqlParameter();
                prmidfoto.ParameterName = "@idfoto";
                prmidfoto.SqlDbType = SqlDbType.Int;
                prmidfoto.Value = foto.Idfoto;

                prmfoto = new SqlParameter();
                prmfoto.ParameterName = "@foto";
                prmfoto.SqlDbType = SqlDbType.Binary;
                prmfoto.Size = 8000;
                prmfoto.Value = foto.ImagenBytes;

                cmdactualizarfoto.Parameters.Add(prmidfoto);
                cmdactualizarfoto.Parameters.Add(prmfoto);

                cmdactualizarfoto.Connection.Open();
                cmdactualizarfoto.ExecuteNonQuery();
                cmdactualizarfoto.Connection.Close();

                return true;

            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void eliminarFoto(int idfoto)
        {
            String sqleliminarfoto;
            SqlConnection conn;
            SqlCommand cmdeliminarfoto;
            SqlParameter prmidfoto;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqleliminarfoto = "SWEGR_eliminarFoto";
                cmdeliminarfoto = new SqlCommand(sqleliminarfoto, conn);
                cmdeliminarfoto.CommandType = CommandType.StoredProcedure;

                prmidfoto = new SqlParameter();
                prmidfoto.ParameterName = "@idfoto";
                prmidfoto.SqlDbType = SqlDbType.Int;
                prmidfoto.Value = idfoto;

                cmdeliminarfoto.Parameters.Add(prmidfoto);
                cmdeliminarfoto.Connection.Open();
                cmdeliminarfoto.ExecuteNonQuery();
                cmdeliminarfoto.Connection.Close();

            }
            catch (Exception ex)
            {
                throw;
            }
        }

    }
}
