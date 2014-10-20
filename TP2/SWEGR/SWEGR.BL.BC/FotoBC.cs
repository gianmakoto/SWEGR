using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SWEGR.DL.DALC;
using SWEGR.BL.BE;

namespace SWEGR.BL.BC
{
    public class FotoBC
    {
        public FotoBE obtenerFoto(int idfoto)
        {
            try
            {
                FotoDALC objFotoDALC = new FotoDALC();
                return objFotoDALC.obtenerFoto(idfoto);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public int insertarFoto(FotoBE foto)
        {
            try
            {
                FotoDALC objFotoDALC = new FotoDALC();
                return objFotoDALC.insertarFoto(foto);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool actualizarFoto(FotoBE foto)
        {
            try
            {
                FotoDALC objFotoDALC = new FotoDALC();
                return objFotoDALC.actualizarFoto(foto);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public void eliminarFoto(int idfoto)
        {
            try
            {
                FotoDALC objFotoDALC = new FotoDALC();
                objFotoDALC.eliminarFoto(idfoto);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
