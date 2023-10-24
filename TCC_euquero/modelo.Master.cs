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
    public partial class modelo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                litEmail.Text = $"<span id='email' style='visibility:hidden; position:absolute' >{Session["email"].ToString()}</span>";
                litNome.Text = $"<span id='nome' style='visibility:hidden; position:absolute' >{Session["nome"].ToString()}</span>";

                string caminhoBase = Request.PhysicalApplicationPath + @"imagens/fotosPerfis";
                DirectoryInfo diretorio = new DirectoryInfo(caminhoBase);
                FileInfo[] listaArquivos = diretorio.GetFiles();

                string caminhoFoto = "fotoPadrao.png";
                foreach (FileInfo fi in listaArquivos)
                {
                    if (fi.Name.Contains(Session["email"].ToString()))
                        caminhoFoto = fi.Name;
                }

                GerenciarCadastro gerenciarCadastro = new GerenciarCadastro();
                Usuario usuario = gerenciarCadastro.BuscarUsuarioPerfil(Session["email"].ToString());

                string[] nomes = usuario.Nome.Split(' ');

                string nome = $"{nomes[0]} {nomes[nomes.Length - 1]}";

                litPerfil.Text = $@"<button class='slide_from_left tituloMaior btnEntrar' href='perfil.aspx'> 
                                        <img src='imagens/fotosPerfis/{caminhoFoto}'> 
                                        <div>
                                            <p>{nome}</p>
                                            <p class='valor'>{usuario.Saldo.ToString("C", new CultureInfo("pt-br"))}</p>
                                        </div>
                                    </button>";

            }
            else
            {
                litPerfil.Text = @"                
                <span id='bemvindo'></span>
                <button id='btnEntrar' class='slide_from_left tituloMaior btnEntrar'> <img src='imagens/header/perfil.png'> Entrar</button>";
            }
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtEmail.Text))
            {
                return;
            }

            if (String.IsNullOrEmpty(txtSenha.Text))
            {
                return;
            }

            GerenciarCadastro gerenciarCadastro = new GerenciarCadastro();

            if (gerenciarCadastro.VerificarLogin(txtEmail.Text, txtSenha.Text))
            {
                Usuario usuario = gerenciarCadastro.BuscarUsuarioLogin(txtEmail.Text);

                Session["email"] = usuario.Email;
                Session["nome"] = usuario.Nome;

                Response.Redirect(Request.Url.ToString());
            }
        }
    }
}