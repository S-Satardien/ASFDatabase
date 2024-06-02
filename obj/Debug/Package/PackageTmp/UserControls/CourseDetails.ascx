<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CourseDetails.ascx.cs" Inherits="ASF.Web.UserControls.CourseDetails" %>

<div class="detailsForm">

    <table>
        <tr>
            <td style="width: 150px;"><label>Course Name</label></td>
            <td><asp:TextBox ID="txtCourseName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><label>Course Type</label></td>
            <td><asp:DropDownList ID="ddCourseType" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td><label>Level</label></td>
            <td><asp:DropDownList ID="ddCourseLevel" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td><label>Pay Cycles</label></td>
            <td><asp:TextBox ID="txtPaycycles" runat="server" CssClass="integer" Width="60px"></asp:TextBox></td>
        </tr>
        <tr>
            <td><label>Course Cost</label></td>
            <td><asp:TextBox ID="txtCourseCost" runat="server" CssClass="numeric" Width="60px"></asp:TextBox></td>
        </tr>
        <tr>
            <td><label>Full Time</label></td>
            <td><asp:CheckBox ID="cbFulltime" runat="server" /></td>
        </tr>
        <asp:Panel ID="pnlSave" runat="server">
            <tr><td style="height: 10px;"></td></tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" onclick="btnSave_Click" />
                </td>
            </tr>
        </asp:Panel>

    </table>

    
</div>
