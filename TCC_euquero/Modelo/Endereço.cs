using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class Endereço
    {
        public int _codigo;
        public int Codigo
        {
            get { return _codigo; }
            set { _codigo = value; }
        }

        public string _emailUsuario;
        public string EmailUsuario
        {
            get { return _emailUsuario; }
            set { _emailUsuario = value; }
        }

        public int _cep;
        public int Cep
        {
            get { return _cep; }
            set { _cep = value; }
        }

        public string _nome;
        public string Nome
        {
            get { return _nome; }
            set { _nome = value; }
        }

        public string _numero;
        public string Numero
        {
            get { return _numero; }
            set { _numero = value; }
        }

        public string _complemento;
        public string Complemento
        {
            get { return _complemento; }
            set { _complemento = value; }
        }

        public bool _preferencial;
        public bool Preferencial
        {
            get { return _preferencial; }
            set { _preferencial = value; }
        }
    }
}