using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TCC_euquero.Modelo;

namespace TCC_euquero.Logica
{
    public class GerenciarCartao : Banco
    {
        public List<Cartao> BuscarCartaoUsuario(string email)
        {
            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pEmail", email));

            List<Cartao> cartoes = new List<Cartao>();
            Conectar();

            MySqlDataReader dados = ConsultarProcedure("BuscarCartaoUsuario", lista);
            if (dados.HasRows)
            {
                while (dados.Read())
                {

                    Cartao cartao = new Cartao();
                    cartao.EmailUsuario = dados.GetString(0);
                    cartao.Digitos = dados.GetInt64(1);
                    cartao.NomeTitular = dados.GetString(2);
                    cartao.Vencimento = dados.GetString(3);
                    cartao.Cvv = dados.GetInt32(4);
                    cartao.Usando = dados.GetBoolean(5);
                    cartoes.Add(cartao);
                }
            }
            else
            {
                Cartao cartao = new Cartao();
                cartao.EmailUsuario = "---";
                cartao.Digitos = 0;
                cartao.NomeTitular = "---";
                cartao.Vencimento = "---";
                cartao.Cvv = 0;
                cartao.Usando = true;
                cartoes.Add(cartao);
            }

            dados.Close();
            Desconectar();

            return cartoes;
        }
    }
}