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
    public class EgresadoDALC
    {
        public EgresadoBE obtenerEgresado(int idegresado)
        {
            String sqlobteneregresado;

            SqlConnection conn;
            SqlCommand cmdobteneregresado;
            SqlParameter prmidegresado;
            SqlDataReader dregresado;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlobteneregresado = "SWEGR_obtenerEgresado";
                cmdobteneregresado = new SqlCommand(sqlobteneregresado, conn);
                cmdobteneregresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = idegresado;

                cmdobteneregresado.Parameters.Add(prmidegresado);
                cmdobteneregresado.Connection.Open();

                EgresadoBE objetoEgresadoBE;
                objetoEgresadoBE = new EgresadoBE();

                dregresado = cmdobteneregresado.ExecuteReader();

                if (dregresado.Read())
                {
                    objetoEgresadoBE.Idegresado = dregresado.GetInt32(0);
                    objetoEgresadoBE.Nombrecompletoegresado = dregresado.GetString(1);
                    objetoEgresadoBE.Edadegresado = dregresado.GetByte(2);
                    objetoEgresadoBE.Sexoegresado = Convert.ToChar(dregresado.GetString(3));
                    objetoEgresadoBE.Telefonoprinegresado = dregresado.GetString(4);
                    objetoEgresadoBE.Telefonoaltegresado = dregresado.GetString(5);
                    objetoEgresadoBE.Dniegresado = dregresado.GetString(6);
                    objetoEgresadoBE.Correoegresado = dregresado.GetString(7);
                    objetoEgresadoBE.Correoaltegresado = dregresado.GetString(8);
                    objetoEgresadoBE.Direccionegresado = dregresado.GetString(9);
                    objetoEgresadoBE.Distritoegresado = dregresado.GetString(10);
                    objetoEgresadoBE.Departamentoegresado = dregresado.GetString(11);
                    objetoEgresadoBE.Paisegresado = dregresado.GetString(12);
                    objetoEgresadoBE.Perfillinkedinegresado = dregresado.GetString(13);
                    objetoEgresadoBE.Perfilfacebookegresado = dregresado.GetString(14);
                    objetoEgresadoBE.Fechanacimientoegresado = dregresado.GetDateTime(15);
                    objetoEgresadoBE.Tipoegresado = Convert.ToChar(dregresado.GetString(16));
                    objetoEgresadoBE.Fotoegresado = dregresado.GetString(17);
                    objetoEgresadoBE.Contrasenaegresado = dregresado.GetString(18);
                }
                cmdobteneregresado.Connection.Close();

                return objetoEgresadoBE;
            }
            catch (Exception ex)
            {                
                throw;
            }
        }

        public bool actualizarEgresado(EgresadoBE objetoEgresadoBE)
        {
            String sqlactualizaregresado;

            SqlConnection conn;
            SqlCommand cmdactualizaregresado;
            SqlParameter prmidegresado;
            SqlParameter prmnombrecompletoegresado;
            SqlParameter prmedadegresado;
            SqlParameter prmsexoegresado;
            SqlParameter prmtelefonoprinegresado;
            SqlParameter prmtelefonoaltegresado;
            SqlParameter prmdniegresado;
            SqlParameter prmcorreoegresado;
            SqlParameter prmcorreoaltegresado;
            SqlParameter prmdireccionegresado;
            SqlParameter prmdistritoegresado;
            SqlParameter prmdepartamentoegresado;
            SqlParameter prmpaisesgresado;
            SqlParameter prmperfilinkedinegresado;
            SqlParameter prmperfilfacebookegresado;
            SqlParameter prmfechanacimientoegresado;
            SqlParameter prmtipoegresado;
            SqlParameter prmfotoegresado;
            SqlParameter prmcontrasenaegresado;

            try
            {
                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CSSeguimientoEgresados"].ToString());
                sqlactualizaregresado = "SWEGR_actualizarEgresado";
                cmdactualizaregresado = new SqlCommand(sqlactualizaregresado, conn);
                cmdactualizaregresado.CommandType = CommandType.StoredProcedure;

                prmidegresado = new SqlParameter();
                prmidegresado.ParameterName = "@idegresado";
                prmidegresado.SqlDbType = SqlDbType.Int;
                prmidegresado.Value = objetoEgresadoBE.Idegresado;

                prmnombrecompletoegresado = new SqlParameter();
                prmnombrecompletoegresado.ParameterName = "@nombrecompletoegresado";
                prmnombrecompletoegresado.SqlDbType = SqlDbType.VarChar;
                prmnombrecompletoegresado.Size = 100;
                prmnombrecompletoegresado.Value = objetoEgresadoBE.Nombrecompletoegresado;

                prmedadegresado = new SqlParameter();
                prmedadegresado.ParameterName = "@edadegresado";
                prmedadegresado.SqlDbType = SqlDbType.TinyInt;
                prmedadegresado.Value = objetoEgresadoBE.Edadegresado;

                prmsexoegresado = new SqlParameter();
                prmsexoegresado.ParameterName = "@sexoegresado";
                prmsexoegresado.SqlDbType = SqlDbType.Char;
                prmsexoegresado.Size = 1;
                prmsexoegresado.Value = objetoEgresadoBE.Sexoegresado;

                prmtelefonoprinegresado = new SqlParameter();
                prmtelefonoprinegresado.ParameterName = "@telefonoprinegresado";
                prmtelefonoprinegresado.SqlDbType = SqlDbType.VarChar;
                prmtelefonoprinegresado.Size = 9;
                prmtelefonoprinegresado.Value = objetoEgresadoBE.Telefonoprinegresado;

                prmtelefonoaltegresado = new SqlParameter();
                prmtelefonoaltegresado.ParameterName = "@telefonoaltegresado";
                prmtelefonoaltegresado.SqlDbType = SqlDbType.VarChar;
                prmtelefonoaltegresado.Size = 9;
                prmtelefonoaltegresado.Value = objetoEgresadoBE.Telefonoaltegresado;

                prmdniegresado = new SqlParameter();
                prmdniegresado.ParameterName = "@dniegresado";
                prmdniegresado.SqlDbType = SqlDbType.VarChar;
                prmdniegresado.Size = 8;
                prmdniegresado.Value = objetoEgresadoBE.Dniegresado;

                prmcorreoegresado = new SqlParameter();
                prmcorreoegresado.ParameterName = "@correoegresado";
                prmcorreoegresado.SqlDbType = SqlDbType.VarChar;
                prmcorreoegresado.Size = 50;
                prmcorreoegresado.Value = objetoEgresadoBE.Correoegresado;

                prmcorreoaltegresado = new SqlParameter();
                prmcorreoaltegresado.ParameterName = "@correoaltegresado";
                prmcorreoaltegresado.SqlDbType = SqlDbType.VarChar;
                prmcorreoaltegresado.Size = 50;
                prmcorreoaltegresado.Value = objetoEgresadoBE.Correoaltegresado;

                prmdireccionegresado = new SqlParameter();
                prmdireccionegresado.ParameterName = "@direccionegresado";
                prmdireccionegresado.SqlDbType = SqlDbType.VarChar;
                prmdireccionegresado.Size = 100;
                prmdireccionegresado.Value = objetoEgresadoBE.Direccionegresado;

                prmdistritoegresado = new SqlParameter();
                prmdistritoegresado.ParameterName = "@distritoegresado";
                prmdistritoegresado.SqlDbType = SqlDbType.VarChar;
                prmdistritoegresado.Size = 50;
                prmdistritoegresado.Value = objetoEgresadoBE.Distritoegresado;

                prmdepartamentoegresado = new SqlParameter();
                prmdepartamentoegresado.ParameterName = "@departamentoegresado";
                prmdepartamentoegresado.SqlDbType = SqlDbType.VarChar;
                prmdepartamentoegresado.Size = 50;
                prmdepartamentoegresado.Value = objetoEgresadoBE.Departamentoegresado;

                prmpaisesgresado = new SqlParameter();
                prmpaisesgresado.ParameterName = "@paisegresado";
                prmpaisesgresado.SqlDbType = SqlDbType.VarChar;
                prmpaisesgresado.Size = 50;
                prmpaisesgresado.Value = objetoEgresadoBE.Paisegresado;

                prmperfilinkedinegresado = new SqlParameter();
                prmperfilinkedinegresado.ParameterName = "@perfillinkedinegresado";
                prmperfilinkedinegresado.SqlDbType = SqlDbType.VarChar;
                prmperfilinkedinegresado.Size = 50;
                prmperfilinkedinegresado.Value = objetoEgresadoBE.Perfillinkedinegresado;

                prmperfilfacebookegresado = new SqlParameter();
                prmperfilfacebookegresado.ParameterName = "@perfilfacebookegresado";
                prmperfilfacebookegresado.SqlDbType = SqlDbType.VarChar;
                prmperfilfacebookegresado.Size = 50;
                prmperfilfacebookegresado.Value = objetoEgresadoBE.Perfilfacebookegresado;
                
                prmfechanacimientoegresado = new SqlParameter();
                prmfechanacimientoegresado.ParameterName = "@fechanacimientoegresado";
                prmfechanacimientoegresado.SqlDbType = SqlDbType.Date;
                prmfechanacimientoegresado.Value = objetoEgresadoBE.Fechanacimientoegresado;
                
                prmtipoegresado = new SqlParameter();
                prmtipoegresado.ParameterName = "@tipoegresado";
                prmtipoegresado.SqlDbType = SqlDbType.Char;
                prmtipoegresado.Size = 1;
                prmtipoegresado.Value = objetoEgresadoBE.Tipoegresado;
                
                prmfotoegresado = new SqlParameter();
                prmfotoegresado.ParameterName = "@fotoegresado";
                prmfotoegresado.SqlDbType = SqlDbType.VarChar;
                prmfotoegresado.Size = 1000;
                prmfotoegresado.Value = objetoEgresadoBE.Fotoegresado;

                prmcontrasenaegresado = new SqlParameter();
                prmcontrasenaegresado.ParameterName = "@contrasenaegresado";
                prmcontrasenaegresado.SqlDbType = SqlDbType.VarChar;
                prmcontrasenaegresado.Size = 50;
                prmcontrasenaegresado.Value = objetoEgresadoBE.Contrasenaegresado;

                cmdactualizaregresado.Parameters.Add(prmidegresado);
                cmdactualizaregresado.Parameters.Add(prmnombrecompletoegresado);
                cmdactualizaregresado.Parameters.Add(prmedadegresado);
                cmdactualizaregresado.Parameters.Add(prmsexoegresado);
                cmdactualizaregresado.Parameters.Add(prmtelefonoprinegresado);
                cmdactualizaregresado.Parameters.Add(prmtelefonoaltegresado);
                cmdactualizaregresado.Parameters.Add(prmdniegresado);
                cmdactualizaregresado.Parameters.Add(prmcorreoegresado);
                cmdactualizaregresado.Parameters.Add(prmcorreoaltegresado);
                cmdactualizaregresado.Parameters.Add(prmdireccionegresado);
                cmdactualizaregresado.Parameters.Add(prmdistritoegresado);
                cmdactualizaregresado.Parameters.Add(prmdepartamentoegresado);
                cmdactualizaregresado.Parameters.Add(prmpaisesgresado);
                cmdactualizaregresado.Parameters.Add(prmperfilinkedinegresado);
                cmdactualizaregresado.Parameters.Add(prmperfilfacebookegresado);
                cmdactualizaregresado.Parameters.Add(prmfechanacimientoegresado);
                cmdactualizaregresado.Parameters.Add(prmtipoegresado);
                cmdactualizaregresado.Parameters.Add(prmfotoegresado);
                cmdactualizaregresado.Parameters.Add(prmcontrasenaegresado);

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
