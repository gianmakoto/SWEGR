using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace SWEGR.DL.DALC
{
    public class Conexion
    {
        private SqlConnection sqlconnection;

        public SqlConnection obtenerConexion()
        {
            string cadena = ConfigurationManager.ConnectionStrings["ConexionDB"].ConnectionString;
            sqlconnection = new SqlConnection(cadena);

            return sqlconnection;
        }
    }
}
