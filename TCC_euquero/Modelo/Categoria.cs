using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class Categoria
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
        public Categoria(int codigo, string nome)
        {
            Codigo = codigo;
            Nome = nome;
        }
        
        public Categoria()
        {

        }
    }
}