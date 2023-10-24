using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCC_euquero.Logica;
using TCC_euquero.Modelo;
using System.Globalization;

namespace TCC_euquero
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            GerenciarAnuncios gerenciarAnuncios = new GerenciarAnuncios();
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
        }
    }
}