using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SendEmail
/// </summary>
public class SendEmail
{
	public static string SendEmailMsg(string emailSubject, string emailBody, string emailTo)
	{
        string fromEmail = "salford.cse.dev@gmail.com";

        string smtpServer = "smtp.gmail.com";

        int smtpPort = 587;

        string smtpUsername = "salford.cse.dev";

        string smtpPassword = "s@lf0rdt3st1ng";

        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage(fromEmail, emailTo);
        message.Subject = emailSubject;
        message.Body = emailBody;

        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient(smtpServer, smtpPort);
        client.UseDefaultCredentials = false;
        client.EnableSsl = true;
        client.Credentials = new System.Net.NetworkCredential(smtpUsername, smtpPassword);

        try
        {
            client.Send(message);
            return "Email has been sent";
        }
        catch (Exception exp)
        {
            return "Failed to send:" + exp.Message;
        }
	}
}