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

        string contrasenadinamica;

        public string Contrasenadinamica
        {
            get { return contrasenadinamica; }
            set { contrasenadinamica = value; }
        }

        private bool cambiocontrasena;

        public bool Cambiocontrasena
        {
            get { return cambiocontrasena; }
            set { cambiocontrasena = value; }
        }

        string carrera;

        public string Carrera
        {
            get { return carrera; }
            set { carrera = value; }
        }

        string cicloegreso;

        public string Cicloegreso
        {
            get { return cicloegreso; }
            set { cicloegreso = value; }
        }

        bool estaregistrado;

        public bool Estaregistrado
        {
            get { return estaregistrado; }
            set { estaregistrado = value; }
        }
    }
}
