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
    public class RegistroLaboralDALC
    {
        public List<RegistroLaboralBE> listarregistrolaobral(int idegresado)
        {
            String sqllistarregistrolabor;
            SqlConnection conn;
            SqlCommand cmdlistarregistrolabor;
            SqlParameter prmidegresado;
            SqlDataReader drregistrolaboral;

            try
            {
                RegistroLaboralBE objetoRegistroLaboralBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistarregistrolabor = "SWEGR_listarRegistroLaboral";
                cmdlistarregistrolabor = new SqlCommand(sqllistarregistrolabor, conn);
                cmdlistarregistrolabor.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                cmdlistarregistrolabor.Parameters.Add(prmidegresado);
                cmdlistarregistrolabor.Connection.Open();
                drregistrolaboral = cmdlistarregistrolabor.ExecuteReader();
                List<RegistroLaboralBE> listaRegistroLaboralBE = new List<RegistroLaboralBE>();

                while (drregistrolaboral.Read())
                {
                    objetoRegistroLaboralBE = new RegistroLaboralBE();

                    objetoRegistroLaboralBE.Idregistrolaboral = drregistrolaboral.GetInt32(0);
                    objetoRegistroLaboralBE.Nombretrabajo = drregistrolaboral.GetString(1);
                    objetoRegistroLaboralBE.Cargotrabajo = drregistrolaboral.GetString(2);
                    objetoRegistroLaboralBE.Duraciontrabajo = drregistrolaboral.GetString(3);
                    objetoRegistroLaboralBE.Descripciontrabajo = drregistrolaboral.GetString(4);
                    objetoRegistroLaboralBE.Nombrejefetrabajo = drregistrolaboral.GetString(5);
                    objetoRegistroLaboralBE.Cargojefetrabajo = drregistrolaboral.GetString(6);
                    objetoRegistroLaboralBE.Telefonojefetrabajo = drregistrolaboral.GetString(7);
                    objetoRegistroLaboralBE.Correojefetrabajo = drregistrolaboral.GetString(8);
                    objetoRegistroLaboralBE.Idpais = drregistrolaboral.GetInt32(9);
                    objetoRegistroLaboralBE.Trabajoactual = drregistrolaboral.GetBoolean(10);

                    listaRegistroLaboralBE.Add(objetoRegistroLaboralBE);
                }

                cmdlistarregistrolabor.Connection.Close();
                return listaRegistroLaboralBE;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
