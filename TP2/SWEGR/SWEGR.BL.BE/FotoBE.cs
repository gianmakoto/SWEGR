using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SWEGR.BL.BE
{
    public class FotoBE
    {
        int idfoto;
        
        byte[] imagenBytes;
        
        public int Idfoto
        {
            get { return idfoto; }
            set { idfoto = value; }
        }

        public byte[] ImagenBytes
        {
            get { return imagenBytes; }
            set { imagenBytes = value; }
        }
    }
}
