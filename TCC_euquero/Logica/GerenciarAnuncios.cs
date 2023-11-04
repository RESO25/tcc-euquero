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
            MySqlDataReader dados = ConsultarProcedure("ListarAnunciosCard", null); ;

            List<Anuncio> anuncios = ListarAnuncios(dados);

            Desconectar();

            return anuncios;
        }
        
        public List<Anuncio> ListarAnunciosCategoria(int pCdCategoria)
        {
            List<Parametro> parametros = new List<Parametro>();

            parametros.Add(new Parametro("pCdCategoria", pCdCategoria.ToString()));

            MySqlDataReader dados = ConsultarProcedure("ListarAnunciosCategoria", parametros);

            List<Anuncio> anuncios = ListarAnuncios(dados);

            Desconectar();

            return anuncios;
        }
        public List<Anuncio> ListarAnunciosBusca(string pNmAnuncio) 
        {

            List<Parametro> parametros = new List<Parametro>();

            parametros.Add(new Parametro("pNmAnuncio", $"%{pNmAnuncio}%"));

            MySqlDataReader dados = ConsultarProcedure("ListarAnunciosCategoria", parametros); ;

            List<Anuncio> anuncios = ListarAnuncios(dados);

            Desconectar();

            return anuncios;
        }

        private List<Anuncio> ListarAnuncios(MySqlDataReader dados)
        {
            List<Anuncio> anuncios = new List<Anuncio>();

            while (dados.Read())
            {
                decimal valorLance = BuscarLanceAtual(dados.GetInt32(0));
                Anuncio anuncio = new Anuncio(dados.GetInt32("CodigoAnuncio"), dados.GetDateTime("DataEncerramento"), dados.GetString("NomeProduto"), valorLance);
                anuncios.Add(anuncio);
            }

            dados.Close();

            return anuncios;
        }


        private decimal BuscarLanceAtual(int pAnuncio)
        {
            int lance = 0;

            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pAnuncio", pAnuncio.ToString()));

            Conectar();

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