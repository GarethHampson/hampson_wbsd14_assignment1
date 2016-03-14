using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MembersArea_ProfilePage : System.Web.UI.Page
{
    
    /// <summary>
    /// On Page Load - FIRST: Check the relationship between the User, and the selected Profile. 
    /// </summary>
 

    protected void Page_Load(object sender, EventArgs e)
    {
        
        string sUserName = Convert.ToString(Session["sessionUserName"]);
        string sProfileName = Convert.ToString(Session["sessionProfileName"]);
        //Session["sessionPrevProfileName"] = (Session["sessionProfileName"]);
        Session["sessionDeleteAllowed"] = 0;


        if (!IsPostBack)
        {
            ViewState["PreviousPage"] = Request.UrlReferrer; //Saves the Previous page url in ViewState
        }


        //Load a Datatable with all the current Friend Requests. This will enable / disable the 'Send Friend Request' button if a Friend Request has already been sent
        // from the user and the member on display.
        NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter friendreqsent = new NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter();
        Notifications.hampson_wbsd14_ass1_notificationsDataTable friendreqtable = friendreqsent.checkFriendReq(sUserName, sProfileName);

        //Load a Datatable with all the User's Friend relationships - this will define if a FULL or BASIC VIEW is to be displayed.
        UpdateFriendsTableAdapters.hampson_wbsd14_ass1_friendsTableAdapter friendcheck = new UpdateFriendsTableAdapters.hampson_wbsd14_ass1_friendsTableAdapter();
        UpdateFriends.hampson_wbsd14_ass1_friendsDataTable friendTable = friendcheck.GetDataBy(User.Identity.Name, sProfileName);

        if (User.Identity.Name == sProfileName) //Settings for when the User's OWN profile is displayed. Display a FULL VIEW (panelInfoScreen = true)
        {
            lblFriendship.Text = "This is your Profile";
            panelInfoScreen.Visible = true;
            btnUpdateProfile.Enabled = true;
            btnSendFriendRequest.Enabled = false;
            btnSendMessage.Enabled = false;
            panelUploadNewPhoto.Visible = true; //Displays the Photo Upload Section
            btnUnfriend.Enabled = false;
            btnMyProfile.Enabled = false;
            pnlFriendRequests.Visible = true;
            lblFriendReq.Text = "These member(s) have sent you Friend Requests:";
            pnlNotifications.Visible = true;
            lblNotifications.Text = "These are your notifications:";
        }
        else //Settings for when the displayed profile is not the User's own
        {
            btnUpdateProfile.Enabled = false;
            btnMyProfile.Enabled = true;
            pnlFriendRequests.Visible = false;
            lblFriendReq.Text = "You need to be in your own profile to see Friend Requests.";
            pnlNotifications.Visible = false;
            lblNotifications.Text = "You need to be in your own profile to see Notifications";

            if (friendTable.Rows.Count > 0) // If the profile displayed is that of one of the User's Friends, display a FULL VIEW
            {
                lblFriendship.Text = "You are my Friend";
                panelInfoScreen.Visible = true;
                btnSendFriendRequest.Enabled = false;
                btnSendMessage.Enabled = true;
                panelUploadNewPhoto.Visible = false;
                btnUnfriend.Enabled = true;
            }
            else //The profile displayed is not one of the User's Friends. Display a BASIC VIEW (panelInfoScreen = false)
            {
                lblFriendship.Text = "You need to be my Friend to see the rest of my profile";
                panelInfoScreen.Visible = false;
                btnSendMessage.Enabled = true;
                btnUnfriend.Enabled = false;

                if (friendreqtable.Rows.Count > 0)
                {
                    btnSendFriendRequest.Text = "Friend Request Sent";
                    btnSendFriendRequest.Enabled = false;
                }
                else
                {
                    btnSendFriendRequest.Text = "Send Friend Request";
                    btnSendFriendRequest.Enabled = true;
                }

            }
            tabContainerProfile.TabIndex = 1;
        }

        //Check to see how many notifications and friend requests the user has, and display in the Content Container in the left hand column. This was supposed to be AJAX, running off a Timer.
        //See the bottom of this code - Timer1.

        NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter checkNotifications = new NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter();
        Notifications.hampson_wbsd14_ass1_notificationsDataTable checkNotificationsTable = checkNotifications.notificationGet(sUserName);

        if (checkNotificationsTable.Rows.Count > 0)
            {
            lblYouHaveNotification.Text = "You have " + Convert.ToInt16(checkNotificationsTable.Rows.Count) + " Notification(s)"; //Counts the number of rows returned and displays
           
        }
        else
        {
           lblYouHaveNotification.Text = "You have no notifications";
        }

        Notifications.hampson_wbsd14_ass1_notificationsDataTable checkFriendReqTable = checkNotifications.friendReqGet(sUserName);

        if (checkFriendReqTable.Rows.Count > 0)
        {
            lblYouHaveFR.Text =  "You have " + Convert.ToInt16(checkFriendReqTable.Rows.Count)  + " Friend Request(s).";
        }
        else 
        {
            lblYouHaveFR.Text = "You have no friend requests.";
        }
        //End of pseudo AJAX

        lblPhotoOwner.Text = sProfileName + @"'s Photo Album";
        lblProfileFriends.Text = sProfileName + @"'s Friends";
        lblProfileMessages.Text = sProfileName + @"'s Messages";

    }

    protected void btnUploadImage_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {   
            
            try
            {
                string path = Server.MapPath("~/");
                PictureUpload pictureUpload = new PictureUpload();
                
                string profileURLToDB = pictureUpload.PictureUploader(FileUpload1, txtImageDescription.Text, User.Identity.Name, path);

                
                lblUploadStatus.Text = "Your photo was uploaded successfully - please check your Photo Album";


                Response.Redirect("~/MembersArea/ProfilePage.aspx");
            }
            catch (Exception exc)
            {
                lblUploadStatus.Text = "The file could not be uploaded due to : " + exc.Message;
            }

        }
    }

    //Send message to the current profile
    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        Response.Cookies["UserInfo"]["cookieMessageTo"] = Convert.ToString(Session["sessionProfileName"]);
        Response.Redirect("~/MembersArea/SendMessage.aspx");
    }

    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/MembersArea/ProfileUpdate.aspx");
    }

    protected void dataListFriends_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "ViewProfile")
        {
            Label lbl = (Label)e.Item.FindControl("usernameLabel");

            Session["sessionProfileName"] = lbl.Text;
            

            Response.Redirect("~/MembersArea/ProfilePage.aspx");
        }
        else if (e.CommandName == "SendMessage")
        {
            Label lbl = (Label)e.Item.FindControl("usernameLabel");

            Response.Cookies["UserInfo"]["cookieMessageTo"] = lbl.Text;
            Response.Redirect("~/MembersArea/SendMessage.aspx");
        }
        
    }

    protected void btnReturnPrev_Click(object sender, EventArgs e)
    {
        if (ViewState["PreviousPage"] != null)	//Check if the ViewState contains Previous page URL
        {
            Session["sessionProfileName"] = Session["sessionPrevProfileName"];
            Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to Previous page by retrieving the PreviousPage Url from ViewState.
            //Response.Redirect("~/MembersArea/ProfilePage.aspx");
        }
    }

    protected void btnSendFriendRequest_Click(object sender, EventArgs e)
    {
        string sUserName = Convert.ToString(Session["sessionUserName"]);
        string sProfileName = Convert.ToString(Session["sessionProfileName"]);

        SetNotifications.SendFriendRequest(sUserName, sProfileName);
        btnSendFriendRequest.Text = "Friend Request Sent";
        btnSendFriendRequest.Enabled = false;

        SendEmail.SendEmailMsg("Message from Salford Friends Network - Friend Request", sUserName + " has sent you a Friend Request.", GetEmailAddress.GetEmail(sProfileName));

    }

    protected void DataListPhotos_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "ViewPicture")
        {
            Image img = (Image)e.Item.FindControl("pictureURL");

            Session["sessionviewPicture"] = img.ImageUrl;

            if (Session["sessionProfileName"] == Session["sessionUserName"])
            {
                Session["sessionDeleteAllowed"] = "Y";
            }
            else
            {
                Session["sessionDeleteAllowed"] = "N";
            }

            Response.Redirect("~/MembersArea/ViewPicture.aspx");
        }
    }


    protected void btnMyProfile_Click(object sender, EventArgs e)
    {
        Session["sessionProfileName"] = Session["sessionUserName"];
        Response.Redirect("ProfilePage.aspx");
    }


    protected void btnUnfriend_Click(object sender, EventArgs e)
    {
        string sUserName = Convert.ToString(Session["sessionUserName"]);
        string sProfileName = Convert.ToString(Session["sessionProfileName"]);

        UpdateFriendsTableAdapters.hampson_wbsd14_ass1_friendsTableAdapter delfriendship = new UpdateFriendsTableAdapters.hampson_wbsd14_ass1_friendsTableAdapter();
        delfriendship.deleteFriendship(sUserName, sProfileName);
        delfriendship.deleteFriendship(sProfileName, sUserName);

        Response.Redirect("~//MembersArea/ProfilePage.aspx");

    }

     
    protected void DataList_Notifications_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Acknowledge")
        {
            Label lbl = (Label)e.Item.FindControl("nidLabel");

            int nID = Convert.ToInt16(lbl.Text);

            SetNotifications.AcknowledgeMsgNotification(nID);

            Response.Redirect("~/MembersArea/ProfilePage.aspx");
        }
    }

    protected void dataListFriendReqs_ItemCommand(object source, DataListCommandEventArgs e)
    {
        string sUserName = Convert.ToString(Session["sessionUserName"]);

        if (e.CommandName == "AcceptFriend")
        {
            Label lbl = (Label)e.Item.FindControl("nidLabel");
            Label frd = (Label)e.Item.FindControl("nfromLabel");

            int nID = Convert.ToInt16(lbl.Text);
            string friend = Convert.ToString(frd.Text);

            SetNotifications.AcceptFriendRequest("Accepted", nID);

            FriendRequests.MakeFriends(sUserName, friend);

            Response.Redirect("~/MembersArea/ProfilePage.aspx");
        }
        else if (e.CommandName == "RejectFriend")
        {
            Label lbl = (Label)e.Item.FindControl("nidLabel");

            int nID = Convert.ToInt16(lbl.Text);

            SetNotifications.AcceptFriendRequest("Rejected", nID);

            Response.Redirect("~/MembersArea/ProfilePage.aspx");

        }
    }

    // This was an attempt at using AJAX with a timer to update the notification alerts box in the left hand column. Errors were occurring because the timer control wasn't being recognised by the 
    // ToolkitScriptManager, and adding another AJAX Script manager caused a clash. So fo now, this routine has been placed in the page load section, so that the alerts get refreshed on each page load. 

    //protected void Timer1_Tick(object sender, EventArgs e)
    //{
    //    string sUserName = Convert.ToString(Session["sessionUserName"]);

    //    NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter checkNotifications = new NotificationsTableAdapters.hampson_wbsd14_ass1_notificationsTableAdapter();
    //    Notifications.hampson_wbsd14_ass1_notificationsDataTable checkNotificationsTable = checkNotifications.notificationGet(sUserName);

    //    if (checkNotificationsTable.Rows.Count > 0)
    //    {
    //        lblYouHaveNotification.Text = "You have " + Convert.ToInt16(checkNotificationsTable.Rows.Count) + " Notification(s)";

    //    }
    //    else
    //    {
    //        lblYouHaveNotification.Text = "You have no notifications";
    //    }

    //    Notifications.hampson_wbsd14_ass1_notificationsDataTable checkFriendReqTable = checkNotifications.friendReqGet(sUserName);

    //    if (checkFriendReqTable.Rows.Count > 0)
    //    {
    //        lblYouHaveFR.Text = "You have " + Convert.ToInt16(checkFriendReqTable.Rows.Count) + "Friend Request(s).";
    //    }
    //    else
    //    {
    //        lblYouHaveFR.Text = "You have no friend requests.";
    //    }
    //}
}
