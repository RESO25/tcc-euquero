using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TCC_euquero.Logica;

namespace TCC_euquero.Modelo
{
    public class Usuario : Banco
    {
        public string _email;
        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }

        public Int64 _cpf;
        public Int64 Cpf
        {
            get { return _cpf; }
            set { _cpf = value; }
        }

        public string _nome;
        public string Nome
        {
            get { return _nome; }
            set { _nome = value; }
        }

        public string Senha;

        public bool _verificado;
        public bool Verificado
        {
            get { return _verificado; }
            set { _verificado = value; }
        }

        public bool _banido;
        public bool Banido
        {
            get { return _banido; }
            set { _banido = value; }
        }

        private decimal _saldo;

        public decimal Saldo
        {
            get { return _saldo; }
            set { _saldo = value; }
        }

        private List<Cartao> _cartoes;

        public List<Cartao> Cartoes
        {
            get { return _cartoes; }
            set { _cartoes = value; }
        }

        public string CadastrarUsuario(string pEmailUsuario, string pCpf_cnpj, string pNomeUsuario, string pSenha, Int64 pTelefone, int pTipoUsuario, string pCep, string pNomeEndereço, string pNumeroEndereço, string pComplementoEndereço)
        {
            GerenciarCadastroUsuario gerenciarCadastro = new GerenciarCadastroUsuario();
            Endereço endereço = new Endereço();
            List<Parametro> parametros = new List<Parametro>();

            if (gerenciarCadastro.VerificarDisponibilidadeEmail(pEmailUsuario))
            {
                parametros.Clear();
                parametros.Add(new Parametro("pEmail", pEmailUsuario));
                parametros.Add(new Parametro("pNome", pNomeUsuario));
                parametros.Add(new Parametro("pSenha", pSenha));
                parametros.Add(new Parametro("pTelefone", pTelefone.ToString()));

                if (pTipoUsuario == 1)
                {
                    parametros.Add(new Parametro("pCPF", pCpf_cnpj));
                    ExecutarProcedure("CadastrarUsuarioFisico", parametros);
                }
                else
                {
                    parametros.Add(new Parametro("pCNPJ", pCpf_cnpj));
                    ExecutarProcedure("CadastrarUsuarioJuridico", parametros);
                }

                gerenciarCadastro.EnviarCodigoEmail(pEmailUsuario);
            }
            else
            {
                return "O email inserido está cadastrado em outra conta!";
            }

            endereço.CadastrarEndereço(pEmailUsuario, pCep, pNomeEndereço, pNumeroEndereço, pComplementoEndereço, 1);

            return "Seu cadastro foi efetuado com sucesso! Agora será necessário que você valide sua conta.";
        }
    }
}