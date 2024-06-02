<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Institution_Courses.aspx.cs" Inherits="ASF.Web.Admin.Institution_Courses" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript">
        var courseDropDown = '#<%= ddCourse.ClientID %>';
        
        $(function ()
            {
            $(courseDropDown).change(function ()
                {
                var courseID = $(this).val();
                $("#<%= hdnCourseID.ClientID %>").val(courseID);
            });
            if(<%=ShowPopup.ToString().ToLowerInvariant() %>)
            {
                ShowInstitutionCourseDialog();
            }
            $("#<%= btnSaveInstitutionCourseDetails.ClientID %>").unbind("click").removeAttr("onclick").bind("click", function() {
                var result = ValidateForm();
                
                if (result.valid)
                {
                    __doPostBack("<%= btnSaveInstitutionCourseDetails.UniqueID %>", "OnClick");
                }
                else
                {
                    alert(result.message);
                }
            });
        });

        function AddCourse_Click()
        {
            ShowInstitutionCourseDialog();

            LoadInstitutionCourseDetails(0, "", "", 2, 0, false, false);

            return false;
        }

        function InstitutionCourse_Clicked(institutionCourseID)
        {
            var params = '{institutionCourseID:' + institutionCourseID + '}';
            
            $.ajax({
                type: "POST",
                url: "Institution_Courses.aspx/GetInstitutionCourseDetails",
                data: params,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    var json = jQuery.parseJSON(data.d);

                    ShowInstitutionCourseDialog();

                    LoadInstitutionCourseDetails(json.InstitutionCourseID, json.Description, json.CourseID, json.PayCycles, json.CourseCost, json.IsFulltime, true);
                    $("#<%= hdnCourseID.ClientID %>").val(json.CourseID);
                }
            });

            return false;
        }

        function ShowInstitutionCourseDialog()
        {
            var dialog = $("#dvInstitutionCourseDetails").dialog({ resizable: false, width: "500px", modal: true });
            dialog.parent().appendTo($("form:first"));
        }

        function LoadInstitutionCourseDetails(institutionCourseID, courseName, courseID, payCycles, courseCost, isFullTime, existingItem)
        {
            $("#<%= hdnInstitutionCourseID.ClientID %>").val(institutionCourseID);
            if (courseID > 0)
            {
                $("[id*=ValidationSummary]").hide();
                $(".requiredField:not([id*=ValidationSummary])").css("visibility", "hidden");
                $("#<%= hdnCourseID.ClientID %>").val(courseID);
                $("#<%= ddCourse.ClientID %>").val(courseID);
                $("#<%= ddPayCycles.ClientID %>").val(payCycles);
                $("#<%= txtCourseCost.ClientID %>").val(courseCost);
                $("#<%= cbFulltime.ClientID %>").attr("checked", isFullTime);
            }
            else
            {
                $("#<%= cbFulltime.ClientID %>").attr("checked", "checked");
                    $("#<%= txtCourseCost.ClientID %>").val("");
                $("#<%= ddPayCycles.ClientID %>").val("2");
            }

            if (existingItem)
            {
                $(courseDropDown).hide().attr("id", "ZZZ");
                $("#CurrentInstitutionCourse").show().text(courseName);
            } else {
                $("#ZZZ").show().attr("id", courseDropDown);
                $("#CurrentInstitutionCourse").text("").hide();
            }
        }
        
        function ValidateForm()
        {
            var result = {};
            result.valid = true;
            
            var cost = parseFloat($("#<%= txtCourseCost.ClientID %>").val());
            if (isNaN(cost) || cost < 1)
            {
                result.valid = false;
                result.message = "Please enter a valid course cost.";
            }
            
            if(cost > 100000)
            {
                result.valid = false;
                result.message = "The maximum course cost is R100 000.";
            }
            
            if($(courseDropDown).is(":visible") && $(courseDropDown).val() == null)
            {
                result.valid = false;
                result.message = "Please select a course.";
            }

            return result;
        }        
        
    </script>
    <h2><asp:Label ID="lblHeading" runat="server" Text="Institution Courses"></asp:Label></h2>
    <div class="detailsForm">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnDetailsView" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Details.png) no-repeat" Text="Institution Details" OnClick="btnDetailsView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton" Style="background: url(/Images/Toolbar/Add.png) no-repeat"
                        Text="Add new Institution Course" OnClientClick="return AddCourse_Click();" />
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
                        <label>Course Name</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPayCycles" runat="server" Text='<%# ((InstitutionCourse)Container.DataItem).Course.Description %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Pay Cycles</label>
                    </HeaderTemplate>
                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPayCycles" runat="server" Text='<%# ((InstitutionCourse)Container.DataItem).PayCycles %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Course Cost</label>
                    </HeaderTemplate>
                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblCourseCost" runat="server" Text='<%# ((InstitutionCourse)Container.DataItem).CourseCost.ToString("0.00") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Full Time</label>
                    </HeaderTemplate>
                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:CheckBox ID="cbIsFullTime" runat="server" Enabled="False" Checked='<%# ((InstitutionCourse)Container.DataItem).IsFulltime %>'></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                    <HeaderTemplate><label>Details</label></HeaderTemplate>
                    <ItemTemplate>
                        <img src="/Images/Toolbar/Details.png" class="gridImageButton" style="cursor: pointer;" alt="Edit course details" title="Edit course details"
                            onclick='return InstitutionCourse_Clicked(<%# ((InstitutionCourse)Container.DataItem).InstitutionCourseID %>);'></img>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <label>
                    No records found</label>
            </EmptyDataTemplate>
        </asp:GridView>
    
        <div id="dvInstitutionCourseDetails" class="popup" style="display: none;" title="Institution Course Details">
            <asp:HiddenField ID="hdnInstitutionCourseID" runat="server" />
            <asp:HiddenField ID="hdnCourseID" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="requiredField" />
            <table>
                <tr>
                    <td style="width: 150px;">
                        <label>Course</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddCourse" runat="server" Width="200px" DataValueField="CourseID" DataTextField="Description" >
                        </asp:DropDownList>
                        <label id="CurrentInstitutionCourse" class="hidden" style="width:200px;"></label>
                        <a href="/Admin/Course_Details.aspx?fromInstitutionCourses=<%=InstitutionID %>"><img src="/Images/Toolbar/Add.png" alt="Add new Course" style="height: 10px; width: 10px" /></a>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;">
                        <label>Pay Cycles</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddPayCycles" runat="server" Width="200px">
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;">
                        <label>Course Cost</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCourseCost" runat="server" CssClass="numericInput"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Full Time</label>
                    </td>
                    <td>
                        <asp:CheckBox ID="cbFulltime" runat="server" Checked="True" />
                    </td>
                </tr>
                <tr>
                    <td style="height: 10px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSaveInstitutionCourseDetails" UseSubmitBehavior="False" runat="server" Text="Save" CssClass="button" Width="70px" OnClick="btnSaveInstitutionCourseDetails_Click" />
                    </td>
                </tr>
            </table>
        </div>

    </div>
</asp:Content>
