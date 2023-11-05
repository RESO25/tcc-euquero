using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TCC_euquero.Modelo
{
    public class Parametro
    {
        public string Nome { get; set; }
        public string Valor { get; set; }


        public Parametro(string Nome, string Valor)
        {
            this.Nome = Nome;
            this.Valor = Valor;
        }
    }
}