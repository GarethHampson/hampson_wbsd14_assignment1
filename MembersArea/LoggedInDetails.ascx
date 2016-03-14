<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoggedInDetails.ascx.cs" Inherits="LoggedInDetails" %>
<asp:Image ID="imgEmoticon" runat="server" ImageUrl="~/images/smile_20.png" />
&nbsp;<asp:Label ID="lblLoggedInUser" runat="server"></asp:Label>
&nbsp;<asp:Button ID="btnLogout" runat="server" onclick="btnLogout_Click" 
    Text="Logout" />

