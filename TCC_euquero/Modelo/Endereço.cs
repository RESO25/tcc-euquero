using Correios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TCC_euquero.Logica;

namespace TCC_euquero.Modelo
{
    public class Endereço : Banco
    {
        #region Props

        public int _codigo;
        public int Codigo
        {
            get { return _codigo; }
            set { _codigo = value; }
        }

        public string _emailUsuario;
        public string EmailUsuario
        {
            get { return _emailUsuario; }
            set { _emailUsuario = value; }
        }

        public int _cep;
        public int Cep
        {
            get { return _cep; }
            set { _cep = value; }
        }

        public string _nome;
        public string Nome
        {
            get { return _nome; }
            set { _nome = value; }
        }

        public string _numero;
        public string Numero
        {
            get { return _numero; }
            set { _numero = value; }
        }

        public string _complemento;
        public string Complemento
        {
            get { return _complemento; }
            set { _complemento = value; }
        }

        public bool _preferencial;
        public bool Preferencial
        {
            get { return _preferencial; }
            set { _preferencial = value; }
        }

        public string UF { get; set; }
        public string Cidade { get; set; }
        public string Rua { get; set; }

        #endregion


        #region Métodos

        public void CadastrarEndereço(string pEmailUsuario, string pCep, string pNome, string pNumero, string pComplemento, int pPreferencial)
        {
            List<Parametro> parametros = new List<Parametro>();
            parametros.Add(new Parametro("pEmailUsuario", pEmailUsuario));
            parametros.Add(new Parametro("pCep", pCep));
            parametros.Add(new Parametro("pNomeEndereço", pNome));
            parametros.Add(new Parametro("pNumeroEndereço", pNumero));
            parametros.Add(new Parametro("pComplemento", pComplemento));
            parametros.Add(new Parametro("pPreferencial", pPreferencial.ToString()));

            ExecutarProcedure("CriarEndereço", parametros);
        }

        public Endereço BuscarEndereço(string cep)
        {
            CorreiosApi correiosApi = new CorreiosApi();

            Endereço endereço = new Endereço();
            endereço.UF = correiosApi.consultaCEP(cep).uf;
            endereço.Cidade = correiosApi.consultaCEP(cep).cidade;
            endereço.Rua = correiosApi.consultaCEP(cep).end;
            endereço.Numero = correiosApi.consultaCEP(cep).complemento;

            return endereço;
        }

        #endregion
    }
}