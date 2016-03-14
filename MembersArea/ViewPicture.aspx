<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true"
    CodeFile="ViewPicture.aspx.cs" Inherits="MembersArea_ViewPicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Image ID="imgViewPicture" runat="server" Style="max-width: 400px" />
    <br />
    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1">
        <EmptyDataTemplate>
            <span>There are no comments for this picture.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <span style="">
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") + " commented: (" + Eval("datestamp") + ")"%>' />
                <br />
                <asp:Label ID="commentLabel" runat="server" Text='<%# Eval("comment") %>' Style="font-weight:normal" />
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PictureCommentsTableAdapters.hampson_wbsd14_ass1_commentsTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="pictureID" Type="String" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="comment" Type="String" />
            <asp:Parameter Name="datestamp" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="pictureURL" SessionField="sessionviewPicture" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:TextBox ID="txtComment" runat="server" Height="69px" TextMode="MultiLine" Width="407px"></asp:TextBox>
    <asp:Button ID="btnSubmitComment" runat="server" OnClick="btnSubmitComment_Click"
        Text="Submit Comment" />
    <br />
    <br />
    <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close" />
    &nbsp;<asp:Button ID="btnDeletePicture" runat="server" OnClick="btnDeletePicture_Click"
        Text="Delete Picture" />
    <br />
    <br />
    <asp:Panel ID="pnlDeleteCheck" runat="server">
        <asp:Label ID="lblSure" runat="server" Text="Are you sure you want to delete?"></asp:Label>
        <br />
        <asp:Button ID="btnYes" runat="server" OnClick="btnYes_Click" Text="Yes" />
        &nbsp;<asp:Button ID="btnNo" runat="server" Text="No" />
        <br />
    </asp:Panel>
    <br />
    <br />
</asp:Content>
