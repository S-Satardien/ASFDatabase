<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Payment_Details.aspx.cs" Inherits="ASF.Web.Payment_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript">

        function OpenStudentPaymentsPopup() {
            var url = '/StudentPaymentConfirmationReport.aspx?InstitutionIDList=<%= Request["institutionId"] %>&Year=<%= Request["year"] %>';

            window.open(url, 'menubar=no,status=no,toolbar=no');

            return false;
        }

    </script>

    <h2>Payment Details</h2>
    <div class="detailsForm">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btRefresh" runat="server" CssClass="toolbarImageButton refresh" Text="Refresh" onclick="btRefresh_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btUpdate" runat="server" Text="Update" CssClass="toolbarImageButton save" onclick="btUpdate_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="Button1" runat="server" Text="Payment Summary" CssClass="toolbarImageButton list" onclick="Button1_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnPrintFirstPayments" runat="server" Text="Print First Payments" CssClass="toolbarImageButton print" onclick="btnPrintFirstPayments_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnSecondFirstPayments" runat="server" Text="Print Second Payments" CssClass="toolbarImageButton print" onclick="btnPrintSecondPayments_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnRepayPopup" runat="server" Text="Repay Student Payments" CssClass="toolbarImageButton payment" OnClientClick="return OpenRepaymentPopup();" />
                </td>
                <td style="width: 100%;">
                    &nbsp;
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td width="80">
                    <label><b>Year:</b></label>
                </td>
                <td>
                    <label><asp:Label runat="server" ID="lblYear"></asp:Label></label>
                </td>
            </tr>
            <tr>
                <td>
                    <label><b> Institution:</b></label>
                </td>
                <td>
                    <label><asp:Label runat="server" ID="lblInstitution"></asp:Label></label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label runat="server" ID="lblUpdated" Text="Records updated successfully" Visible="False" style="color:green;"></asp:Label>
        <asp:GridView runat="server" ID="gvPaymentDetails" 
            DataKeyNames="StudentApplicationId,CurrentPayCycle" AutoGenerateColumns="false"
            CssClass="grid" Style='width: 98%;' 
            onrowdatabound="gvPaymentDetails_RowDataBound">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="20"/>
                    <HeaderTemplate>
                        <asp:CheckBox runat="server" ID="chkSelectAll" /> 
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:HiddenField runat="server" ID="hdnStudentApplicationID" Value='<%#Eval("StudentApplicationId")%>' ></asp:HiddenField>
                        <asp:CheckBox Visible='<%#(!(bool)Eval("Excluded"))%>' runat="server" ID="chkSelectedStudent" />                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left"/>
                    <HeaderTemplate><label>Student</label></HeaderTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="hplStudent" runat="server" NavigateUrl='<%#Eval("StudentLink")%>' Text='<%#Eval("StudentName")%>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="100"/>
                    <HeaderTemplate>
                        <label>Status</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblStudentStatus" runat="server"><%#Eval("StudentStatus")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" Width="100"/>
                    <HeaderTemplate>
                        <label>Donor</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDonorName" runat="server"><%#Eval("DonorName")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="75"/>
                    <HeaderTemplate>
                        <label>Award</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblAwardAmount" runat="server"><%#Eval("AwardAmount")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField >
                    <HeaderStyle HorizontalAlign="Center" Width="75"/>
                    <HeaderTemplate>
                        <label>Remaining</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblRemainingAmount" runat="server"><%#Eval("RemainingAmount")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="50"/>
                    <HeaderTemplate>
                        <label>Dec Avg.</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblDecResult" runat="server"><%#Eval("DecemberAverage")%> %</asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="60" />
                    <HeaderTemplate>
                        <label>Payment 1</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment1Amount" runat="server"><%#Eval("Payment1")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="90" />
                    <HeaderTemplate>
                        <label>Payment 1 Date</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment1Date" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField Visible="False">
                    <HeaderStyle HorizontalAlign="Center" Width="60"/>
                    <HeaderTemplate>
                        <label>June Avg.</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblJuneResult" runat="server"><%#Eval("JuneAverage")%> %</asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField Visible="False">
                    <HeaderStyle HorizontalAlign="Center" Width="60" />
                    <HeaderTemplate>
                        <label>Payment 2</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment2Amount" runat="server"><%#Eval("Payment2")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField Visible="False">
                    <HeaderStyle HorizontalAlign="Center" Width="90" />
                    <HeaderTemplate>
                        <label>Payment 2 Date</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment2Date" runat="server"><%#Eval("Payment2Date")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                   <HeaderStyle HorizontalAlign="Center" Width="40" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <label>Exclude</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkExcludeStudent" runat="server" Checked='<%#Eval("Excluded")%>'></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    
    
    <div id="dvOpenRepaymentPopup" title="Repay Institution Payment" style="display: none;">
        <table>
            <tr>
                <td style="width: 150px;"><label>Payment:</label></td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlPaymentDate" Width="150px"/>
                </td>
            </tr>
                <tr>
                <td style="width: 150px;"><label>New Payment Date</label></td>
                <td>
                    <asp:TextBox ID="txtNewPaymentDate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr><td style="height: 10px;"></td></tr>
             <tr>
                <td><asp:Button ID="btnRepay" runat="server" Text="Make Payment" Width="120px" OnClick="btnRepay_Click" /></td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
        $("a.bank-details").bind("click dblclick", function() {
            var dialog = $("#institution-bank-details-" + $(this).find("span").attr("data-id")).dialog({ title: "Bank Details", resizable: false, modal: true });
            dialog.parent().appendTo($("form:first"));
        });

        $(document).ready(function() {

            $("#<%= txtNewPaymentDate.ClientID %>" ).datepicker(
                {
                    dateFormat: "yy-mm-dd"
                });

        });

        function OpenRepaymentPopup()
        {
            var dialog = $("#dvOpenRepaymentPopup").dialog({ resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));

            return false;
        }

        $("a.bank-details span.error").parent().addClass("error");

        $("[id*=chkSelectAll]").bind("click", function () {
            var chkboxes = $("input[type='checkbox'][id*=chkSelectedStudent]");
            
            if (!$(this).is(":checked")) {
                chkboxes.removeAttr("checked");
            } else {
                chkboxes.attr("checked", "checked");            
            }
        });

    </script>

</asp:Content>
