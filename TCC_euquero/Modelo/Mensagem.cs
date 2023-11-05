using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class Mensagem
    {
        public int _codigoAnuncio;
        public int CodigoAnuncio
        {
            get { return _codigoAnuncio; }
            set { _codigoAnuncio = value; }
        }

        public int _codigoLance;
        public int CodigoLance
        {
            get { return _codigoLance; }
            set { _codigoLance = value; }
        }

        public string _emailUsuario;
        public string EmailUsuario
        {
            get { return _emailUsuario; }
            set { _emailUsuario = value; }
        }

        public DateTime _dataLance;
        public DateTime DataLance
        {
            get { return _dataLance; }
            set { _dataLance = value; }
        }

        public DateTime _dataMensagem;
        public DateTime DataMensagem
        {
            get { return _dataMensagem; }
            set { _dataMensagem = value; }
        }

        public string _descricao;
        public string Descricao
        {
            get { return _descricao; }
            set { _descricao = value; }
        }

        public bool _lido;
        public bool Lido
        {
            get { return _lido; }
            set { _lido = value; }
        }
    }
}