using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class Cartao
    {
        public string _emailUsuario;
        public string EmailUsuario
        {
            get { return _emailUsuario; }
            set { _emailUsuario = value; }
        }

        public Int64 _digitos;
        public Int64 Digitos
        {
            get { return _digitos; }
            set { _digitos = value; }
        }

        public string _nomeTitular;
        public string NomeTitular
        {
            get { return _nomeTitular; }
            set { _nomeTitular = value; }
        }

        public string _vencimento;
        public string Vencimento
        {
            get { return _vencimento; }
            set { _vencimento = value; }
        }

        public int _cvv;
        public int Cvv
        {
            get { return _cvv; }
            set { _cvv = value; }
        }

        private bool _usando;

        public bool Usando
        {
            get { return _usando; }
            set { _usando = value; }
        }

    }
}