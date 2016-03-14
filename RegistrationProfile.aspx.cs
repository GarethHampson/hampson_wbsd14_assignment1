using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

public partial class RegistrationProfile : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtDOB_TextChanged(object sender, EventArgs e)
    {

    }
    
    protected void btnProfileImageUpload_Click(object sender, EventArgs e)
    {
         if (FileUpload1.HasFile)
        {   
            try
            {
                    string path = Server.MapPath("~/");
                   
                    PictureUpload profileUpload = new PictureUpload();

                    string profileURLToDB = profileUpload.PictureUploader(FileUpload1, "Profile Picture", Convert.ToString(Session["sessionUserName"]), path);
                    Response.Cookies["UserInformation"]["profilePic"] = profileURLToDB;
                    Debug.WriteLine(profileURLToDB);
                    lblProfileImageStatus.Text = "Picture has been uploaded";
             }

            catch (Exception exc)
            {
                lblProfileImageStatus.Text = "The Image could not be uploaded due to : " + exc.Message;
            }

        }
    
    }

    protected void btnComplete_Click(object sender, EventArgs e)
    {
        string currentUser = Convert.ToString(Session["sessionUserName"]);

        string gender ="";

        if (rdoFemale.Checked)
        {
            gender = "Female";
        }
        else if (rdoMale.Checked)
        {
            gender = "Male";
        }

        
        DateTime dateofbirth = Convert.ToDateTime(txtDOB.Text);

        SiteRegistrationTableAdapters.hampson_wbsd14_ass1_profileTableAdapter register = new SiteRegistrationTableAdapters.hampson_wbsd14_ass1_profileTableAdapter();

        
        register.insertRegistrationPartTwo(txtForename.Text, txtSurname.Text, txtCity.Text, txtAboutYou.Text, Request.Cookies["UserInformation"]["profilePic"], dateofbirth, gender, DateTime.Now, currentUser);

        Response.Cookies["UserInformation"]["Name"] = txtForename.Text;
        //Need to set expiry period
        Response.Redirect("RegistrationComplete.aspx");
    }
}   

