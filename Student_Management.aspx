<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Student_Management.aspx.cs" Inherits="ASF.Web.Student_Management" %>
<%@ Register src="UserControls/GridExportControl.ascx" tagname="GridExportControl" tagprefix="uc1" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Student Management</h2>

    <div class="gridForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new Student" OnClick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="toolbarBtnSearch" runat="server" CssClass="toolbarImageButton search" Text="Search" OnClientClick="Search_Click(); return false;" />
                </td>
                <td class="toolbarCell">
                    <uc1:GridExportControl ID="GridExportControl1" runat="server" />
                </td>
                <td style="width: 100%;">&nbsp;</td>
            </tr>
        </table>
        
        <div style="height:20px; text-align: right; display: block; font-family:Tahoma; font-size:8pt; ">
            <asp:Label ID="lblRecordCount" runat="server"></asp:Label>
        </div>

        <asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0px;"
            GridLines="Both" BorderColor="#CCCCCC" AutoGenerateColumns="false" Width="100%" AllowPaging="True" PagerSettings-Position="Bottom"
            OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <EmptyDataTemplate>There are no students that match your criteria</EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>First Name</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((Student)Container.DataItem).Firstname %>' CommandName="studentDetail" CommandArgument='<%# ((Student)Container.DataItem).StudentID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Last Name</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:Label ID="lblLastname" runat="server" Text='<%# ((Student)Container.DataItem).Lastname %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Gender</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblGender" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Date of Birth</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblDOB" runat="server" Text='<%# (((Student)Container.DataItem).DOB).HasValue ? (((Student)Container.DataItem).DOB).Value.ToString("yyyy-MM-dd") : "" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Contact Number</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblContactNo" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Province</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblProvince" runat="server" Text='<%# Eval("Province.Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Institution</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnInstitution" runat="server" CommandName="institutionDetail"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Course</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblCourse" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="40px" />
                    <HeaderTemplate>
                        <label>Last Application Year</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblLastApplicationYear" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Donor</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnDonor" runat="server" CommandName="donorDetail"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Mode="NumericFirstLast" Visible="True" Position="Bottom" FirstPageText="First" NextPageText="Next" LastPageText="Last"></PagerSettings>
        </asp:GridView>

        <div id="dvSearch" title="Student Search Criteria" style="display: none; overflow: hidden;">
        
            <table>
                <tr>
                    <td style="width: 150px;"><label>First Name</label></td>
                    <td><asp:DropDownList ID="ddSearchFirstNameOperator" runat="server" Width="80px"></asp:DropDownList></td>
                    <td><asp:TextBox ID="txtSearchFirstName" runat="server" Width="120px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Last Name</label></td>
                    <td><asp:DropDownList ID="ddSearchLastNameOperator" runat="server" Width="80px"></asp:DropDownList></td>
                    <td><asp:TextBox ID="txtSearchLastName" runat="server" Width="120px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Date Of Birth</label></td>
                    <td><asp:DropDownList ID="ddSearchDOBOperator" runat="server" Width="80px"></asp:DropDownList></td>
                    <td><asp:TextBox ID="txtSearchDOB" runat="server" CssClass="datepicker" Width="80px" style="text-align: center;"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Email</label></td>
                    <td><asp:DropDownList ID="ddSearchEmailOperator" runat="server" Width="80px"></asp:DropDownList></td>
                    <td><asp:TextBox ID="txtSearchEmail" runat="server" Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Institution</label></td>
                    <td><tgs:IntegerDropdownList ID="ddInstitutionOperator" runat="server" Width="80px"></tgs:IntegerDropdownList></td>
                    <td><asp:TextBox ID="txtInstitutionName" runat="server" Width="200px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Region</label></td>
                    <td colspan="2"><asp:DropDownList ID="ddSearchProvince" runat="server" Width="150px" DataValueField="ProvinceID" DataTextField="Description"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><label>Donor</label></td>
                    <td colspan="2"><asp:DropDownList ID="ddSearchDonor" runat="server" Width="150px" DataValueField="DonorID" DataTextField="DisplayName"></asp:DropDownList></td>
                </tr>
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                    <td><asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" OnClick="btnSearch_Click" /></td>
                </tr>
            </table>

        </div>

    </div>
    <script type="text/javascript">
        BindCalendars("<%=DateTime.Now.AddYears(-30).Year %>", "<%=DateTime.Now.AddYears(-12).Year %>", 20);
        
        var showDialog = <%= (!Page.IsPostBack).ToString().ToLowerInvariant() %>;
        if(showDialog)
        {
            Search_Click();
        }
        
        function Search_Click()
        {
            var dialog = $("#dvSearch").dialog({ resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));
        }
    </script>
    

</asp:Content>
