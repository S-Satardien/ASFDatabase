<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Student_Details.aspx.cs" Inherits="ASF.Web.Student_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {

            BindCalendars("<%=DateTime.Now.AddYears(-30).Year %>", "<%=DateTime.Now.AddYears(-12).Year %>", 20);

            $('#<%= txtDOB.ClientID %>').keydown(function () {
                return false;
            });
        });

    </script>
    <h2><asp:Label ID="lblHeader" runat="server" Text="Student Details"></asp:Label></h2>
    <div class="detailsForm LeavePageNotiDialog">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton NoLeavePageNotiDialog save" Text="Save Details" OnClick="btnSave_Click" ValidationGroup="save" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnSaveAndCap" runat="server" CssClass="toolbarImageButton NoLeavePageNotiDialog save" Text="Save & Capture" OnClick="btnSaveAndCap_Click" ValidationGroup="save" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnGridView" runat="server" CssClass="toolbarImageButton list" Text="Student List" OnClick="btnGridView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new Student" OnClick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnDelete" runat="server" CssClass="toolbarImageButton delete" Text="Delete Student" OnClientClick="return confirm('Are you sure you want to delete this student?');"
                        OnClick="btnDelete_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnStudentApplication" runat="server" CssClass="toolbarImageButton details" Text="Student Applications" OnClick="btnStudentApplication_Click" />
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

        <asp:ValidationSummary ID="valSum" DisplayMode="List" EnableClientScript="true"
            HeaderText="<h4>Please Correct the Following:</h4>" ValidationGroup="save" CssClass="validationSummary" runat="server" />

        <table>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="requiredField"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 150px;">
                    <label>
                        First Name</label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"  MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="<span class='validationSummaryPoints'>Student first name is required.</span>"
                        CssClass="requiredField" ControlToValidate="txtFirstName" ValidationGroup="save"  Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Last Name</label>
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="<span class='validationSummaryPoints'>Student last name is required.</span>"
                        CssClass="requiredField" ControlToValidate="txtLastName" ValidationGroup="save"  Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Date Of Birth</label>
                </td>
                <td>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="datepicker numericInput" Width="75px"
                        Style="text-align: center;"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<span class='validationSummaryPoints'>Student date of birth is required.</span>"
                        CssClass="requiredField" ControlToValidate="txtDOB" ValidationGroup="save"  Text="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><label>Gender</label></td>
                <td>
                    <tgs:IntegerDropdownList ID="ddGender" runat="server" />
                </td>
            </tr>
            <tr>
                <td><label>Email</label></td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px" MaxLength="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Landline</label>
                </td>
                <td>
                    <asp:TextBox ID="txtLandline" runat="server" CssClass="phone" MaxLength="50"></asp:TextBox>
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
                <td><label>ID</label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtId" CssClass="idNumber"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <label>
                        Carreer Choice</label>
                </td>
                <td>
                    <asp:TextBox ID="txtCarreerChoice" runat="server" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <hr style="width: 880px;" />
        <br />
        <h5>
            Student Address</h5>
        <table>
            <tr>
                <td style="width: 420px;">
                    <table>
                        <tr>
                            <td style="width: 150px;">
                                <label>
                                    Address Line 1</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressLine1" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:CustomValidator ID="validateId_address" ValidationGroup="save" ControlToValidate="txtAddressLine1"
                                    ValidateEmptyText="True" OnServerValidate="validate_txtAddressLine1" ErrorMessage="<span class='validationSummaryPoints'>Address Line 1, 2, or 3 required.</span>"
                                    CssClass="requiredField" runat="server" Text="*"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Address Line 2</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressLine2" runat="server" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Address Line 3</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressLine3" runat="server" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Suburb</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressSuburb" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="required_txtAddressSuburb" ControlToValidate="txtAddressSuburb"
                                    CssClass="requiredField" ErrorMessage="<span class='validationSummaryPoints'>Suburb is required.</span>" ToolTip="Suburb is required."
                                    ValidationGroup="save" runat="server" Text="*"></asp:RequiredFieldValidator>
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
                                <asp:TextBox ID="txtAddressCity" runat="server" MaxLength="50"></asp:TextBox>
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
                                <asp:TextBox ID="txtAddressPostCode" runat="server" CssClass="numericInput postcode"
                                    Width="75px" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="required_txtAddressPostCode" ControlToValidate="txtAddressPostCode"
                                    CssClass="requiredField" ErrorMessage="<span class='validationSummaryPoints'>Postal code is required.</span>" ToolTip="Postal code is required."
                                    ValidationGroup="save" runat="server" Text="*"></asp:RequiredFieldValidator>
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
            Alumni</h5>
        <table>
            <tr>
                <td style="width: 420px;">
                    <table>
                        <tr>
                            <td>
                                <label>
                                    Current Activity:</label>
                            </td>
                            <td>
                                <tgs:IntegerDropdownList ID="ddAlumniActivity" DataValueField="AlumniActivityID" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Additional Information:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAlumniAdditionalInfo" runat="server" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                
            </tr>
        </table>

    </div>
</asp:Content>
