<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="ApplicationForm_Wizard.aspx.cs" Inherits="ASF.Web.ApplicationForm_Wizard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Application Form Wizard</h2>
    <div class="detailsForm">
        <table class="toolbar" id="Toolbar" runat="server" visible="False">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="SaveStatuses" runat="server" CssClass="toolbarImageButton save" Text="Save"
                        OnClick="SaveStatuses_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="PrintApplications" runat="server" Text="Print" CssClass="toolbarImageButton save"
                        OnClick="PrintApplications_Click" />
                </td>
                <td style="width: 100%;">
                    &nbsp;
                </td>
            </tr>
        </table>
        <asp:Label ID="PrintError" runat="server" Text="<div class='validationSummary'><h4>Please Correct the Following:</h4><span class='validationSummaryPoints' style='line-height:25px;'>Please select at least one institution to print</span></div>"
        CssClass="" Visible="False"></asp:Label>
        <div style="margin: 10px 0px 20px 0px;">
            <table>
                <tr>
                    <td></td>
                    <td>
                        <asp:HyperLink ID="PrintApplicationLink" runat="server" Text="Print application form" Target="_blank"></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                         <label><b>Application Year:</b></label>
                    </td>
                    <td>
                        <tgs:IntegerDropdownList runat="server" ID="Year" AutoPostBack="True" OnSelectedIndexChanged="Year_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr>
                    <td>
                         <label><b>Status:</b></label>
                    </td>
                    <td>
                        <tgs:IntegerDropdownList runat="server" ID="idlFilterStatus" AutoPostBack="True" OnSelectedIndexChanged="Status_SelectedIndexChanged" />
                    </td>
                </tr>
                <tr>
                    <td width="120">
                         <label><b>Institution Search:</b></label>
                    </td>
                    <td style="text-align:left;">
                        <asp:TextBox runat="server" ID="Name" style="float:left;"></asp:TextBox>
                        <asp:LinkButton runat="server" Text=" " CssClass="toolbarImageButton refresh" OnClick="Filter_Click" style="float:left;height:22px;width:22px;border:none;"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: left;margin:15px 0px 5px 7px;" id="SelectAllInstitutions" runat="server">
            <input type="checkbox" id="SelectAll" />
            <label for="SelectAll">
                Select All</label><label>
                (selected <span id="WizardSelected">0</span> of
                <%= CurrentCount%>)</label>
        </div>
        <div style="float: right; margin: 15px 43px 5px 0px;" id="SelectAllInstitutionsCount" runat="server">
                <label>Set status for all:</label> <tgs:IntegerDropdownList runat="server" 
                    ID="idlChangeForAll" AutoPostBack="True" 
                    onchange="return ChangeStatuses(this);" 
                    onselectedindexchanged="idlChangeStatusForAll_SelectedIndexChanged"/>
        </div>
        <div style="clear: both;">
        </div>
        <asp:GridView ID="grdAppFormWizard" runat="server" CssClass="grid" GridLines="Both"
            BorderColor="#CCCCCC" AllowPaging="True" AutoGenerateColumns="false"
            Width="98%" OnRowDataBound="grdAppFormWizard_RowDataBound" OnPageIndexChanging="grdAppFormWizard_PageIndexChanging">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left"/>
                    <HeaderTemplate>
                        <label>
                            Institution Name</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:HiddenField runat="server" ID="ApplicationWizardID" Value='<%#Eval("ApplicationWizardID") %>' />
                        <asp:HiddenField runat="server" ID="InstitutionID" Value='<%#Eval("InstitutionID") %>' />
                        <asp:CheckBox runat="server" ID="InstitutionSelected" />
                        <asp:Label runat="server" AssociatedControlID="InstitutionSelected"><%#Eval("Name") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" Width="50" />
                    <HeaderTemplate>
                        <label>
                            Address</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <a runat="server" id="UpdateCompleteLink" style="color: red;" Visible="False">Update</a>
                        <img src="/Images/Check.png" width="16" height="16" id="imgAddressCorrect" runat="server" Visible="False"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left"  Width="200" />
                    <HeaderTemplate>
                        <label>
                            Status</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:DropDownList runat="server" ID="Status" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Mode="NumericFirstLast" Visible="True" Position="Bottom" FirstPageText="First" NextPageText="Next" LastPageText="Last"></PagerSettings>
            <EmptyDataTemplate>
                There are no institutions in this view</EmptyDataTemplate>
        </asp:GridView>
    </div>
    <input type='hidden' id="PrintUrl" runat="server" />
    <script type="text/javascript">
        $.each($("select[id*=Status]"), function (i, val)
        {
            $(this).data("initial-val", $(this).val());
        });
        $("select[id*=Status]").bind("change", function () {
            var chkBox = $(this).closest("tr").find("input[type='checkbox'][id*=Institution]");
            var selectCount = $("#WizardSelected");

            if (parseInt($(this).data("initial-val")) != parseInt($(this).val()))
            {
                if (!chkBox.is(":checked"))
                {
                    chkBox.attr("checked", "checked");
                    selectCount.html(parseInt(selectCount.html()) + 1);
                }
            }
            else
            {
                if (chkBox.is(":checked"))
                {
                    chkBox.removeAttr("checked");
                    selectCount.html(parseInt(selectCount.html()) - 1);
                }
            }
        });
        $("#SelectAll").bind("click dblclick", function ()
        {
            var chkboxes = $("input[type='checkbox'][id*=Institution]");
            var selectCount = $("#WizardSelected");

            if (!$(this).is(":checked"))
            {
                chkboxes.removeAttr("checked");
                selectCount.html("0");

            } else
            {
                chkboxes.attr("checked", "checked");
                selectCount.html(chkboxes.length);
            }
        });
        $("[id*=InstitutionSelected]").bind("change", function ()
        {
            var selectCount = $("#WizardSelected");

            if ($(this).is(":checked"))
            {
                selectCount.html(parseInt(selectCount.html()) + 1);
            } else
            {
                selectCount.html(parseInt(selectCount.html()) - 1);
            }
        });

        function ChangeStatuses(el)
        {
            var currOption = $(el).children("option").filter(":selected").text();
            if (!confirm('Are you sure you want to change the status for ' + $("#WizardSelected").html() + ' institution(s) to "' + currOption + '"?')) {
                $(el).children("option").removeAttr("selected");
                return false;
            }

            setTimeout('__doPostBack(\'idlChangeForAll\',\'\')', 0);
            return true;
        }

        var printUrl = $("[id*=PrintUrl]").val();
        if (printUrl != null && printUrl.length > 0)
        {
            window.open(printUrl, "Print_Institutions");
        }
        $(":checkbox").removeAttr("checked");
    </script>
</asp:Content>
