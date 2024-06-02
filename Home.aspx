<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="ASF.Web.Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="pageWrapper" class="home">
        <table>
            <tr>
                <td>
                    <label>Application Year:</label>
                </td>
                <td colspan="2">
                    <tgs:IntegerDropdownList ID="ddApplicationYear" runat="server" Width="150px" AutoPostBack="True" >
                    </tgs:IntegerDropdownList>
                </td>
            </tr>
        </table>
        <br />
        
        <table style="width: 85%;">
            <tr>
                <td>
                    <div id="dvChartStudentDetails" class="block" style="width: 350px; height: 150px;">
                        <h2>Current Student Application Award Statuses</h2>
                        <hr />
                        <asp:Chart ID="chartStudentDetails" runat="server" Width="325" Height="125"></asp:Chart>
                    </div>
                </td>
                <td>
                    <div id="dvChartAcceptedStudentsByGender" class="block" style="width: 330px;">
                        <h2>Accepted Students By Gender</h2>
                        <hr />
                        <asp:Chart ID="chartAcceptedStudentsByGender" runat="server" Width="325" Height="125"></asp:Chart>
                    </div>
                </td>
                <td>
                    <div id="dvInstitutions" class="block" style="width: 265px; height: 150px;">
                        <h2>Institutions</h2>
                        <hr />
                        <table style="margin: 5px 0px 0px 20px;">
                            <tr>
                                <td width="180">Awaiting Confirmation</td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblSchoolAwaitingConfirmation"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="180">Active</td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblSchoolActive"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Pending 1st Pmnt</td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblSchoolPending1stPayment"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Pending 2nd Pmnt</td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblSchoolPending2ndPayment"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Blacklisted</td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblSchoolBlacklisted"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="total right">
                                    <asp:Label runat="server" ID="lblSchoolTotal"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="dvChartStudentApplications" class="block" style="width: 350px;">
                        <h2>Application Form Wizard Statuses</h2>
                        <hr />
                        <asp:Chart ID="chartStudentApplications" runat="server" Width="325" Height="125"></asp:Chart>
                    </div>
                </td>
                <td>
                    <div id="dvChartInstitutionsByProvince" class="block" style="width: 330px;">
                        <h2>Accepted Students By Province</h2>
                        <hr />
                        <asp:Chart ID="chartInstitutionsByProvince" runat="server" Width="325" Height="125"></asp:Chart>
                    </div>
                </td>
                <td>
                    <div id="dvStudents" class="block" style="width: 265px; height: 150px;">
                        <h2>Total Applications By Gender</h2>
                        <hr />
                        <table style="margin: 5px 0px 0px 20px;">
                            <tr>
                                <td width="180">Male</td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblStudentMale"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Female</td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblStudentFemale"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="total right">
                                    <asp:Label runat="server" ID="lblStudentByGenderTotal"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" height="10">
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="dvChartFirstPayments" class="block" style="width: 350px;">
                        <h2>1st Payments</h2>
                        <hr />
                        <asp:Chart ID="chartFirstPayments" runat="server" Width="325" Height="125"></asp:Chart>
                    </div>
                </td>
                <td>
                    <div id="dvChartSecondPayments" class="block" style="width: 330px;">
                        <h2>2nd Payments</h2>
                        <hr />
                        <asp:Chart ID="chartSecondPayments" runat="server" Width="325" Height="125"></asp:Chart>
                    </div>
                </td>
                <td>
                    <div id="dvDonors" class="block" style="width: 265px; height: 150px">
                        <h2>Donors</h2>
                        <hr />
                        <table style="margin: 5px 0px 0px 20px;">
                            <tr>
                                <th></th>
                                <th class="right" style="color:#166A8C;">Sponsored Apps</th>
                                <th><div style="height:1px;width:5px;"></div></th>
                                <th style="color:#166A8C;">Total Donors</th>
                            </tr>
                            <tr>
                                <td>Active</td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblDonorYearActive"></asp:Label>
                                </td>
                                <td></td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblDonorTotalActive"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Inactive</td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblDonorYearInactive"></asp:Label>
                                </td>
                                <td></td>
                                <td class="right" >
                                    <asp:Label runat="server" ID="lblDonorTotalInactive"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Deceased</td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblDonorYearDeceased"></asp:Label>
                                </td>
                                <td></td>
                                <td class="right">
                                    <asp:Label runat="server" ID="lblDonorTotalDeceased"></asp:Label>
                                </td>
                            </tr>               
                            <tr>
                                <td></td>
                                <td class="total right">
                                    <asp:Label runat="server" ID="lblDonorYearTotal"></asp:Label>
                                </td>
                                <td></td>
                                <td class="total right">
                                    <asp:Label runat="server" ID="lblDonorOverallTotal"></asp:Label>
                                </td>
                            </tr>                              
                        </table>
                    </div>
                </td>
            </tr>
        </table>

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

    </div>
</asp:Content>
