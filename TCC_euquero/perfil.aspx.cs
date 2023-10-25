using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
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

            string caminhoBase = Request.PhysicalApplicationPath + @"imagens/fotosPerfis";

            DirectoryInfo diretorio = new DirectoryInfo(caminhoBase);
            FileInfo[] listaArquivos = diretorio.GetFiles();

            string caminhoFoto = "fotoPadrao.png";
            foreach (FileInfo fi in listaArquivos)
            {
                if (fi.Name.Contains(Session["email"].ToString()))
                    caminhoFoto = fi.Name;
            }

            litFotoPerfil.Text = $"<img src='imagens/fotosPerfis/{caminhoFoto}' class='imgPerfil'>";

            string[] nomes = usuario.Nome.Split(' ');

            litNomeUsuario.Text = $"{nomes[0]} {nomes[nomes.Length-1]}";
            litEmailUsuario.Text = Session["email"].ToString();
            litNomeCompletoUsuario.Text = usuario.Nome;

            string cpf = usuario.Cpf.ToString();
            string trio1 = cpf.Substring(0, 3);
            string trio2 = cpf.Substring(3, 3);
            string trio3 = cpf.Substring(6, 3);
            string duo = cpf.Substring(9, 2);


            litCPF.Text = $"{trio1}.{trio2}.{trio3}-{duo}";
            litSaldo.Text = usuario.Saldo.ToString("C", new CultureInfo("pt-br"));

            litNumeroCartao.Text = cartaoAtual.Digitos.ToString();
            litCVV.Text = cartaoAtual.Cvv.ToString();
            //litDataVencimento.Text = cartaoAtual.Vencimento.ToString();
            //litNomeTitular.Text = cartaoAtual.NomeTitular.ToString();

        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}