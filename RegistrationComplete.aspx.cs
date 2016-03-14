using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationComplete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string CookieName = Request.Cookies["UserInformation"]["Name"];

        lblWelcome.Text = "Hi " + CookieName + ", welcome to Salford Friends Network. Click the button below to Log in, and start making friends."; 
    }

    protected void btnProfile_Click(object sender, EventArgs e)
    {
        Session["sessionProfileName"] = Session["sessionUserName"];
        
        //Response.Redirect("MembersArea/profilepage.aspx");
        Response.Redirect("Login.aspx");
    }
}