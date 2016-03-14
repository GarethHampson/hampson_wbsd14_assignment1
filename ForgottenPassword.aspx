<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgottenPassword.aspx.cs" Inherits="ForgottenPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset style="height:250px">
    <legend>Forgotten Password:</legend>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblUserName" runat="server" CssClass="grid_4" 
                    Text="Please enter your Username:"></asp:Label>
                <asp:TextBox ID="txtForgotUserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valUsername" runat="server" 
                    ControlToValidate="txtForgotUserName" CssClass="error" 
                    ErrorMessage="Please enter your Username">*</asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="lblPassword" runat="server" CssClass="grid_4" 
                    Text="Please enter your Email:"></asp:Label>
                <asp:TextBox ID="txtForgotEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valEmail" runat="server" 
                    ControlToValidate="txtForgotEmail" CssClass="error" 
                    ErrorMessage="Please enter your Email">*</asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" CssClass="grid_3" 
                    onclick="btnSendPassword_Click" Text="Send Password" />
                <br />
                <br />
                <asp:Label ID="lblForgotStatus" runat="server"></asp:Label>
                <br />
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    CssClass="error" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </fieldset>
    <p>    
            <asp:Button ID="btnReturnLogin" runat="server" Text="Return to Login" 
                onclick="btnReturnLogin_Click" CausesValidation="False" />
    </p>     
   
    <p>
        
    &nbsp;<asp:Label ID="Label1" runat="server" Text="New User? - Register Here!"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnNewRegistration" runat="server" Text="Register" 
            onclick="btnNewRegistration_Click" CausesValidation="False" />
        
    </p>
</asp:Content>

