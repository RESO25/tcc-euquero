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

            string email = Session["email"].ToString();

            GerenciarCadastro gerenciarCadastro = new GerenciarCadastro();
            Usuario usuario = new Usuario();
            try
            {
                usuario = gerenciarCadastro.BuscarUsuarioPerfil(email);

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            List<Cartao> listaCartao = new List<Cartao>();
            GerenciarCartao gerenciarCartao = new GerenciarCartao();

            listaCartao = gerenciarCartao.BuscarCartaoUsuario(email);


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
                if (fi.Name.Contains(email))
                    caminhoFoto = fi.Name;
            }

            Endereço endereco = new Endereço();
            endereco.BuscarEnderecoUsuario();

            litFotoPerfil.Text = $"<img src='imagens/fotosPerfis/{caminhoFoto}' class='imgPerfil'>";

            string[] nomes = usuario.Nome.Split(' ');

            litNomeUsuario.Text = $"{nomes[0]} {nomes[nomes.Length-1]}";
            litEmailUsuario.Text = email;
            litNomeCompletoUsuario.Text = usuario.Nome;

            string cpf = usuario.Cpf.ToString();
            string trio1 = cpf.Substring(0, 3);
            string trio2 = cpf.Substring(3, 3);
            string trio3 = cpf.Substring(6, 3);
            string duo = cpf.Substring(9, 2);


            litCPF.Text = $"{trio1}.{trio2}.{trio3}-{duo}";
            litSaldo.Text = usuario.Saldo.ToString("C", new CultureInfo("pt-br"));

            if (cartaoAtual.Digitos > 0)
            {
                string digitos = cartaoAtual.Digitos.ToString();
                string q1 = digitos.Substring(0, 4);
                string q2 = digitos.Substring(4, 4);
                string q3 = digitos.Substring(8, 4);

                litNumeroCartao.Text = $"{q1} {q2} {q3}";
            }
            else
            {
                litNumeroCartao.Text = $"---";
            }

            if (cartaoAtual.Cvv > 0)
                litCVV.Text = cartaoAtual.Cvv.ToString();
            else
                litCVV.Text = "---";

            litDataVencimento.Text = cartaoAtual.Vencimento.ToString();
            litNomeTitular.Text = cartaoAtual.NomeTitular.ToString();

            // Listar anúncios do usuário -------------------------------------------------------------------------------------

            GerenciarAnuncios gerenciarAnuncios = new GerenciarAnuncios();

            List<Anuncio> anunciosUsuario = gerenciarAnuncios.ListarAnunciosUsuario(email);

            if (anunciosUsuario.Count > 0)
            {
                foreach (Anuncio anuncio in anunciosUsuario)
                {
                    TimeSpan diasRestantes = anuncio.DataEncerramento.Subtract(DateTime.Today);

                    litMeusAnuncios.Text += $@"
                                            <div class='cardProduto'>
                                                <a href='anuncio.aspx?codProduto={anuncio.Codigo}'> 
                                                    <img src='imagens/fotosAnuncios/{anuncio.Codigo}-1.jpeg' class='imgProduto'>
                
                                                    <div class='infoEncerramento'>
                                                        <h3 class='txtEncerra'>encerra em: </h3> <h4 class='txtDataEncerramento'>{diasRestantes.Days} dias</h4>
                                                    </div>

                                                    <div class='infoTituloProduto'>
                                                        <h5>{anuncio.NomeProduto}</h5>
                                                    </div>

                                                    <div class='infoValorAtual'>
                                                        <h6>valor a partir de:</h6>
                                                        <p class='txtValorProduto'>{anuncio.LanceAtual.ToString("C", new CultureInfo("pt-br"))}</p>
                                                    </div>

                                                </a>
                                            </div>
                                            ";
                }
            }
            else
            {
                litMeusAnuncios.Text =  "Você ainda não publicou nenhum anúncio.";
            }

            // Listar anúncios que o usuário já deu lances -------------------------------------------------------------------------------------

            List<Anuncio> anunciosParticipo = gerenciarAnuncios.ListarAnunciosUsuarioParticipa(email);

            if (anunciosParticipo.Count > 0)
            {
                foreach (Anuncio anuncio in anunciosParticipo)
                {
                    TimeSpan diasRestantes = anuncio.DataEncerramento.Subtract(DateTime.Today);

                    litAnunciosParticipo.Text += $@"
                                            <div class='cardProduto'>
                                                <a href='anuncio.aspx?codProduto={anuncio.Codigo}'> 
                                                    <img src='imagens/fotosAnuncios/{anuncio.Codigo}-1.jpeg' class='imgProduto'>
                
                                                    <div class='infoEncerramento'>
                                                        <h3 class='txtEncerra'>encerra em: </h3> <h4 class='txtDataEncerramento'>{diasRestantes.Days} dias</h4>
                                                    </div>

                                                    <div class='infoTituloProduto'>
                                                        <h5>{anuncio.NomeProduto}</h5>
                                                    </div>

                                                    <div class='infoValorAtual'>
                                                        <h6>valor a partir de:</h6>
                                                        <p class='txtValorProduto'>{anuncio.LanceAtual.ToString("C", new CultureInfo("pt-br"))}</p>
                                                    </div>

                                                </a>
                                            </div>
                                            ";
                }
            }
            else
            {
                litAnunciosParticipo.Text = "Você não participa de nenhum leilão ainda.";
            }
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}