using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace TCC_euquero.Logica
{
    public class EnvioDeEmail
    {
        public void Enviar(MailMessage mail)
        {
            SmtpClient smtpClient = new SmtpClient("smtp.office365.com", 587);
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("leilaoEuQuero@outlook.pt", "aafjkrTCC2023");
            smtpClient.EnableSsl = true;
            smtpClient.Send(mail);
        }
    }
}