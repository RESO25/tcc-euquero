using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class Lance
    {
        public int _codigoAnuncio;
        public int CodigoAnuncio
        {
            get { return _codigoAnuncio; }
            set { _codigoAnuncio = value; }
        }

        public string _emailUsuario;
        public string EmailUsuario
        {
            get { return _emailUsuario; }
            set { _emailUsuario = value; }
        }

        public DateTime _data;
        public DateTime Data
        {
            get { return _data; }
            set { _data = value; }
        }

        public decimal _valorLance;
        public decimal ValorLance
        {
            get { return _valorLance; }
            set { _valorLance = value; }
        }
    }
}