using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        LoginAuthenticationTableAdapters.hampson_wbsd14_ass1_loginauthTableAdapter auth = new LoginAuthenticationTableAdapters.hampson_wbsd14_ass1_loginauthTableAdapter();
        LoginAuthentication.hampson_wbsd14_ass1_loginauthDataTable authtable = auth.GetData();

        bool error = true;

        foreach (DataRow row in authtable.Rows)
        {
            if (txtRegUserName.Text == Convert.ToString(row["username"]))
            {
                lblUsernameError.Visible = true;
                error = true;
            }

            else
            {
                lblUsernameError.Visible = false;
                error = false;
                
            }
        }

        if (error == false) {

                Session["sessionUserName"] = txtRegUserName.Text;

                SiteRegistrationTableAdapters.hampson_wbsd14_ass1_profileTableAdapter register = new SiteRegistrationTableAdapters.hampson_wbsd14_ass1_profileTableAdapter();

                register.insertRegistrationPartOne(txtRegUserName.Text, txtRegPassword.Text, txtRegEmail.Text);

                Response.Redirect("RegistrationProfile.aspx");
        }

    }

    protected void txtRegUserName_TextChanged(object sender, EventArgs e)
    {
        if (txtRegUserName.Text == "Testing")
        {
            lblUsernameError.Visible = true;
        }
    }
}