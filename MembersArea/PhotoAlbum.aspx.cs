using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PhotoAlbum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        imgSelectedImage.ImageUrl = Request.Cookies["UserInfo"]["cookiesCurrentProfilePic"];
       
        lblSelectedImage.Text = "Your current profile picture:";

        if (!IsPostBack) //check if the webpage is loaded for the first time.
        {
            ViewState["PreviousPage"] = Request.UrlReferrer; //Saves the Previous page url in ViewState
        }
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "SelectImage")
        {
            Image img = (Image)e.Item.FindControl("pictureURL");

            lblSelectedImage.Text = "Selected Image:";
            imgSelectedImage.ImageUrl = Convert.ToString(img.ImageUrl);

        }
    }
    protected void btnUseProfilePic_Click(object sender, EventArgs e)
    {
        UpdateProfilePicTableAdapters.hampson_wbsd14_ass1_profileTableAdapter profPic = new UpdateProfilePicTableAdapters.hampson_wbsd14_ass1_profileTableAdapter();

        profPic.UpdateProfilePic(Convert.ToString(imgSelectedImage.ImageUrl), Convert.ToString(Session["sessionUserName"]));

        Response.Redirect("../MembersArea/ProfileUpdate.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (ViewState["PreviousPage"] != null)	//Check if the ViewState contains Previous page URL
        {
            Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to Previous page by retrieving the PreviousPage Url from ViewState.
        }
    }
    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
}