<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Institution_Details.aspx.cs" Inherits="ASF.Web.Institution_Details" %>
<%@ Register src="UserControls/InstitutionBlacklistComments.ascx" tagname="InstitutionBlacklistComments" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript">

        $(function () {
            $('.txtBankAccountName').attr('maxlength', '20');

            $('#<%= chk_postalSameAsStreetAddress.ClientID %>').bind("change", function () {
                DisplayInstitutionAddress();
            });

            DisplayInstitutionAddress();

            var isBlacklisted = <%= IsBlacklisted.ToString().ToLower() %>;
            if(isBlacklisted)
            {
                $('#IsBlacklisted').show();
            }
            else $('#IsBlacklisted').hide();
        });

        function DisplayInstitutionAddress() {

            if ($('#<%= chk_postalSameAsStreetAddress.ClientID %>').is(':checked')) {
                $('.displayInstitutionAddress').hide();
            } else {
                $('.displayInstitutionAddress').show();
            }
        }
    </script>

    <h2><asp:Label ID="lblHeading" runat="server" Text="Institution Details"></asp:Label></h2>
    <div class="detailsForm LeavePageNotiDialog">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton NoLeavePageNotiDialog save" Text="Save Details" OnClick="btnSave_Click" ValidationGroup="SaveDetails" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnGridView" runat="server" CssClass="toolbarImageButton list" Text="Institution List" OnClick="btnGridView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new Institution" OnClick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnInstitutionCourses" runat="server" CssClass="toolbarImageButton" Style="background: url(/Images/Toolbar/Course.png) no-repeat"
                        Text="Courses" OnClick="btnInstitutionCourses_Click" />
                </td>
                <td style="width: 100%;">
                    &nbsp;
                </td>
            </tr>
        </table>
        
        <asp:Panel ID="pnlInfo" runat="server" EnableViewState="False">
            <asp:Label ID="lblInfo" runat="server" CssClass="infoLabel" EnableViewState="False"></asp:Label>
            <br/>
        </asp:Panel>
        
        <asp:ValidationSummary ID="valSum" DisplayMode="List" EnableClientScript="true" HeaderText="<h4>Please Correct the Following:</h4>" ValidationGroup="SaveDetails" CssClass="validationSummary" runat="server"  />
        <table>
            <tr>
                <td style="width: 150px;">
                    <label>Institution Name</label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" MaxLength="100"></asp:TextBox>
                    <span class="ErrorContainer">
                        <asp:RequiredFieldValidator runat="server" ID="required_txtName" ControlToValidate="txtName"
                            CssClass="requiredField" ErrorMessage="<span class='validationSummaryPoints'>Institution name is required</span>" Text="*"
                            ToolTip="Description is required." ValidationGroup="SaveDetails"></asp:RequiredFieldValidator>
                        <asp:CustomValidator runat="server" ID="DescriptionUnique" ControlToValidate="txtName"
                            CssClass="requiredField" ErrorMessage="<span class='validationSummaryPoints'>Institution name already exists.</span>" OnServerValidate="DescriptionValidation"
                            ValidationGroup="SaveDetails" Text="*"></asp:CustomValidator>
                    </span>
                </td>
            </tr>
            <tr>
                <td><label>Institution Type</label></td>
                <td>
                    <tgs:IntegerDropdownList ID="ddInstitutionType" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <label>Institution Status</label>
                </td>
                <td>
                    <tgs:IntegerDropdownList ID="ddInstitutionStatus" runat="server" /><span id="IsBlacklisted" style="color:crimson;font-size:10px;padding-left:10px;display:none;">This institution is Pending-Blacklisted/Blacklisted</span>
                </td>
            </tr>            
            <tr>
                <td>
                    <asp:Label ID="lblOwesMoney" runat="server" Text="Owes ASF Money"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="cbOwesMoney" runat="server" />
                    <asp:TextBox ID="txtMoneyOwedComment" runat="server" MaxLength="100" style="width: 146px !important;"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Public Institution</label>
                </td>
                <td>
                    <asp:CheckBox ID="cbIsPublic" runat="server" Checked="True" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td style="width: 450px;">
                    <table>
                        <tr>
                            <td style="width: 150px;">
                                <label>Principal</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPrincipal" runat="server" MaxLength="100"></asp:TextBox>                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Bursary Representative</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBursaryRepresentative" runat="server" MaxLength="100"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Contact Number</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtContactNo" runat="server" CssClass="phone" MaxLength="50"></asp:TextBox>                             
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Fax</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFaxNo" runat="server" CssClass="phone" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Mobile</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="phone" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Email</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" MaxLength="200"></asp:TextBox>                               
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td style="width: 150px;">
                                <h5>Bank Details</h5>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Bank</label></td>
                            <td>
                                <asp:TextBox ID="txtBankName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Account Type</label></td>
                            <td>
                                <tgs:IntegerDropdownList ID="ddBankAccountType" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td><label>Account Name</label></td>
                            <td>
                                <asp:TextBox ID="txtBankAccountName" runat="server" CssClass="txtBankAccountName"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Account Number</label></td>
                            <td>
                                <asp:TextBox ID="txtBankAccountNo" runat="server" CssClass="numeric"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Branch</label></td>
                            <td>
                                <asp:TextBox ID="txtBankBranch" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><label>Branch Code</label></td>
                            <td>
                                <asp:TextBox ID="txtBankBranchCode" runat="server" CssClass="numericInput"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table>
                        <tr>
                            <td style="width: 150px; vertical-align: top;">
                                <label>Comments</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtComments" runat="server" CssClass="longText" TextMode="MultiLine" Height="150px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="pnlBlacklistDetails" runat="server">
                        <br/>
                        <label>Blacklist Comments</label>
                        <uc2:InstitutionBlacklistComments ID="InstitutionBlacklistComments1" runat="server" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <hr style="width: 880px;" />
        <br />
        <h5>Postal Address</h5>
        <table>
            <tr>
                <td style="width: 450px;">
                    <table>
                        <tr>
                            <td style="width: 150px;">
                                <label>
                                    Address Line 1</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPostalAddressLine1" runat="server"></asp:TextBox>                              
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Address Line 2</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPostalAddressLine2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Address Line 3</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPostalAddressLine3" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Suburb</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPostalAddressSuburb" runat="server"></asp:TextBox>                              
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td style="width: 150px;">
                                <label>
                                    City</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPostalAddressCity" runat="server"></asp:TextBox>                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Province</label>
                            </td>
                            <td>
                                <tgs:IntegerDropdownList ID="ddPostalAddressProvince" runat="server" DataValueField="ProvinceID" DataTextField="Description" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Country</label>
                            </td>
                            <td>
                                <tgs:IntegerDropdownList ID="ddPostalAddressCountry" runat="server" DataValueField="CountryID" DataTextField="Description" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Postal Code</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPostalAddressPostCode" CssClass="postcode numericInput" runat="server"></asp:TextBox>                               
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
         <br />
        <hr style="width: 880px;" />
        <br />
        <h5>
            Institution Address</h5>
        <table>
            <tr>
                <td>
                     <table>
                        <tr>
                            <td>
                                <label>Same as Postal Address </label>
                            </td>
                            <td>
                               <asp:CheckBox runat="server" ID="chk_postalSameAsStreetAddress" Checked="True" />
                            </td>
                        </tr>
                      </table>
                </td>
            </tr>
            <tr class="displayInstitutionAddress">
                <td style="width: 450px;">
                    <table>
                        <tr>
                            <td style="width: 150px;">
                                <label>
                                    Address Line 1</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressLine1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Address Line 2</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressLine2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Address Line 3</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressLine3" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Suburb</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressSuburb" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td style="width: 150px;">
                                <label>
                                    City</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressCity" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Province</label>
                            </td>
                            <td>
                                <tgs:IntegerDropdownList ID="ddAddressProvince" runat="server" DataValueField="ProvinceID" DataTextField="Description" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Country</label>
                            </td>
                            <td>
                                <tgs:IntegerDropdownList ID="ddAddressCountry" runat="server" DataValueField="CountryID" DataTextField="Description" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Postal Code</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressPostCode" CssClass="postcode numericInput" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
