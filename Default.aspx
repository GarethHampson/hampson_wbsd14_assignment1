<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="style1">
                        Welcome to Salford Friends Network.</h1>
    <p class="style1">
                        Please Log-in Here.</p>
    <p class="style1">
        <asp:Button ID="btnGoToLogin" runat="server" Text="Log In" 
            onclick="btnGoToLogin_Click" />
    </p>
</asp:Content>

