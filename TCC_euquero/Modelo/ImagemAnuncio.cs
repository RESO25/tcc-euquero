using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class ImagemAnuncio
    {
        public int _codigo;
        public int Codigo
        {
            get { return _codigo; }
            set { _codigo = value; }
        }

        public int _numeroImagem;
        public int NumeroImagem
        {
            get { return _numeroImagem; }
            set { _numeroImagem = value; }
        }

        public string _foto;
        public string Foto
        {
            get { return _foto; }
            set { _foto = value; }
        }
    }
}