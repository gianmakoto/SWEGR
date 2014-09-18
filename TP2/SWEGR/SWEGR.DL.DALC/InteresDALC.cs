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
    }
}
