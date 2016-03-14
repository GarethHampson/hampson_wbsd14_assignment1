<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true" CodeFile="ProfileUpdate.aspx.cs" Inherits="ProfileUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>
        You can update your Profile here:</h3>
    <p>
        <asp:Label ID="lblCurrImg" runat="server" CssClass="grid_3" 
            Text="Your current image:"></asp:Label>
        <asp:Image ID="imgCurrentImage" runat="server" style="width:150px; height:150px"/>
&nbsp;
        <asp:Button ID="btnChangeImage" runat="server" onclick="btnChangeImage_Click" 
            Text="Change Image" />
    &nbsp;
    </p>
    <asp:Panel ID="Panel1" runat="server" Visible="False">
        <asp:Label ID="lblImageInfo" runat="server" 
            Text="You can either select an image from your Photo Album, or upload a new profile photo."></asp:Label>
        <br />
        <p>
            <strong>Upload a profile photo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Select from Photo Album:"></asp:Label>
        </p>
        <p>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnViewAlbum" runat="server" onclick="btnViewAlbum_Click" 
                Text="View Album" />
        </p>
        <p>
            &nbsp;
            <asp:Button ID="btnProfileImageUpload" runat="server" 
                onclick="btnProfileImageUpload_Click" Text="Upload" />
            &nbsp;
            <asp:Label ID="lblProfileImageStatus" runat="server"></asp:Label>
        </p>
        <br />
    </asp:Panel>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="lblForename" runat="server" CssClass="grid_3" 
            Text="Your Forename:"></asp:Label>
        <asp:TextBox ID="txtForename" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblSurname" runat="server" CssClass="grid_3" 
            Text="Your Surname:"></asp:Label>
        <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblEmail" runat="server" CssClass="grid_3" 
            Text="Your Email Address:"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblDOB" runat="server" CssClass="grid_3" 
            Text="Your Date of Birth?"></asp:Label>
        <asp:TextBox ID="txtDOB" runat="server" ontextchanged="txtDOB_TextChanged"></asp:TextBox>
        &nbsp;Please enter in DD/MM/YYYY format.
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
        &nbsp;</p>
    <p>
        <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" 
            onclick="btnComplete_Click" />
    &nbsp;<asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
            Text="Cancel Changes" />
&nbsp; <asp:Label ID="lblRegStatus" runat="server"></asp:Label>
    </p>
</asp:Content>

