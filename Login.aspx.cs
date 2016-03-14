using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }

   /// <summary>
   /// On clicking the Log-in button, check the entered Username and Password against the records, by setting up an instance of the LoginAuthentication Dataset, 
   /// and then stepping through each returned Row.
   /// 
   /// If no data is returned, a warning label will be dispayed to indicate incorrect Username / Password combination.
   /// 
   /// </summary>


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        LoginAuthenticationTableAdapters.hampson_wbsd14_ass1_loginauthTableAdapter auth = new LoginAuthenticationTableAdapters.hampson_wbsd14_ass1_loginauthTableAdapter();
        LoginAuthentication.hampson_wbsd14_ass1_loginauthDataTable authtable = auth.GetData();

        foreach (DataRow row in authtable.Rows)

            if ((txtUserName.Text == Convert.ToString(row["username"])) && (txtPassword.Text == Convert.ToString(row["password"])))
            {
                Session["sessionUserName"] = txtUserName.Text;      //sets the Session for the Logged in User
                Session["sessionProfileName"] = txtUserName.Text;   //sets the Session for the ProfilePage.aspx so that it loads with the Logged in user

                FormsAuthentication.SetAuthCookie(txtUserName.Text, false); //Indicates that the user is authenticated
                Response.Redirect("MembersArea/ProfilePage.aspx");          //and redirects to ProfilePage.aspx no matter whare then enter the site from.
            }
            else
                lblError.Visible = true;

    }
    protected void lnkForgotPwd_Click(object sender, EventArgs e)
    {

        Response.Redirect("ForgottenPassword.aspx");


    }
    protected void btnNewRegistration_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx");
    }

}