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
    public class RegistroAcademicoDALC
    {
        public List<RegistroAcademicoBE> listarregistroacademico(int idegresado)
        {
            String sqllistarregistroacad;
            SqlConnection conn;
            SqlCommand cmdlistarregistroacad;
            SqlParameter prmidegresado;
            SqlDataReader drregistroacademico;

            try
            {
                RegistroAcademicoBE objetoRegistroAcademicoBE;

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistarregistroacad = "SWEGR_listarRegistroAcademico";
                cmdlistarregistroacad = new SqlCommand(sqllistarregistroacad, conn);
                cmdlistarregistroacad.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                cmdlistarregistroacad.Parameters.Add(prmidegresado);
                cmdlistarregistroacad.Connection.Open();
                drregistroacademico = cmdlistarregistroacad.ExecuteReader();
                List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();

                while (drregistroacademico.Read())
                {
                    objetoRegistroAcademicoBE = new RegistroAcademicoBE();

                    objetoRegistroAcademicoBE.Idregistroacademico = drregistroacademico.GetInt32(0);
                    objetoRegistroAcademicoBE.Nombreinstitucion = drregistroacademico.GetString(1);
                    objetoRegistroAcademicoBE.Nombreestudio = drregistroacademico.GetString(2);
                    objetoRegistroAcademicoBE.Duracionestudio = drregistroacademico.GetString(3);
                    objetoRegistroAcademicoBE.Descripcionestudio = drregistroacademico.GetString(4);
                    objetoRegistroAcademicoBE.Tipoestudio = drregistroacademico.GetString(5);
                    objetoRegistroAcademicoBE.Idpais = drregistroacademico.GetInt32(6);

                    listaRegistroAcademicoBE.Add(objetoRegistroAcademicoBE);
                }

                cmdlistarregistroacad.Connection.Close();
                return listaRegistroAcademicoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
