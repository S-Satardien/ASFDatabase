<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Student_Management.aspx.cs" Inherits="ASF.Web.Student_Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script type="text/javascript">

        $(document).ready(function () {

            $(".datepicker").datepicker(
            {
                showOn: 'button',
                buttonImage: '/Images/Calendar.png',
                buttonImageOnly: true,
                dateFormat: 'yy-m-dd',
                changeYear: true,
                changeMonth: true,
                yearRange: '1975:2011'
            });

            $(".datepicker").next("img").css("cursor", "pointer").css("position", "relative").css("top", "3px").css("margin-left", "3px");

        });

        function Search_Click() {

            var dialog = $("#dvSearch").dialog({ position: [80, 100], resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));
        }

    </script>

    <h2>Student Management</h2>

    <div class="gridForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnRefresh" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Refresh.png) no-repeat" Text="Refresh" OnClick="btnRefresh_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Add.png) no-repeat" Text="Add new Student" OnClick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <span class="toolbarImageButton" onclick="Search_Click();" style="background: url(/Images/Toolbar/Search.png) no-repeat; padding-left: 16px;">Search</span>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>

        <asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0px;"
            GridLines="Both" AutoGenerateColumns="false" Width="100%" 
            OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>First Name</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((ASF.BusinessObjects.Student)Container.DataItem).Firstname %>' CommandName="itemDetail" CommandArgument='<%# ((ASF.BusinessObjects.Student)Container.DataItem).StudentID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Last Name</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:Label ID="lblLastname" runat="server" Text='<%# ((ASF.BusinessObjects.Student)Container.DataItem).Lastname %>'></asp:Label>
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
                        <asp:Label ID="lblDOB" runat="server" Text='<%# ((DateTime)((ASF.BusinessObjects.Student)Container.DataItem).DOB).ToString("yyyy-MM-dd") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Email</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# ((ASF.BusinessObjects.Student)Container.DataItem).Email %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Contact Number</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblContactNo" runat="server" Text='<%# ((ASF.BusinessObjects.Student)Container.DataItem).Mobile %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Province</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblProvince" runat="server" Text='<%# ((ASF.BusinessObjects.Student)Container.DataItem).Province.Description %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Institution</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblInstitution" runat="server"></asp:Label>
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
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Donor</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblDonor" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Award Amount</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblAwardAmount" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
        </asp:GridView>

        <div id="dvSearch" title="Student Search Criteria  <img src='/Images/Filter.png' style='position: relative; top: 2px; left: 10px;' alt=''>" style="display: none;">
        
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
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                    <td><label>Region</label></td>
                    <td colspan="2"><asp:DropDownList ID="ddSearchProvince" runat="server" Width="150px" DataValueField="ProvinceID" DataTextField="Description"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><label>Donor</label></td>
                    <td colspan="2"><asp:DropDownList ID="ddSearchDonor" runat="server" Width="150px" DataValueField="DonorID" DataTextField="DisplayName"></asp:DropDownList></td>
                </tr>
                <%--<tr>
                    <td><label>Award Amount Between</label></td>
                    <td colspan="2">
                        <asp:TextBox ID="txtSearchAwardAmountFrom" runat="server" CssClass="numeric" Width="60px"></asp:TextBox>
                        <label> and </label>
                        <asp:TextBox ID="txtSearchAwardAmountTo" runat="server" CssClass="numeric" Width="60px"></asp:TextBox>
                    </td>
                </tr>--%>
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                    <td><asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" OnClick="btnSearch_Click" /></td>
                </tr>
            </table>

        </div>

    </div>

    

</asp:Content>
