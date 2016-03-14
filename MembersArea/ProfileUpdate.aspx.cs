using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

public partial class ProfileUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.Name == null) 
        {
            Response.Redirect("~/Login.aspx");
        }

        if (!Page.IsPostBack)
        {
            Connection_ProfileTableTableAdapters.hampson_wbsd14_ass1_profileTableAdapter profileload = new Connection_ProfileTableTableAdapters.hampson_wbsd14_ass1_profileTableAdapter();

            //Connection_ProfileTable.hampson_wbsd14_ass1_profileDataTable profileTable = profileload.GetDataByUsername(Convert.ToString(Session["sessionUserName"]));
            Connection_ProfileTable.hampson_wbsd14_ass1_profileDataTable profileTable = profileload.GetData(Convert.ToString(Session["sessionUserName"]));
            imgCurrentImage.ImageUrl = Convert.ToString(profileTable.Rows[0]["profilephoto"]);
            Response.Cookies["UserInfo"]["cookiesCurrentProfilePic"] = Convert.ToString(profileTable.Rows[0]["profilephoto"]);
            txtForename.Text = Convert.ToString(profileTable.Rows[0]["forename"]);
            txtSurname.Text = Convert.ToString(profileTable.Rows[0]["surname"]);
            txtEmail.Text = Convert.ToString(profileTable.Rows[0]["email"]);
            //txtDOB.Text = Convert.ToString(profileTable.Rows[0]["dob"]);
            DateTime dofB = (DateTime) (profileTable.Rows[0]["dob"]);
            txtDOB.Text = dofB.ToShortDateString();
            txtCity.Text = Convert.ToString(profileTable.Rows[0]["location"]);
            txtAboutYou.Text = Convert.ToString(profileTable.Rows[0]["aboutme"]);
            

            string gender = Convert.ToString(profileTable.Rows[0]["gender"]);

            if (gender == "Male")
            {
                txtAboutYou.Text = gender;
                rdoMale.Checked = true;

            }
            else if (gender == "Female")
            {
                rdoFemale.Checked = true;
            }
        }
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
                                  
                    lblProfileImageStatus.Text = profileURLToDB;
                
                    UpdateProfilePicTableAdapters.hampson_wbsd14_ass1_profileTableAdapter profPic = new UpdateProfilePicTableAdapters.hampson_wbsd14_ass1_profileTableAdapter();

                    profPic.UpdateProfilePic(Convert.ToString(profileURLToDB), Convert.ToString(Session["sessionUserName"]));

                                 
                    Response.Redirect("../MembersArea/ProfileUpdate.aspx");  

             }

            catch (Exception exc)
            {
                lblProfileImageStatus.Text = "The file could not be uploaded due to : " + exc.Message;
            }

        }
    
    }

    protected void btnComplete_Click(object sender, EventArgs e)
    {
        string gender = "";

        if (rdoFemale.Checked)
        {
            gender = "Female";
        }
        else if (rdoMale.Checked)
        {
            gender = "Male";
        }

        Connection_ProfileTableTableAdapters.hampson_wbsd14_ass1_profileTableAdapter updateProfile = new Connection_ProfileTableTableAdapters.hampson_wbsd14_ass1_profileTableAdapter();

        updateProfile.UpdateProfileQuery(txtEmail.Text, txtForename.Text, txtSurname.Text, txtDOB.Text, gender, txtCity.Text, txtAboutYou.Text, Convert.ToString(Session["sessionUserName"]));
        
        Response.Redirect("../MembersArea/ProfilePage.aspx");
    }

    protected void btnChangeImage_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        string path = Server.MapPath("~/");
   
    }

    protected void btnViewAlbum_Click(object sender, EventArgs e)
    {
        Response.Redirect("../MembersArea/PhotoAlbum.aspx");
    }
    protected void txtDOB_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MembersArea/ProfilePage.aspx");
    }
}   

