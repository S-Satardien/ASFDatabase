<%@ Page Title="Student Application Details" Language="C#" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Student_ApplicationDetails.aspx.cs" Inherits="ASF.Web.Student_ApplicationDetails" %>
<%@ Import Namespace="ASF.BusinessObjects.Enums" %>

<asp:Content ID="studentApplicationDetails" ContentPlaceHolderID="MainContent" runat="server">
    
    
    

    <script type="text/javascript">
        var reportData = '<%= ReportData %>';
        var studentApplicationYear = '<%= StudentApplicationYear %>';
        var institutionBlocked = '<%= StudentApplication != null && StudentApplication.Institution.Status == InstitutionStatus.Block %>';

        $(function() {
            $('#myTabs a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
                
                $('[id*=btnPaymentReceivedConfirmed]').button();
                $('[id*=btnProcessPayment]').button();
                
            });
        });
        

    </script>
    <script type="text/javascript" src="/Scripts/StudentApplication.js"></script>

    <h2><asp:Label ID="lblHeading" runat="server" Text="New Student Application"></asp:Label></h2>
    
    <table class="toolbar">
        <tr>
            <td class="toolbarCell">
                <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton save" Text="Save Details" OnClick="btnSave_Click" ValidationGroup="Save" />
            </td>
            <td class="toolbarCell">
                <asp:Button ID="btnDetailsView" runat="server" CssClass="toolbarImageButton details" Text="Student Details" OnClick="btnDetailsView_Click" />
            </td>
            <td class="toolbarCell">
                <asp:Button ID="btnRefreshDropdowns" runat="server" CssClass="toolbarImageButton refresh" Text="Refresh Dropdowns" OnClick="btnRefreshDropdowns_Click" />
            </td>
            <td class="toolbarCell">
                <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new Student Application" OnClick="btnAdd_Click" />
            </td>
            <td class="toolbarCell">
                <asp:Button ID="btnScholarshipDetails" runat="server" CssClass="toolbarImageButton scholar" Text="Scholarship Details" OnClick="btnScholarshipDetails_Click" Visible="false" />
            </td>
            <td class="toolbarCell">
                <asp:Button ID="btnPrintSummary" runat="server" CssClass="toolbarImageButton print" Text="Print Summary" OnClick="btnPrintSummary_Click" />
            </td>
            <td style="width: 100%;">
                &nbsp;
            </td>
        </tr>
    </table>
    
    <br/>
    
    <div class="detailsForm">
        
        <ul id="myTabs" class="nav nav-tabs" role="tablist">
          <li class="active"><a href="#ApplicationDetails" role="tab" data-toggle="tab">Application Details</a></li>
          <li><a href="#AwardCriteria" role="tab" data-toggle="tab">Award Criteria</a></li>
          <li><a href="#PaymentDetails" role="tab" data-toggle="tab">Payment Details</a></li>
        </ul>

        <br />

        <asp:Panel ID="pnlInfo" runat="server" EnableViewState="False">
            <asp:Label ID="lblInfo" runat="server" CssClass="infoLabel" EnableViewState="False">Application saved successfully</asp:Label>
            <br/>
        </asp:Panel>
        <asp:ValidationSummary ID="ValidationSummary2" DisplayMode="List" EnableClientScript="true" HeaderText="<h4>Please Correct the Following:</h4>" ValidationGroup="Save" CssClass="validationSummary" runat="server" />
        
        <div class="tab-content">
            <div id="ApplicationDetails" class="tab-pane active">
        
                <table cellspacing="0" cellpadding="0" border="0">
                    <tr>
                        <td style="width: 180px;">
                            <label for="slctAcademicYear">Select Academic Year</label>
                        </td>
                        <td>
                            <tgs:IntegerDropdownList runat="server" ID="ddYear" AutoPostBack="true" OnSelectedIndexChanged="ddYear_SelectedIndexChanged" />
                        </td>
                    </tr>
                        <tr>
                        <td>
                            <label>Application Status</label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddApplicationStatus" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                </table>

        
            
                <table cellspacing="0" cellpadding="0" border="0">
                    <tr>
                        <td style="width: 180px;"><label>Previous Institution</label></td>
                        <td colspan="5">
                            <asp:TextBox ID="txtPreviousInstitution" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 180px;"><label>Institution</label></td>
                        <td colspan="5">
                            <tgs:IntegerDropdownList ID="ddInstitution" runat="server" DataValueField="InstitutionID" DataTextField="Name" AutoPostBack="true" OnSelectedIndexChanged="ddInstitution_SelectedIndexChanged" />
                            <a href="/Institution_Details.aspx" target="_blank">
                                <img src="/Images/Toolbar/Add.png" alt="Add new Institution" style="height: 10px; width: 10px" />
                            </a>
                            <asp:RequiredFieldValidator ID="valDescriptionRequired" runat="server" ControlToValidate="ddInstitution" CssClass="requiredField" ErrorMessage="Please select an Institution." Text="*" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr> 
                        <td><label for="ddInstitutionCourse">Course</label></td>
                        <td colspan="5">
                            <tgs:IntegerDropdownList ID="ddInstitutionCourse" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddInstitutionCourse_SelectedIndexChanged" />
                            <a href="/Admin/Institution_Courses.aspx?InstitutionID=<%=SelectedInstitutionID %>" target="_blank">
                                <img src="/Images/Toolbar/Add.png" alt="Add new Course" style="height: 10px; width: 10px" /></a>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddInstitutionCourse"
                                CssClass="requiredField" ErrorMessage="Please select an Institution Course." Text="*" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="ddCourseLevel">Course Level</label></td>
                        <td colspan="5">
                            <tgs:IntegerDropdownList ID="ddCourseLevel" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddCourseLevel_SelectedIndexChanged" />
                            <a href="/Admin/CourseLevel_List.aspx" target="_blank">
                                <img src="/Images/Toolbar/Add.png" alt="Add new Course" style="height: 10px; width: 10px" /></a>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddCourseLevel"
                                CssClass="requiredField" ErrorMessage="Please select an Institution Course Level." Text="*" ValidationGroup="Save"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="txtDonorName">Donor (if applicable)</label></td>
                        <td style="white-space: nowrap">
                            <tgs:IntegerDropdownList ID="ddDonor" runat="server" DataValueField="DonorID" DataTextField="DisplayName" />
                            <a href="/Donor_Details.aspx" target="_blank">
                            <img src="/Images/Toolbar/Add.png" alt="Add new Donor" style="height: 10px; width: 10px" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;">
                            <label for="<%=cbExcludeComms.ClientID %>">
                                Exclude From Comms</label>
                        </td>
                        <td style="width: 50px;">
                            <asp:CheckBox runat="server" ID="cbExcludeComms" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;">
                            <label id="lblInRefundProcess" runat="server">In Refund Process</label>
                        </td>
                        <td style="width: 50px;">
                            <asp:CheckBox runat="server" ID="cbInRefundProcess" />
                        </td>
                    </tr>
                    <tr>
                        <td><label for="lblLastYearDonor">Last Year Donor</label></td>
                        <td>
                            <asp:Label runat="server" ID="lblLastYearDonor" CssClass="asflabel"/>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top;">
                            <label for="txtStudentBackground">
                                Student Background</label>
                        </td>
                        <td colspan="7">
                            <asp:TextBox runat="server" ID="txtStudentBackground" TextMode="MultiLine" />
                        </td>
                    </tr>
                </table>
                
            </div>
        
        
            <div id="AwardCriteria" class="tab-pane">
        
                <asp:Panel runat="server" ID="pnlAwardCriteria">
       
                <h5>Award Subject Criteria</h5>
                <table class="grid" cellpadding="0" cellspacing="0" border="0">
                    <tr class="gridHeader">
                        <td colspan="3"><label>June Results</label></td>
                        <td colspan="3"><label>December Results</label></td>
                    </tr>
                    <tr>
                        <td style="width: 150px;"><label>English</label></td>
                        <td style="width: 70px; text-align: center"><asp:TextBox ID="txtJuneEnglishResult" runat="server" CssClass="numericInput" maxvalue="100" TabIndex="1"></asp:TextBox></td>
                        <td style="width: 20px; text-align: center">
                            <asp:Image ID="imgValidateJuneEnglishResult" runat="server" CssClass="ValidationImage" />
                        </td>
                        <td style="width: 150px;"><label>English</label></td>
                        <td style="width: 70px; text-align: center"><asp:TextBox ID="txtDecemberEnglishResult" runat="server" CssClass="numericInput" maxvalue="100" TabIndex="5"></asp:TextBox></td>
                        <td>
                            <asp:Image ID="imgValidateDecemberEnglishResult" runat="server" CssClass="ValidationImage" />
                        </td>
                    </tr>
                    <tr>
                        <td><label>Math</label></td>
                        <td style="text-align: center"><asp:TextBox ID="txtJuneMathResult" runat="server" CssClass="numericInput" maxvalue="100" TabIndex="2"></asp:TextBox></td>
                        <td style="text-align: center">
                            <asp:Image ID="imgValidateJuneMathResult" runat="server" CssClass="ValidationImage" />
                        </td>
                        <td><label>Math</label></td>
                        <td style="text-align: center"><asp:TextBox ID="txtDecemberMathResult" runat="server" CssClass="numericInput" maxvalue="100" TabIndex="6"></asp:TextBox></td>
                        <td style="text-align: center">
                            <asp:Image ID="imgValidateDecemberMathResult" runat="server" CssClass="ValidationImage" />
                        </td>
                    </tr>
                    <tr>
                        <td><label>Average</label></td>
                        <td style="text-align: center"><asp:TextBox ID="txtJuneAverageResult" runat="server" CssClass="numericInput" maxvalue="100" TabIndex="3"></asp:TextBox></td>
                        <td style="text-align: center">
                            <asp:Image ID="imgValidateJuneAverage" runat="server" CssClass="ValidationImage" />
                        </td>
                        <td><label>Average</label></td>
                        <td style="text-align: center"><asp:TextBox ID="txtDecemberAverageResult" runat="server" CssClass="numericInput" maxvalue="100" TabIndex="7"></asp:TextBox></td>
                        <td style="text-align: center">
                            <asp:Image ID="imgValidateDecemberAverage" runat="server" CssClass="ValidationImage" />
                        </td>
                    </tr>
                    <tr>
                        <td><label>Subjects over 50%</label></td>
                        <td style="text-align: center"><asp:TextBox ID="txtJuneSubjectsOver50" runat="server" CssClass="numericInput" maxvalue="12" TabIndex="4"></asp:TextBox></td>
                        <td>&nbsp;</td>
                        <td><label>Subjects over 50%</label></td>
                        <td style="text-align: center"><asp:TextBox ID="txtDecemberSubjectsOver50" runat="server" CssClass="numericInput" maxvalue="12" TabIndex="8"></asp:TextBox></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="ReportCard">
                            <a id="lbtnAwardJunReport" href="#" onclick="return lbShowJunReport_Click(<%= StudentApplicationYear - 1 %>);">June Report Card</a>
                        </td>
                        <td colspan="3" class="ReportCard">
                            <a id="lbtnAwardDecReport" href="#" onclick="return lbShowDecReport_Click(<%= StudentApplicationYear - 1 %>);">December Report Card</a>
                        </td>
                    </tr>
                </table>
                <div id='dvResults_6_<%= StudentApplicationYear - 1 %>' style="display:none;" title="June Report Card"></div>
                <div id='dvResults_12_<%= StudentApplicationYear - 1 %>' style="display:none;" title="December Report Card"></div>
                <br />
                <h5>Additional Award Criteria</h5>
                <asp:Panel ID="pnlSchool" runat="server">
                    <table cellspacing="0" cellpadding="0" border="0" class="">
                        <tr>
                            <td style="width: 200px;"><label>Age</label></td>
                            <td style="width: 100px">
                                <asp:Image ID="imgValidateAge" runat="server" CssClass="ValidationImage"/>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblSchoolAge" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Public School</label></td>
                            <td><asp:Image ID="imgValidatePublicSchool" runat="server" CssClass="ValidationImage"/></td>
                        </tr>
                        <tr>
                            <td><label>School Not Blacklisted</label></td>
                            <td><asp:Image ID="imgValidateSchoolBlacklisted" runat="server" CssClass="ValidationImage"/></td>
                        </tr>
                        <tr>
                            <td><label>School Fees</label></td>
                            <td><asp:Image ID="imgValidateSchoolFees" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:Label ID="lblSchoolFees" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Household Income & Grants</label></td>
                            <td><asp:Image ID="imgValidateHouseholdIncome" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                R<asp:TextBox ID="txtSchoolHouseholdIncome" runat="server" CssClass="numeric"></asp:TextBox>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td><label>Dependants</label></td>
                            <td></td>
                            <td>
                                <tgs:IntegerDropdownList ID="ddDependants" runat="server" Width="50px">
                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                    <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                    <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                    <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                    <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                    <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                    <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="21" Value="21"></asp:ListItem>
                                    <asp:ListItem Text="22" Value="22"></asp:ListItem>
                                    <asp:ListItem Text="23" Value="23"></asp:ListItem>
                                    <asp:ListItem Text="24" Value="24"></asp:ListItem>
                                    <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                </tgs:IntegerDropdownList>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Proof of salary received</label></td>
                            <td><asp:Image ID="imgValidateProofOfSalaryRecieved" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox ID="cbSchoolProofOfSalaryReceived" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Copy of ID Received</label></td>
                            <td><asp:Image ID="imgValidateIDRecieved" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox runat="server" ID="cbSchoolIdReceived" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Motivation Received</label></td>
                            <td><asp:Image ID="imgValidateMotivationRecieved" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox runat="server" ID="cbSchoolMotivationReceived" />
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;"><label>Comments / Background</label></td>
                            <td colspan="2">
                                <asp:TextBox runat="server" ID="txtSchoolComments" TextMode="MultiLine" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlFET" runat="server">
                    <table cellspacing="0" cellpadding="0" border="0" class="">
                        <tr>
                            <td style="width: 300px;"><label>Age</label></td>
                            <td style="width: 100px">
                                <asp:Image ID="imgValidateFETAge" runat="server" CssClass="ValidationImage"/>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblFETAge" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Residence</label></td>
                            <td><asp:Image ID="imgValidateFETResidence" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox runat="server" ID="cbFETResidence" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Full time Course</label></td>
                            <td><asp:Image ID="imgValidateFETFullTimeCourse" runat="server" CssClass="ValidationImage"/></td>
                        </tr>
                        <tr>
                            <td><label>Certified copy of Matric Cert</label></td>
                            <td><asp:Image ID="imgValidateFETCertMatricCert" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox runat="server" ID="cbFETMatricCert" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>1st Year - 50 % for matric</label></td>
                            <td><asp:Image ID="imgValidateFET50PercentMatric" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox runat="server" ID="cbFET1stYear50Percent" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>New Student - >50% in all exams</label></td>
                            <td><asp:Image ID="imgValidateFET50PercentAllExams" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox runat="server" ID="cbFET50PercentAllExams" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Already at FET - printout of current class test results</label></td>
                            <td><asp:Image ID="imgValidateFETCurrentTestResults" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox runat="server" ID="cbFETCurrentClassResultsPrintout" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Payslips or proof of income</label></td>
                            <td><asp:Image ID="imgValidateFETProofOfIncome" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox runat="server" ID="cbFETPayslips" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Motivation</label></td>
                            <td><asp:Image ID="imgValidateFETMotivation" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox runat="server" ID="cbFETMotivation" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Copy of ID Received</label></td>
                            <td><asp:Image ID="imgValidateFETIDRecieved" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox ID="cbFETIDRecieved" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>No other bursaries in existance</label></td>
                            <td><asp:Image ID="imgValidateFETNoOtherBursaries" runat="server" CssClass="ValidationImage"/></td>
                            <td>
                                <asp:CheckBox runat="server" ID="cbFETNoBursaries" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Comments / Background</label></td>
                            <td colspan="2">
                                <asp:TextBox runat="server" ID="txtFETComments" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
        
            </asp:Panel>

                <asp:Panel ID="pnlSubjectDetail" runat="server">
                    <asp:PlaceHolder ID="phCurrentYearResults" runat="server"></asp:PlaceHolder>


                    <br />
                    <hr style="width: 880px;" />
                    <br />
        
                    <h5>Current Year Results</h5>
                    <asp:PlaceHolder ID="phStudentSubjectMarks" runat="server"></asp:PlaceHolder>
        
                </asp:Panel>

                <br />
                <hr style="width: 880px;" />
                <br />
        
                <div id="AwardDetails" runat="server" Visible="False">
                    <h5>Awards Details <span style="color:red;font-size:10px;"><asp:Label ID="lblSecondPaymentDenied" runat="server" Text="- 2nd Payment Denied" Visible="False"></asp:Label></span></h5>
        
                    <!-- Amount and Pay Cycles -->
                    <table cellspacing="0" cellpadding="0" border="0" style="border: 0px solid #ffffff;">
                        <tr>
                            <td style="width: 200px;">
                                <label for="txtAwardAmount">
                                    Award Amount
                                </label>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lblAwardAmount" value="" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtAwardAmount">
                                    Remaining Funds
                                </label>
                            </td>
                            <td>
                                <strong>
                                    <asp:Label runat="server" ID="lblAwardRemainingAmount" /></strong>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top">
                                <label for="txtAwardGrantedComments">Award Granted Comments</label>
                            </td>
                            <td><asp:TextBox runat="server" ID="txtAwardGrantedComments" TextMode="MultiLine" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        
        
            <div id="PaymentDetails" class="tab-pane">
            
                <asp:GridView runat="server" ID="gvInstitutionPayments" AutoGenerateColumns="false"
                    CssClass="grid" Style='width: 90%' 
                    OnRowDataBound="gvInstitutionPayments_RowDataBound"
                    AutoGenerateEditButton="True"
                    OnRowEditing="gvInstitutionPayments_RowEditing" 
                    OnRowUpdating="gvInstitutionPayments_RowUpdating"
                    OnRowCancelingEdit="gvInstitutionPayments_RowCancelingEdit">
                    <HeaderStyle CssClass="gridHeader" />
                    <RowStyle CssClass="row" />
                    <AlternatingRowStyle CssClass="alternatingRow" />
                    <Columns>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Left" />
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPaymentNumber" runat="server">Payment <%#Eval("PaymentNumber")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Left" />
                            <HeaderTemplate>
                                <label>Payment</label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:TextBox runat="server" ID="hdnAwardRemainingAmount" CssClass="hidden"></asp:TextBox>
                                <asp:Label ID="lblPaymentAmount" runat="server" Text='<%#Bind("PaymentAmount")%>'
                                    Visible="False"></asp:Label>
                                <asp:TextBox ID="txtPaymentAmount" runat="server" Text='<%#Bind("PaymentAmount")%>' CssClass="numericInput"></asp:TextBox>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:HiddenField ID="hdnInstitutionPaymentDetailID" runat="server" Value='<%#Bind("InstitutionPaymentDetailID")%>'/>
                                <asp:TextBox ID="txtEditAmount" runat="server" CssClass="integer" Text='<%#Bind("PaymentAmount")%>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Left" />
                            <HeaderTemplate>
                                <label>Processed Date</label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblProcessedDate" runat="server"><%#Eval("ProcessedDate")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" Width="130" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <HeaderTemplate>
                                <label>Actual Payment Date
                                </label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblActualPaymentDate" runat="server"><%#Eval("ActualPaymentDate")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" Width="70" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <HeaderTemplate>
                                <label>Notes</label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="txtNotes" runat="server" Text='<%#Bind("Notes")%>'></asp:TextBox>
                                <asp:Label ID="lblNotes" runat="server" Text='<%#Bind("Notes")%>' Visible="False"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" Width="70" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <HeaderTemplate>
                                <label>Payment Received Confirmed</label>
                            </HeaderTemplate>
                            <ItemTemplate>                        
                                <asp:Image ID="imgPaymentReceivedConfirmed" Visible='<%#Eval("IsActualData")%>' runat="server"/> <asp:Button ID="btnPaymentReceivedConfirmed" runat="server" Visible='<%#Eval("IsActualData")%>' CommandName="ConfirmPaymentRecieved" CommandArgument='<%#Eval("InstitutionPaymentDetailID")%>' OnClick="ConfirmPaymentRecieved_Click"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" Width="70" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btnProcessPayment" Text="Process" CommandArgument='<%#Eval("PaymentNumber")%>'
                                    OnClientClick="if(!confirm('Are you sure you want to send this payment for processing?')){return false;}"
                                    OnClick="ProcessPayment_Click" ValidationGroup="award"
                                    CausesValidation="True" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            
            </div>
        
        </div>
    </div>


    <input id="hdnSubjectID" type="hidden" />
    <div id="dvSubjectMarkDetails" class="popup" style="display: none;" title="Student Marks">
        <asp:HiddenField ID="hdnCurrentPeriod" runat="server"/>
        <asp:HiddenField ID="hdnMonth" runat="server"/>

        <div id="dvSubjectMarksLoading"><img src="Images/Loading.gif" alt=""/><label>Loading...</label></div>        
        <table id="tblSubjectMarks" class="grid" cellpadding="0" cellspacing="0">
        </table>
        <asp:Button ID="btnSaveSubjectMarks" CssClass="button" runat="server" Text="Save" Width="70px" OnClientClick="return btnSaveSubjectMarks_Click();" />
    </div>
    <div id="dvRefund" title="Refund Required" style="display: none; overflow: hidden;">
        <div>
            <p style="font-size:13px;">
                <label>A payment has already been made and student is changing institutions.</label>
            </p>
            <p style="font-style:oblique;font-weight:bold;">
                <label>Please select an option:</label>
            </p>
        </div>        
        <asp:Button ID="btnInstitutionRefund" runat="server" Text="Institution Refund" Width="120px" OnClick="btnInstitutionRefund_Click"/>
        <asp:Button ID="btnStudentCollect" runat="server" Text="Student Collect" Width="120px" OnClick="btnStudentCollect_Click" />
    </div>
    <script>
        var showDialog = <%= (IsRefund).ToString().ToLowerInvariant() %>;
        if(showDialog)
        {
            var dialog = $("#dvRefund").dialog({ resizable: false, width: "500px", modal: true });
            dialog.parent().appendTo($("form:first"));
        }
    </script>
</asp:Content>
