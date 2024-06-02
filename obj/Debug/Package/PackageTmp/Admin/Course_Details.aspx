<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Course_Details.aspx.cs" Inherits="ASF.Web.Admin.Course_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        function AddSubject_Click()
        {
            var dialog = $("#dvInstitutionCourseDetails").dialog({ position: [200, 195], resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));
        }
        
    </script>

    <h2>Course Details</h2>

    <div class="detailsForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Save.png) no-repeat" Text="Save Details" OnClick="btnSave_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnGridView" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/GridView.png) no-repeat" Text="Course List" OnClick="btnGridView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Add.png) no-repeat" Text="Add new Course" OnClick="btnAdd_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        
        <br />

        <table>
            <tr>
                <td style="width: 150px;"><label>Description</label></td>
                <td><asp:TextBox ID="txtDescription" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Course Type</label></td>
                <td><asp:DropDownList ID="ddInstitutionType" runat="server" Width="100px"></asp:DropDownList></td>
            </tr>
        </table>

        <br />
        <br />

        <asp:Panel ID="pnlSubjects" runat="server">

            <table>
                <tr>
                    <td><h5>Course Subjects</h5></td>
                    <td style="width: 20px;">
                        <img id="btnAddSubject" src="/Images/Toolbar/Add.png" runat="server" class="toolbarButton" title="Add new institution course" alt="Add new institution course" onclick="AddSubject_Click();" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">

                        <asp:GridView ID="GridViewCourseSubjects" runat="server" CssClass="grid" style="margin: 0px;"
                            GridLines="Both" AutoGenerateColumns="false" Width="400px">
                            <HeaderStyle CssClass="gridHeader" />
                            <RowStyle CssClass="row" />
                            <AlternatingRowStyle CssClass="alternatingRow" />
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <HeaderTemplate>
                                        <label>Subject</label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubject" runat="server" Text='<%# ((ASF.BusinessObjects.Subject)Container.DataItem).Description %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddSubjects" runat="server"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <label>This course does not contain any subjects yet.</label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </table>

        </asp:Panel>

        <div id="dvInstitutionCourseDetails" class="popup" style="display: none;" title="Institution Course Details">
        
            <table>
                <tr>
                    <td style="width: 120px;"><label>Subject</label></td>
                    <td><asp:DropDownList ID="ddSubject" runat="server" Width="200px" DataValueField="SubjectID" DataTextField="Description"></asp:DropDownList></td>
                </tr>
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSaveCourseSubjectDetails" CssClass="button" runat="server" Text="Save" Width="70px" onclick="btnSaveCourseSubjectDetails_Click" />
                    </td>
                </tr>
            </table>

        </div>

    </div>

</asp:Content>
