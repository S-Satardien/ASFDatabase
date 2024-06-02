<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Donor_Sponsorship_Details.aspx.cs" Inherits="ASF.Web.Donor_Sponsorship_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="detailsForm">
        
        <h2>Donor Sponsorship Details</h2>

        <table>
            <tr>
                <td style="width: 150px;"><label>Donor Status</label></td>
                <td><asp:TextBox ID="txtDonorStatus" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Sponsorship Year</label></td>
                <td><asp:DropDownList ID="ddYear" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><label>Donor Type</label></td>
                <td><asp:DropDownList ID="ddDonorType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddDonorType_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><label>Suburb</label></td>
                <td><asp:TextBox ID="txtAddressSuburb" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        
        <br />
        <hr style="width: 880px;" />
        <br />

        <table>
            <tr>
                <td style="width: 250px;"><label>Donor Sponsor Amount</label></td>
                <td><asp:TextBox ID="txtSponsorAmount" runat="server"></asp:TextBox></td>
            </tr>
            <asp:Panel ID="pnlSponsorshipDetails" runat="server">
            <tr>
                <td colspan="2">
                    <h5>Donor Sponsorship Information</h5>
                    <asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0px;"
                        GridLines="Both" AutoGenerateColumns="false" Width="780px" >
                        <HeaderStyle CssClass="gridHeader" />
                        <RowStyle CssClass="row" />
                        <AlternatingRowStyle CssClass="alternatingRow" />
                        <Columns>
                            <asp:TemplateField>
                                <HeaderStyle HorizontalAlign="Left" />
                                <HeaderTemplate>
                                    <label>Course Name</label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <a onclick='InstitutionCourse_Clicked(<%# ((ASF.BusinessObjects.InstitutionCourse)Container.DataItem).InstitutionCourseID %>);' style="cursor: pointer;" ><%# ((ASF.BusinessObjects.InstitutionCourse)Container.DataItem).CourseLevel.Description %></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <label>Pay Cycles</label>
                                </HeaderTemplate>
                                <ItemStyle Width="80px" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="lblPayCycles" runat="server" Text='<%# ((ASF.BusinessObjects.InstitutionCourse)Container.DataItem).PayCycles %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <label>Course Cost</label>
                                </HeaderTemplate>
                                <ItemStyle Width="80px" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="lblCourseCost" runat="server" Text='<%# ((ASF.BusinessObjects.InstitutionCourse)Container.DataItem).CourseCost.ToString("0.00") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemStyle Width="20px" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="/Images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this course?');" CommandName="delete" CommandArgument='<%# ((ASF.BusinessObjects.InstitutionCourse)Container.DataItem).InstitutionCourseID %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <label>No records found</label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
            <tr><td style="height: 20px;"></td></tr>
            </asp:Panel>
            <tr>
                <td><label>Total Amount of Scholarships for year</label></td>
                <td><asp:TextBox ID="txtTotalYearAmount" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Sponsorship money avaliable</label></td>
                <td><asp:TextBox ID="txtSponsorshipMoneyAvailable" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        
        
        <asp:Panel ID="pnlReports" runat="server">

            <br />
            <hr style="width: 880px;" />
            <br />

            <h5>Reports</h5>
            <br />
            <table>
                <tr>
                    <td colspan="2">
                        <div class="buttonWrapper">
                            <asp:Button ID="btnGenerateMidYearReport" runat="server" CssClass="button" Text="Generate Mid Year Report" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;"><label>Mid year donor report sent</label></td>
                    <td><asp:CheckBox ID="cbMidYearReportSent" runat="server" /></td>
                </tr>
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                    <td colspan="2">
                        <div class="buttonWrapper">
                            <asp:Button ID="btnGenerateEndYearReport" runat="server" CssClass="button" Text="Generate End Year Report" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px;"><label>End year donor report sent</label></td>
                    <td><asp:CheckBox ID="cbEndYearReportSent" runat="server" /></td>
                </tr>
            </table>

        </asp:Panel>

    </div>

</asp:Content>
