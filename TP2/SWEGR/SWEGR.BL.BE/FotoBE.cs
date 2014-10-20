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
        String imagenString;
        byte[] imagenBytes;
        
        public int Idfoto
        {
            get { return idfoto; }
            set { idfoto = value; }
        }

        public string ImagenString
        {
            get { return imagenString; }
            set { imagenString = value; }
        }

        public byte[] ImagenBytes
        {
            get { return imagenBytes; }
            set { imagenBytes = value; }
        }
    }
}
