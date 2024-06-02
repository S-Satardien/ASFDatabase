<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Communication_Management.aspx.cs" Inherits="ASF.Web.Communication_Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function Search_Click() {
            var dialog = $("#dvSearch").dialog({ resizable: false, width: "400px", modal: true });
            dialog.parent().appendTo($("form:first"));
            return false;
        }

        $(function () {
            $("[id*=btnGenerateLabels]").bind("click", function () {
                setTimeout(function () {
                    window.location.href = window.location.href;
                }, 1000);
            });
        });
    </script>
    <h2>
        Communication Management</h2>
    <div class="gridForm">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnGenerate" runat="server" CssClass="toolbarImageButton envelope" Text="Get Letter" OnClick="btnGenerate_Click" OnClientClick="target ='_blank';" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnGenerateLabels" runat="server" CssClass="toolbarImageButton settings" Text="Generate Labels" OnClick="btnGenerateLabels_Click" OnClientClick="target ='_blank';" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnCommList" runat="server" CssClass="toolbarImageButton list" Text="Communications List" OnClick="btnCommList_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="toolbarImgButton" runat="server" CssClass="toolbarImageButton search" OnClientClick="Search_Click(); return false;" Text="Search"></asp:Button>
                </td>
                <td style="width: 100%;">
                    &nbsp;
                </td>
            </tr>
        </table>
        <table class="detailsForm">
            <tr>
                <td><label><b>Status:</b></label></td>
                <td>
                    <tgs:IntegerDropdownList runat="server" ID="idlCommunicationStatus" 
                        AutoPostBack="True" 
                        onselectedindexchanged="idlCommunicationStatus_SelectedIndexChanged" />
                </td>
            </tr>
            <tr>
                <td><label><b>Institution:</b></label></td>
                <td>
                    <tgs:IntegerDropdownList runat="server" ID="ddInstitution" AutoPostBack="True" 
                        DataValueField="InstitutionID"
                        DataTextField="Name"
                        OnSelectedIndexChanged="ddInstitution_SelectedIndexChanged" />
                </td>
            </tr>
        </table>
        <asp:Panel runat="server" ID="pnlContent">
        </asp:Panel>
    </div>
    <input type='hidden' id="TemplateUrl" runat="server" />
    <div id="dvSearch" title="Search Criteria  <img src='/Images/Filter.png' style='position: relative; top: 2px; left: 10px;' alt=''>"
        style="display: none;">
        <table>
            <tr>
                <td style="width: 150px;">
                    <label>
                        First Name</label>
                </td>
                <td>
                    <asp:DropDownList ID="ddSearchFirstNameOperator" runat="server" Width="80px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txtSearchFirstName" runat="server" Width="120px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        Last Name</label>
                </td>
                <td>
                    <asp:DropDownList ID="ddSearchLastNameOperator" runat="server" Width="80px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txtSearchLastName" runat="server" Width="120px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        Institution:</label>
                </td>
                <td>
                    <asp:DropDownList ID="ddSearchInstitutionOperator" runat="server" Width="80px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="txtInstitution" runat="server" Width="120px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        Institution Type:</label>
                </td>
                <td>
                    <asp:DropDownList ID="ddInstitutionType" runat="server" Width="80px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        Label Status</label>
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="ddLabelStatus" runat="server" Width="80px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="height: 10px;">
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" OnClick="btnSearch_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
