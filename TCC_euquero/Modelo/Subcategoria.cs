using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class Subcategoria
    {
        public int _codigo;
        public int Codigo
        {
            get { return _codigo; }
            set { _codigo = value; }
        }

        public string _nome;
        public string Nome
        {
            get { return _nome; }
            set { _nome = value; }
        }

        public int _codigoCategoria;
        public int CodigoCategoria
        {
            get { return _codigoCategoria; }
            set { _codigoCategoria = value; }
        }
    }
}