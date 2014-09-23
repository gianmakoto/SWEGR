using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SWEGR.DL.DALC;
using SWEGR.BL.BE;

namespace SWEGR.BL.BC
{
    public class RegistroLaboralBC
    {
        public List<RegistroLaboralBE> listarregistrolaobral(int idegresado)
        {
            try
            {
                RegistroLaboralDALC objetoRegistroLaboralDALC = new RegistroLaboralDALC();
                return objetoRegistroLaboralDALC.listarregistrolaobral(idegresado);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
