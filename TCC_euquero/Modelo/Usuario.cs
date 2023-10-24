using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class Usuario
    {
        public string _email;
        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }

        public Int64 _cpf;
        public Int64 Cpf
        {
            get { return _cpf; }
            set { _cpf = value; }
        }

        public string _nome;
        public string Nome
        {
            get { return _nome; }
            set { _nome = value; }
        }

        public string Senha;

        public bool _verificado;
        public bool Verificado
        {
            get { return _verificado; }
            set { _verificado = value; }
        }

        public bool _banido;
        public bool Banido
        {
            get { return _banido; }
            set { _banido = value; }
        }

        private decimal _saldo;

        public decimal Saldo
        {
            get { return _saldo; }
            set { _saldo = value; }
        }

        private List<Cartao> _cartoes;

        public List<Cartao> Cartoes
        {
            get { return _cartoes; }
            set { _cartoes = value; }
        }

    }
}