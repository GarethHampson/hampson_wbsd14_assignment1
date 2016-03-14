<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true" CodeFile="AllMembers.aspx.cs" Inherits="allmembers" %>

<%@ Register src="LoggedInDetails.ascx" tagname="LoggedInDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        All Members of Salford Friends Network:</h1>
<p>
        <asp:Label ID="lblSearchFirstName" runat="server" Text="First Name:"></asp:Label>
&nbsp;<asp:TextBox ID="txtSearchFirstname" runat="server" 
            ToolTip="You can use * as a wildcard"></asp:TextBox>
&nbsp;<asp:Label ID="lblSearchSurname" runat="server" Text="Surname:"></asp:Label>
&nbsp;<asp:TextBox ID="txtSearchSurname" runat="server" 
            ToolTip="You can use * as a wildcard"></asp:TextBox>
&nbsp;
        <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
            Text="Search" />
&nbsp;
</p>
    <p>
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
        <asp:Button ID="btnViewAllMembers" runat="server" 
            onclick="btnViewAllMembers_Click" Text="View All Members" />
        <asp:Button ID="btnViewFriends" runat="server" onclick="btnViewFriends_Click" 
            Text="View your Friends" />
</p>
    <p>
        <asp:DataList ID="dataList_Members" runat="server" DataSourceID="SqlDataSource_AllMembers" 
            onitemcommand="DataList_Members_ItemCommand">
        <ItemTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Image ID="profilephotoLabel" runat="server" ImageURL='<%# Eval("profilephoto") %>' style="width:100px; height:100px" />
                    </td>
                    <td style="float:left; padding-left: 20px; width:350px">
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' Style="font-size: large; font-weight: bold; vertical-align: top" />
                        <br />
                        <asp:Label ID="lblUser" CssClass="descriptivelabel" runat="server" Text="Username:"></asp:Label>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                        <br />
                        <asp:Label ID="lblLoc" CssClass="descriptivelabel" runat="server" Text="Location:"></asp:Label>
                        <asp:Label ID="locationLabel" runat="server" Text='<%# Eval("location") %>' />
                        <br />
                        <asp:Label ID="lblJoin" CssClass="descriptivelabel" runat="server" Text="Joined:"></asp:Label>
                        <asp:Label ID="joiningdateLabel" runat="server" Text='<%# Eval("joiningdate", "{0:d}") %>' />
                        <br />
                      </td>
                    <td style="float:left">
                        <asp:Button ID="btnSendMsg" runat="server" Text="Send Message" CommandName="SendMessage" /> <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" CommandName="ViewProfile" />
                    </td></span>
                </tr>
            </table>
            
        </ItemTemplate>

        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource_AllMembers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>" 
            
            
            SelectCommand="hampson_wbsd14_ass1_showallmembers" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="sessionUserName" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
<asp:SqlDataSource ID="SqlDataSource_SearchMembers" runat="server" 
    ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>" 
    SelectCommand="hampson_wbsd14_ass1_searchmembers" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="username" SessionField="sessionUserName" 
            Type="String" />
        <asp:ControlParameter ControlID="txtSearchSurname" Name="surname" 
            PropertyName="Text" />
        <asp:ControlParameter ControlID="txtSearchFirstname" Name="forename" 
            PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_FilterOnFriends" runat="server" 
    ConnectionString="<%$ ConnectionStrings:wbsdConnectionString %>" 
    SelectCommand="hampson_wbsd14_ass1_filteronfriendlist" 
    SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="username" SessionField="sessionUserName" 
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

