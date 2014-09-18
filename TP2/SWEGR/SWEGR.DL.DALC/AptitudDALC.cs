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
    }
}
