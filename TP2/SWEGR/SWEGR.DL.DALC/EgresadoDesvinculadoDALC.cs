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
                    objetoEgresadoDesvinculadoBE.Contrasenadinamica = dregresado.GetString(2);
                    objetoEgresadoDesvinculadoBE.Cambiocontrasena = dregresado.GetBoolean(3);
                    objetoEgresadoDesvinculadoBE.Carrera = dregresado.GetString(4);
                    objetoEgresadoDesvinculadoBE.Cicloegreso = dregresado.GetString(5);
                    objetoEgresadoDesvinculadoBE.Estaregistrado = dregresado.GetBoolean(6);
                }

                cmdobteneregresado.Connection.Close();
                return objetoEgresadoDesvinculadoBE;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool ActualizarEgresadoDesvinclado(EgresadoDesvinculadoBE objEgresadoDesvinculadoBE)
        {
            String sqlactualizaregresado;

            SqlConnection conn;
            SqlCommand cmdactualizaregresado;
            SqlParameter prmcodigouniversitarioegresado;
            SqlParameter prmnombrecompletoegresado;
            SqlParameter prmcontrasenadinamicaegresado;
            SqlParameter prmcambiocontrasenaegresado;
            SqlParameter prmcarreraegresado;
            SqlParameter prmcicloegresado;
            SqlParameter prmestaregistrado;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlactualizaregresado = "SWEGR_actualizarEgresadoDesvinculado";
                cmdactualizaregresado = new SqlCommand(sqlactualizaregresado, conn);
                cmdactualizaregresado.CommandType = CommandType.StoredProcedure;


                prmnombrecompletoegresado = new SqlParameter();
                prmnombrecompletoegresado.ParameterName = "@nombrecompleto";
                prmnombrecompletoegresado.SqlDbType = SqlDbType.VarChar;
                prmnombrecompletoegresado.Size = 100;
                prmnombrecompletoegresado.Value = objEgresadoDesvinculadoBE.Nombrecompleto;

                prmcontrasenadinamicaegresado = new SqlParameter();
                prmcontrasenadinamicaegresado.ParameterName = "@contrasenadinamica";
                prmcontrasenadinamicaegresado.SqlDbType = SqlDbType.VarChar;
                prmcontrasenadinamicaegresado.Size = 50;
                prmcontrasenadinamicaegresado.Value = objEgresadoDesvinculadoBE.Contrasenadinamica;

                prmcambiocontrasenaegresado = new SqlParameter();
                prmcambiocontrasenaegresado.ParameterName = "@cambiocontrasena";
                prmcambiocontrasenaegresado.SqlDbType = SqlDbType.Bit;
                prmcambiocontrasenaegresado.Value = objEgresadoDesvinculadoBE.Cambiocontrasena;

                prmcicloegresado = new SqlParameter();
                prmcicloegresado.ParameterName = "@cicloegreso";
                prmcicloegresado.SqlDbType = SqlDbType.VarChar;
                prmcicloegresado.Size = 10;
                prmcicloegresado.Value = objEgresadoDesvinculadoBE.Cicloegreso;

                prmcodigouniversitarioegresado = new SqlParameter();
                prmcodigouniversitarioegresado.ParameterName = "@codigo";
                prmcodigouniversitarioegresado.SqlDbType = SqlDbType.VarChar;
                prmcodigouniversitarioegresado.Size = 10;
                prmcodigouniversitarioegresado.Value = objEgresadoDesvinculadoBE.Codigo;

                prmcarreraegresado = new SqlParameter();
                prmcarreraegresado.ParameterName = "@carrera";
                prmcarreraegresado.SqlDbType = SqlDbType.VarChar;
                prmcarreraegresado.Size = 50;
                prmcarreraegresado.Value = objEgresadoDesvinculadoBE.Carrera;

                prmestaregistrado = new SqlParameter();
                prmestaregistrado.ParameterName = "@estaregistrado";
                prmestaregistrado.SqlDbType = SqlDbType.Bit;
                prmestaregistrado.Value = objEgresadoDesvinculadoBE.Estaregistrado;

                cmdactualizaregresado.Parameters.Add(prmnombrecompletoegresado);
                cmdactualizaregresado.Parameters.Add(prmcontrasenadinamicaegresado);
                cmdactualizaregresado.Parameters.Add(prmcambiocontrasenaegresado);
                cmdactualizaregresado.Parameters.Add(prmcicloegresado);
                cmdactualizaregresado.Parameters.Add(prmcodigouniversitarioegresado);
                cmdactualizaregresado.Parameters.Add(prmcarreraegresado);
                cmdactualizaregresado.Parameters.Add(prmestaregistrado);


                cmdactualizaregresado.Connection.Open();
                cmdactualizaregresado.ExecuteNonQuery();
                cmdactualizaregresado.Connection.Close();

                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
