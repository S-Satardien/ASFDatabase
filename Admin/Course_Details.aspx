<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Course_Details.aspx.cs" Inherits="ASF.Web.Admin.Course_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        function AddSubject_Click()
        {
            var dialog = $("#dvInstitutionCourseDetails").dialog({ resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));
        }
        
    </script>
    <h2><asp:Label ID="lblHeading" runat="server" Text="Course Details"></asp:Label></h2>
    <div class="detailsForm LeavePageNotiDialog">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton save NoLeavePageNotiDialog" ValidationGroup="Save" Text="Save Details" OnClick="btnSave_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnGridView" runat="server" CssClass="toolbarImageButton list" Text="Course List" OnClick="btnGridView_Click" />
                </td>
                <td style="width: 100%;">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <asp:ValidationSummary DisplayMode="List" EnableClientScript="true"
            HeaderText="<h4>Please Correct the Following:</h4>" ValidationGroup="Save" CssClass="validationSummary" runat="server" />
        <table>
            <tr>
                <td style="width: 150px;">
                    <label>
                        Description</label>
                </td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valDescriptionRequired" runat="server" ControlToValidate="txtDescription"
                        CssClass="requiredField" ErrorMessage="Description is required." Text="*" ValidationGroup="Save"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="valDescriptionUnique" runat="server" ControlToValidate="txtDescription"
                        CssClass="requiredField" ErrorMessage="Course name already exists" Text="*" ValidationGroup="Save"
                        OnServerValidate="valDescriptionUnique_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>
                        Course Type</label>
                </td>
                <td>
                    <tgs:IntegerDropdownList ID="ddInstitutionType" runat="server" Width="100px">
                    </tgs:IntegerDropdownList>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
