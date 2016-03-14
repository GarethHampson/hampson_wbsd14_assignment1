using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForumNewSubject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) //check if the webpage is loaded for the first time.
        {
            ViewState["PreviousPage"] = Request.UrlReferrer; //Saves the Previous page url in ViewState
        }
    }

    /// <summary>
    /// If the user starts a new Forum Topic, insert a new row into the forum table.
    /// </summary>


    protected void btnNewSubmit_Click(object sender, EventArgs e)
    {
        ForumTableAdapters.ForumDataTableAdapter writenewpost = new ForumTableAdapters.ForumDataTableAdapter();

        writenewpost.Insert(txtNewSubject.Text, Convert.ToString(Session["sessionUserName"]), txtNewBody.Text, DateTime.Now);
        
        Response.Redirect("~/MembersArea/Forum.aspx");

        
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (ViewState["PreviousPage"] != null)	//Check if the ViewState contains Previous page URL
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to Previous page by retrieving the PreviousPage Url from ViewState.
        }
        else
            Response.Redirect("~/MembersArea/Forum.aspx");
    }
}