using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MembersArea_ViewPicture : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) //check if the webpage is loaded for the first time.
        {
            ViewState["PreviousPage"] = Request.UrlReferrer; //Saves the Previous page url in ViewState
        }

        imgViewPicture.ImageUrl = Convert.ToString(Session["sessionViewPicture"]); //Sets the URL to the saved session set on ProfilePage.

        if (Convert.ToString(Session["sessionDeleteAllowed"]) == "Y") // Checks to see if this picture belongs to the user, and if so, allow delete
        {
            btnDeletePicture.Enabled = true;
        }
        else
        {
            btnDeletePicture.Enabled = false;
        }

        pnlDeleteCheck.Visible = false;

    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProfilePage.aspx");
    }

    protected void btnDeletePicture_Click(object sender, EventArgs e)
    {
        pnlDeleteCheck.Visible = true;
    }

    protected void btnYes_Click(object sender, EventArgs e)
    {
        PictureGalleryTableAdapters.hampson_wbsd14_ass1_picturesTableAdapter deletePic = new PictureGalleryTableAdapters.hampson_wbsd14_ass1_picturesTableAdapter();
        deletePic.deletePicture(Convert.ToString(Session["sessionviewPicture"]));

        if (ViewState["PreviousPage"] != null)	//Check if the ViewState contains Previous page URL
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to Previous page by retrieving the PreviousPage Url from ViewState.
        }
    }

    protected void btnSubmitComment_Click(object sender, EventArgs e)
    {
        string sUserName = Convert.ToString(Session["sessionUserName"]);
        string sProfileName = Convert.ToString(Session["sessionProfileName"]);

        PictureCommentsTableAdapters.hampson_wbsd14_ass1_commentsTableAdapter picomment = new PictureCommentsTableAdapters.hampson_wbsd14_ass1_commentsTableAdapter();
        picomment.Insert(Convert.ToString(Session["sessionviewPicture"]), sUserName, txtComment.Text, DateTime.Now);

        if (sUserName != sProfileName) //You wouldnt want a notification if you were commenting on your own photo.
        {
            SetNotifications.SetNotification(sUserName, sProfileName, "Picture Comment");
            Response.Redirect("~/MembersArea/ViewPicture.aspx");
        }

        Response.Redirect("~/MembersArea/ViewPicture.aspx");
    }
}