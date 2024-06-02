<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CourseLevel_List.aspx.cs" Inherits="ASF.Web.Admin.CourseLevel_List" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Course Level Management</h2>
    <div class="gridForm">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnRefresh" runat="server" CssClass="toolbarImageButton refresh" Text="Refresh" OnClick="btnRefresh_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new course level" OnClick="btnAdd_Click" />
                </td>
                <td style="width: 100%;">
                    &nbsp;
                </td>
            </tr>
        </table>
        
        <div style="height:20px; text-align: right; display: block; font-family:Tahoma; font-size:8pt; ">
            <asp:Label ID="lblRecordCount" runat="server"></asp:Label>
        </div>

        <asp:GridView ID="GridView1" runat="server" CssClass="grid" Style="margin: 0px;"
            GridLines="Both" AutoGenerateColumns="false" Width="100%" OnRowCommand="GridView1_RowCommand"
            OnRowDataBound="GridView1_RowDataBound">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
             <EmptyDataTemplate>No records found</EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Description</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((CourseLevel)Container.DataItem).Description %>'
                            CommandName="itemDetail" CommandArgument='<%# ((CourseLevel)Container.DataItem).CourseLevelID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Institution Type</label>
                    </HeaderTemplate>
                    <ItemStyle Width="200px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblInstitutionType" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
