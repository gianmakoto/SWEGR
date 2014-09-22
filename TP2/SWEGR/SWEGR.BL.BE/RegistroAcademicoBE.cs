using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SWEGR.BL.BE
{
    public class RegistroAcademicoBE
    {
        int idregistroacademico;
        int idegresado;
        String nombreinstitucion;
        String nombreestudio;
        String duracionestudio;
        String descripcionestudio;
        String tipoestudio;
        int idpais;

        public int Idregistroacademico
        {
            get { return idregistroacademico; }
            set { idregistroacademico = value; }
        }

        public int Idegresado
        {
            get { return idegresado; }
            set { idegresado = value; }
        }

        public String Nombreinstitucion
        {
            get { return nombreinstitucion; }
            set { nombreinstitucion = value; }
        }

        public String Nombreestudio
        {
            get { return nombreestudio; }
            set { nombreestudio = value; }
        }

        public String Duracionestudio
        {
            get { return duracionestudio; }
            set { duracionestudio = value; }
        }

        public String Descripcionestudio
        {
            get { return descripcionestudio; }
            set { descripcionestudio = value; }
        }

        public String Tipoestudio
        {
            get { return tipoestudio; }
            set { tipoestudio = value; }
        }

        public int Idpais
        {
            get { return idpais; }
            set { idpais = value; }
        }
    }
}
