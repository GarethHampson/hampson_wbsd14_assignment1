<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegistrationComplete.aspx.cs" Inherits="RegistrationComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        Registration Complete!</h1>
    <p>
        <asp:Label ID="lblWelcome" runat="server" ></asp:Label>
    </p>
    <p>
        <asp:Button ID="btnProfile" runat="server" Text="Go to Profile" 
            onclick="btnProfile_Click" />
    </p>
</asp:Content>

