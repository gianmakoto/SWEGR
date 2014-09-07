using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SWEGR.BL.BE
{
    public class HistorialDatosEgresadoBE
    {
        int idactualizacion;
        int idegresado;
        string campoactualizado;
        string valornuevo;
        DateTime fechaactualizacion;
        char origen;

        public int Idactualizacion
        {
            get { return idactualizacion; }
            set { idactualizacion = value; }
        }

        public int Idegresado
        {
            get { return idegresado; }
            set { idegresado = value; }
        }

        public string Campoactualizado
        {
            get { return campoactualizado; }
            set { campoactualizado = value; }
        }
       
        public string Valornuevo
        {
            get { return valornuevo; }
            set { valornuevo = value; }
        } 

        public DateTime Fechaactualizacion
        {
            get { return fechaactualizacion; }
            set { fechaactualizacion = value; }
        }

        public char Origen
        {
            get { return origen; }
            set { origen = value; }
        }
    }
}
