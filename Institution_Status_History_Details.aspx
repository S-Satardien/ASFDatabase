<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Institution_Status_History_Details.aspx.cs" Inherits="ASF.Web.Institution_Status_History_Details" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Institution Blacklist Status History - <%= institution %></h2>

    <div class="detailsForm">
        <table class="toolbar">
        <tr>
            <td class="toolbarCell">
                <asp:Button ID="btnInstitutionManagement" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/GridView.png) no-repeat" Text="Institution List" OnClick="btnInstitutionManagement_Click" />
            </td>
            <td style="width: 100%;">&nbsp;</td>
        </tr>
    </table>
    </div>
    <div class="gridForm">
        <asp:GridView runat="server" ID="gvInstitutionStatusDetails" CssClass="grid" style="margin: 0px;"  GridLines="Both" AutoGenerateColumns="false" Width="100%"  OnRowDataBound="gvInstitutionStatusDetails_RowDataBound">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <EmptyDataTemplate>No Institution Blacklisted Status history</EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" Width="180" />
                    <HeaderTemplate>
                        <label>Blacklist Status</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBlacklistStatus" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Comment</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblComment" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" Width="110" />
                    <HeaderTemplate>
                        <label>Blacklist Status Updated</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBlacklistStatusUpdated" runat="server" Text='<%# ((InstitutionBlacklistProcess)Container.DataItem).BlacklistStatusUpdated.ToString("yyyy-MM-dd HH:mm") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" Width="60" />
                    <HeaderTemplate>
                        <label>By User</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblUser" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
