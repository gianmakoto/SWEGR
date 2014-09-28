using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SWEGR.DL.DALC;
using SWEGR.BL.BE;

namespace SWEGR.BL.BC
{
    public class AptitudBC
    {
        public AptitudBE obtenerAptitud(int idaptitud)
        {
            AptitudDALC objetoAptitudDALC = new AptitudDALC();
            return objetoAptitudDALC.obtenerAptitud(idaptitud);
        }

        public int insertarAptitud(AptitudBE objetoaptitud)
        {
            AptitudDALC objetoAptitudDALC = new AptitudDALC();
            return objetoAptitudDALC.insertarAptitud(objetoaptitud);
        }

        public bool actualizarInteres(AptitudBE objetoaptitud)
        {
            AptitudDALC objetoAptitudDALC = new AptitudDALC();
            return objetoAptitudDALC.actualizarInteres(objetoaptitud);
        }

        public void eliminarInteres(int idaptitud)
        {
            AptitudDALC objetoAptitudDALC = new AptitudDALC();
            objetoAptitudDALC.eliminarInteres(idaptitud);
        }
    }
}
