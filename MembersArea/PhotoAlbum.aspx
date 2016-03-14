<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMembers.master" AutoEventWireup="true"
    CodeFile="PhotoAlbum.aspx.cs" Inherits="PhotoAlbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="picturescroll" style="width: 300px; float: left; height: 1103px;">
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="614px">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" 
                onitemcommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="pictureURL" runat="server" ImageUrl='<%# Eval("pictureURL") %>'
                                    Style="width: 100px; height: 100px; float:left" />
                                <br />
                                <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                                <br />
                                
                            </td>
                            <td >
                                <asp:Button ID="btnSelectImage" runat="server" Text="Select Image" CommandName="SelectImage"/>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="PictureGalleryTableAdapters.hampson_wbsd14_ass1_picturesTableAdapter" 
                onselecting="ObjectDataSource1_Selecting">
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="sessionUserName" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </asp:Panel>
    </div>
    <div>
    <asp:Panel ID="Panel2" runat="server">
        <p>
            <asp:Label ID="lblSelectedImage" runat="server"></asp:Label>
        </p>
    </asp:Panel>
    
        <p>
            <asp:Image ID="imgSelectedImage" runat="server" />
        </p>
        <p>
            <asp:Button ID="btnUseProfilePic" runat="server" Text="Set Profile Picture" 
                onclick="btnUseProfilePic_Click" />
        </p>
        <p>
            <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                Text="Cancel" />
        </p>
        <p>
            &nbsp;</p>
    </div>
</asp:Content>
