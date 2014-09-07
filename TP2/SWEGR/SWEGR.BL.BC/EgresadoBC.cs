using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SWEGR.DL.DALC;
using SWEGR.BL.BE;

namespace SWEGR.BL.BC
{
    public class EgresadoBC
    {
        public EgresadoBE obtenerEgresado(int idegresado)
        {
            try
            {
                EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
                return objetoEgresadoDALC.obtenerEgresado(idegresado);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool actualizarEgresado(EgresadoBE objetoEgresadoBE)
        {
            try
            {
                EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
                return objetoEgresadoDALC.actualizarEgresado(objetoEgresadoBE);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public int insertarhistdategresado(HistorialDatosEgresadoBE objetohistdategresado)
        {
            try
            {
                HistorialDatosEgresadoDALC objetohistdategresadoDALC = new HistorialDatosEgresadoDALC();
                return objetohistdategresadoDALC.insertarhistdategresado(objetohistdategresado);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
