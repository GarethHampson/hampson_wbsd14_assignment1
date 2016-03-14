using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class ForgottenPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// This prcedure uses AJAX to display to the user if their details have been successfully authenticated. If so, then a message is displayed to indicate an email
    /// has been successfully sent.
    /// </summary>


    protected void btnSendPassword_Click(object sender, EventArgs e)
    {
        LoginAuthenticationTableAdapters.hampson_wbsd14_ass1_loginauthTableAdapter email = new LoginAuthenticationTableAdapters.hampson_wbsd14_ass1_loginauthTableAdapter();
        LoginAuthentication.hampson_wbsd14_ass1_loginauthDataTable emailtable = email.GetData();

        foreach (DataRow row in emailtable.Rows)
        {
            
            if ((txtForgotUserName.Text == Convert.ToString(row["username"])) && (txtForgotEmail.Text == Convert.ToString(row["email"])))
            {
                String pwdStore = Convert.ToString(row["password"]);

                string emailMessage = SendEmail.SendEmailMsg("Salford Friends Network: Forgotten Password", "Your Password is: " + pwdStore, Convert.ToString(row["email"]));
                              
                lblForgotStatus.Text = emailMessage;
                break;

            }
            else
            {
                lblForgotStatus.Text = "These details aren't recognised. Please try again or contact Admin";
            }
        }
    }

    protected void btnNewRegistration_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Registration.aspx");
    }

    protected void btnReturnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
    
}