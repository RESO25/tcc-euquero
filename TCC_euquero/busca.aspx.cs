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
    public partial class busca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request["pesquisa"]))
            {
                Response.Redirect("index.aspx");
            }

            string pesquisa = Request["pesquisa"].ToString();

            litNomeBusca.Text = pesquisa;

            GerenciarAnuncios gerenciarAnuncios = new GerenciarAnuncios();
            List<Anuncio> anuncios = gerenciarAnuncios.ListarAnunciosBusca(pesquisa);

            string resposta = "";

            if (anuncios.Count == 0)
            {
                resposta = "Não foram encontrados resultados para sua busca.";
            }
            else
            {
                resposta = $"{anuncios.Count} resultado(s) encontrado(s).";

                foreach (Anuncio anuncio in anuncios)
                {
                    TimeSpan diasRestantes = anuncio.DataEncerramento.Subtract(DateTime.Today);
                    string dias = "";
                    if (diasRestantes < TimeSpan.Zero)
                        dias = "Encerrado";
                    else
                        dias = diasRestantes.Days.ToString() + " dias";

                    litCardProduto.Text += $@"
                                        <div class='cardProduto'>
                                            <a href='anuncio.aspx?codProduto={anuncio.Codigo}'> 
                                                <img src='imagens/fotosAnuncios/{anuncio.Codigo}-1.jpeg' class='imgProduto'>
                
                                                <div class='infoEncerramento'>
                                                    <h3 class='txtEncerra'>encerra em: </h3> <h4 class='txtDataEncerramento'>{dias}</h4>
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

            litTotalResultados.Text = resposta;
        }
    }
}