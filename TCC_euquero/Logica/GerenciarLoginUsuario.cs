using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TCC_euquero.Modelo;

namespace TCC_euquero.Logica
{
    public class GerenciarLoginUsuario : Banco
    {
        public bool VerificarLogin(string email, string senha)
        {
            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pEmail", email));
            lista.Add(new Parametro("pSenha", senha));

            bool resposta = false;
            Conectar();

            MySqlDataReader dados = ConsultarProcedure("VerificarLogin", lista);
            if (dados.Read())
                resposta = dados.GetBoolean(0);

            dados.Close();
            Desconectar();

            return resposta;
        }

        public Usuario BuscarUsuarioLogin(string email)
        {
            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pEmail", email));

            Usuario usuario = new Usuario();

            Conectar();

            MySqlDataReader dados = ConsultarProcedure("BuscarUsuarioLogin", lista);
            if (dados.Read())
            {
                usuario.Email = dados.GetString(0);
                usuario.Nome = dados.GetString(1);
            }

            dados.Close();
            Desconectar();

            return usuario;
        }

        public Usuario BuscarUsuarioPerfil(string email)
        {
            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pEmail", email));

            Usuario usuario = new Usuario();

            Conectar();

            MySqlDataReader dados = ConsultarProcedure("BuscarUsuarioPerfil", lista);

            if (dados.Read())
            {
                usuario.Cpf = dados.GetInt64(0);
                usuario.Nome = dados.GetString(1);
                usuario.Saldo = dados.GetDecimal(2);
            }

            dados.Close();
            Desconectar();

            return usuario;
        }
    }
}