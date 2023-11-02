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
    public partial class categoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
         {
            if (String.IsNullOrEmpty(Request["cdCategoria"]))
            {
                Response.Redirect("index.aspx");
            }

            GerenciarCategorias gerenciarCategorias = new GerenciarCategorias();
            int total = gerenciarCategorias.ContarCategorias();

            if (int.Parse(Request["cdCategoria"].ToString()) > total)
            {
                Response.Redirect("index.aspx");
            }

            int cdCategoria = int.Parse(Request["cdCategoria"].ToString());

            Categoria categoria = gerenciarCategorias.BuscarCategoria(cdCategoria);

            litImgCategoria.Text = $"<img src=\"imagens\\categorias\\{categoria.Codigo}.png\" class=\"iconCategoria\">";
            litNomeCategoria.Text = categoria.Nome;

            GerenciarAnuncios gerenciarAnuncios = new GerenciarAnuncios();
            List<Anuncio> listaAnuncio = gerenciarAnuncios.ListarAnunciosCategoria(cdCategoria);

            litTotalResultados.Text = listaAnuncio.Count.ToString();

            foreach (Anuncio anuncio in listaAnuncio)
            {
                TimeSpan diasRestantes = anuncio.DataEncerramento.Subtract(DateTime.Today);

                litCardProduto.Text += $@"
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
                                        </div>";
             
            }
        }
    }
}