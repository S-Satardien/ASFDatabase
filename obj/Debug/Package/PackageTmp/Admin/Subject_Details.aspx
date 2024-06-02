<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Subject_Details.aspx.cs" Inherits="ASF.Web.Admin.Subject_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Subject Details</h2>

    <div class="detailsForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Save.png) no-repeat" Text="Save Details" OnClick="btnSave_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnGridView" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/GridView.png) no-repeat" Text="Subject List" OnClick="btnGridView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Add.png) no-repeat" Text="Add new Subject" OnClick="btnAdd_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        
        <br />

        <table>
            <tr>
                <td style="width: 100px;"><label>Description</label></td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="DescriptionRequired" runat="server" ControlToValidate="txtDescription" 
                        CssClass="failureNotification" 
                        ErrorMessage="Description is required." 
                        ToolTip="Description is required." 
                        ValidationGroup="SaveValidationGroup">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
