using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SWEGR.BL.BE
{
    public class RegistroLaboralBE
    {
        int idregistrolaboral;
        int idegresado;
        String nombretrabajo;
        String cargotrabajo;
        String duraciontrabajo;
        String nombrejefetrabajo;
        String descripciontrabajo;
        String cargojefetrabajo;
        String telefonojefetrabajo;
        String correojefetrabajo;
        int idpais;
        bool trabajoactual;

        public int Idregistrolaboral
        {
            get { return idregistrolaboral; }
            set { idregistrolaboral = value; }
        }

        public int Idegresado
        {
            get { return idegresado; }
            set { idegresado = value; }
        }

        public String Nombretrabajo
        {
            get { return nombretrabajo; }
            set { nombretrabajo = value; }
        }

        public String Cargotrabajo
        {
            get { return cargotrabajo; }
            set { cargotrabajo = value; }
        }

        public String Duraciontrabajo
        {
            get { return duraciontrabajo; }
            set { duraciontrabajo = value; }
        }

        public String Nombrejefetrabajo
        {
            get { return nombrejefetrabajo; }
            set { nombrejefetrabajo = value; }
        }

        public String Descripciontrabajo
        {
            get { return descripciontrabajo; }
            set { descripciontrabajo = value; }
        }

        public String Cargojefetrabajo
        {
            get { return cargojefetrabajo; }
            set { cargojefetrabajo = value; }
        }
        public String Telefonojefetrabajo
        {
            get { return telefonojefetrabajo; }
            set { telefonojefetrabajo = value; }
        }

        public String Correojefetrabajo
        {
            get { return correojefetrabajo; }
            set { correojefetrabajo = value; }
        }

        public int Idpais
        {
            get { return idpais; }
            set { idpais = value; }
        }

        public bool Trabajoactual
        {
            get { return trabajoactual; }
            set { trabajoactual = value; }
        }
    }
}
