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
        public EgresadoBE obtenerEgresadoxCodigo(string codigo)
        {
            try
            {
                EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
                return objetoEgresadoDALC.obtenerEgresadoxCodigo(codigo);
            }
            catch (Exception ex)
            {
                throw;
            }
        }


        public List<EgresadoBE> listarEgresado()
        {
            try
            {
                EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
                return objetoEgresadoDALC.listarEgresado();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<EgresadoBE> listarEgresado_Lista(String nombre, String carrera, int anioInicio, int anioFin, String codigoUniversitario)
        {
            try
            {
                EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
                return objetoEgresadoDALC.listarEgresado_Lista(nombre, carrera, anioInicio, anioFin, codigoUniversitario);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        
        ////public List<EgresadoBE> listarEgresadoxNombreoCodigo(string busqueda)
        ////{
        ////    try
        ////    {
        ////        EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
        ////        return objetoEgresadoDALC.listarEgresadoxNombreoCodigo(busqueda);
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        throw;
        ////    }
        ////}

        ////public List<EgresadoBE> listarEgresadoxCiclo(string busqueda)
        ////{
        ////    try
        ////    {
        ////        EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
        ////        return objetoEgresadoDALC.listarEgresadoxCiclo(busqueda);
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        throw;
        ////    }
        ////}

        ////public List<EgresadoBE> listarEgresadoxCarrera(string busqueda)
        ////{
        ////    try
        ////    {
        ////        EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
        ////        return objetoEgresadoDALC.listarEgresadoxCarrera(busqueda);
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        throw;
        ////    }
        ////}

        ////public List<EgresadoBE> listarEgresadoxNombreoCodigoyCiclo(string busqueda, string ciclo)
        ////{
        ////    try
        ////    {
        ////        EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
        ////        return objetoEgresadoDALC.listarEgresadoxNombreoCodigoyCiclo(busqueda, ciclo);
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        throw;
        ////    }
        ////}

        ////public List<EgresadoBE> listarEgresadoxNombreoCodigoyCarrera(string busqueda, string carrera)
        ////{
        ////    try
        ////    {
        ////        EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
        ////        return objetoEgresadoDALC.listarEgresadoxNombreoCodigoyCarrera(busqueda, carrera);
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        throw;
        ////    }
        ////}

        ////public List<EgresadoBE> listarEgresadoxCicloyCarera(string ciclo, string carrera)
        ////{
        ////    try
        ////    {
        ////        EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
        ////        return objetoEgresadoDALC.listarEgresadoxCicloyCarera(ciclo, carrera);
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        throw;
        ////    }
        ////}

        ////public List<EgresadoBE> listarEgresadoxNombreoCodigoyCicloyCarera(string busqueda, string ciclo, string carrera)
        ////{
        ////    try
        ////    {
        ////        EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
        ////        return objetoEgresadoDALC.listarEgresadoxNombreoCodigoyCicloyCarera(busqueda, ciclo, carrera);
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        throw;
        ////    }
        ////}

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

        public EgresadoDesvinculadoBE obtenerEgresadoDesvinculado(string codigo)
        {
            try
            {
                EgresadoDesvinculadoDALC objetoEgresadoDesvinculadoDALC = new EgresadoDesvinculadoDALC();
                return objetoEgresadoDesvinculadoDALC.obtenerEgresadoDesvinculado(codigo);
            }
            catch (Exception)
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

        public int insertarEgresadodesdeEgresadoDesvinculado(EgresadoBE objEgresadoBE)
        {
            try
            {
                EgresadoDALC objetoegresadoDALC = new EgresadoDALC();
                return objetoegresadoDALC.insertarEgresadodesdeEgresadoDesvinculado(objEgresadoBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public String[] obtenerLinksEgresado(int idegresado)
        {
            try
            {
                EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
                return objetoEgresadoDALC.obtenerLinksEgresado(idegresado);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<String> listaranios()
        {
            EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
            return objetoEgresadoDALC.listarAniosEgresados();
        }

        public bool ActualizarEgresadoDesvinclado(EgresadoDesvinculadoBE objEgresadoDesvinculadoBE)
        {
            try
            {
                EgresadoDesvinculadoDALC objetoEgresadoDesvinculadoDALC = new EgresadoDesvinculadoDALC();
                return objetoEgresadoDesvinculadoDALC.ActualizarEgresadoDesvinclado(objEgresadoDesvinculadoBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool insertarFotoxEgresado(int idegresado, int idfoto)
        {
            try
            {
                EgresadoDALC objetoegresadoDALC = new EgresadoDALC();
                return objetoegresadoDALC.insertarFotoxEgresado(idegresado, idfoto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void eliminarFotoxEgresado(int idegresado, int idfoto)
        {
            try
            {
                EgresadoDALC objetoegresadoDALC = new EgresadoDALC();
                objetoegresadoDALC.eliminarFotoxEgresado(idegresado, idfoto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<EgresadoBE> listarGraduando_Lista(String nombre, String carrera, String codigoUniversitario)
        {
            try
            {
                EgresadoDALC objetoEgresadoDALC = new EgresadoDALC();
                return objetoEgresadoDALC.listarGraduando_Lista(nombre, carrera, codigoUniversitario);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
