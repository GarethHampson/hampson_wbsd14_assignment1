<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegistrationProfile.aspx.cs" Inherits="RegistrationProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        Welcome to Salford Friends Network!</h1>
    <h3>
        Please complete your profile below:</h3>
    <p>
        <asp:Label ID="lblForename" runat="server" CssClass="grid_3" 
            Text="Your Forename:"></asp:Label>
        <asp:TextBox ID="txtForename" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valForename" runat="server" 
            ControlToValidate="txtForename" CssClass="error" 
            ErrorMessage="Please enter your Forename">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="lblSurname" runat="server" CssClass="grid_3" 
            Text="Your Surname:"></asp:Label>
        <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
    &nbsp;<asp:RequiredFieldValidator ID="valSurname" runat="server" 
            ControlToValidate="txtSurname" CssClass="error" 
            ErrorMessage="Please enter your Surname">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="lblDOB" runat="server" CssClass="grid_3" 
            Text="Your Date of Birth:"></asp:Label>
        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
        &nbsp;(DD/MM/YYYY)
        <asp:RequiredFieldValidator ID="valDoB" runat="server" 
            ControlToValidate="txtDOB" CssClass="error" 
            ErrorMessage="Please enter your Date of Birth">*</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="dateValidator" runat="server" 
            ControlToValidate="txtDOB" CssClass="error" 
            ErrorMessage="Please enter in the format DD/MM/YYYY" Operator="DataTypeCheck" 
            Type="Date"></asp:CompareValidator>
    </p>
    <p>
        <asp:Label ID="lblGender" runat="server" CssClass="grid_3" Text="Your Gender:"></asp:Label>
        <asp:RadioButton ID="rdoMale" runat="server" Text="Male" GroupName="gender" />
&nbsp;
        <asp:RadioButton ID="rdoFemale" runat="server" Text="Female" 
            GroupName="gender" />
    </p>
    <p>
        <asp:Label ID="lblCity" runat="server" CssClass="grid_3" 
            Text="Your Town / City:"></asp:Label>
        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblAboutYou" runat="server" CssClass="grid_3" Text="About you:"></asp:Label>
        <asp:TextBox ID="txtAboutYou" runat="server" Height="47px" TextMode="MultiLine" 
            Width="262px"></asp:TextBox>
    </p>
    <p>
        <strong>Upload a profile photo: </strong>
    <p>
        <asp:FileUpload ID="FileUpload1" runat="server" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnProfileImageUpload" runat="server" 
            onclick="btnProfileImageUpload_Click" Text="Upload" />
    </p>
    <p>
        &nbsp;
        &nbsp;
        <asp:Label ID="lblProfileImageStatus" runat="server"></asp:Label>
    </p>
    <p>
        </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        CssClass="error" />
    <p>
        <asp:Button ID="btnComplete" runat="server" Text="Complete Registration" 
            onclick="btnComplete_Click" />
    &nbsp;<asp:Label ID="lblRegStatus" runat="server"></asp:Label>
    </p>
</asp:Content>

