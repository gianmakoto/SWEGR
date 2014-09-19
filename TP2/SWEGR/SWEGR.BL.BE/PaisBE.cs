using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SWEGR.BL.BE
{
    public class PaisBE
    {
        int idpais;
        String nombrepais;

        public int Idpais
        {
            get { return idpais; }
            set { idpais = value; }
        }

        public String Nombrepais
        {
            get { return nombrepais; }
            set { nombrepais = value; }
        }
    }
}
