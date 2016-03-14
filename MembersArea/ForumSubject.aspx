<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true"
    CodeFile="ForumSubject.aspx.cs" Inherits="MembersArea_ForumSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <asp:FormView ID="FormView_ForumSubject" runat="server" 
        DataSourceID="SqlDataSource_ForumSubject">
        <ItemTemplate>
        <table>
        <tr>
        <td style="width:450px; border:1px solid; padding:20px">
            <asp:Label ID="forumSUsernameLabel" runat="server" Text='<%# Bind("forumSUsername") %>' Style="font-weight:bold" />
            <asp:Label ID="Label3" runat="server" Text=" started this Thread on " Style="font-weight:bold"></asp:Label>
            <asp:Label ID="postDateLabel" runat="server" Text='<%# Bind("forumDate") %>' Style="font-weight:bold"/>
            <br />
            
            <asp:Label ID="forumSubjectLabel" runat="server" Text='<%# Bind("forumSubject") %>' Style="font-weight:bold; color:Blue" />
            <br />
            <asp:Label ID="postMessageLabel" runat="server" Text='<%# Bind("forumBody") %>' Style="font-weight:normal" />
            <br />       
            
            </td>
            </tr>
         </table>   
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource_ForumSubject" runat="server" ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>"
        
        SelectCommand="hampson_wbsd14_ass1_selectedforumsubject" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="forumID" SessionField="sessionSubjectID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <panel>
    <asp:ListView ID="ListView_SelectedSubjectReplies" runat="server" 
        DataSourceID="SqlDataSource_SubjectReplies">
        <EmptyDataTemplate>
            <span>There are no responses to this Topic yet.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <span style="">

                <asp:Label ID="forumSUsernameLabel" runat="server" Text='<%# Eval("postUsername") %>' Style="font-weight:bold"/>
                <asp:Label ID="Label1" runat="server" Text=" wrote:      (" Style="font-weight:bold"> </asp:Label>
                <asp:Label ID="postDateLabel" runat="server" Text='<%# Eval("postDate") %>' Style="font-weight:bold" />
                <asp:Label ID="Label2" runat="server" Text=")" Style="font-weight:bold"></asp:Label>
                <br />
                <asp:Label ID="postMessageLabel" runat="server" Text=' <%# "-> " +  Eval("postMessage") %>' Style="font-weight:normal" />
                <br />
               
                <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    </panel>
    <br />
    <asp:Button ID="btnReturnForum" runat="server" onclick="btnReturnForum_Click" 
        Text="Forum Home" />
    &nbsp;
    <asp:Button ID="btnEditComments" runat="server" onclick="btnEditComments_Click" 
        Text="Edit Your Comments" />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource_SubjectReplies" runat="server" ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>"
        
        
        
        SelectCommand="SELECT p.postMessage, p.postDate, p.postUsername FROM hampson_wbsd14_ass1_forum AS f INNER JOIN hampson_wbsd14_ass1_posts AS p ON f.forumID = p.postSID WHERE (f.forumID = @forumID) ORDER BY p.postDate">
        <SelectParameters>
            <asp:SessionParameter Name="forumID" SessionField="sessionSubjectID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblWriteReply" runat="server" Font-Bold="True" 
        Text="Post a Reply:"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="txtPostReply" runat="server" Height="65px" 
        TextMode="MultiLine" Width="450px"></asp:TextBox>
    <br />
    <asp:Button ID="btnSubmitReply" runat="server" onclick="btnSubmitReply_Click" 
        Text="Submit" />
&nbsp;
    <br />
    <br />
</asp:Content>
