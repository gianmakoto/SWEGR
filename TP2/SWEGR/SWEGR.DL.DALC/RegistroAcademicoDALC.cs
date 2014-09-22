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
            DataTable dtregistroAcad = new DataTable();
            

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqllistarregistroacad = "SWEGR_listarRegistroAcademico";
                cmdlistarregistroacad = new SqlCommand(sqllistarregistroacad, conn);
                cmdlistarregistroacad.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                cmdlistarregistroacad.Parameters.Add(idegresado);

                cmdlistarregistroacad.Connection.Open();

                RegistroAcademicoBE objetoRegistroAcademicoBE = new RegistroAcademicoBE();
                List<RegistroAcademicoBE> listaRegistroAcademicoBE = new List<RegistroAcademicoBE>();

                dtregistroAcad.Load(cmdlistarregistroacad.ExecuteReader());

                foreach (DataRow drwregistroacad in dtregistroAcad.Rows)
                {
                    objetoRegistroAcademicoBE.Idregistroacademico = Convert.ToInt32(drwregistroacad["RegistroAcademicoID"]);
                    objetoRegistroAcademicoBE.Idegresado = Convert.ToInt32(drwregistroacad["EgresadoID"]);
                    objetoRegistroAcademicoBE.Nombreinstitucion = Convert.ToString(drwregistroacad["NombreInstitucion"]);
                    objetoRegistroAcademicoBE.Nombreestudio = Convert.ToString(drwregistroacad["Nombre"]);
                    objetoRegistroAcademicoBE.Duracionestudio = Convert.ToString(drwregistroacad["Duracion"]);
                    objetoRegistroAcademicoBE.Descripcionestudio = Convert.ToString(drwregistroacad["Descripcion"]);
                    objetoRegistroAcademicoBE.Tipoestudio = Convert.ToString(drwregistroacad["TipoEstudio"]);
                    objetoRegistroAcademicoBE.Idpais = Convert.ToInt32(drwregistroacad["PaisID"]);

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
