<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Blacklist_Details.aspx.cs" Inherits="ASF.Web.Blacklist_Details"  MasterPageFile="~/MasterPage.Master" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>
<%@ Register src="UserControls/InstitutionBlacklistComments.ascx" tagname="InstitutionBlacklistComments" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        function confirmAction() {
            var needEmail = <%= NeedEmail.ToString().ToLower() %>;
            
            if(needEmail)
            {
                alert('This action cannot be performed successfully without an associated email address. Please add an email address in the configuration section.');
                return false;
            }else
            {
                var dlg = $("#dvComment").dialog({ resizable: false, width: "500px", modal: true });
                dlg.parent().appendTo($("form:first"));
                return false;
            }
        }
    </script>

    <h2>Blacklist Details</h2>

    <div class="detailsForm">
        <table class="toolbar">
        <tr>
            <td class="toolbarCell">
                <asp:Button ID="btnBlacklistManagement" runat="server" CssClass="toolbarImageButton list" Text="Blacklist Pending List" OnClick="btnBlacklistManagement_Click" />
            </td>
            <td class="toolbarCell">
                <asp:Button ID="btnCancelBlacklistPending" runat="server" CssClass="toolbarImageButton delete" Text="Cancel Blacklist Pending" OnClick="btnCancel_Click"  OnClientClick="return confirm('Are you sure you want to cancel this Institutions Blacklist Pending status and mark them as active?');" />
            </td>
            <td class="toolbarCell">
                 <asp:Button ID="btnAction" runat="server" CssClass="toolbarImageButton save" CommandName="cmdAction" OnClick="btnAction_Click" OnClientClick="return confirmAction();" />
            </td>
            <td style="width: 100%;">&nbsp;</td>
        </tr>
    </table>
       <div style="margin: 10px 0px 20px 0px;">
            <table>
                <tr>
                    <td width="130">
                        <label><b>Institution Name:</b></label>
                    </td>
                    <td>
                        <asp:HyperLink runat="server" ID="lbtnInstitution" Font-Underline="True"></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Institution Type:</b></label>
                    </td>
                    <td>
                        <label><asp:Label runat="server" ID="lblInstitutionType"></asp:Label></label>
                    </td>
                </tr>
                <tr>
                    <td>
                       <label><b>Blacklist Status:</b></label>
                    </td>
                    <td>
                        <label><asp:Label runat="server" ID="lblInstitutionBlacklistStatus"></asp:Label></label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>Last Update:</b></label>
                    </td>
                    <td>
                        <label><asp:Label runat="server" ID="lblInstitutionBlacklistStatusUpdated"></asp:Label></label>
                    </td>
                </tr>
            </table>
       </div>
    </div>
    <div class="gridForm">
        
        <uc1:InstitutionBlacklistComments ID="InstitutionBlacklistComments1" runat="server" />

    </div>
    <div id="dvComment" style="display:none;" title="Blacklist Status Comment">
        <table>
            <tr><td><asp:TextBox ID="tbComment" runat="server" TextMode="MultiLine" Width="470px" Rows="4"></asp:TextBox></td></tr>
            <tr><td><asp:Button ID="btnCommentSave" runat="server" Text="Save" Width="50px" OnClick="btnAction_Click"></asp:Button></td></tr>
        </table>
    </div>

    <input type='hidden' id="TemplateUrl" runat="server" />    
    <script type="text/javascript">
        var templateUrl = $("[id*=TemplateUrl]").val();
        if (templateUrl != null && templateUrl.length > 0) {
            window.open(templateUrl, "Print_Template_BlacklistManagement");

            if ("<%= Redirect %>" == "True")
            {
                window.location.href = 'Institution_Details.aspx?InstitutionID=<%= this.EntityID %>';
            }
        }
    </script>
</asp:Content>