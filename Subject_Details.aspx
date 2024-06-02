<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Subject_Details.aspx.cs" Inherits="ASF.Web.Subject_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="detailsForm">

        <h2>Subject Details</h2>

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:ImageButton ID="btnSave" runat="server" CssClass="toolbarButton" ImageUrl="~/Images/Toolbar/Save.png" ToolTip="Save"  OnClick="btnSave_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:ImageButton ID="btnAdd" runat="server" CssClass="toolbarButton" ImageUrl="~/Images/Toolbar/Add.png" ToolTip="Add new subject" onclick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:ImageButton ID="btnGridView" runat="server" CssClass="toolbarButton" ImageUrl="~/Images/Toolbar/GridView.png" ToolTip="Subject list" onclick="btnGridView_Click" />
                </td>
                <td></td>
            </tr>
        </table>
        
        <br />

        <table>
            <tr>
                <td style="width: 100px;"><label>Description</label></td>
                <td><asp:TextBox ID="txtDescription" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
        </table>
    </div>

</asp:Content>
