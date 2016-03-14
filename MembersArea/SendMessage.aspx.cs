using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SendMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) //check if the webpage is loaded for the first time.
        {
            ViewState["PreviousPage"] = Request.UrlReferrer; //Saves the Previous page url in ViewState
        }

        string sMessageFrom = User.Identity.Name;
        string sMessageTo = Request.Cookies["UserInfo"]["cookieMessageTo"];

        lblMsgFrom.Text = sMessageFrom; //Initalises the page to show who the message is from and to
        lblMsgTo.Text = sMessageTo;


    }

    protected void btnMsgSend_Click(object sender, EventArgs e)
    {
        string sMessageFrom = Convert.ToString(Session["sessionUserName"]);
        string sMessageTo = Request.Cookies["UserInfo"]["cookieMessageTo"];

        DateTime messageDate = DateTime.Now;

        //Writes the message to the messages table
        MessagesTableAdapters.hampson_wbsd14_ass1_messagesTableAdapter newmessage = new MessagesTableAdapters.hampson_wbsd14_ass1_messagesTableAdapter();
        newmessage.Insert(sMessageFrom, sMessageTo, txtMsgSubject.Text, txtMsgBody.Text, messageDate);

        SetNotifications.SetNotification(sMessageFrom, sMessageTo, "Message Sent"); //Calls the SetNotifications Method to send a acreen notification to the recipient that they have a new message.

        //Calls the static SendEmailMsg method to send an email notification to the recipient that they have a message. 
        SendEmail.SendEmailMsg("Message from Salford Friends Network - Someone has posted a Message on your Profile!", sMessageFrom + " has posted a Message.", GetEmailAddress.GetEmail(sMessageTo));

        if (ViewState["PreviousPage"] != null)	//Check if the ViewState contains Previous page URL
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to Previous page by retrieving the PreviousPage Url from ViewState.
        }
    }

    protected void btnMsgCancel_Click(object sender, EventArgs e)
    {
        if (ViewState["PreviousPage"] != null)	//Check if the ViewState contains Previous page URL
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to Previous page by retrieving the PreviousPage Url from ViewState.
        }
        else
            Response.Redirect("~/MembersArea/ProfilePage.aspx");
    }
}