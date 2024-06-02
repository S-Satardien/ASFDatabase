<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Institution_CourseLevelSubjects.aspx.cs" Inherits="ASF.Web.Admin.Institution_CourseLevelSubjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript">

        function AddCourseLevelSubject_Click()
        {
            ShowInstitutionCourseLevelSubjectDialog();

            $("#<%= hdninstitutionCourseLevelSubjectID.ClientID %>").val(0);
            $("#<%= ddSubjects.ClientID %>").val(0);

            return false;
        }

        function ShowInstitutionCourseLevelSubjectDialog()
        {
            var dialog = $("#dvInstitutionCourseLevelSubjectDetails").dialog({ resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));
        }

    </script>
    <h2><asp:Label ID="lblHeading" runat="server" Text="Institution Course Level Subjects"></asp:Label></h2>
    <div class="detailsForm">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnDetailsView" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Details.png) no-repeat" Text="Institution Course Levels" OnClick="btnDetailsView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton" Style="background: url(/Images/Toolbar/Add.png) no-repeat"
                        Text="Add New Institution Course Level Subject" OnClientClick="return AddCourseLevelSubject_Click();" />
                </td>
                <td style="width: 100%;">
                    &nbsp;
                </td>
            </tr>
        </table>

        <asp:GridView ID="GridView1" runat="server" CssClass="grid" Style="margin: 0px;"
            GridLines="Both" AutoGenerateColumns="false" Width="98%" OnRowCommand="GridView1_RowCommand">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Subject</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:Label ID="lblSubject" runat="server" Text='<%# ((ASF.BusinessObjects.InstitutionCourseLevelSubject)Container.DataItem).Subject.Description %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                    <HeaderTemplate><label>Details</label></HeaderTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="/Images/Delete.png" CssClass="gridImageButton" ToolTip="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');" CommandName="deleteItem" CommandArgument='<%# ((ASF.BusinessObjects.InstitutionCourseLevelSubject)Container.DataItem).InstitutionCourseLevelSubjectID %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <label>No records found</label>
            </EmptyDataTemplate>
        </asp:GridView>
    
        <div id="dvInstitutionCourseLevelSubjectDetails" class="popup" style="display: none;" title="Institution Course Level Subject Details">
            <asp:HiddenField ID="hdninstitutionCourseLevelSubjectID" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="requiredField" ValidationGroup="Save"/>
            <table>
                <tr>
                    <td style="width: 150px;">
                        <label>Subject</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddSubjects" runat="server" Width="200px"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="valDescriptionRequired" runat="server" ControlToValidate="ddSubjects"
                            CssClass="requiredField" ErrorMessage="Please select a Course Level Subject." Text="*" ValidationGroup="Save"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="height: 10px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="buttonWrapper">
                            <asp:Button ID="btnSaveInstitutionCourseLevelDetails" runat="server" Text="Save" CssClass="button"
                                Width="70px" OnClick="btnSaveInstitutionCourseLevelDetails_Click" ValidationGroup="Save" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>

    </div>

</asp:Content>
