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

        public int insertarregistrolaboral(RegistroLaboralBE objetoregistrolaboral)
        {
            try
            {
                RegistroLaboralDALC objetoRegistroLaboralDALC = new RegistroLaboralDALC();
                return objetoRegistroLaboralDALC.insertarregistrolaboral(objetoregistrolaboral);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public int insertarregistrolaboral_DatosExtraidos(RegistroLaboralBE objetoregistrolaboral)
        {
            try
            {
                RegistroLaboralDALC objetoRegistroLaboralDALC = new RegistroLaboralDALC();
                return objetoRegistroLaboralDALC.insertarregistrolaboral_DatosExtraidos(objetoregistrolaboral);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public bool actualizarregistrolaboral(RegistroLaboralBE objetoregistrolaboral)
        {
            try
            {
                RegistroLaboralDALC objetoRegistroLaboralDALC = new RegistroLaboralDALC();
                return objetoRegistroLaboralDALC.actualizarregistrolaboral(objetoregistrolaboral);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
