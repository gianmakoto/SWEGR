﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SWEGR.DL.DALC;
using SWEGR.BL.BE;

namespace SWEGR.BL.BC
{
    public class PaisBC
    {
        public List<String> listarPais()
        {
            PaisDALC objetoPaisDALC = new PaisDALC();
            return objetoPaisDALC.listarPais();
        }

        public String obtenerPais(int idpais)
        {
            PaisDALC objetoPaisDALC = new PaisDALC();
            return objetoPaisDALC.obtenerPais(idpais);
        }

        public int obtenerPaisID(string nombre)
        {
            PaisDALC objetoPaisDALC = new PaisDALC();
            return objetoPaisDALC.obtenerPaisID(nombre);
        }
    }
}
