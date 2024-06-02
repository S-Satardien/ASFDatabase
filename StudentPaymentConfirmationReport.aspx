<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentPaymentConfirmationReport.aspx.cs" Inherits="ASF.Web.ViewReport" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div style="position: absolute; top:5px; right: 5px; bottom: 5px; left: 5px; border: solid 1px #DDDDDD;">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" 
                    WaitMessageFont-Names="Verdana" 
                    WaitMessageFont-Size="14pt" 
                    Width="100%" 
                    Height="100%"
                    ShowFindControls="False" 
                    InteractiveDeviceInfos="(Collection)"
                    >
            
                 <LocalReport EnableExternalImages="True" EnableHyperlinks="True" ReportPath="Reports\StudentPaymentConfirmationReportList.rdlc" >
                     <DataSources>
                         <rsweb:ReportDataSource DataSourceId="dsPaymentData" Name="PaymentData" />
                     </DataSources>
                 </LocalReport>
            </rsweb:ReportViewer>
        
        </div>

        <asp:ObjectDataSource ID="dsPaymentData" runat="server" 
            SelectMethod="GetInstitutionPaymentReportData" 
            TypeName="ASF.Services.InstitutionPaymentService">
            <SelectParameters>
                <asp:QueryStringParameter Name="InstitutionIDList" QueryStringField="InstitutionIDList" Type="String" />
                <asp:QueryStringParameter Name="Year" QueryStringField="Year" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

    </form>
</body>
</html>
