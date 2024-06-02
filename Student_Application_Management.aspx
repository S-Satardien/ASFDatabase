<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Student_Application_Management.aspx.cs" Inherits="ASF.Web.Student_Application_Management" %>
<%@ Register src="UserControls/GridExportControl.ascx" tagname="GridExportControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Student Application Management</h2>

    <div class="gridForm">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <span class="toolbarImageButton" onclick="Search_Click();" style="background: url(/Images/Toolbar/Search.png) no-repeat;
                        padding-left: 16px;">Search</span>
                </td>
                <td class="toolbarCell">
                    <uc1:GridExportControl ID="GridExportControl1" runat="server" />
                </td>
                 <td class="toolbarCell">
                    <asp:Button ID="btnPrintSummary" runat="server" CssClass="toolbarImageButton" Style="background: url(/Images/Toolbar/Print.png) no-repeat" Text="Print Summary" OnClick="btnPrintSummary_Click" />
                </td>
                <td style="width: 100%;">
                    &nbsp;
                </td>
            </tr>
        </table>
        
        <div style="height:20px; text-align: right; display: block; font-family:Tahoma; font-size:8pt; ">
            <asp:Label ID="lblRecordCount" runat="server"></asp:Label>
        </div>
        
        <div style="width:100%;overflow-x:scroll;">
        <div style="width:1400px;overflow-x:auto;">
            <asp:GridView ID="GridView1" runat="server" CssClass="grid" Style="margin: 0px;"
                GridLines="Both" BorderColor="#CCCCCC" AutoGenerateColumns="false" Width="100%"
                OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" AllowPaging="True"
                AllowSorting="True" OnSorting="SortGrid"
                OnPageIndexChanging="GridView1_PageIndexChanging">
                <HeaderStyle CssClass="gridHeader" />
                <RowStyle CssClass="row" />
                <AlternatingRowStyle CssClass="alternatingRow" />
                <PagerSettings Visible="True" Position="Bottom"></PagerSettings>
                <EmptyDataTemplate>
                    <p>
                        There are no student applications that match your criteria.
                    </p>
                </EmptyDataTemplate>
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
                    <asp:TemplateField SortExpression="Name" HeaderText="Name">
                        <HeaderStyle HorizontalAlign="Left" Width="150" />
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="hplStudentLink"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Status" HeaderText="Award Status">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblAwardStatus" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Institution" HeaderText="Institution">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnInstitution" runat="server" CommandName="institutionDetail"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Province" HeaderText="Province">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:Label ID="lblProvince" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="InstitutionStatus" HeaderText="Institution Status">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblInstitutionStatus" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Course" HeaderText="Course">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblCourse" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="JuneAvg" HeaderText="Prior June Result">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblJuneAvg" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  SortExpression="DecAvg" HeaderText="Prior Dec Result">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblDecAvg" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  SortExpression="Payment1Processed" HeaderText="Payment 1 Processed">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblFirstPayment" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Payment1Paid" HeaderText="Payment 1 Paid">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblFirstPaymentDate" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Payment1Amount" HeaderText="Payment 1 Amount">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblFirstPaymentAmount" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Notification1Received" HeaderText="Thank you notification 1 recieved">
                        <HeaderStyle HorizontalAlign="Center" Width="40px" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Image ID="imgNotificationRecieved1" runat="server"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="JuneResult" HeaderText="Current Year June Result">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblJuneResult" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField SortExpression="Payment2Processed" HeaderText="Payment 2 Processed">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblSecondPayment" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Payment2Paid" HeaderText="Payment 2 Paid">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblSecondPaymentDate" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Payment2Amount" HeaderText="Payment 2 Amount">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblSecondPaymentAmount" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField SortExpression="Notification2Received" HeaderText="Thank you notification 2 recieved">
                        <HeaderStyle HorizontalAlign="Center" Width="40px" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Image ID="imgNotificationRecieved2" runat="server"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="DecResult" HeaderText="Current Year Dec Result">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblDecResult" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="Donor" HeaderText="Donor">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDonor" runat="server" CommandName="donorDetail"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField SortExpression="AwardAmount" HeaderText="Award Amount">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lblAwardAmount" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        </div>
        <div id="dvSearch" title="Student Application Search Criteria"
            style="display: none; overflow: hidden;">
            <table>
                <tr>
                    <td style="width: 150px;">
                        <label>First Name</label>
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
                        <label>Last Name</label>
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
                        <label>Award Status:</label>
                    </td>
                    <td colspan="2">
                        <tgs:IntegerDropdownList ID="ddApplicationAwardStatus" runat="server" Width="150px" >
                        </tgs:IntegerDropdownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Grade:</label>
                    </td>
                    <td colspan="2">
                        <tgs:IntegerDropdownList ID="ddSearchCourseLevel" runat="server" Width="150px" DataValueField="CourseLevelID" DataTextField="Description">
                        </tgs:IntegerDropdownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Year:</label>
                    </td>
                    <td colspan="2">
                        <tgs:IntegerDropdownList ID="ddApplicationYear" runat="server" Width="150px">
                        </tgs:IntegerDropdownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Institution:</label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddInstitution" runat="server" Width="150px" DataValueField="InstitutionID" DataTextField="Name">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Donor</label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddSearchDonor" runat="server" Width="150px" DataValueField="DonorID"
                            DataTextField="DisplayName">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Province</label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddSearchProvince" runat="server" Width="150px" DataValueField="ProvinceID"
                            DataTextField="Description">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Amount</label>
                    </td>
                    <td colspan="2">
                        between
                        <asp:TextBox ID="txtSearchAwardAmountFrom" runat="server" CssClass="numeric noresize" style="width:60px;" ></asp:TextBox>
                        <label>
                            and
                        </label>
                        <asp:TextBox ID="txtSearchAwardAmountTo" runat="server" CssClass="numeric noresize" style="width:60px;" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="<%=ddInRefundProcess.ClientID %>">In Refund Process</label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddInRefundProcess" runat="server" Width="150px">
                            <asp:ListItem Value="-1" Text="N/A"></asp:ListItem>
                            <asp:ListItem Value="1" Text="In Refund"></asp:ListItem>
                            <asp:ListItem Value="0" Text="Not In Refund"></asp:ListItem>
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
    </div>
    <script type="text/javascript">
        var showDialog = <%= ((!Page.IsPostBack) && !ShowDialogOverride).ToString().ToLowerInvariant() %>;
        function Search_Click()
        {
            var dialog = $("#dvSearch").dialog({ resizable: false, width: "500px", modal: true });
            dialog.parent().appendTo($("form:first"));
        }
        if(showDialog)
        {
            Search_Click();
        }

        $("input[id*=chkSelectedAll]").bind("click", function() {
            var el = $(this);
            var chkd = el.attr("checked") == "checked";
            
            if (chkd)
            {
                $("input[type='checkbox']").not("#" + el.attr("id")).attr("checked", "checked");
            }
            else
            {
                $("input[type='checkbox']").not("#" + el.attr("id")).removeAttr("checked");
            }
        });
    </script>
</asp:Content>
