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
    public class PaisDALC
    {
        public List<String> listarPais()
        {
            String sqllistarpais;
            SqlConnection conn;
            SqlCommand cmdlistarpais;
            SqlDataReader drpais;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistarpais = "SWEGR_listarPais";
                cmdlistarpais = new SqlCommand(sqllistarpais, conn);
                cmdlistarpais.CommandType = CommandType.StoredProcedure;

                cmdlistarpais.Connection.Open();

                PaisBE objetoPaisBE = new PaisBE();
                List<String> listapais = new List<String>();

                drpais = cmdlistarpais.ExecuteReader();

                while (drpais.Read())
                {
                    objetoPaisBE.Idpais = drpais.GetInt32(0);
                    objetoPaisBE.Nombrepais = drpais.GetString(1);

                    listapais.Add(objetoPaisBE.Nombrepais);
                }

                cmdlistarpais.Connection.Close();

                return listapais;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
