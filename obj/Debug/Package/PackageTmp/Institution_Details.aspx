<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Institution_Details.aspx.cs" Inherits="ASF.Web.Institution_Details" %>

<%@ Register src="UserControls/CourseDetails.ascx" tagname="CourseDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        function AddCourse_Click() {

            ShowInstitutionCourseDialog();

            LoadInstitutionCourseDetails(0, "", "", "", "", "", "");
        }

        function InstitutionCourse_Clicked(id) {

            var params = '{id:' + id +  '}';

            $.ajax({
                type: "POST",
                url: "Institution_Details.aspx/GetInstitutionCourseDetails",
                data: params,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    var json = jQuery.parseJSON(data.d);

                    ShowInstitutionCourseDialog();

                    LoadInstitutionCourseDetails(json.InstitutionCourseID, json.InstitutionID, json.CourseID, json.CourseLevelID, json.PayCycles, json.CourseCost, json.IsFulltime);
                }
            });
        }

        function ShowInstitutionCourseDialog() {

            var dialog = $("#dvInstitutionCourseDetails").dialog({ position: [200, 195], resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));
        }

        function LoadInstitutionCourseDetails(institutionCourseID, courseName, courseType, courseLevel, payCycles, courseCost, fullTime) {

            $("#<%= hdnInstitutionCourseID.ClientID %>").val(institutionCourseID);
            $("#<%= ddCourse.ClientID %>").val(courseName);
            $("#<%= ddInstitutionType.ClientID %>").val(courseType);
            $("#<%= ddCourseLevel.ClientID %>").val(courseLevel);
            $("#<%= txtPaycycles.ClientID %>").val(payCycles);
            $("#<%= txtCourseCost.ClientID %>").val(courseCost);
            $("#<%= cbFulltime.ClientID %>").attr("checked", fullTime);

        }
        
    </script>

    <h2>Institution Details</h2>

    <div class="detailsForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Save.png) no-repeat" Text="Save Details" OnClick="btnSave_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnGridView" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/GridView.png) no-repeat" Text="Institution List" OnClick="btnGridView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Add.png) no-repeat" Text="Add new Institution" OnClick="btnAdd_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        
        <br />

        <table>
            <tr>
                <td><label>Institution Type</label></td>
                <td><asp:DropDownList ID="ddInstitutionType" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 150px;"><label>Institution Name</label></td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="DescriptionRequired" runat="server" 
                        ControlToValidate="txtName" 
                        CssClass="failureNotification" ErrorMessage="Description is required." ToolTip="Description is required." 
                        ValidationGroup="SaveValidationGroup">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><label>Application Status</label></td>
                <td><asp:DropDownList ID="ddApplicationStatus" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><label>Institution Status</label></td>
                <td><asp:DropDownList ID="ddInstitutionStatus" runat="server"></asp:DropDownList></td>
            </tr>
        </table>
        
        <br />

        <table>
            <tr>
                <td style="width: 450px;">
                    <table>
                        <tr>
                            <td style="width: 150px;"><label>Principal</label></td>
                            <td><asp:TextBox ID="txtPrincipal" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Bursary Representative</label></td>
                            <td><asp:TextBox ID="txtBursaryRepresentative" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Contact Number</label></td>
                            <td><asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Fax</label></td>
                            <td><asp:TextBox ID="txtFaxNo" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Mobile</label></td>
                            <td><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Email</label></td>
                            <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td style="width: 150px;"><h5>Bank Details</h5></td>
                        </tr>
                        <tr>
                            <td><label>Bank</label></td>
                            <td><asp:TextBox ID="txtBankName" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Account Type</label></td>
                            <td><asp:DropDownList ID="ddBankAccountType" runat="server"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td><label>Account Name</label></td>
                            <td><asp:TextBox ID="txtBankAccountName" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Account Number</label></td>
                            <td><asp:TextBox ID="txtBankAccountNo" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Branch</label></td>
                            <td><asp:TextBox ID="txtBankBranch" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Branch Code</label></td>
                            <td><asp:TextBox ID="txtBankBranchCode" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Validity</label></td>
                            <td><asp:CheckBox ID="cbBankValidity" runat="server" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table>
                        <tr>
                            <td style="width: 150px; vertical-align:top;"><label>Comments</label></td>
                            <td><asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <br />
        <hr style="width: 880px;" />
        <br />

        <h5>Address</h5>

        <table>
            <tr>
                <td style="width: 450px;">
                    <table>
                        <tr>
                            <td style="width: 150px;"><label>Address Line 1</label></td>
                            <td><asp:TextBox ID="txtAddressLine1" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Address Line 2</label></td>
                            <td><asp:TextBox ID="txtAddressLine2" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Address Line 3</label></td>
                            <td><asp:TextBox ID="txtAddressLine3" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Suburb</label></td>
                            <td><asp:TextBox ID="txtAddressSuburb" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td style="width: 150px;"><label>City</label></td>
                            <td><asp:TextBox ID="txtAddressCity" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Province</label></td>
                            <td><asp:DropDownList ID="ddAddressProvince" runat="server" DataValueField="ProvinceID" DataTextField="Description"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td><label>Country</label></td>
                            <td><asp:DropDownList ID="ddAddressCountry" runat="server" DataValueField="CountryID" DataTextField="Description"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td><label>Postal Code</label></td>
                            <td><asp:TextBox ID="txtAddressPostCode" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Validity</label></td>
                            <td><asp:CheckBox ID="cbAddressValidity" runat="server" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <asp:Panel ID="pnlExistingInstitute" runat="server">
            
            <br />
            <hr style="width: 880px;" />
            <br />

            <table>
                <tr>
                    <td><h5>Institution Courses</h5></td>
                    <td style="width: 20px;">
                        <img src="Images/Toolbar/Add.png" class="toolbarButton" title="Add new institution course" alt="Add new institution course" onclick="AddCourse_Click();" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridViewCourses" runat="server" CssClass="grid" style="margin: 0px;"
                            GridLines="Both" AutoGenerateColumns="false" Width="780px" 
                            OnRowCommand="GridViewCourses_RowCommand">
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
                                        <a onclick='InstitutionCourse_Clicked(<%# ((ASF.BusinessObjects.InstitutionCourse)Container.DataItem).InstitutionCourseID %>);' style="cursor: pointer;" ><%# ((ASF.BusinessObjects.InstitutionCourse)Container.DataItem).CourseLevel.Description %></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <label>Pay Cycles</label>
                                    </HeaderTemplate>
                                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblPayCycles" runat="server" Text='<%# ((ASF.BusinessObjects.InstitutionCourse)Container.DataItem).PayCycles %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <label>Course Cost</label>
                                    </HeaderTemplate>
                                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCourseCost" runat="server" Text='<%# ((ASF.BusinessObjects.InstitutionCourse)Container.DataItem).CourseCost.ToString("0.00") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:TemplateField>
                                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="/Images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this course?');" CommandName="delete" CommandArgument='<%# ((ASF.BusinessObjects.InstitutionCourse)Container.DataItem).InstitutionCourseID %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                            <EmptyDataTemplate>
                                <label>No records found</label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            
            <br />
            <hr style="width: 880px;" />
            <br />

            <table>
                <tr>
                    <td style="width: 500px;"><label>Number of Students "Active" on system (i.e. current year with bursary)</label></td>
                    <td><asp:TextBox ID="txtActiveStudents" runat="server" ReadOnly="true" style="text-align: center;"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Total Number of student from this institution</label></td>
                    <td><asp:TextBox ID="txtTotalStudents" runat="server" ReadOnly="true" style="text-align: center;"></asp:TextBox></td>
                </tr>
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                    <td>
                        <div class="buttonWrapper">
                            <asp:Button ID="btnPrintBursaryRepPack" runat="server" CssClass="button" Text="Print Bursary Rep Pack" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><asp:CheckBox ID="cbBursaryRepPackSent" runat="server" Text="Bursary Rep Pack sent" CssClass="checkbox" /></td>
                </tr>
            </table>

        </asp:Panel>
        


    </div>

    <div id="dvInstitutionCourseDetails" class="popup" style="display: none;" title="Institution Course Details">
        
        <asp:HiddenField ID="hdnInstitutionCourseID" runat="server" />

        <table>
            <tr>
                <td style="width: 150px;"><label>Course</label></td>
                <td><asp:DropDownList ID="ddCourse" runat="server" Width="200px" DataValueField="CourseID" DataTextField="Description"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><label>Level</label></td>
                <td><asp:DropDownList ID="ddCourseLevel" runat="server" Width="200px" DataValueField="CourseLevelID" DataTextField="Description"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><label>Pay Cycles</label></td>
                <td><asp:TextBox ID="txtPaycycles" runat="server" CssClass="integer"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Course Cost</label></td>
                <td><asp:TextBox ID="txtCourseCost" runat="server" CssClass="numeric"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Full Time</label></td>
                <td><asp:CheckBox ID="cbFulltime" runat="server" /></td>
            </tr>
            <tr><td style="height: 10px;"></td></tr>
            <tr>
                <td colspan="2">
                    <div class="buttonWrapper">
                        <asp:Button ID="btnSaveInstitutionCourseDetails" runat="server" Text="Save" CssClass="button" Width="70px" onclick="btnSaveInstitutionCourseDetails_Click" />
                    </div>
                </td>
            </tr>
        </table>

    </div>

</asp:Content>
