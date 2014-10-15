using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SWEGR.BL.BE
{
    public class Egresados
    {
        int _EgresadoID;

        public int EgresadoID
        {
            get { return _EgresadoID; }
            set { _EgresadoID = value; }
        }
        string codigo;

        public string Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }
        string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
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
        string trabajoactual;

        public string Trabajoactual
        {
            get { return trabajoactual; }
            set { trabajoactual = value; }
        }
        string nombrejefe;

        public string Nombrejefe
        {
            get { return nombrejefe; }
            set { nombrejefe = value; }
        }
        string cargojefe;

        public string Cargojefe
        {
            get { return cargojefe; }
            set { cargojefe = value; }
        }
        string telefonojefe;

        public string Telefonojefe
        {
            get { return telefonojefe; }
            set { telefonojefe = value; }
        }
        string correojefe;

        public string Correojefe
        {
            get { return correojefe; }
            set { correojefe = value; }
        }
    }
}
