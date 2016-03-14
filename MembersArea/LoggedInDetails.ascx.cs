using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class LoggedInDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sessionUserName"] != null)  //need to check for existence of User.Identity.Name instead
        {
            lblLoggedInUser.Text = "You are logged in as: " + Convert.ToString(Session["sessionUserName"]);
            btnLogout.Visible = true;
            imgEmoticon.ImageUrl = "~/images/smile_20.png";
        }
        else
        {
            lblLoggedInUser.Text = "Please log in";
            btnLogout.Visible = false;
            imgEmoticon.ImageUrl = "~/images/sleepy_20.png";
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../Login.aspx");

    }


}