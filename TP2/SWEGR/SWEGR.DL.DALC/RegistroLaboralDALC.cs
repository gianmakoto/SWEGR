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
            DataTable dtregistroLabor = new DataTable();


            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistarregistrolabor = "SWEGR_listarRegistroLaboral";
                cmdlistarregistrolabor = new SqlCommand(sqllistarregistrolabor, conn);
                cmdlistarregistrolabor.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                cmdlistarregistrolabor.Parameters.Add(idegresado);

                cmdlistarregistrolabor.Connection.Open();

                RegistroLaboralBE objetoRegistroLaboralBE = new RegistroLaboralBE();
                List<RegistroLaboralBE> listaRegistroLaboralBE = new List<RegistroLaboralBE>();

                dtregistroLabor.Load(cmdlistarregistrolabor.ExecuteReader());

                foreach (DataRow drwregistrolabor in dtregistroLabor.Rows)
                {
                    objetoRegistroLaboralBE.Idregistrolaboral = Convert.ToInt32(drwregistrolabor["RegistroLaboralID"]);
                    objetoRegistroLaboralBE.Idegresado = Convert.ToInt32(drwregistrolabor["EgresadoID"]);
                    objetoRegistroLaboralBE.Nombretrabajo = Convert.ToString(drwregistrolabor["NombreTrabajo"]);
                    objetoRegistroLaboralBE.Cargotrabajo = Convert.ToString(drwregistrolabor["Cargo"]);
                    objetoRegistroLaboralBE.Duraciontrabajo = Convert.ToString(drwregistrolabor["Duracion"]);
                    objetoRegistroLaboralBE.Descripciontrabajo = Convert.ToString(drwregistrolabor["Descripcion"]);
                    objetoRegistroLaboralBE.Nombrejefetrabajo = Convert.ToString(drwregistrolabor["NombreJefe"]);
                    objetoRegistroLaboralBE.Cargojefetrabajo = Convert.ToString(drwregistrolabor["JefeCargo"]);
                    objetoRegistroLaboralBE.Telefonojefetrabajo = Convert.ToString(drwregistrolabor["TelefonoContacto"]);
                    objetoRegistroLaboralBE.Correojefetrabajo = Convert.ToString(drwregistrolabor["CorreoJefe"]);
                    objetoRegistroLaboralBE.Idpais = Convert.ToInt32(drwregistrolabor["PaisID"]);
                    objetoRegistroLaboralBE.Trabajoactual = Convert.ToBoolean(drwregistrolabor["TrabajoActual"]);

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
