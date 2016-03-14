<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true"
    CodeFile="ProfilePage.aspx.cs" Inherits="MembersArea_ProfilePage" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divProfile">
        <p>
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
            <asp:FormView ID="formViewCurrentProfile" runat="server" DataSourceID="SqlDataSource_ShowProfile"
                Width="412px">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="profilephotoImage" runat="server" ImageUrl='<%# Bind("profilephoto") %>'
                                    Style="width: 150px; height: 150px" />
                                <br />
                            </td>
                            <td style="float: left; padding-left: 20px">
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' Style="font-size: large;
                                    font-weight: bold; vertical-align: top" />
                                <br />
                                <asp:Label ID="lblUser" CssClass="descriptivelabel" runat="server" Text="Username:"></asp:Label>
                                <asp:Label ID="usernameLabel" runat="server" Text='<%# Bind("username") %>' />
                                <br />
                                <asp:Label ID="lblDoB" CssClass="descriptivelabel" runat="server" Text="Date of Birth:"></asp:Label>
                                <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob", "{0:d}") %>' />
                                <br />
                                <asp:Label ID="lblGender" CssClass="descriptivelabel" runat="server" Text="Gender:"></asp:Label>
                                <asp:Label ID="genderLabel" runat="server" Text='<%# Bind("gender") %>' />
                                <br />
                                <asp:Label ID="lblLoc" CssClass="descriptivelabel" runat="server" Text="Location:"></asp:Label>
                                <asp:Label ID="locationLabel" runat="server" Text='<%# Bind("location") %>' />
                                <br />
                                <asp:Label ID="lblAbout" CssClass="descriptivelabel" runat="server" Text="About Me:"></asp:Label>
                                <asp:Label ID="aboutmeLabel" runat="server" Text='<%# Bind("aboutme") %>' />
                                <br />
                                <asp:Label ID="lblJoin" CssClass="descriptivelabel" runat="server" Text="Joined:"></asp:Label>
                                <asp:Label ID="joiningdateLabel" runat="server" Text='<%# Bind("joiningdate", "{0:d}") %>' />
                                <br />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource_ShowProfile" runat="server" ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>"
                SelectCommand="hampson_wbsd14_ass1_showprofile" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="sessionProfileName" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
    <asp:Button ID="btnSendFriendRequest" runat="server" Text="Send Friend Request" OnClick="btnSendFriendRequest_Click" />
    <asp:Button ID="btnUnfriend" runat="server" OnClick="btnUnfriend_Click" Text="Unfriend" />
    <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" OnClick="btnSendMessage_Click" />
    <asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile" OnClick="btnUpdateProfile_Click" />
    <asp:Button ID="btnMyProfile" runat="server" OnClick="btnMyProfile_Click" Text="Go to My Profile" />
    <br />
    <br />
    <p>
        <asp:Label ID="lblFriendship" runat="server"></asp:Label>
    </p>
    &nbsp;&nbsp;&nbsp;<asp:Panel ID="panelInfoScreen" runat="server">
        <ajaxToolkit:TabContainer ID="tabContainerProfile" runat="server" ActiveTabIndex="4"
            CssClass="MyTabStyle" Height="600px" Width="751px">
            <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                <HeaderTemplate>
                    Messages</HeaderTemplate>
                <ContentTemplate>
                    <asp:Label ID="lblProfileMessages" runat="server"></asp:Label><br />
                    <br />
                    <asp:Panel ID="panelProfileMessages" runat="server" Height="400px">
                        <asp:DataList ID="DataList_ProfileMessages" runat="server" DataSourceID="SqlDataSource_ViewMessages"
                            Width="562px" Height="400px">
                            <ItemTemplate>
                                <table >
                                    <tr >
                                        <td style="padding-left:20px">
                                            <asp:Image ID="messageProfilePhoto" runat="server" ImageUrl='<%# Eval("profilePhoto") %>'
                                                Style="height: 70px; width: 70px; float: left" />
                                        </td>
                                        <td style="float: left; padding-left: 20px">
                                            <asp:Label ID="messageIDLabel" runat="server" Text='<%# Eval("messageID") %>' Visible="false"  /><br />
                                            <asp:Label ID="lblFrom" runat="server" Text="From:" Width=80px></asp:Label><asp:Label ID="messageFromLabel"
                                                runat="server" Text='<%# Eval("messageFrom") %>' Style="font-weight:normal"/><br />
                                            <asp:Label ID="lblDate" runat="server" Text="Date:" Width=80px></asp:Label><asp:Label ID="Label3"
                                                runat="server" Text='<%# Eval("messageDateTime") %>' Style="font-weight:normal" /><br />
                                            <asp:Label ID="lblSubj" runat="server" Text="Subject:" Width=80px></asp:Label><asp:Label ID="messageSubjectLabel"
                                                runat="server" Text='<%#  Eval("messageSubject") %>' Style="font-weight:normal"/><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="padding-top: 5px; padding-left:20px; font-weight: normal">
                                            <asp:Label ID="messageBodyLabel" runat="server" Text='<%# " --> " + Eval("messageBody") %>' Style="font-weight:normal" /><br />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList><br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource_ViewMessages" runat="server" ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>"
                            SelectCommand="hampson_wbsd14_ass1_readmessages" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="messageTo" SessionField="sessionProfileName" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                <HeaderTemplate>
                    Photos</HeaderTemplate>
                <ContentTemplate>
                    <div style="width: 450px; float: left">
                        <asp:Panel ID="panelPhotoDisplay" runat="server" Height="614px" ScrollBars="Vertical">
                            <p>
                                <asp:Label ID="lblPhotoOwner" runat="server" Style="font-weight: bold"></asp:Label></p>
                            <p>
                                <asp:DataList ID="DataListPhotos" runat="server" DataSourceID="SqlDataSourcePhotos"
                                    OnItemCommand="DataListPhotos_ItemCommand">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td style="padding-left: 10px">
                                                    <asp:Image ID="pictureURL" runat="server" ImageUrl='<%# Eval("pictureURL") %>' Style="width: 100px;
                                                        height: 100px; float: left" /><br />
                                                </td>
                                                <td style="padding-left: 20px">
                                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("description") %>' />
                                                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>'
                                                        Style="vertical-align: top" /><br />
                                                    <asp:Label ID="dateLabel" runat="server" Text="Date Uploaded:"></asp:Label><asp:Label
                                                        ID="dateuploadedLabel" runat="server" Text='<%# Eval("dateuploaded") %>' /><br />
                                                    <asp:Button ID="btnViewPic" runat="server" Text="View Picture & Comments" CommandName="ViewPicture" /><br />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList><asp:SqlDataSource ID="SqlDataSourcePhotos" runat="server" ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>"
                                    SelectCommand="hampson_wbsd14_ass1_showphotos" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="username" SessionField="sessionProfileName" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </p>
                        </asp:Panel>
                    </div>
                    <div style="padding-left: 20px">
                        <asp:Panel ID="panelUploadNewPhoto" runat="server" Style="padding-left: 20px">
                            <p>
                                <asp:Label ID="lblUploadNew" runat="server" Text="Upload New Photo:"></asp:Label></p>
                            <p>
                                <asp:FileUpload ID="FileUpload1" runat="server" /></p>
                            <asp:Label ID="Label10" runat="server" Text="Image Description:"></asp:Label><p>
                                <asp:TextBox ID="txtImageDescription" runat="server"></asp:TextBox></p>
                            <asp:Button ID="btnUploadImage" runat="server" OnClick="btnUploadImage_Click" Text="Upload" /><br />
                            <br />
                            <asp:Label ID="lblUploadStatus" runat="server"></asp:Label><br />
                            </asp:Panel>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                <HeaderTemplate>
                    Friends</HeaderTemplate>
                <ContentTemplate>
                    <asp:Label ID="lblProfileFriends" runat="server"></asp:Label><br />
                    <br />
                    <asp:Panel ID="panelProfileFriends" runat="server" ScrollBars="Vertical" Height="600px">
                        <asp:DataList ID="dataListFriends" runat="server" DataSourceID="SqlDataSource_Friends"
                            OnItemCommand="dataListFriends_ItemCommand" Height="600px">
                            <ItemTemplate>
                                <table style="padding-left: 10px">
                                    <tr>
                                        <td style="padding-left: 10px">
                                            <asp:Image ID="ImageFriendPhoto" runat="server" ImageUrl='<%# Eval("profilephoto") %>'
                                                Style="float: left; width: 100px; height: 100px" /><br />
                                        </td>
                                        <td style="padding-left: 20px; width: 350px">
                                            <asp:Label ID="nameLabel" CssClass="profilename" runat="server" Text='<%# Eval("name") %>' /><br />
                                            <asp:Label ID="lblFriendUsername" CssClass="descriptivelabel" runat="server" Text="Username:" /><asp:Label
                                                ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' /><br />
                                            <br />
                                        </td>
                                        <td style="padding-left: 10px">
                                            <asp:Button ID="btnSendMsg" runat="server" CommandName="SendMessage" Text="Send Message" /><br />
                                            <asp:Button ID="btnViewProfile" runat="server" CommandName="ViewProfile" Text="View Profile" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList></asp:Panel>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource_Friends" runat="server" ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>"
                        SelectCommand="hampson_wbsd14_ass1_friendslist" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="profileName" SessionField="sessionProfileName" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
                <HeaderTemplate>
                    Friend Requests</HeaderTemplate>
                <ContentTemplate>
                    <asp:Panel ID="pnlFriendRequests" runat="server">
                        <asp:Label ID="lblFriendReq" runat="server" Text="These member(s) have sent you Friend Requests:"></asp:Label><br />
                        <br />
                        <asp:DataList ID="dataListFriendReqs" runat="server" DataSourceID="sqlDataSourceFriendReqs"
                            OnItemCommand="dataListFriendReqs_ItemCommand">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Image ID="profilephotoImage" runat="server" ImageUrl='<%# Eval("profilephoto") %>'
                                                Style="width: 80px; height: 80px" /><br />
                                        </td>
                                        <td style="float: left; padding-left: 20px">
                                            <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' Style="font-size: large;
                                                font-weight: bold; vertical-align: top" /><br />
                                            <asp:Label ID="nfromLabel" runat="server" Text='<%# Eval("nfrom") %>' /><asp:Label
                                                ID="nidLabel" runat="server" Text='<%# Eval("nid") %>' /><br />
                                            <asp:Label ID="lblUser" CssClass="descriptivelabel" runat="server" Text="Username:"></asp:Label><asp:Label
                                                ID="usernameLabel" runat="server" Text='<%# Eval("nFrom") %>' /><br />
                                            <asp:Label ID="lblGender" CssClass="descriptivelabel" runat="server" Text="Gender:"></asp:Label><asp:Label
                                                ID="Label2" runat="server" Text='<%# Eval("gender") %>' /><br />
                                            <asp:Label ID="lblLoc" CssClass="descriptivelabel" runat="server" Text="Location:"></asp:Label><asp:Label
                                                ID="Label4" runat="server" Text='<%# Eval("location") %>' /><br />
                                        </td>
                                        <td>
                                            <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandName="AcceptFriend" /><br />
                                            <asp:Button ID="btnReject" runat="server" Text="Reject" CommandName="RejectFriend" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList><asp:SqlDataSource ID="sqlDataSourceFriendReqs" runat="server" ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>"
                            SelectCommand="hampson_wbsd14_ass1_getfriendrequests" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="nto" SessionField="sessionUserName" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="TabPanel5">
                <HeaderTemplate>
                    Notifications</HeaderTemplate>
                <ContentTemplate>
                    <asp:Panel ID="pnlNotifications" runat="server">
                        <asp:Label ID="lblNotifications" runat="server" Text="These are your notifications:"></asp:Label><br />
                        <br />
                        <br />
                        <asp:DataList ID="DataList_Notifications" runat="server" DataSourceID="SqlDataSource_Notifications"
                            OnItemCommand="DataList_Notifications_ItemCommand">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td style="padding-right: 20px">
                                            <asp:Image ID="profilephotoImage" runat="server" ImageUrl='<%# Eval("profilephoto") %>'
                                                Style="width: 50px; height: 50px" /><br />
                                        </td>
                                        <td style="padding-right: 20px">
                                            <asp:Label ID="nidLabel" runat="server" Text='<%# Eval("nid") %>' Visible="false" /><asp:Label
                                                ID="nfromLabel" runat="server" Text='<%# Eval("nfrom") + " has " %>' /><asp:Label
                                                    ID="nstatusLabel" runat="server" Text='<%# Eval("nstatus") + " your "%>' /><asp:Label
                                                        ID="ntypeLabel" runat="server" Text='<%# Eval("ntype") %>' /><asp:Label ID="nurlLabel"
                                                            runat="server" Text='<%# Eval("nurl") %>' />
                                        </td>
                                        <td>
                                            <asp:Button ID="btnAcknowledge" runat="server" Text="OK" CommandName="Acknowledge" /><br />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList><asp:SqlDataSource ID="SqlDataSource_Notifications" runat="server"
                            ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>" SelectCommand="hampson_wbsd14_ass1_getnotifications"
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="nTo" SessionField="sessionUserName" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
        </ajaxToolkit:TabContainer>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <div style="border: 1px none #003366; background-color: #C60C30;">
        <asp:Label ID="lblAlerts" runat="server" Text="Your Alerts:"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblYouHaveNotification" runat="server" Text="You have Notification(s)."></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblYouHaveFR" runat="server" Text="You have Friend Request(s)."></asp:Label>
        <br />
    </div>
</asp:Content>
