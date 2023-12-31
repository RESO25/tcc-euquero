﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCC_euquero.Logica;
using TCC_euquero.Modelo;

namespace TCC_euquero
{
    public partial class cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void CEP_TextChanged(object sender, EventArgs e)
        {
            Endereço endereço = new Endereço();

            endereço = endereço.BuscarEndereço(CEP.Text);


            UF.Value = endereço.UF;
            Cidade.Value = endereço.Cidade;
            Rua.Value = endereço.Rua;
            Número.Value = endereço.Numero;
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            int codTipoPessoa = 0;
            string nomeEndereço = $"{Rua.Value}, {Cidade.Value} - {UF.Value}";

            if (PessoaFisica.Checked || PessoaJuridica.Checked)
            {
                if (PessoaFisica.Checked)
                {
                    codTipoPessoa = 1;
                }
                else
                {
                    codTipoPessoa = 2;
                }
            }
            else
            {
                litRespostaSistema.Text = "Defina o seu tipo de usuário.";
                return;
            }

            if (Senha.Value == RepetirSenha.Value)
            {
                GerenciarCadastroUsuario gerenciarCadastroUsuario = new GerenciarCadastroUsuario();

                if (!gerenciarCadastroUsuario.VerificarValidacao(Email.Value))
                {
                    Endereço endereco = new Endereço();
                    endereco.CadastrarEndereço(Email.Value, CEP.Text, Nome.Value, Número.Value, Complemento.Value, 1);

                    usuario.CadastrarUsuario(Email.Value, CPF.Value, Nome.Value, Senha.Value, long.Parse(Telefone.Value), codTipoPessoa, CEP.Text, nomeEndereço, Número.Value, Complemento.Value);

                    gerenciarCadastroUsuario.EnviarCodigoEmail(Email.Value);

                    Response.Redirect($"validarEmail.aspx?email={Email.Value}");
                }
                else
                {
                    litRespostaSistema.Text = "Já existe uma conta cadastrada nesse email.";
                }

            }
            else
            {
                litRespostaSistema.Text = "Houve um conflito nas senhas.";
                return;
            }
        }
    }
}