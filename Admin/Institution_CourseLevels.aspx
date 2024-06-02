<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Institution_CourseLevels.aspx.cs" Inherits="ASF.Web.Admin.Institution_CourseLevels" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript">

        function AddCourse_Click()
        {
            ShowInstitutionCourseLevelDialog();

            LoadInstitutionCourseLevelDetails(0, 0, 0, 0, false);

            return false;
        }

        function InstitutionCourseLevel_Clicked(id)
        {
            var params = '{id:' + id + '}';

            $.ajax({
                type: "POST",
                url: "Institution_CourseLevels.aspx/GetInstitutionCourseLevelDetails",
                data: params,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    var json = jQuery.parseJSON(data.d);

                    ShowInstitutionCourseLevelDialog();

                    LoadInstitutionCourseLevelDetails(json.InstitutionCourseLevelID, json.CourseLevelID, json.PayCycles, json.CourseCost, true);
                }
            });
        }

        function ShowInstitutionCourseLevelDialog()
        {
            var dialog = $("#dvInstitutionCourseLevelDetails").dialog({ resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));
        }

        function LoadInstitutionCourseLevelDetails(InstitutionCourseLevelID, courseLevelID, payCycles, courseCost, existingItem)
        {
            $("#<%= hdnInstitutionCourseLevelID.ClientID %>").val(InstitutionCourseLevelID);
            $("#<%= ddCourseLevel.ClientID %>").val(courseLevelID);
            $("#<%= txtCourseCost.ClientID %>").val(courseCost);

            if (payCycles > 0)
                $("#<%= ddPaycycles.ClientID %>").val(payCycles);
            else
                $("#<%= ddPaycycles.ClientID %>").val(2);
  

            if (existingItem)
                $("#<%= ddCourseLevel.ClientID %>").attr('disabled', 'disabled');
            else
                $("#<%= ddCourseLevel.ClientID %>").removeAttr('disabled');
        }

    </script>
    <h2><asp:Label ID="lblHeading" runat="server" Text="Institution Course Levels"></asp:Label></h2>
    <div class="detailsForm">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnDetailsView" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Details.png) no-repeat" Text="Institution Courses" OnClick="btnDetailsView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton" Style="background: url(/Images/Toolbar/Add.png) no-repeat"
                        Text="Add new Institution Course Level" OnClientClick="return AddCourse_Click();" />
                </td>
                <td style="width: 100%;">
                    &nbsp;
                </td>
            </tr>
        </table>

        <asp:GridView ID="GridViewCourses" runat="server" CssClass="grid" Style="margin: 0px;"
            GridLines="Both" AutoGenerateColumns="false" Width="98%" OnRowCommand="GridViewCourses_RowCommand">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Course Level</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnInstitutionCourseLevel" runat="server" Text='<%# ((ASF.BusinessObjects.InstitutionCourseLevel)Container.DataItem).CourseLevel.Description %>' CommandName="itemDetail" CommandArgument='<%# ((ASF.BusinessObjects.InstitutionCourseLevel)Container.DataItem).InstitutionCourseLevelID %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Pay Cycles</label>
                    </HeaderTemplate>
                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPayCycles" runat="server" Text='<%# ((ASF.BusinessObjects.InstitutionCourseLevel)Container.DataItem).PayCycles %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Course Cost</label>
                    </HeaderTemplate>
                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblCourseCost" runat="server" Text='<%# ((ASF.BusinessObjects.InstitutionCourseLevel)Container.DataItem).CourseCost.ToString("0.00") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                    <HeaderTemplate><label>Details</label></HeaderTemplate>
                    <ItemTemplate>
                        <img src="/Images/Toolbar/Details.png" class="gridImageButton" style="cursor: pointer;"
                            onclick='return InstitutionCourseLevel_Clicked(<%# ((ASF.BusinessObjects.InstitutionCourseLevel)Container.DataItem).InstitutionCourseLevelID %>);'></img>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                    <HeaderTemplate><label>Delete</label></HeaderTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="/Images/Delete.png" CssClass="gridImageButton" ToolTip="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');" CommandName="deleteItem" CommandArgument='<%# ((ASF.BusinessObjects.InstitutionCourseLevel)Container.DataItem).InstitutionCourseLevelID %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <label>No records found</label>
            </EmptyDataTemplate>
        </asp:GridView>
    
        <div id="dvInstitutionCourseLevelDetails" class="popup" style="display: none;" title="Institution Course Level Details">
            <asp:HiddenField ID="hdnInstitutionCourseLevelID" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="requiredField" ValidationGroup="Save"/>
            <table>
                <tr>
                    <td style="width: 150px;">
                        <label>Course Level</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddCourseLevel" runat="server" Width="200px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="valDescriptionRequired" runat="server" ControlToValidate="ddCourseLevel"
                            CssClass="requiredField" ErrorMessage="Please select a course Level." Text="*" ValidationGroup="Save"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Pay Cycles</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddPaycycles" runat="server">
                            <asp:ListItem runat="server" Value="1">1</asp:ListItem>
                            <asp:ListItem runat="server" Value="2">2</asp:ListItem>
                            <asp:ListItem runat="server" Value="3">3</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Course Cost</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCourseCost" runat="server" CssClass="numeric" MaxLength="6"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCourseCost" ValidationGroup="Save"
                            ValueToCompare="0" Operator="GreaterThan" Text="*" ErrorMessage="Course Cost must be greater than 0"
                            CssClass="requiredField"></asp:CompareValidator>
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
