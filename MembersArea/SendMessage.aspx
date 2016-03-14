<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true" CodeFile="SendMessage.aspx.cs" Inherits="SendMessage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="Message From:"></asp:Label>
&nbsp;
        <asp:Label ID="lblMsgFrom" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Message To:"></asp:Label>
&nbsp;
        <asp:Label ID="lblMsgTo" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label3" runat="server" Text="Subject: "></asp:Label>
&nbsp;
        <asp:TextBox ID="txtMsgSubject" runat="server" Width="479px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_MessageSubject" runat="server" 
            ControlToValidate="txtMsgSubject" CssClass="error" 
            ErrorMessage="Enter a subject"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="Label4" runat="server" Text="Message:"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="txtMsgBody" runat="server" Height="143px" TextMode="MultiLine" 
            Width="690px"></asp:TextBox>
    </p>
    <asp:Button ID="btnMsgSend" runat="server" onclick="btnMsgSend_Click" 
        Text="Send Message" />
&nbsp;
    <asp:Button ID="btnMsgCancel" runat="server" Text="Cancel Message" 
    onclick="btnMsgCancel_Click" CausesValidation="False" />
    <br />
&nbsp;
</asp:Content>

