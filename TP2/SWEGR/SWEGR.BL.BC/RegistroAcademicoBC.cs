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

        public int insertarregistroacademico(RegistroAcademicoBE objetoregistroacademico)
        {
            try
            {
                RegistroAcademicoDALC objetoRegistroAcademicoDALC = new RegistroAcademicoDALC();
                return objetoRegistroAcademicoDALC.insertarregistroacademico(objetoregistroacademico);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public int insertarregistroacademico_DatosExtraidos(RegistroAcademicoBE objetoregistroacademico)
        {
            try
            {
                RegistroAcademicoDALC objetoRegistroAcademicoDALC = new RegistroAcademicoDALC();
                return objetoRegistroAcademicoDALC.insertarregistroacademico_DatosExtraidos(objetoregistroacademico);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        
        
        public bool actualizarregistroacademico(RegistroAcademicoBE objetoregistroacademico)
        {
            try
            {
                RegistroAcademicoDALC objetoRegistroAcademicoDALC = new RegistroAcademicoDALC();
                return objetoRegistroAcademicoDALC.actualizarregistroacademico(objetoregistroacademico);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
