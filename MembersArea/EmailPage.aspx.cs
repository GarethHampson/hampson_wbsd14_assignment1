using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmailPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtEmailTo.Text = "g.hampson@edu.salford.ac.uk"; //Temporary setting
        txtEmailTo.Enabled = false;
        
        if (!IsPostBack)
        {
            ViewState["PreviousPage"] = Request.UrlReferrer; //Saves the Previous page url in ViewState
        }
    }

    protected void btnSendEmail_Click(object sender, EventArgs e)
    {
            string subject = txtEmailSubject.Text;
            string body = txtEmailMessage.Text;
            try
            {
                SendEmail.SendEmailMsg(subject, body, "g.hampson@edu.salford.ac.uk");
                Response.Redirect(ViewState["PreviousPage"].ToString()); //Redirect to Previous page by retrieving the PreviousPage Url from ViewState.
            }
            catch (Exception exp)
            {
                lblEmailStatus.Text = "Failed to send:" + exp.Message;
            }
        
        
    }
    protected void btnCancelEmail_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MembersArea/ProfilePage.aspx");
    }
}