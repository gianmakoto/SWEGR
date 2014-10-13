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
    public class EgresadoDesvinculadoDALC
    {
        public EgresadoDesvinculadoBE obtenerEgresadoDesvinculado(string codigo)
        {
            String sqlobteneregresado;

            SqlConnection conn;
            SqlCommand cmdobteneregresado;
            SqlParameter prmcodigoegresado;
            SqlDataReader dregresado;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlobteneregresado = "SWEGR_obtenerEgresadoDesvinculado";
                cmdobteneregresado = new SqlCommand(sqlobteneregresado, conn);
                cmdobteneregresado.CommandType = CommandType.StoredProcedure;

                prmcodigoegresado = new SqlParameter();
                prmcodigoegresado.ParameterName = "@codigoegresado";
                prmcodigoegresado.SqlDbType = SqlDbType.VarChar;
                prmcodigoegresado.Size = 10;
                prmcodigoegresado.Value = codigo;

                cmdobteneregresado.Parameters.Add(prmcodigoegresado);
                cmdobteneregresado.Connection.Open();

                EgresadoDesvinculadoBE objetoEgresadoDesvinculadoBE;
                objetoEgresadoDesvinculadoBE = new EgresadoDesvinculadoBE();

                dregresado = cmdobteneregresado.ExecuteReader();

                if (dregresado.Read())
                {
                    objetoEgresadoDesvinculadoBE.Nombrecompleto = dregresado.GetString(1);
                    objetoEgresadoDesvinculadoBE.Contrasena = dregresado.GetString(2);
                    objetoEgresadoDesvinculadoBE.Cambiocontrasena = dregresado.GetBoolean(3);
                    //objetoEgresadoDesvinculadoBE.Cambiocontrasena = dregresado.GetBoolean(4);
                }

                cmdobteneregresado.Connection.Close();
                return objetoEgresadoDesvinculadoBE;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
