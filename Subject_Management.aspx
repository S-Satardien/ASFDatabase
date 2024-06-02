<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Subject_Management.aspx.cs" Inherits="ASF.Web.Subject_Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="gridForm">
        <h2>Subject Management</h2>

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:ImageButton ID="btnRefresh" runat="server" CssClass="toolbarButton" ImageUrl="~/Images/Toolbar/Refresh.png" ToolTip="Refresh data" OnClick="btnRefresh_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:ImageButton ID="btnAdd" runat="server" CssClass="toolbarButton" ImageUrl="~/Images/Toolbar/Add.png" ToolTip="Add new Subject" OnClick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <img src="Images/Toolbar/Search.png" class="toolbarButton" alt="Search" />
                </td>
                <td style="width: 100%;">&nbsp;</td>
            </tr>
        </table>

        <asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0px;"
            GridLines="Both" AutoGenerateColumns="false" Width="100%" OnRowCommand="GridView1_RowCommand">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />

            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Description</label>
                    </HeaderTemplate>
                    <ItemStyle Width="90%" />
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((ASF.BusinessObjects.Subject)Container.DataItem).Description %>' CommandName="itemDetail" CommandArgument='<%# ((ASF.BusinessObjects.Subject)Container.DataItem).SubjectID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>

</asp:Content>
