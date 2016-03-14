<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true"
    CodeFile="EditForumComments.aspx.cs" Inherits="MembersArea_EditForumComments" %>

<%@ Register Src="LoggedInDetails.ascx" TagName="LoggedInDetails" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        <asp:Label ID="lblEditComments" runat="server" Text="Edit and Delete Forum Comments"></asp:Label>
    </h1>
    <p>
        <asp:Label ID="lblWarning" runat="server" Text="Note - you can only edit and delete your own comments in this thread."></asp:Label>
    </p>
    <p>
    <asp:FormView ID="FormView_ForumSubject" runat="server" 
        DataSourceID="SqlDataSource_ForumSubject">
        <ItemTemplate>
        <table>
        <tr>
        <td style="width:450px; border:1px solid; padding:20px">
            <asp:Label ID="forumSUsernameLabel" runat="server" Text='<%# Bind("forumSUsername") %>' Style="font-weight:bold" />
            <asp:Label ID="Label3" runat="server" Text=" started this Thread on " Style="font-weight:bold"></asp:Label>
            <asp:Label ID="postDateLabel0" runat="server" Text='<%# Bind("forumDate") %>' 
                Style="font-weight:bold"/>
            <br />
            
            <asp:Label ID="forumSubjectLabel" runat="server" Text='<%# Bind("forumSubject") %>' Style="font-weight:bold; color:Blue" />
            <br />
            <asp:Label ID="postMessageLabel0" runat="server" 
                Text='<%# Bind("forumBody") %>' Style="font-weight:normal" />
            <br />       
            
            </td>
            </tr>
         </table>   
        </ItemTemplate>
    </asp:FormView>
    </p>
    <asp:SqlDataSource ID="SqlDataSource_ForumSubject" runat="server" ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>"
        
        SelectCommand="hampson_wbsd14_ass1_selectedforumsubject" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="forumID" SessionField="sessionSubjectID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView_EditReplies" runat="server" DataKeyNames="postID" 
        DataSourceID="ObjectDataSource_EditReplies">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="postIDLabel" runat="server" Text='<%# Eval("postID") %>'  />
                </td>
                <td>
                    <asp:Label ID="postSIDLabel" runat="server" Text='<%# Eval("postSID") %>'  />
                </td>
                <td>
                    <asp:Label ID="postUsernameLabel" runat="server" Text='<%# Eval("postUsername") %>' />
                </td>
                <td>
                    <asp:Label ID="postMessageLabel" runat="server" Text='<%# Eval("postMessage") %>' />
                </td>
                <td>
                    <asp:Label ID="postDateLabel" runat="server" Text='<%# Eval("postDate") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" /> <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="postIDLabel1" runat="server" Text='<%# Eval("postID") %>' Visible="false" />
                </td>
                <td>
                    <asp:TextBox ID="postSIDTextBox" runat="server" Text='<%# Bind("postSID") %>' Visible="false" />
                </td>
                <td>
                    <asp:TextBox ID="postUsernameTextBox" runat="server" Text='<%# Bind("postUsername") %>'
                        Enabled="false" />
                </td>
                <td>
                    <asp:TextBox ID="postMessageTextBox" runat="server" Text='<%# Bind("postMessage") %>' />
                </td>
                <td>
                    <asp:TextBox ID="postDateTextBox" runat="server" Text='<%# Bind("postDate") %>' Enabled="false" />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        No data was returned.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="postSIDTextBox" runat="server" Text='<%# Bind("postSID") %>' Visible="false" />
                </td>
                <td>
                    <asp:TextBox ID="postUsernameTextBox" runat="server" Text='<%# Bind("postUsername") %>'
                        Visible="false" />
                </td>
                <td>
                    <asp:TextBox ID="postMessageTextBox" runat="server" Text='<%# Bind("postMessage") %>' />
                </td>
                <td>
                    <asp:TextBox ID="postDateTextBox" runat="server" Text='<%# Bind("postDate") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" /><br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="postIDLabel" runat="server" Text='<%# Eval("postID") %>' />
                </td>
                <td>
                    <asp:Label ID="postSIDLabel" runat="server" Text='<%# Eval("postSID") %>' />
                </td>
                <td>
                    <asp:Label ID="postUsernameLabel" runat="server" Text='<%# Eval("postUsername") %>' />
                </td>
                <td style="padding-right: 5px">
                    <asp:Label ID="postMessageLabel" runat="server" Text='<%# Eval("postMessage") %>' />
                </td>
                <td>
                    <asp:Label ID="postDateLabel" runat="server" Text='<%# Eval("postDate") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="padding: 5px">
                            <tr runat="server" style="">
                                <th runat="server" style="padding: 5px">
                                </th>
                                <th runat="server" style="padding: 5px">
                                    Post ID
                                </th>
                                <th runat="server" style="padding: 5px">
                                    Subj ID
                                </th>
                                <th runat="server" style="padding: 5px">
                                    Username
                                </th>
                                <th runat="server">
                                    Message
                                </th>
                                <th runat="server">
                                    Date
                                </th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="postIDLabel" runat="server" Text='<%# Eval("postID") %>' />
                </td>
                <td>
                    <asp:Label ID="postSIDLabel" runat="server" Text='<%# Eval("postSID") %>' />
                </td>
                <td>
                    <asp:Label ID="postUsernameLabel" runat="server" Text='<%# Eval("postUsername") %>' />
                </td>
                <td>
                    <asp:Label ID="postMessageLabel" runat="server" Text='<%# Eval("postMessage") %>' />
                </td>
                <td>
                    <asp:Label ID="postDateLabel" runat="server" Text='<%# Eval("postDate") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource_EditReplies" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="EditForumTableAdapters.hampson_wbsd14_ass1_postsTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_postID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="postSID" Type="Int32" />
            <asp:Parameter Name="postUsername" Type="String" />
            <asp:Parameter Name="postMessage" Type="String" />
            <asp:Parameter Name="postDate" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="postSID" SessionField="sessionSubjectID" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="postUsername" SessionField="sessionUserName"
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="postSID" Type="Int32" />
            <asp:Parameter Name="postUsername" Type="String" />
            <asp:Parameter Name="postMessage" Type="String" />
            <asp:Parameter Name="postDate" Type="DateTime" />
            <asp:Parameter Name="Original_postID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:Button ID="btnReturnToSubject" runat="server" 
        onclick="btnReturnToSubject_Click" Text="Return To Subject" />
    <br />
    <br />
    <br />
</asp:Content>
