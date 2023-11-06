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
            lista.Add(new Parametro("pValor", pValorNovo.ToString().Replace(',', '.')));

            ExecutarProcedure("DarLance", lista);
            EmailRessarcirSaldo(pAnuncio, pValorAnterior);
        }

        public void EmailRessarcirSaldo(int pAnuncio, decimal pValor)
        {
            string emailUsuario = "";
            List<Parametro> parametros = new List<Parametro>();
            parametros.Add(new Parametro("pCdAnuncio", pAnuncio.ToString()));
            parametros.Add(new Parametro("pVlLance", pValor.ToString().Replace(',', '.')));

            MySqlDataReader dados = ConsultarProcedure("BuscarEmailUsuarioCliente", parametros);

            if (dados.Read())
                emailUsuario = dados["EmailUsuarioCliente"].ToString();
            
            dados.Close();

            if (String.IsNullOrEmpty(emailUsuario))
            {
                return;
            }
            else
            {
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
}