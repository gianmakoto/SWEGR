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

        public int insertarregistrolaboral(RegistroLaboralBE objetoregistrolaboral)
        {
            String sqlinsertarregistrolaboral;

            SqlConnection conn;
            SqlCommand cmdinsertarregistrolaboral;
            SqlParameter prmidregistrolaboral;
            SqlParameter prmidegresado;
            SqlParameter prmnombretrabajo;
            SqlParameter prmcargo;
            SqlParameter prmduracion;
            SqlParameter prmdescripcion;
            SqlParameter prmnombrejefe;
            SqlParameter prmcargojefe;
            SqlParameter prmtelefonojefe;
            SqlParameter prmcorreojefe;
            SqlParameter prmidpais;
            SqlParameter prmtrabajoactual;

            int idregistrolaboral;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlinsertarregistrolaboral = "SWEGR_insertarRegistroLaboral";
                cmdinsertarregistrolaboral = new SqlCommand(sqlinsertarregistrolaboral, conn);
                cmdinsertarregistrolaboral.CommandType = CommandType.StoredProcedure;

                prmidregistrolaboral = new SqlParameter();
                prmidregistrolaboral.Direction = ParameterDirection.ReturnValue;
                prmidregistrolaboral.SqlDbType = SqlDbType.Int;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = objetoregistrolaboral.Idegresado;

                prmnombretrabajo = new SqlParameter();
                prmnombretrabajo.ParameterName = "@nombretrabajo";
                prmnombretrabajo.SqlDbType = SqlDbType.VarChar;
                prmnombretrabajo.Size = 100;
                prmnombretrabajo.Value = objetoregistrolaboral.Nombretrabajo;

                prmcargo = new SqlParameter();
                prmcargo.ParameterName = "@cargo";
                prmcargo.SqlDbType = SqlDbType.VarChar;
                prmcargo.Size = 50;
                prmcargo.Value = objetoregistrolaboral.Cargotrabajo;

                prmduracion = new SqlParameter();
                prmduracion.ParameterName = "@duracion";
                prmduracion.SqlDbType = SqlDbType.VarChar;
                prmduracion.Size = 50;
                prmduracion.Value = objetoregistrolaboral.Duraciontrabajo;

                prmdescripcion = new SqlParameter();
                prmdescripcion.ParameterName = "@descripcion";
                prmdescripcion.SqlDbType = SqlDbType.VarChar;
                prmdescripcion.Size = 500;
                prmdescripcion.Value = objetoregistrolaboral.Descripciontrabajo;

                prmnombrejefe = new SqlParameter();
                prmnombrejefe.ParameterName = "@nombrejefe";
                prmnombrejefe.SqlDbType = SqlDbType.VarChar;
                prmnombrejefe.Size = 50;
                prmnombrejefe.Value = objetoregistrolaboral.Nombrejefetrabajo;

                prmcargojefe = new SqlParameter();
                prmcargojefe.ParameterName = "@cargojefe";
                prmcargojefe.SqlDbType = SqlDbType.VarChar;
                prmcargojefe.Size = 50;
                prmcargojefe.Value = objetoregistrolaboral.Cargojefetrabajo;

                prmtelefonojefe = new SqlParameter();
                prmtelefonojefe.ParameterName = "@telefonojefe";
                prmtelefonojefe.SqlDbType = SqlDbType.VarChar;
                prmtelefonojefe.Size = 15;
                prmtelefonojefe.Value = objetoregistrolaboral.Telefonojefetrabajo;

                prmcorreojefe = new SqlParameter();
                prmcorreojefe.ParameterName = "@correojefe";
                prmcorreojefe.SqlDbType = SqlDbType.VarChar;
                prmcorreojefe.Size = 50;
                prmcorreojefe.Value = objetoregistrolaboral.Correojefetrabajo;

                prmidpais = new SqlParameter();
                prmidpais.ParameterName = "@idpais";
                prmidpais.SqlDbType = SqlDbType.Int;
                prmidpais.Value = objetoregistrolaboral.Idpais;

                prmtrabajoactual = new SqlParameter();
                prmtrabajoactual.ParameterName = "@trabajoactual";
                prmtrabajoactual.SqlDbType = SqlDbType.Bit;
                prmtrabajoactual.Value = objetoregistrolaboral.Trabajoactual;

                cmdinsertarregistrolaboral.Parameters.Add(prmidregistrolaboral);
                cmdinsertarregistrolaboral.Parameters.Add(prmidegresado);
                cmdinsertarregistrolaboral.Parameters.Add(prmnombretrabajo);
                cmdinsertarregistrolaboral.Parameters.Add(prmcargo);
                cmdinsertarregistrolaboral.Parameters.Add(prmduracion);
                cmdinsertarregistrolaboral.Parameters.Add(prmdescripcion);
                cmdinsertarregistrolaboral.Parameters.Add(prmnombrejefe);
                cmdinsertarregistrolaboral.Parameters.Add(prmcargojefe);
                cmdinsertarregistrolaboral.Parameters.Add(prmtelefonojefe);
                cmdinsertarregistrolaboral.Parameters.Add(prmcorreojefe);
                cmdinsertarregistrolaboral.Parameters.Add(prmidpais);
                cmdinsertarregistrolaboral.Parameters.Add(prmtrabajoactual);

                cmdinsertarregistrolaboral.Connection.Open();
                cmdinsertarregistrolaboral.ExecuteNonQuery();
                idregistrolaboral = Convert.ToInt32(prmidregistrolaboral.Value);
                cmdinsertarregistrolaboral.Connection.Close();

                return idregistrolaboral;

            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool actualizarregistrolaboral(RegistroLaboralBE objetoregistrolaboral)
        {
            String sqlactualizarregistrolaboral;

            SqlConnection conn;
            SqlCommand cmdactualizarregistrolaboral;
            SqlParameter prmidregistrolaboral;
            SqlParameter prmidegresado;
            SqlParameter prmnombretrabajo;
            SqlParameter prmcargo;
            SqlParameter prmduracion;
            SqlParameter prmdescripcion;
            SqlParameter prmnombrejefe;
            SqlParameter prmcargojefe;
            SqlParameter prmtelefonojefe;
            SqlParameter prmcorreojefe;
            SqlParameter prmidpais;
            SqlParameter prmtrabajoactual;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlactualizarregistrolaboral = "SWEGR_actualizarRegistroLaboral";
                cmdactualizarregistrolaboral = new SqlCommand(sqlactualizarregistrolaboral, conn);
                cmdactualizarregistrolaboral.CommandType = CommandType.StoredProcedure;

                prmidregistrolaboral = new SqlParameter();
                prmidregistrolaboral.ParameterName = "@idregistrolaboral";
                prmidregistrolaboral.SqlDbType = SqlDbType.Int;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = objetoregistrolaboral.Idegresado;

                prmnombretrabajo = new SqlParameter();
                prmnombretrabajo.ParameterName = "@nombretrabajo";
                prmnombretrabajo.SqlDbType = SqlDbType.VarChar;
                prmnombretrabajo.Size = 100;
                prmnombretrabajo.Value = objetoregistrolaboral.Nombretrabajo;

                prmcargo = new SqlParameter();
                prmcargo.ParameterName = "@cargo";
                prmcargo.SqlDbType = SqlDbType.VarChar;
                prmcargo.Size = 50;
                prmcargo.Value = objetoregistrolaboral.Cargotrabajo;

                prmduracion = new SqlParameter();
                prmduracion.ParameterName = "@duracion";
                prmduracion.SqlDbType = SqlDbType.VarChar;
                prmduracion.Size = 50;
                prmduracion.Value = objetoregistrolaboral.Duraciontrabajo;

                prmdescripcion = new SqlParameter();
                prmdescripcion.ParameterName = "@descripcion";
                prmdescripcion.SqlDbType = SqlDbType.VarChar;
                prmdescripcion.Size = 500;
                prmdescripcion.Value = objetoregistrolaboral.Descripciontrabajo;

                prmnombrejefe = new SqlParameter();
                prmnombrejefe.ParameterName = "@nombrejefe";
                prmnombrejefe.SqlDbType = SqlDbType.VarChar;
                prmnombrejefe.Size = 50;
                prmnombrejefe.Value = objetoregistrolaboral.Nombrejefetrabajo;

                prmcargojefe = new SqlParameter();
                prmcargojefe.ParameterName = "@cargojefe";
                prmcargojefe.SqlDbType = SqlDbType.VarChar;
                prmcargojefe.Size = 50;
                prmcargojefe.Value = objetoregistrolaboral.Cargojefetrabajo;

                prmtelefonojefe = new SqlParameter();
                prmtelefonojefe.ParameterName = "@telefonojefe";
                prmtelefonojefe.SqlDbType = SqlDbType.VarChar;
                prmtelefonojefe.Size = 15;
                prmtelefonojefe.Value = objetoregistrolaboral.Telefonojefetrabajo;

                prmcorreojefe = new SqlParameter();
                prmcorreojefe.ParameterName = "@correojefe";
                prmcorreojefe.SqlDbType = SqlDbType.VarChar;
                prmcorreojefe.Size = 50;
                prmcorreojefe.Value = objetoregistrolaboral.Correojefetrabajo;

                prmidpais = new SqlParameter();
                prmidpais.ParameterName = "@idpais";
                prmidpais.SqlDbType = SqlDbType.Int;
                prmidpais.Value = objetoregistrolaboral.Idpais;

                prmtrabajoactual = new SqlParameter();
                prmtrabajoactual.ParameterName = "@trabajoactual";
                prmtrabajoactual.SqlDbType = SqlDbType.Bit;
                prmtrabajoactual.Value = objetoregistrolaboral.Trabajoactual;

                cmdactualizarregistrolaboral.Parameters.Add(prmidregistrolaboral);
                cmdactualizarregistrolaboral.Parameters.Add(prmidegresado);
                cmdactualizarregistrolaboral.Parameters.Add(prmnombretrabajo);
                cmdactualizarregistrolaboral.Parameters.Add(prmcargo);
                cmdactualizarregistrolaboral.Parameters.Add(prmduracion);
                cmdactualizarregistrolaboral.Parameters.Add(prmdescripcion);
                cmdactualizarregistrolaboral.Parameters.Add(prmnombrejefe);
                cmdactualizarregistrolaboral.Parameters.Add(prmcargojefe);
                cmdactualizarregistrolaboral.Parameters.Add(prmtelefonojefe);
                cmdactualizarregistrolaboral.Parameters.Add(prmcorreojefe);
                cmdactualizarregistrolaboral.Parameters.Add(prmidpais);
                cmdactualizarregistrolaboral.Parameters.Add(prmtrabajoactual);

                cmdactualizarregistrolaboral.Connection.Open();
                cmdactualizarregistrolaboral.ExecuteNonQuery();
                cmdactualizarregistrolaboral.Connection.Close();

                return true;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
