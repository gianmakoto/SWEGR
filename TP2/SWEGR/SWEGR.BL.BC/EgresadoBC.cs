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

        public List<int> listaraptitudxegresado(int idegresado)
        {
            try
            {
                EgresadoDALC objetoegresadoDALC = new EgresadoDALC();
                return objetoegresadoDALC.listaraptitudxegresado(idegresado);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<int> listarinteresxegresado(int idegresado)
        {
            try
            {
                EgresadoDALC objetoegresadoDALC = new EgresadoDALC();
                return objetoegresadoDALC.listarinteresxegresado(idegresado);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool insertarAptitudxEgresado(int idegresado, int idaptitud)
        {
            try
            {
                EgresadoDALC objetoegresadoDALC = new EgresadoDALC();
                return objetoegresadoDALC.insertarAptitudxEgresado(idegresado, idaptitud);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool insertarInteresxEgresado(int idegresado, int idinteres)
        {
            try
            {
                EgresadoDALC objetoegresadoDALC = new EgresadoDALC();
                return objetoegresadoDALC.insertarInteresxEgresado(idegresado, idinteres);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void eliminarAptitudxEgresado(int idegresado, int idaptitud)
        {
            try
            {
                EgresadoDALC objetoegresadoDALC = new EgresadoDALC();
                objetoegresadoDALC.eliminarAptitudxEgresado(idegresado, idaptitud);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void eliminarInteresxEgresado(int idegresado, int idinteres)
        {
            try
            {
                EgresadoDALC objetoegresadoDALC = new EgresadoDALC();
                objetoegresadoDALC.eliminarInteresxEgresado(idegresado, idinteres);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
