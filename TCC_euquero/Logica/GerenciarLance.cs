using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TCC_euquero.Modelo;

namespace TCC_euquero.Logica
{
    public class GerenciarLance : Banco
    {
        public decimal ConsultarSaldo(string pEmail)
        {
            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pEmail", pEmail));

            decimal saldo = 0;

            MySqlDataReader dados = ConsultarProcedure("ConsultarSaldo", lista);
            if (dados.Read())
                saldo = dados.GetDecimal(0);

            dados.Close();
            Desconectar();

            return saldo;
        }

        public void DarLance(int pAnuncio, string pEmail, decimal pValor)
        {
            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pAnuncio", pAnuncio.ToString()));
            lista.Add(new Parametro("pEmail", pEmail));
            lista.Add(new Parametro("pValor", pValor.ToString()));

            ExecutarProcedure("DarLance", lista);
        }
    }
}