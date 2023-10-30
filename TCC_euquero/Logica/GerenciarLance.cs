using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using TCC_euquero.Modelo;

namespace TCC_euquero.Logica
{
    public class GerenciarLance : Banco
    {
        List<Parametro> parametros = new List<Parametro>();

        public decimal ConsultarSaldo(string pEmail)
        {
            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pEmail", pEmail));

            decimal saldo = 0;

            MySqlDataReader dados = ConsultarProcedure("ConsultarSaldo", lista);
            if (dados.Read())
                saldo = dados.GetDecimal(0);

            dados.Close();
            Desconectar();

            return saldo;
        }

        public void DarLance(int pAnuncio, string pEmailGanhadorNovo, decimal pValorAnterior, decimal pValorNovo)
        {
            List<Parametro> lista = new List<Parametro>();
            lista.Add(new Parametro("pAnuncio", pAnuncio.ToString()));
            lista.Add(new Parametro("pEmail", pEmailGanhadorNovo));
            lista.Add(new Parametro("pValor", pValorNovo.ToString()));

            ExecutarProcedure("DarLance", lista);
            EmailRessarcirSaldo(pAnuncio, pValorAnterior);
        }

        public void EmailRessarcirSaldo(int pAnuncio, decimal pValor)
        {
            string emailUsuario = "";
            MySqlDataReader dados = ConsultarComando($"select nm_email_usuario_cliente as EmailUsuarioCliente from lance where cd_anuncio = {pAnuncio} and vl_lance = {pValor.ToString().Replace(',', '.')};");

            if (dados.Read())
                emailUsuario = dados["EmailUsuarioCliente"].ToString();
            
            dados.Close();
            
            MailMessage mail = new MailMessage("leilaoEuQuero@outlook.pt", emailUsuario);
            EnvioDeEmail envioDeEmail = new EnvioDeEmail();

            string CSS = "";

            mail.Subject = $"Saldo Ressarcido!";
            mail.IsBodyHtml = true;
            mail.Body = $@"     <html>
                                    <body>
                                        <div style={CSS}>
                                            <p> O valor de {pValor.ToString("C", new CultureInfo("pt-br"))} foi ressarcido para você.</p>
                                        </div>
                                    </body>
                                </html>";

            mail.SubjectEncoding = Encoding.GetEncoding("UTF-8");
            mail.BodyEncoding = Encoding.GetEncoding("UTF-8");

            envioDeEmail.Enviar(mail);
        }
    }
}