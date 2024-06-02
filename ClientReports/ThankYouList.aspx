<%@ Page Title="Thank You List Report" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ThankYouList.aspx.cs" Inherits="ASF.Web.ClientReports.ThankYouList" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>
<%@ Import Namespace="ASF.Web.ClientReports" %>
<%@ Register src="~/UserControls/GridExportControl.ascx" tagname="GridExportControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Thank you list</h2>

    <div class="gridForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="toolbarBtnSearch" runat="server" CssClass="toolbarImageButton search" Text="Search" OnClientClick="Search_Click(); return false;" />
                </td>
                <td class="toolbarCell" id="ddxxx">
                    <uc1:GridExportControl ID="GridExportControl1" runat="server" />
                </td>
                <td style="width: 100%;">&nbsp;</td>
            </tr>
        </table>
        
        <div style="height:20px; text-align: right; display: block; font-family:Tahoma; font-size:8pt; ">
            <asp:Label ID="lblRecordCount" runat="server"></asp:Label>
        </div>

        <asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0;"
            GridLines="Both" AutoGenerateColumns="false" Width="100%" AllowPaging="True" AllowSorting="true" PageSize="20"
            OnRowCommand="GridView1_RowCommand" 
            OnRowDataBound="GridView1_RowDataBound" 
            OnPageIndexChanging="GridView1_PageIndexChanging"
            OnSorting="GridView1_Sorting" >
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <EmptyDataTemplate>There are no institutions that match your criteria</EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="hdnInstitutionID" runat="server" Value='<%# ((ThankYouItemProxy)Container.DataItem).InstitutionID %>' />
                        <asp:CheckBox ID="cbSelected" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="Institution" HeaderText="Name">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((ThankYouItemProxy)Container.DataItem).Institution %>' CommandName="itemDetail" CommandArgument='<%# ((ThankYouItemProxy)Container.DataItem).InstitutionID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="Status" HeaderText="Status">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <a id="anchorStatus" runat="server" href="" ></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="Year" HeaderText="Year">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblYear" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 1 <br/> 3 yrs ago</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPayments1_3yrs" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 2 <br/> 3 yrs ago</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPayments2_3yrs" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 1 <br/> 2 yrs ago</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPayments1_2yrs" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 2 <br/> 2 yrs ago</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPayments2_2yrs" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 1 <br/> prev Year</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPaymentsPrevYear1" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 2 <br/> prev Year</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPaymentsPrevYear2" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 1 <br/> current year</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPayments1" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 2 <br/> current year</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPayments2" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Mode="NumericFirstLast" Visible="True" Position="Bottom" FirstPageText="First" NextPageText="Next" LastPageText="Last"></PagerSettings>
        </asp:GridView>
        
        <div id="dvSearch" title="Institution Search Criteria" style="display: none; overflow: hidden;">
        
            <table>
                <tr>
                    <td style="width: 150px;"><label>Institution Name</label></td>
                    <td><asp:DropDownList ID="ddSearchNameOperator" runat="server" Width="80px"></asp:DropDownList></td>
                    <td><asp:TextBox ID="txtSearchName" runat="server" Width="120px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><label>Year</label></td>
                    <td colspan="2"><asp:DropDownList ID="ddSearchYear" runat="server" Width="150px"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><label>Status</label></td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddInstitutionStatus" runat="server" Width="150px">
                            <Items>
                                <asp:ListItem Value="-999" Text="-- All --"></asp:ListItem>
                                <asp:ListItem Value="2" Text="1st Payment Blacklist Pending"></asp:ListItem>
                                <asp:ListItem Value="3" Text="2nd Payment Blacklist Pending"></asp:ListItem>
                            </Items>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                    <td><asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" OnClick="btnSearch_Click" /></td>
                </tr>
            </table>

        </div>

    </div>

    <script type="text/javascript">
    
        function Search_Click()
        {
            var dialog = $("#dvSearch").dialog({ resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));
        }
        
    </script>


</asp:Content>
