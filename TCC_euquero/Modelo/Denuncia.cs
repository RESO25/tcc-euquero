using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class Denuncia
    {
        public DateTime _data;
        public DateTime Data
        {
            get { return _data; }
            set { _data = value; }
        }

        public string _emailUsuario;
        public string EmailUsuario
        {
            get { return _emailUsuario; }
            set { _emailUsuario = value; }
        }

        public string _descricao;
        public string Descricao
        {
            get { return _descricao; }
            set { _descricao = value; }
        }

        public bool _verificada;
        public bool Verificada
        {
            get { return _verificada; }
            set { _verificada = value; }
        }
    }
}