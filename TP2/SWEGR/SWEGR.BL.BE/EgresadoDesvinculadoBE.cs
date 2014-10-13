using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SWEGR.BL.BE
{
    public class EgresadoDesvinculadoBE
    {
        string codigo;

        public string Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }
        string nombrecompleto;

        public string Nombrecompleto
        {
            get { return nombrecompleto; }
            set { nombrecompleto = value; }
        }
        string contrasena;

        public string Contrasena
        {
            get { return contrasena; }
            set { contrasena = value; }
        }

        private bool cambiocontrasena;

        public bool Cambiocontrasena
        {
            get { return cambiocontrasena; }
            set { cambiocontrasena = value; }
        }
    }
}
