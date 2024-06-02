<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Donor_Sponsorship_Details.aspx.cs" Inherits="ASF.Web.Donor_Sponsorship_Details" %>
<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="ASF.BusinessObjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">  
    <h2><asp:Label ID="lblHeading" runat="server" Text="Donor Sponsorship Details"></asp:Label></h2>
    <div class="detailsForm">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnDetailsView" runat="server" CssClass="toolbarImageButton details" Text="Donor Details" OnClick="btnDetailsView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAddDonorSponsorAmount" runat="server" CssClass="toolbarImageButton add" Text="Add Donor Sponsor Amount" OnClientClick="return AddDonorSponsorAmount_Click();" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnExportToCsv" runat="server" CssClass="toolbarImageButton settings" Text="Export" OnClick="btnExportToCsv_Click"/>
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnPrintStudentResults" runat="server" CssClass="toolbarImageButton" Style="background: url(/Images/Toolbar/Print.png) no-repeat"
                        Text="Print Student Results" OnClick="btnPrintStudentResults_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnDeleteSelectedSponsorShips" runat="server" CssClass="toolbarImageButton" Style="background: url(/Images/Toolbar/Delete.png) no-repeat"
                                Text="Delete Selected Sponsorships" OnClientClick="return confirm('Are you sure you want to delete the selected donor applications? This cannot be undone!');" OnClick="btnDeleteSelectedSponsorShips_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnBulkAddSponsorship" runat="server" CssClass="toolbarImageButton add" Text="Bulk Add Sponsorship" OnClientClick="return BulkAddSponsorship_Click();" />
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

        <table>
            <tr>
                <td style="width: 250px;">
                    <label>Sponsorship Year</label>
                </td>
                <td>
                    <asp:DropDownList ID="ddYear" runat="server" AutoPostBack="True" onselectedindexchanged="ddYear_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        Donor Status</label>
                </td>
                <td>
                    <asp:Label runat="server" ID="DonorStatus"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        Donor Type</label>
                </td>
                <td>
                    <asp:Label runat="server" ID="DonorType"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;">
                    <label>Address</label>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblDonorAddress"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <hr style="width: 880px;" />
        <br />
        <table style="width:98%;">
            <tr>
                <td colspan="2" style="font-weight: bold;">
                   <asp:Label runat="server" ID="lblDonorSponsorAmountsTitle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView runat="server" ID="gvDonorSponsorAmounts" CssClass="grid" style="" 
                    GridLines="Both" AutoGenerateColumns="false" Width="100%" OnRowCommand="gvDonorSponsorAmounts_RowCommand" OnRowDataBound="gvDonorSponsorAmounts_RowDataBound">
                        <HeaderStyle CssClass="gridHeader" />
                        <RowStyle CssClass="row" />
                        <AlternatingRowStyle CssClass="alternatingRow" />
                        <Columns>
                            <asp:TemplateField>
                                <HeaderStyle HorizontalAlign="Left" />
                                <HeaderTemplate>
                                    <label>Amount</label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lbAmount" Text="" CommandName="editItem"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle HorizontalAlign="Left" />
                                <HeaderTemplate>
                                    <label>Date Added</label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblDateAdded" Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>                            
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="/Images/Delete.png" CssClass="gridImageButton" ToolTip="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');" CommandName="deleteItem" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-size: 10px;">
                    <asp:Label runat="server" ID="lblDonorSponsorAmountsTotal"></asp:Label>
                </td>
            </tr>
            <asp:Panel ID="pnlSponsorshipDetails" runat="server">
                <tr>
                    <td colspan="2">
                        <h5>
                            Donor Sponsorship Information</h5>
                        <asp:GridView ID="GridView1" runat="server" CssClass="grid" Style="margin: 0px;"
                            GridLines="Both" AutoGenerateColumns="false" Width="100%" OnRowDataBound="GridView1_RowDataBound">
                            <HeaderStyle CssClass="gridHeader" />
                            <RowStyle CssClass="row" />
                            <AlternatingRowStyle CssClass="alternatingRow" />
                            <Columns>
                                <asp:TemplateField HeaderText="Select">
                                    <HeaderStyle HorizontalAlign="Left"/>
                                    <HeaderTemplate>
                                        <asp:CheckBox runat="server" ID="chkSelectedAll"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chkItemSelected"></asp:CheckBox>
                                        <asp:HiddenField runat="server" ID="hdnStudentId" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <label>
                                            Student</label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlStudentName" runat="server" Text='<%# Eval("Student") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <label>
                                            Institution</label>
                                    </HeaderTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblInstitution" runat="server" Text='<%# Eval("Institution") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <label>
                                            Course</label>
                                    </HeaderTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCourse" runat="server" Text='<%# Eval("Course") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <label>
                                            Course Level</label>
                                    </HeaderTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCourseLevel" runat="server" Text='<%# Eval("CourseLevel") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <label>
                                            June Average</label>
                                    </HeaderTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblJuneAverage" runat="server" Text='<%# Eval("JuneAverage") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <label>
                                            December Average</label>
                                    </HeaderTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblDecAverage" runat="server" Text='<%# Eval("DecAverage") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <label>
                                            Amount</label>
                                    </HeaderTemplate>
                                    <ItemStyle Width="100px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblCourseCost" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <label>
                                            Include In Comms.</label>
                                    </HeaderTemplate>
                                    <ItemStyle Width="100px" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="imgExcludeFromComms" ImageUrl='<%# (!(bool)Eval("ExcludeFromCommunications")) ? "~/Images/Check.png" : "~/Images/Cross.png" %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <HeaderTemplate>
                                        <label>
                                            Last Year Donor</label>
                                    </HeaderTemplate>
                                    <ItemStyle Width="100px" HorizontalAlign="Left" />
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" NavigateUrl='<%# Eval("LastYearDonorLink") %>' Text='<%# Eval("LastYearDonor") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <label>
                                    No records found</label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td style="height: 20px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table style="width: 310px;">
                            <tr>
                                <td><label>Total amount of scholarships for year:</label></td>
                                <td><asp:Label ID="lblTotalYearAmount" runat="server" style="padding: 2px;"></asp:Label></td>
                            </tr>
                            <tr>
                                <td><label>Sponsorship money available:</label></td>
                                <td><asp:Label ID="lblSponsorshipMoneyAvailable" runat="server" style="padding: 2px;"></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </asp:Panel>
        </table>
        <asp:Panel ID="pnlReports" runat="server" Visible="false">
            <br />
            <hr style="width: 880px;" />
            <br />
            <h5>
                Reports</h5>
            <br />
            <table>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnGenerateMidYearReport" runat="server" CssClass="button" Text="Generate Mid Year Report" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;">
                        <label>
                            Mid year donor report sent</label>
                    </td>
                    <td>
                        <asp:CheckBox ID="cbMidYearReportSent" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="height: 10px;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnGenerateEndYearReport" runat="server" CssClass="button" Text="Generate End Year Report" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;">
                        <label>
                            End year donor report sent</label>
                    </td>
                    <td>
                        <asp:CheckBox ID="cbEndYearReportSent" runat="server" />
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <div id="dvDonorSponsorAmount" class="popup" style="display: none;" title="Manage Donor Sponsor Amount">
            <asp:HiddenField ID="hdnDonorPaymentID" runat="server" Value="" />
            <asp:HiddenField ID="hdnDisplayPopup" runat="server" Value="false" />
            <table style="margin:20px;">
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="requiredField" ValidationGroup="Save"/>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;">
                        <label>Sponsor Amount</label>
                    </td>
                    <td>
                       <asp:TextBox runat="server" ID="txtSponsorAmount" CssClass="decimal" Text=""></asp:TextBox>
                       <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSponsorAmount" ValidationGroup="Save" Text="*" CssClass="requiredField" ErrorMessage="Please enter a valid sponsorship amount"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" ValidationGroup="Save" Text="*" ValueToCompare="0" Operator="GreaterThan" CssClass="requiredField" ControlToValidate="txtSponsorAmount"  ErrorMessage="Please enter a valid sponsorship amount"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;">
                        <label>For Year</label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddForYear"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSaveDonorSponsorAmount" runat="server" Text="Save" CssClass="button"
                                Width="70px" OnClick="btnSaveDonorSponsorAmount_Click" ValidationGroup="Save" />
                    </td>
                </tr>
            </table>
        </div>
    
        <div id="bulkAddDialog" class="popup" style="display: none;" title="Bulk Add Sponsorship">
            <table style="margin:20px;">
                <tr>
                    <td style="width: 100px;">
                        <label>Institution:</label>
                    </td>
                    <td style="width: 400px;">
                        <asp:DropDownList runat="server" ID="ddBulkAddInstitution" style="width: 300px;"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Grade:</label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddBulkAddCourseLevel"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: right; padding: 20px 15px 0 0; ">
                        <asp:Button ID="btnBulkAddSponsorShipSave" runat="server" Text="Save" CssClass="button" Width="100px" OnClientClick="return confirm('Are you sure you want to add sponsorship for the selected Institution/Grade?');" OnClick="btnBulkAddSponsorShipSave_OnClick" ValidationGroup="Save" />
                    </td>
                </tr>
            </table>
        </div>
    

    </div>

