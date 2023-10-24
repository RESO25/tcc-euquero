using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using TCC_euquero.Modelo;

namespace TCC_euquero.Logica
{
    public class GerenciarAnuncios : Banco
    {
        public List<Anuncio> ListarAnunciosCard() 
        {
            List<Anuncio> anuncios = new List<Anuncio>();
            MySqlDataReader dados = ConsultarProcedure("ListarAnunciosCard", null); ;

            while (dados.Read())
            {
                decimal valorLance = BuscarLanceAtual(dados.GetInt32(0));
                Anuncio anuncio = new Anuncio(dados.GetInt32("CodigoAnuncio"), dados.GetDateTime("DataEncerramento"), dados.GetString("NomeProduto"), valorLance);
                anuncios.Add(anuncio);
            }

            dados.Close();
            Desconectar();

            return anuncios;
        }

        private decimal BuscarLanceAtual(int pAnuncio)
        {
            int lance = 0;

            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pAnuncio", pAnuncio.ToString()));

            MySqlDataReader dados = ConsultarProcedure("BuscarLanceAtual", lista);
            if (dados.Read())
                lance = dados.GetInt32("ValorLance");

            dados.Close();
            Desconectar();

            return lance;
        }

        public int ContarAnuncios()
        {
            int total = 0;
            MySqlDataReader dados = ConsultarProcedure("ContarAnuncios", null);

            if (dados.Read())
                total = dados.GetInt32("TotalAnuncios");

            dados.Close();
            Desconectar();

            return total;
        }
    }
}