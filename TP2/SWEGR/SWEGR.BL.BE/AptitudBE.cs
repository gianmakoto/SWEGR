using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SWEGR.BL.BE
{
    public class AptitudBE
    {
        int idaptitud;
        String nombreaptitud;

        public int Idaptitud
        {
            get { return idaptitud; }
            set { idaptitud = value; }
        }

        public String Nombreaptitud
        {
            get { return nombreaptitud; }
            set { nombreaptitud = value; }
        }
    }
}
