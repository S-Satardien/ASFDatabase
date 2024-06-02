<%@ Page Title="Student Application Details" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Student_ApplicationDetails.aspx.cs" Inherits="ASF.Web.Student_ApplicationDetails" %>

<asp:Content ID="studentApplicationDetails" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#dvSchool').hide();

            $('#<%= rbInstitutionType.ClientID %>').change(function () {
                if ($('#<%= rbInstitutionType.ClientID %> [value=school]').is(":checked")) {
                    $('#dvFET').hide();
                    $('#dvSchool').show();
                }
                else if ($('#<%= rbInstitutionType.ClientID %> [value=FET]').is(":checked")) {
                    $('#dvSchool').hide();
                    $('#dvFET').show();
                }
            })
        });
    </script>

    <h2>Student Details</h2>
   
    <div class="detailsForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Save.png) no-repeat" Text="Save Details" OnClick="btnSave_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnDetailsView" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Form.gif) no-repeat" Text="Student Details" OnClick="btnDetailsView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnScholarshipDetails" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Scholar.png) no-repeat" Text="Scholarship Details" OnClick="btnScholarshipDetails_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        
        <br />

        <table cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td style="width: 180px;">
                    <label for="slctAcademicYear">Select Academic Year</label>
                </td>
                <td colspan="7">
                    <asp:DropDownList runat="server" ID="ddYear" AutoPostBack="true" OnSelectedIndexChanged="ddYear_SelectedIndexChanged" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtAwardStatus">Student Award Status</label>
                </td>
                <td colspan="7">
                    <asp:TextBox runat="server" ID="txtAwardStatus" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtAwardGrantedComments">Award Granted Comments</label>
                </td>
                <td colspan="7">
                    <asp:TextBox runat="server" ID="txtAwardGrantedComments" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtInstitutionName">Institution Name</label>
                </td>
                <td colspan="5">
                    <asp:DropDownList ID="ddInstitution" runat="server" DataValueField="InstitutionID" DataTextField="Name" AutoPostBack="true" OnSelectedIndexChanged="ddInstitution_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="rbInstitutionType">Institution Type</label>
                </td>
                <td>
                    <asp:RadioButtonList runat="server" ID="rbInstitutionType" RepeatDirection="Horizontal" Width="150px" Enabled="false" >
                        <asp:ListItem Text=" FET" Value="2" Selected="True" />
                        <asp:ListItem Text=" School" Value="1" />
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtCourseName">Course Name</label>
                </td>
                <td colspan="5">
                    <asp:DropDownList ID="ddCourse" runat="server" DataValueField="CourseID" DataTextField="Description"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtDonorName">Donor Name (if applicable)</label>
                </td>
                <td>
                    <asp:DropDownList ID="ddDonor" runat="server" DataValueField="DonorID" DataTextField="DisplayName"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 110px;"><label for="cbExcludeComms">Exclude from Comms</label></td>
                <td style="width: 50px;">
                    <asp:CheckBox runat="server" ID="cbExcludeComms" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtLastYearDonor">Last Year Donor</label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtLastYearDonor" />
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;"><label for="txtStudentBackground">Student Background</label></td>
                <td colspan="7">
                    <asp:TextBox runat="server" ID="txtStudentBackground" TextMode="MultiLine" />
                </td>
            </tr>
        </table>

        <br />
        <hr style="width: 880px;" />
        <br />

        <asp:Panel ID="pnlSubjectDetail" runat="server">
        <h5>Subject Detail</h5>
        <div id="dvSubjectDetailsGrid">
            <!-- Subject Details Grid Here -->
        </div>
        </asp:Panel>

        <br />
        <hr style="width: 880px;" />
        <br />

        <h5>Award Criteria</h5>
        <div id="dvSchool">
            <table cellspacing="0" cellpadding="0" border="0" class="">
                <tr>
                    <td style="width: 300px;"><label>Age</label></td>
                    <td>
                        <asp:TextBox runat="server" ID="txtSchoolAge" />
                    </td>
                </tr>
                <tr>
                    <td><label>Public School</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbSchoolPublicSchool" />
                    </td>
                </tr>
                <tr>
                    <td><label>Is School Blacklisted</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbSchoolBlacklisted" />
                    </td>
                </tr>
                <tr>
                    <td><label>School Fees</label></td>
                    <td>
                        <asp:TextBox runat="server" ID="txtSchoolFees" />
                    </td>
                </tr>
                <tr>
                    <td><label>Household Income & Grants</label></td>
                    <td>
                        <asp:TextBox runat="server" ID="txtSchoolHouseholdIncome" />
                    </td>
                </tr>
                <tr>
                    <td><label>Proof of salary received</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbSchoolProofOfSalaryReceived" />
                    </td>
                </tr>
                <tr>
                    <td><label>ID Received</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbSchoolIdReceived" />
                    </td>
                </tr>
                <tr>
                    <td><label>June Report Received</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbSchoolJuneReportReceived" />
                    </td>
                </tr>
                <tr>
                    <td><label>Result >% required</label></td>
                    <td>
                        <asp:TextBox runat="server" ID="txtSchoolJuneResultRequired" />
                    </td>
                </tr>
                <tr>
                    <td><label>Decemeber Report Received</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbSchoolDecemberReportReceived" />
                    </td>
                </tr>
                <tr>
                    <td><label>Result >% required</label></td>
                    <td>
                        <asp:TextBox runat="server" ID="txtSchoolDecemberResultRequired" />
                    </td>
                </tr>
                <tr>
                    <td><label>Motivation Received</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbSchoolMotivationReceived" />
                    </td>
                </tr>
                <tr>
                    <td><label>Comments / Background</label></td>
                    <td>
                        <asp:TextBox runat="server" ID="txtSchoolComments" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="dvFET">
            <table cellspacing="0" cellpadding="0" border="0" class="">
                <tr>
                    <td style="width: 300px;"><label>Age</label></td>
                    <td>
                        <asp:TextBox runat="server" ID="txtFETAge" />
                    </td>
                </tr>
                <tr>
                    <td><label>Residence</label></td>
                    <td>
                        <asp:TextBox runat="server" ID="txtFETResidence" />
                    </td>
                </tr>
                <tr>
                    <td><label>Full time Course</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbFETFullTimeCourse" />
                    </td>
                </tr>
                <tr>
                    <td><label>N2 - N6 trade and prac & N4 - N6 in Business</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbFETTrade" />
                    </td>
                </tr>
                <tr>
                    <td><label>Certified copy of Matric Cert</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbFETMatricCert" />
                    </td>
                </tr>
                <tr>
                    <td><label>1st Year FET - 50 % for matric</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbFET1stYear50Percent" />
                    </td>
                </tr>
                <tr>
                    <td><label>Already at FET - >50% in all exams</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbFET50PercentAllExams" />
                    </td>
                </tr>
                <tr>
                    <td><label>Already at FET - printout of current class test results</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbFETCurrentClassResultsPrintout" />
                    </td>
                </tr>
                <tr>
                    <td><label>Payslips or proof of income</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbFETPayslips" />
                    </td>
                </tr>
                <tr>
                    <td><label>Motivation</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbFETMotivation" />
                    </td>
                </tr>
                <tr>
                    <td><label>ID Received</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbFETIdReceived" />
                    </td>
                </tr>
                <tr>
                    <td><label>No other bursaries in existance</label></td>
                    <td>
                        <asp:CheckBox runat="server" ID="cbFETNoBursaries" />
                    </td>
                </tr>
                <tr>
                    <td><label>Comments / Background</label></td>
                    <td>
                        <asp:TextBox runat="server" ID="txtFETComments" />
                    </td>
                </tr>
            </table>
        </div>

        <br />
        <hr style="width: 880px;" />
        <br />

        <h5>Awards Details</h5>
        
        <!-- Amount and Pay Cycles -->
        <table cellspacing="0" cellpadding="0" border="0" style="border: 0px solid #ffffff;">
            <tr>
                <td style="width: 100px;">
                    <label for="txtAwardAmount">Award Amount</label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtAwardAmount" value="" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtPayCycles">Pay Cycles</label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPayCycles" value="" />
                </td>
            </tr>
        </table>
        <!-- Awards details Payment Grid -->
        <div>
            <!-- Payment Grid goes here -->
        </div>

        <br />
        <hr style="width: 880px;" />
        <br />

        <h5>Thank you Letters</h5>



    </div>
</asp:Content>
