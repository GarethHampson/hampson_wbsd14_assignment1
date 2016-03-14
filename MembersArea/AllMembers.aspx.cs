using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class allmembers : System.Web.UI.Page
{
    /// <summary>
    ///  On this page, there are 3 SQLDataSources set up, each with a specific query to display the user's Friends,
    ///  or All Members, or to perform a search. Depending on the requirement, the Datalist Datasource ID is updated with
    ///  the required SQLDataSource.
    /// </summary>


    protected void Page_Load(object sender, EventArgs e)
    {
        dataList_Members.DataSourceID = "SqlDataSource_AllMembers"; //Page loads to display all members
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string searchFirstname = txtSearchFirstname.Text;
        string searchSurname = txtSearchSurname.Text;

        dataList_Members.DataSourceID = "SqlDataSource_SearchMembers"; //Perform a search
    }

    protected void btnViewAllMembers_Click(object sender, EventArgs e)
    {
        dataList_Members.DataSourceID = "SqlDataSource_AllMembers"; //Display all members
        txtSearchSurname.Text = "";
        txtSearchFirstname.Text = "";
    }

    protected void btnViewFriends_Click(object sender, EventArgs e)
    {
        dataList_Members.DataSourceID = "SqlDataSource_FilterOnFriends"; //Display Users Friends
        txtSearchSurname.Text = "";
        txtSearchFirstname.Text = "";
    }

    /// <summary>
    /// Button Commandnames within the Datalist to perform redirections to other pages as appropriate
    /// </summary>


    protected void DataList_Members_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "ViewProfile")
        {
            Label lbl = (Label)e.Item.FindControl("usernameLabel");

            Session["sessionProfileName"] = lbl.Text; // set the session to display the selected Profile

            Response.Redirect("~/MembersArea/ProfilePage.aspx");
        }

        if (e.CommandName == "SendMessage")
        {
            Label lbl = (Label)e.Item.FindControl("usernameLabel");

            Response.Cookies["UserInfo"]["cookieMessageTo"] = lbl.Text; // set the cookie of the person the message is to be sent to.
            Response.Redirect("~/MembersArea/SendMessage.aspx");
        }
    }
}