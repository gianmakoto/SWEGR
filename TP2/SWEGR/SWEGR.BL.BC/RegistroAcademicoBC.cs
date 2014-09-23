using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SWEGR.DL.DALC;
using SWEGR.BL.BE;

namespace SWEGR.BL.BC
{
    public class RegistroAcademicoBC
    {
        public List<RegistroAcademicoBE> listarregistroacademico(int idegresado)
        {
            try
            {
                RegistroAcademicoDALC objetoRegistroAcademicoDALC = new RegistroAcademicoDALC();
                return objetoRegistroAcademicoDALC.listarregistroacademico(idegresado);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
