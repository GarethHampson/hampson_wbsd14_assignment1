<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <h1>Welcome to Salford Friends Network! 
    </h1>
<h1>Please register below.
    </h1>
    &nbsp;<p>    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>     
   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblRegUserName" runat="server" CssClass="grid_3" 
                Text="Choose a Username:"></asp:Label>
            <asp:TextBox ID="txtRegUserName" runat="server" ValidationGroup="registration"></asp:TextBox>
            &nbsp;
            <asp:RequiredFieldValidator ID="valUsername" runat="server" 
                ControlToValidate="txtRegUserName" CssClass="error" 
                ErrorMessage="Please enter a Username">*</asp:RequiredFieldValidator>
            &nbsp;
            <br />
            <asp:Label ID="lblUsernameError" runat="server" CssClass="error" 
                Text="This Username is taken. Please choose another." Visible="False"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <p>
        <asp:Label ID="lblPassword" runat="server" CssClass="grid_3" 
            Text=" Enter your Password:"></asp:Label>
        <asp:TextBox ID="txtRegPassword" runat="server" ValidationGroup="registration" 
            TextMode="Password"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="valPassword" runat="server" 
            ControlToValidate="txtRegPassword" CssClass="error" 
            ErrorMessage="Enter the password">*</asp:RequiredFieldValidator>
</p>
<p>
    <asp:Label ID="lblCheckPassword" runat="server" CssClass="grid_3" 
        Text="Enter Password again:"></asp:Label>
    <asp:TextBox ID="txtRegPwdCheck" runat="server" ValidationGroup="registration" 
        TextMode="Password"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="valPwdCheck" runat="server" 
        ControlToValidate="txtRegPwdCheck" CssClass="error" 
        ErrorMessage="Enter the Password again">*</asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="valcompPassword" runat="server" 
        ControlToCompare="txtRegPassword" ControlToValidate="txtRegPwdCheck" 
        CssClass="error" ErrorMessage="The Passwords don't match">*</asp:CompareValidator>
</p>
<p>
    <asp:Label ID="lblEmail" runat="server" CssClass="grid_3" 
        Text="Enter your Email:"></asp:Label>
    <asp:TextBox ID="txtRegEmail" runat="server" ValidationGroup="registration"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="valEmail" runat="server" 
        ControlToValidate="txtRegEmail" CssClass="error" 
        ErrorMessage="Please enter your email.">*</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="expvalEmail" runat="server" 
        ControlToValidate="txtRegEmail" CssClass="error" 
        ErrorMessage="Please use a recognised email format." 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
</p>
<p>
    <asp:Button ID="btnRegister" runat="server" Text="Register" 
        onclick="btnRegister_Click" />
</p>
    <p>
        &nbsp;</p>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" 
    CssClass="error" />
</asp:Content>

