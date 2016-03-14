<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<fieldset style="height:200px">
    <legend>Login:</legend>
    <p>
        <asp:Label ID="lblUserName" runat="server" CssClass="grid_2 prefix_1" Text="Username"></asp:Label>
        &nbsp;<asp:TextBox ID="txtUserName" runat="server" ValidationGroup="LoginPage"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="valUsername" runat="server" ControlToValidate="txtUserName"
            CssClass="error" ErrorMessage="Please enter your Username" ValidationGroup="LoginPage">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="lblPassword" runat="server" CssClass="grid_2 prefix_1" Text="Password"></asp:Label>
        &nbsp;<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ValidationGroup="LoginPage"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="valPassword" runat="server" ControlToValidate="txtPassword"
            CssClass="error" ErrorMessage="Please enter your Password" ValidationGroup="LoginPage">*</asp:RequiredFieldValidator>
    </p>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="prefix_1">
                <asp:Button ID="btnLogin" runat="server" CssClass="grid_2" Text="Log In" OnClick="btnLogin_Click"
                    ValidationGroup="Login Page" />
                &nbsp;
            </div>
            <p> </p>
            <p>
                <asp:Label ID="lblError" runat="server" CssClass="error" Text="Invalid Username / Password"
                    Visible="False"></asp:Label>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </p>
        </ContentTemplate>
    </asp:UpdatePanel>
    </fieldset>
    <p>
            <asp:LinkButton ID="lnkForgotPwd" runat="server" OnClick="lnkForgotPwd_Click">Forgotten Password?</asp:LinkButton>
            <p>
                <asp:Label ID="lblNewUser" runat="server" Text="New User? Register Here!" CssClass="grid_3"></asp:Label>
                &nbsp;
                <asp:Button ID="btnNewRegistration" runat="server" OnClick="btnNewRegistration_Click"
                    Text="Register" Width="100px" />
            </p>
</asp:Content>
