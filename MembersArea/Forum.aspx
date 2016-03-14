<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="MembersArea_Forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        <asp:Label ID="lblForum" runat="server" Text="Welcome to the Forum!"></asp:Label>
    </h1>
    <asp:ListView ID="listView_ForumSubjects" runat="server" DataSourceID="SqlDataSource_ForumSubjects" 
        onitemcommand="listView_ForumSubjects_ItemCommand">
       
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="forumIDLabel" runat="server" Text='<%# Eval("forumID") %>' Visible=false/>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("forumSubject") %>' CommandName = "SelectSubject" style="padding-right:20px">LinkButton</asp:LinkButton>
                </td>
                <td>
                    <asp:Label ID="forumSUsernameLabel" runat="server" 
                        Text='<%# Eval("forumSUsername") %>' />
                </td>
                <td>
                    <asp:Label ID="NumberMessagesLabel" runat="server" 
                        Text='<%# Eval("NumberMessages") %>' />
                </td>
                <td>
                    <asp:Label ID="LatestDateLabel" runat="server" 
                        Text='<%# Eval("LatestDate") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" style="padding-right:20px">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server" style="padding-right:20px" >
                                    ID:</th>
                                <th runat="server" style="padding-right:20px">
                                    Subject:</th>
                                <th runat="server" style="padding-right:20px">
                                    Started by:</th>
                                <th runat="server" style="padding-right:20px">
                                    Replies:</th>
                                <th runat="server" style="padding-right:20px">
                                    Latest Reply:</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource_ForumSubjects" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>" 
        
        
        SelectCommand="hampson_wbsd14_ass1_forumsubjects" 
        SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <br />
    <p>
        <asp:Button ID="btnNewSubject" runat="server" onclick="btnNewSubject_Click" 
            Text="Start a New Subject" />
    </p>
</asp:Content>