<script type="text/javascript">

    $(document).ready(function () {

        $('.decimal').numeric();
        if ($('#<%= hdnDisplayPopup.ClientID %>').val() === "true")
            ShowDonorSponsorAmountDialog();

        $("input[id*=chkSelectedAll]").bind("click", function () {
            var el = $(this);
            var chkd = el.attr("checked") === "checked";

            if (chkd) {
                $("input[type='checkbox']").not("#" + el.attr("id")).attr("checked", "checked");
            }
            else {
                $("input[type='checkbox']").not("#" + el.attr("id")).removeAttr("checked");
            }
        });
    });

    function AddDonorSponsorAmount_Click() {
        $('#<%= hdnDonorPaymentID.ClientID %>').val("");
        $('#<%= txtSponsorAmount.ClientID %>').val("0");
        $('#<%= ddForYear.ClientID %>').val((new Date).getFullYear());
        ShowDonorSponsorAmountDialog();
        return false;
    }

    function ShowDonorSponsorAmountDialog() {
        var dialog = $("#dvDonorSponsorAmount").dialog(
            {
                resizable: false,
                width: "410px", 
                modal: true,
                close: function(event, ui) {
                    $('#<%= hdnDisplayPopup.ClientID %>').val("false");
                }
            });
        dialog.parent().appendTo($("form:first"));
        $("#<%= ddForYear.ClientID %>").val($("#<%= ddYear.ClientID %>").val());
    }

    function BulkAddSponsorship_Click() {
        var dialog = $("#bulkAddDialog").dialog(
            {
                resizable: false,
                width: "450px", 
                modal: true
            });
        dialog.parent().appendTo($("form:first"));
        return false;
    }
</script>

</asp:Content>
