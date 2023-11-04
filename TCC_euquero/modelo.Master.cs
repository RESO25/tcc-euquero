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

                string caminhoBase = Request.PhysicalApplicationPath + @"imagens/fotosPerfis";
                DirectoryInfo diretorio = new DirectoryInfo(caminhoBase);
                FileInfo[] listaArquivos = diretorio.GetFiles();

                string caminhoFoto = "fotoPadrao.png";
                foreach (FileInfo fi in listaArquivos)
                {
                    if (fi.Name.Contains(Session["email"].ToString()))
                        caminhoFoto = fi.Name;
                }

                GerenciarLoginUsuario gerenciarLogin = new GerenciarLoginUsuario();
                Usuario usuario = gerenciarLogin.BuscarUsuarioPerfil(Session["email"].ToString());

                string[] nomes = usuario.Nome.Split(' ');

                string nome = $"{nomes[0]} {nomes[nomes.Length - 1]}";


                string perfil = $@"<a id='aPerfil' class='slide_from_left tituloMaior btnperfil' href='perfil.aspx'>
                                        <img id='fotoPerfil' src='imagens/fotosPerfis/{caminhoFoto}'>
                                        <div>
                                            <p>{nome.ToUpper()}</p>
                                            <p class='valor'>{usuario.Saldo.ToString("C", new CultureInfo("pt-br"))}</p>
                                        </div>
                                    </a>";

                litPerfil.Text = perfil;
            }
            else
            {
                litPerfil.Text = "<button id='btnEntrar' class='slide_from_left tituloMaior btnEntrar'> <img src='imagens/header/perfil.png'> Entrar</button>";
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

            GerenciarLoginUsuario gerenciarLogin = new GerenciarLoginUsuario();

            if (gerenciarLogin.VerificarLogin(txtEmail.Text, txtSenha.Text))
            {
                Usuario usuario = gerenciarLogin.BuscarUsuarioLogin(txtEmail.Text);

                Session["email"] = usuario.Email;
                Session["nome"] = usuario.Nome;

                Response.Redirect(Request.Url.ToString());
            }
        }
    }
}