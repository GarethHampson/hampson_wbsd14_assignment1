<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true" CodeFile="ForumNewSubject.aspx.cs" Inherits="ForumNewSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        <asp:Label ID="Label1" runat="server" Text="New Subject"></asp:Label>
    </h1>
    <p>
        <asp:Label ID="lblSubject" runat="server" Text="Subject:" CssClass="grid_1"></asp:Label>
&nbsp;<asp:TextBox ID="txtNewSubject" runat="server" Width="375px"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtNewSubject" ErrorMessage="RequiredFieldValidator" 
            CssClass="error">You need to enter the subject.</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="lblNewBody" runat="server" Text="Body:" CssClass="grid_1"></asp:Label>
&nbsp;<asp:TextBox ID="txtNewBody" runat="server" Height="134px" TextMode="MultiLine" 
            Width="375px"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtNewBody" ErrorMessage="RequiredFieldValidator" 
            CssClass="error">You need to enter the body.</asp:RequiredFieldValidator>
    </p>
    <div class="grid_3 push_2">
        <asp:Button ID="btnNewSubmit" runat="server" onclick="btnNewSubmit_Click" 
            Text="Submit" />
            &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" 
            CausesValidation="False" onclick="btnCancel_Click" />
            </div>
   
</asp:Content>

