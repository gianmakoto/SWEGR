using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SWEGR.DL.DALC;
using SWEGR.BL.BE;

namespace SWEGR.BL.BC
{
    public class InteresBC
    {
        public InteresBE obtenerInteres(int idinteres)
        {
            InteresDALC objetoInteresDALC = new InteresDALC();
            return objetoInteresDALC.obtenerInteres(idinteres);
        }
    }
}
