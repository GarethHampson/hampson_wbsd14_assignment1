using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MembersArea_Forum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// List View ItemCommand routine to set the subjectID session of the Forum Subject ready for the redirection to ForumSubject.aspx
    /// </summary>


    protected void listView_ForumSubjects_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "SelectSubject")
        {
            Label lbl = (Label)e.Item.FindControl("forumIDLabel"); //SubjectID yaken from the Bound label "forumIDLabel"

            Session["sessionSubjectID"] = lbl.Text;

            Response.Redirect("~/MembersArea/ForumSubject.aspx");
        }
    }
    protected void btnNewSubject_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MembersArea/ForumNewSubject.aspx");
    }
}