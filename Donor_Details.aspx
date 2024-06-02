<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Donor_Details.aspx.cs" Inherits="ASF.Web.Donor_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        $(function () {

            $('#<%= ddAddressCountry.ClientID %>').change(function () {
                if ($('#<%= ddAddressCountry.ClientID %>').val() != 201) {
                    $('#<%= ddAddressProvince.ClientID %>').hide();
                    $('#<%= tbAddressProvince.ClientID %>').show();
                } else {
                    $('#<%= ddAddressProvince.ClientID %>').show();
                    $('#<%= tbAddressProvince.ClientID %>').hide();
                }
            });
        });
        
    </script>
    <h2>
        Donor Details</h2>
    <div class="detailsForm LeavePageNotiDialog">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton NoLeavePageNotiDialog save" Text="Save Details" OnClick="btnSave_Click" ValidationGroup="save" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnGridView" runat="server" CssClass="toolbarImageButton list" Text="Donor List" OnClick="btnGridView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new Donor" OnClick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnSponsorship" runat="server" CssClass="toolbarImageButton sponsor" Text="Sponsorship details" OnClick="btnSponsorship_Click" />
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

        <asp:ValidationSummary ID="valSum" DisplayMode="List" HeaderText="<h4>Please Correct the Following:</h4>" EnableClientScript="true"
            ValidationGroup="save" CssClass="validationSummary" runat="server" />
        <table>
            <tr>
                <td style="width: 150px;">
                    <label>First Name</label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="validateId_txtFirstName" ControlToValidate="txtFirstName"
                        ErrorMessage="<span class='validationSummaryPoints'>First name is required.</span>" CssClass="requiredField" ToolTip="First name is required."
                        ValidationGroup="save" runat="server" Text="*"></asp:RequiredFieldValidator>
                </td>
                <td style="width: 150px; padding-left: 90px;">
                    <label>Date Of Birth</label>
                </td>
                <td>
                    <asp:TextBox ID="txtDOB" runat="server" MaxLength="50" Width="50px" CssClass="datepicker"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><label>Last Name</label></td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="validateId_txtLastName" ControlToValidate="txtLastName"
                        ErrorMessage="<span class='validationSummaryPoints'>Last name is required.</span>" CssClass="requiredField" ToolTip="Last name is required."
                        ValidationGroup="save" runat="server" Text="*"></asp:RequiredFieldValidator>
                </td>
                <td style="width: 150px; padding-left: 90px; vertical-align: top;">
                    <label>Comments:</label>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="vertical-align: top; padding-left: 90px;" rowspan="6" colspan="2">
                    <asp:TextBox ID="txtComments" runat="server" CssClass="longText" TextMode="MultiLine" Width="340px" Height="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><label>Status</label></td>
                <td>
                    <asp:DropDownList ID="ddStatus" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        Gender</label>
                </td>
                <td>
                    <asp:DropDownList ID="ddGender" runat="server">
                    </asp:DropDownList>
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
            <tr>
                <td>
                    <label>
                        Landline</label>
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
        </table>
        <br />
        <hr style="width: 880px;" />
        <br />
        <h5>
            Donor Address</h5>
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
                                    Province/State/Region</label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddAddressProvince" runat="server" DataValueField="ProvinceID"
                                    DataTextField="Description">
                                </asp:DropDownList>
                                <asp:TextBox runat="server" ID="tbAddressProvince"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Country</label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddAddressCountry" runat="server" DataValueField="CountryID"
                                    DataTextField="Description">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Postal Code/ZIP</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressPostCode" runat="server" CssClass="postalCode numericInput" maxlength="10"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
