<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Course_List.aspx.cs" Inherits="ASF.Web.Admin.Course_List" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function Search_Click()
        {
            var dialog = $("#dvSearch").dialog({ resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));
        }
    </script>
    <h2>Course Management</h2>
    <div class="gridForm">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnRefresh" runat="server" CssClass="toolbarImageButton refresh" Text="Refresh" OnClick="btnRefresh_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new Course" OnClick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="toolbarImgButton" runat="server" CssClass="toolbarImageButton search" OnClientClick="Search_Click(); return false;" Text="Search"></asp:Button>
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
             <EmptyDataTemplate>
                        There are no courses in this view. Please refine your <a href="javascript:;" onclick="Search_Click();">search</a>.
                </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>
                            Description</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((Course)Container.DataItem).Description %>'
                            CommandName="itemDetail" CommandArgument='<%# ((Course)Container.DataItem).CourseID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>
                            Institution Type</label>
                    </HeaderTemplate>
                    <ItemStyle Width="200px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblInstitutionType" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div id="dvSearch" class="hidden" title="Course Search Criteria  <img src='/Images/Filter.png' style='position: relative; top: 2px; left: 10px;' alt=''>">
            <table>
                <tr>
                    <td style="width: 150px;">
                        <label>
                            Institution Type</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddSearchInstitutionTypeOperator" runat="server" Width="80px">
                        </asp:DropDownList>
                        <asp:DropDownList runat="server" ID="InstitutionType" />
                    </td>
                    <tr>
                        <td>
                            <label>
                                Description</label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddSearchDescriptionOperator" runat="server" Width="80px">
                            </asp:DropDownList>
                            <asp:TextBox ID="txtSearchDescription" runat="server" Width="120px"></asp:TextBox>
                        </td>
                    </tr>
                <tr>
                    <td style="height: 10px;">
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
