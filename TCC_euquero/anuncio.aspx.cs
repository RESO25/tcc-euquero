using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCC_euquero.Modelo;
using TCC_euquero.Logica;

namespace TCC_euquero
{
    public partial class anuncio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Anuncio anuncio = new Anuncio();
            GerenciarAnuncios gerenciarAnuncios = new GerenciarAnuncios();

            anuncio.ListarDadosAnuncio(int.Parse(Request["codProduto"]));

            //if (!(anuncio.DataEncerramento.Subtract(DateTime.Today).Days <= 0 && anuncio.DataEncerramento.Subtract(DateTime.UtcNow).Hours <= 0 && anuncio.DataEncerramento.Subtract(DateTime.UtcNow).Minutes <= 0))
            //{
            if (Session["email"] != null)
            {
                txtLance.Enabled = true;
            }

            int totalAnuncios = gerenciarAnuncios.ContarAnuncios();
            if (String.IsNullOrEmpty(Request["codProduto"]) || int.Parse(Request["codProduto"]) > totalAnuncios)
                Response.Redirect("erro.aspx?codErro=1");

            litNomeProduto.Text = anuncio.NomeProduto;
            litDescricao.Text = anuncio.DescricaoProduto;
            litDiasRestantes.Text = anuncio.DataEncerramento.Subtract(DateTime.Today).Days.ToString();
            litHorasRestantes.Text = anuncio.DataEncerramento.Subtract(DateTime.UtcNow).Hours.ToString();
            litMinutosRestantes.Text = anuncio.DataEncerramento.Subtract(DateTime.UtcNow).Minutes.ToString();
            litParticipantes.Text = anuncio.QntParticipantes.ToString();
            litLances.Text = anuncio.QntLances.ToString();
            litLeiloeiro.Text = anuncio.NomeUsuario;
            litGanhador.Text = anuncio.GanhadorAtual;
            litLanceAtual.Text = anuncio.LanceAtual.ToString("C", new CultureInfo("pt-br"));
            litValorInicial.Text = anuncio.ValorMinimo.ToString("C", new CultureInfo("pt-br"));

            CarregarImagens();

            List<Anuncio> anuncios = gerenciarAnuncios.ListarAnunciosCard();

            litCardProduto.Text = "";

            for (int i = 0; i < anuncios.Count; i++)
            {
                TimeSpan diasRestantes = anuncios[i].DataEncerramento.Subtract(DateTime.Today);

                litCardProduto.Text += $@"
                                <div class='cardProduto'>
                                    <a href='anuncio.aspx?codProduto={anuncios[i].Codigo}'> 
                                        <img src='imagens/fotosAnuncios/{anuncios[i].Codigo}-1.jpeg' class='imgProduto'>
                
                                        <div class='infoEncerramento'>
                                            <h3 class='txtEncerra'>encerra em: </h3> <h4 class='txtDataEncerramento'>{diasRestantes.Days} dias</h4>
                                        </div>

                                        <div class='infoTituloProduto'>
                                            <h5>{anuncios[i].NomeProduto}</h5>
                                        </div>

                                        <div class='infoValorAtual'>
                                            <h6>valor a partir de:</h6>
                                            <p class='txtValorProduto'>{anuncios[i].LanceAtual.ToString("C", new CultureInfo("pt-br"))}</p>
                                        </div>

                                    </a>
                                </div>
                                ";
            }

            if ((anuncio.DataEncerramento.Subtract(DateTime.Today).Days <= 0 && anuncio.DataEncerramento.Subtract(DateTime.UtcNow).Hours <= 0 && anuncio.DataEncerramento.Subtract(DateTime.UtcNow).Minutes <= 0))
            {
                litTermina.Text = "Leilão encerrou há:";

                litMin.Text = "<p style=text-align:center;>Leilão encerrado.</p>";
                btnDarLance.Visible = false;
                txtLance.Visible = false;
                litMax.Text = "";

                litDiasRestantes.Text = anuncio.DataEncerramento.Subtract(DateTime.Today).Days.ToString().Replace('-',' ');
                litHorasRestantes.Text = anuncio.DataEncerramento.Subtract(DateTime.UtcNow).Hours.ToString().Replace('-', ' ');
                litMinutosRestantes.Text = anuncio.DataEncerramento.Subtract(DateTime.UtcNow).Minutes.ToString().Replace('-', ' ');

                if (!anuncio.VerificarEstadoAnuncio(int.Parse(Request["codProduto"].ToString())))
                    anuncio.FecharAnuncio(int.Parse(Request["codProduto"].ToString()));
            }
               
        }

        public void CarregarImagens()
        {
            litImgExtras.Text = "";

            string caminhoBase = Request.PhysicalApplicationPath + @"imagens/fotosAnuncios";

            DirectoryInfo diretorio = new DirectoryInfo(caminhoBase);
            FileInfo[] listaArquivos = diretorio.GetFiles();

            foreach (FileInfo fi in listaArquivos)
            {
                int codigoAnuncio = int.Parse(Request["codProduto"]);
                string[] infoImg = fi.Name.Split('-');

                if (int.Parse(infoImg[0]) == codigoAnuncio)
                {
                    string numero = infoImg[1].Substring(0, 1);

                    if (numero == "1")
                    {
                        litImgPrincipal.Text = $"<img src='imagens/fotosAnuncios/{fi.Name}' class='fotoProduto'>";
                    }
                    else
                    {
                        litImgExtras.Text += $"<img src='imagens/fotosAnuncios/{fi.Name}' class='fotinhas'>";
                    }
                }
            }
        }

        protected void btnDarLance_Click(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                int cdAnuncio = int.Parse(Request["codProduto"]);
                string email = Session["email"].ToString();

                if (String.IsNullOrEmpty(txtLance.Text))
                {
                    return;
                }

                decimal valorLance = 0;

                try
                {
                    valorLance = decimal.Parse(txtLance.Text);
                }
                catch (Exception ex)
                {
                    throw new Exception("Não foi possível converter o valor da caixa de texto em decimal.");
                }

                GerenciarLance gerenciarLance = new GerenciarLance();

                decimal saldo = gerenciarLance.ConsultarSaldo(email);
                
                //litRespostaSistema.Text = "-";

                if (saldo >= valorLance)
                {
                    gerenciarLance.DarLance(cdAnuncio, email, decimal.Parse(litLanceAtual.Text.Replace("R$ ","")), valorLance);

                    //Dar Refresh na página
                    Response.Redirect(Page.Request.Url.ToString());
                    //litRespostaSistema.Text = "Seu lance foi efetuado com sucesso!";
                }
                else
                {
                    //litRespostaSistema.Text = "Saldo insuficiente!";
                }
            }
            else
            {
                //litRespostaSistema.Text = "Você não está cadastrado!";
            }
        }

    }
}