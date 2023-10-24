using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCC_euquero.Logica;
using TCC_euquero.Modelo;


namespace TCC_euquero
{
    public partial class perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("index.aspx");
            }

            GerenciarCadastro gerenciarCadastro = new GerenciarCadastro();
            Usuario usuario = new Usuario();
            try
            {
                usuario = gerenciarCadastro.BuscarUsuarioPerfil(Session["email"].ToString());

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            List<Cartao> listaCartao = new List<Cartao>();
            GerenciarCartao gerenciarCartao = new GerenciarCartao();

            listaCartao = gerenciarCartao.BuscarCartaoUsuario(Session["email"].ToString());


            usuario.Cartoes = listaCartao;
            Cartao cartaoAtual = new Cartao();
            foreach(Cartao cartao in usuario.Cartoes)
            {
                if(cartao.Usando)
                    cartaoAtual = cartao;
            }

            string[] nomes = usuario.Nome.Split(' ');

            litNomeUsuario.Text = $"{nomes[0]} {nomes[nomes.Length-1]}";
            litEmailUsuario.Text = Session["email"].ToString();
            litNomeCompletoUsuario.Text = usuario.Nome;
            litCPF.Text = usuario.Cpf.ToString();
            litSaldo.Text = usuario.Saldo.ToString("C", new CultureInfo("pt-br"));

            litNumeroCartao.Text = cartaoAtual.Digitos.ToString();
            litCVV.Text = cartaoAtual.Cvv.ToString();
            litDataVencimento.Text = cartaoAtual.Vencimento.ToString();
            litNomeTitular.Text = cartaoAtual.NomeTitular.ToString();

        }
    }
}