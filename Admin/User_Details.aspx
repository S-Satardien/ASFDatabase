<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="User_Details.aspx.cs" Inherits="ASF.Web.Admin.User_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><asp:Label ID="lblHeading" runat="server" Text="User Details"></asp:Label></h2>

    <div class="detailsForm LeavePageNotiDialog">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton NoLeavePageNotiDialog save" Text="Save Details" OnClick="btnSave_Click" ValidationGroup="SaveValidationGroup" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnGridView" runat="server" CssClass="toolbarImageButton list" Text="User List" OnClick="btnGridView_Click" ValidationGroup="noGroup" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new User" OnClick="btnAdd_Click" ValidationGroup="noGroup" />
                </td>
                <td style="width: 100%;">&nbsp;</td>
            </tr>
        </table>
        
        <br />

        <table>
            <tr>
                <td style="width: 100px;"><label>Username</label></td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="DescriptionRequired" runat="server" ControlToValidate="txtUsername" 
                        CssClass="failureNotification" 
                        ErrorMessage="Description is required." 
                        ToolTip="Description is required." 
                        ValidationGroup="SaveValidationGroup">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><label>Password</label></td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><label>Email</label></td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" CssClass="failureNotification" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><label>Status</label></td>
                <td>
                    <asp:DropDownList ID="ddStatus" runat="server"></asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
