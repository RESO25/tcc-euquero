using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class Comentario
    {
        public int _codigoComentario;
        public int CodigoComentario
        {
            get { return _codigoComentario; }
            set { _codigoComentario = value; }
        }

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

        public int _codigoComentarioPai;
        public int CodigoComentarioPai
        {
            get { return _codigoComentarioPai; }
            set { _codigoComentarioPai = value; }
        }

        public DateTime _data;
        public DateTime Data
        {
            get { return _data; }
            set { _data = value; }
        }

        public string _descricao;
        public string Descricao
        {
            get { return _descricao; }
            set { _descricao = value; }
        }
    }
}