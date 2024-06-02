<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Payment_Summary.aspx.cs" Inherits="ASF.Web.Payment_Summary" %>
   
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript">

        function OpenStudentPaymentsPopup(institutionIDs, year)
        {
            var url = '/StudentPaymentConfirmationReport.aspx?InstitutionIDList=' + institutionIDs + '&Year=' + year;

            window.open(url, 'Student Payment Confirmation Report', 'menubar=no,status=no,toolbar=no,height=850,width=800');

            return false;
        }

        function DoPostback(source) {

            __doPostBack(source, "Redirect");

        }

        function Postback() {

        }

        function OpenPrintInstitutionPopup(institutionIDs) {
            var url = '/ApplicationForm_Wizard_Print.aspx?ids=' + institutionIDs;

            window.open(url, 'Institution Address List', 'menubar=no,status=no,toolbar=no,height=850,width=800');

            return false;
        }

    </script>

    <h2>Payment Summary</h2>

    <div class="gridForm">
        <table class="toolbar">
            <tr>
                 <td class="toolbarCell">
                    <asp:Button ID="toolbarImgButton" runat="server" CssClass="toolbarImageButton search" OnClientClick="Search_Click(); return false;" Text="Search"></asp:Button>
                </td>
                <td class="toolbarCell">                    
                    <input type="submit" value="Make Payments" id="btnUpdate" class="toolbarImageButton save">
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnPrintStudentPayments" runat="server" Text="Print Payments" CssClass="toolbarImageButton print" onclick="btnPrintPayments_Click" />
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
                    <tgs:IntegerDropdownList runat="server" ID="idlPaymentSummaryStatus" 
                        AutoPostBack="True" 
                        onselectedindexchanged="idlPaymentSummaryStatus_SelectedIndexChanged" />
                </td>
            </tr>
        </table>
		<div style="height:20px; text-align: right; display: block; font-family:Tahoma; font-size:8pt; ">
            <asp:Label ID="lblRecordCount" runat="server"></asp:Label>
        </div>

        <asp:Label runat="server" ID="lblMakePayments" Text="Payment for selected institution(s) processed successfully" Visible="false" Style="color: green;"></asp:Label>
        
        <asp:GridView runat="server" ID="gvPaymentSummary" DataKeyNames="InstitutionId,IsTotal"
            AutoGenerateColumns="false" CssClass="grid" Style="width: 100%;" 
            AllowPaging="True"
            OnPageIndexChanging="gvPaymentSummary_PageIndexChanging"
            OnRowDataBound="gvPaymentSummary_RowDataBound">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Institution</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="hplInstitution" runat="server" ToolTip='<%#Eval("Comments")%>'><%#Eval("InstitutionName")%></asp:HyperLink>
                        <asp:Label ID="lblInstitution" runat="server" Text='<%#Eval("InstitutionName")%>' Visible="False" ToolTip='<%#Eval("Comments")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>
                            Status</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:Label ID="lblInstitutionStatus" runat="server"><%#Eval("InstitutionStatus")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>
                            Pmnt 1 Pend</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Hyperlink ID="hplPayment1Pending" runat="server"></asp:Hyperlink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>
                            Pmnt 1 Rqrd</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment1Required" runat="server"><%#Eval("Payment1Required")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>
                            Pmnt 1 Paid</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment1Paid" runat="server"><%#Eval("Payment1Paid")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <label>
                            Pmnt 1 Pmnt Amnt
                        </label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment1PaymentAmount" runat="server"><%#Eval("Payment1PaymentAmount")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <label>
                            Pmnt 1 Ttl</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment1TotalAmount" runat="server"><%#Eval("Payment1TotalAmount")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>
                            Pmnt 2 Decl</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment2Declined" runat="server"><%#Eval("Payment2Declined")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Pmnt 2 Pend</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Hyperlink ID="hplPayment2Pending" runat="server"></asp:Hyperlink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Pmnt 2 Rqrd</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment2Required" runat="server"><%#Eval("Payment2Required")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Pmnt 2 Paid</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment2Paid" runat="server"><%#Eval("Payment2Paid")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Outstanding Reports</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblOutstandingReports" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <label>Pmnt 2 Pmnt Amnt
                        </label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment2PaymentAmount" runat="server"><%#Eval("Payment2PaymentAmount")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <label>Pmnt 2 Ttl</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPayment2TotalAmount" runat="server"><%#Eval("Payment2TotalAmount")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <label>Banking Details</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <a href="javascript:;" class="bank-details" id="hplBankingDetails" runat="server"><asp:Label ID="lblBankingDetails" runat="server" data-id='<%#Eval("InstitutionID")%>'>Open</asp:Label></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Owes Money</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <ItemTemplate>
                        <asp:HyperLink ID="lbtnOwesMoney" runat="server" Visible="False"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <HeaderStyle HorizontalAlign="Center"  />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <label>Pmnt Mthd</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tgs:IntegerDropdownList runat="server" ID="ddPaymentType" CssClass="dropdown" style="font-family:Tahoma; font-size:8pt; width: 55px;"></tgs:IntegerDropdownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <label>Pay</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkMakePayment" runat="server" Checked='<%# Eval("MakePayment") %>'></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <div class="hidden">
        <asp:Repeater runat="server" ID="rptBankingDetails">
            <ItemTemplate>
                <div id="institution-bank-details-<%#Eval("InstitutionId")%>">
                <table>
                    <tr>
                        <td width="120">
                            <strong>Account Name:</strong>
                        </td>
                        <td>
                            <%#Eval("AccountName")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Account Type:</strong>
                        </td>
                        <td>
                            <%#Eval("AccountType")%>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <strong>Account Number:</strong>
                        </td>
                        <td>
                            <%#Eval("AccountNumber")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <strong>Bank:</strong>
                        </td>
                        <td>
                            <%#Eval("Bank")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <strong>Branch:</strong>
                        </td>
                        <td>
                            <%#Eval("Branch")%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <strong>Branch Code:</strong>
                        </td>
                        <td>
                            <%#Eval("BranchCode")%>
                        </td>
                    </tr>
                </table>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
     <div id="dvSearch" title="Payment Summary Search Criteria" style="display: none;">
        <table>
            <tr>
                <td style="width: 150px;"><label>Application Year</label></td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlYear" Width="150px"/>
                </td>
            </tr>
                <tr>
                <td style="width: 150px;"><label>Institution</label></td>
                <td>
                    <asp:TextBox ID="txtSearchInstitution" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 150px;"><label>Status</label></td>
                <td>
                    <tgs:IntegerDropdownList runat="server" ID="idlSearchPaymentSummaryStatus"></tgs:IntegerDropdownList>
                </td>
            </tr>
            <tr><td style="height: 10px;"></td></tr>
             <tr>
                <td><asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" OnClick="btnSearch_Click" /></td>
             </tr>
            <tr><td style="height: 5px;"></td></tr>
        </table>
    </div>
    <div id="dvPayInstitution" title="Institution Payment" style="display: none;">
        <table>
            <tr>
                <td style="width: 150px;"><label>Payment Date</label></td>
                <td>
                    <input type="text" id="txtPaymentDate" runat="server" style="width:70px !important;" />
                </td>
            </tr>            
            <tr><td style="height: 5px;"></td></tr>
            <tr>
                <td><asp:Button ID="btUpdate" runat="server" Text="Make Payment" OnClick="btUpdate_Click" /></td>
            </tr>
            <tr><td style="height: 5px;"></td></tr>
        </table>
    </div>
    
    <script type="text/javascript">    
    $("a.bank-details").bind("click dblclick", function() {
        var dialog = $("#institution-bank-details-" + $(this).find("span").attr("data-id")).dialog({ title: "Bank Details", resizable: false, modal: true });
        dialog.parent().appendTo($("form:first"));
    });
    
    function Search_Click()
    {
        var dialog = $("#dvSearch").dialog({ resizable: false, width: "500px", modal: true });

        dialog.parent().appendTo($("form:first"));
    }       
    $("a.bank-details span.error").parent().addClass("error");

    $("#btnUpdate").bind("click", function ()
    {
        if ($('.gridForm :checkbox:checked').length == 0)
        {
            alert('Please select at least one institution');
            return false;
        }
        
        var dialog = $("#dvPayInstitution").dialog({ resizable: false, modal: true });
        dialog.parent().appendTo($("form:first"));

        return false;       
    });

    $("[id*=btUpdate]").bind("click", function ()
    {
        if ($.trim($(this).val()).length == 0)
        {
            alert("Please select a payment date.")
            return false;
        }

        if (!confirm('Are you sure you want to make the selected payment(s)?'))
            return false;
    });

    $(function () {
        var txtPaymentDate = $("[id*=txtPaymentDate]");

        txtPaymentDate.datepicker({
            dateFormat: 'yy-mm-dd',
            yearStart: '<%=DateTime.Now.Year - 1 %>',
            yearEnd: '<%=DateTime.Now.Year + 1 %>'
        });

        txtPaymentDate.keydown(function () { return false; });

        txtPaymentDate.datepicker('hide');

        txtPaymentDate.val('<%=DateTime.Now.ToString("yyyy-MM-dd") %>');
    });

    </script>
</asp:Content>
