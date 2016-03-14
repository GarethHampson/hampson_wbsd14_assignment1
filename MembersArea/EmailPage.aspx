<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true" CodeFile="EmailPage.aspx.cs" Inherits="EmailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label4" runat="server" Text="Email Page"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="To:"></asp:Label>
&nbsp;
    </p>
    <p>
        <asp:TextBox ID="txtEmailTo" runat="server" Width="573px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Subject:"></asp:Label>
&nbsp;
    </p>
    <p>
        <asp:TextBox ID="txtEmailSubject" runat="server" Width="577px"></asp:TextBox>
    &nbsp;</p>
    <p>
        <asp:Label ID="Label3" runat="server" Text="Message:"></asp:Label>
&nbsp;
    </p>
    <p>
        <asp:TextBox ID="txtEmailMessage" runat="server" Height="168px" 
            TextMode="MultiLine" Width="584px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnSendEmail" runat="server" onclick="btnSendEmail_Click" 
            Text="Send Email" />
&nbsp;&nbsp;
        <asp:Button ID="btnCancelEmail" runat="server" Text="Cancel Email" 
            onclick="btnCancelEmail_Click" />
&nbsp;
        <asp:Label ID="lblEmailStatus" runat="server"></asp:Label>
    </p>
</asp:Content>

