using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SWEGR.BL.BE
{
    public class DatosObtenidosBE
    {
        List<RegistroLaboralBE> listaRegistroLaboral;

        public List<RegistroLaboralBE> ListaRegistroLaboral
        {
            get { return listaRegistroLaboral; }
            set { listaRegistroLaboral = value; }
        }
        List<RegistroAcademicoBE> listaRegistroAcademico;

        public List<RegistroAcademicoBE> ListaRegistroAcademico
        {
            get { return listaRegistroAcademico; }
            set { listaRegistroAcademico = value; }
        }
        EgresadoBE datosUsuario;

        public EgresadoBE DatosUsuario
        {
            get { return datosUsuario; }
            set { datosUsuario = value; }
        }
        List<String> listaIntereses;

        public List<String> ListaIntereses
        {
            get { return listaIntereses; }
            set { listaIntereses = value; }
        }
        List<String> listaAptitudes;

        public List<String> ListaAptitudes
        {
            get { return listaAptitudes; }
            set { listaAptitudes = value; }
        }

    }
}
