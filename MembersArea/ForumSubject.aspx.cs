using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MembersArea_ForumSubject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //If User submits a reply to a Forum Subject, Table adapter is used to insert a new Row into hampson_wbsd14_ass1_posts table, along with the Subject ID and the User Name.

    protected void btnSubmitReply_Click(object sender, EventArgs e)
    {
        DateTime datenow = DateTime.Now;

        ForumPostsTableAdapters.hampson_wbsd14_ass1_postsTableAdapter postreply = new ForumPostsTableAdapters.hampson_wbsd14_ass1_postsTableAdapter();

        postreply.insertPost(Convert.ToInt16(Session["sessionSubjectID"]), Convert.ToString(Session["sessionUserName"]), txtPostReply.Text, datenow);

        Response.Redirect("~/MembersArea/ForumSubject.aspx");
    }

    protected void btnReturnForum_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MembersArea/Forum.aspx");
    }

    protected void btnEditComments_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MembersArea/EditForumComments.aspx");
    }
}