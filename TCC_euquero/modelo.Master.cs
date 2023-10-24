using System;
using System.Collections.Generic;
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