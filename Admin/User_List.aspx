<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="User_List.aspx.cs" Inherits="ASF.Web.Admin.User_List" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>User Management</h2>

    <div class="gridForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnRefresh" runat="server" CssClass="toolbarImageButton refresh" Text="Refresh" OnClick="btnRefresh_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new User" OnClick="btnAdd_Click" />
                </td>
                <td style="width: 100%;">&nbsp;</td>
            </tr>
        </table>

        <asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0px;"
            GridLines="Both" AutoGenerateColumns="false" Width="100%" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />

            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Username</label>
                    </HeaderTemplate>
                    <ItemStyle/>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnUsername" runat="server" Text='<%# ((User)Container.DataItem).Username %>' CommandName="itemDetail" CommandArgument='<%# ((User)Container.DataItem).UserID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" Width="250px" />
                    <HeaderTemplate>
                        <label>Email</label>
                    </HeaderTemplate>
                    <ItemStyle/>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# ((User)Container.DataItem).Email %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="150px" />
                    <HeaderTemplate>
                        <label>Status</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"/>
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="150px" />
                    <HeaderTemplate>
                        <label>Last Login Date</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblLastLoginDate" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>

</asp:Content>
