using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;
using TCC_euquero.Logica;

namespace TCC_euquero.Modelo
{
    public class Anuncio : Banco
    {
        public int Codigo { get; set; }
        public string EmailUsuario { get; set; }
        public string NomeUsuario { get; set; }
        public DateTime DataInicio { get; set; }
        public DateTime DataEncerramento { get; set; }
        public string NomeProduto { get; set; }
        public string DescricaoProduto { get; set; }
        public decimal ValorMinimo { get; set; }
        public decimal ValorMaximo { get; set; }
        public decimal LanceAtual { get; set; }
        public string GanhadorAtual { get; set; }
        public int QntLances { get; set; }
        public int QntParticipantes { get; set; }
        public bool Encerrado { get; set; }


        public Anuncio()
        {
        }

        public Anuncio(int codigo, DateTime dataEncerramento, string nomeProduto, decimal lanceAtual)
        {
            Codigo           = codigo;
            DataEncerramento = dataEncerramento;
            NomeProduto      = nomeProduto;
            LanceAtual       = lanceAtual;
        }


        public void ListarDadosAnuncio(int CodigoAnuncio)
        {
            Anuncio anuncio = new Anuncio();
            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pCodigoAnuncio", CodigoAnuncio.ToString()));

            MySqlDataReader dados = ConsultarProcedure("ListarDadosAnuncio", lista);
            if (dados.Read())
            {
                Codigo = CodigoAnuncio;
                NomeProduto = dados.GetString(0);
                DescricaoProduto = dados.GetString(1);
                DataEncerramento = dados.GetDateTime(2);
                ValorMinimo = dados.GetDecimal(3);
                LanceAtual = dados.GetDecimal(4);
                NomeUsuario = dados.GetString(5);
                QntLances = dados.GetInt32(6);
                QntParticipantes = dados.GetInt32(7);
                GanhadorAtual = dados.GetString(8);
            }

            dados.Close();
            Desconectar();
        }

        public bool VerificarEstadoAnuncio(int CodigoAnuncio)
        {
            List<Parametro> parametros = new List<Parametro>();
            parametros.Add(new Parametro("pCodigoAnuncio", CodigoAnuncio.ToString()));

            MySqlDataReader dados = ConsultarProcedure("ConsultarEstadoAnuncio", parametros);
            dados.Read();

            if (dados.GetBoolean("EstadoAnuncio"))
            {
                dados.Close();
                Desconectar();
                return true;
            }
            else
            {
                dados.Close();
                Desconectar();
                return false;
            }
        }
    }
}