<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Institution_Management.aspx.cs" Inherits="ASF.Web.Institution_Management" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>
<%@ Register src="UserControls/GridExportControl.ascx" tagname="GridExportControl" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript">

        function OpenPrintPopup(institutionIDs) {
            var url = '/ApplicationForm_Wizard_Print.aspx?ids=' + institutionIDs;

            window.open(url, 'Institution Address List', 'menubar=no,status=no,toolbar=no,height=850,width=800');

            return false;
        }

    </script>

    <h2>Institution Management</h2>

    <div class="gridForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new Institution" OnClick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="toolbarImgButton" runat="server" CssClass="toolbarImageButton search" OnClientClick="Search_Click(); return false;" Text="Search"></asp:Button>
                </td>
                <td class="toolbarCell">
                    <uc1:GridExportControl ID="GridExportControl1" runat="server" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="PrintApplications" runat="server" Text="Print" CssClass="toolbarImageButton print"
                        OnClick="PrintInstitutionAddresses_Click" />
                </td>
                <td style="width: 100%;">&nbsp;</td>
            </tr>
        </table>
        
        <div style="height:20px; text-align: right; display: block; font-family:Tahoma; font-size:8pt; ">
            <asp:Label ID="lblRecordCount" runat="server"></asp:Label>
        </div>

        <asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0px;"
            GridLines="Both" AutoGenerateColumns="false" Width="100%" AllowPaging="True" PageSize="20"
            OnRowCommand="GridView1_RowCommand" onrowdatabound="GridView1_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging" >
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <EmptyDataTemplate>There are no institutions that match your criteria</EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="hdnInstitutionID" runat="server" Value='<%# ((Institution)Container.DataItem).InstitutionID %>' />
                        <asp:CheckBox ID="cbSelected" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Name</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((Institution)Container.DataItem).Name %>' CommandName="itemDetail" CommandArgument='<%# ((ASF.BusinessObjects.Models.Institution)Container.DataItem).InstitutionID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Status</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <a id="anchorStatus" runat="server" href="" ></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Principal</label>
                    </HeaderTemplate>
                    <ItemStyle />
                    <ItemTemplate>
                        <asp:Label ID="lblPrincipal" runat="server" Text='<%# ((Institution)Container.DataItem).Principal %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Contact No</label>
                    </HeaderTemplate>
                    <ItemStyle Width="110px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblContactNo" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Postal Address</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPostalAddress" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Institution Address</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblInstitutionAddress" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Province</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblProvince" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Bursary Rep</label>
                    </HeaderTemplate>
                    <ItemStyle />
                    <ItemTemplate>
                        <asp:Label ID="lblBursaryRep" runat="server" Text='<%# ((Institution)Container.DataItem).BursaryRepresentitive %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>No. Students this Year</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblNumStudents" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 1 Prev Year</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPaymentsPrevYear1" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 2 Prev Year</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPaymentsPrevYear2" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 1</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblPayments1" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Thank you 2</label>
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
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                    <td><label>Institution Type</label></td>
                    <td colspan="2"><asp:DropDownList ID="ddInstitutionType" runat="server" Width="150px"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><label>Region</label></td>
                    <td colspan="2"><asp:DropDownList ID="ddSearchProvince" runat="server" Width="150px" DataValueField="ProvinceID" DataTextField="Description"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><label>Status</label></td>
                    <td colspan="2"><asp:DropDownList ID="ddInstitutionStatus" runat="server" Width="150px"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><label>Owes ASF Money</label></td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddOwesAsfMoney" runat="server" Width="150px">
                            <asp:ListItem Value="-1" Text="N/A"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                            <asp:ListItem Value="0" Text="No"></asp:ListItem>
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
    var showDialog = <%= (!Page.IsPostBack).ToString().ToLowerInvariant() %>;
    function Search_Click()
    {
        var dialog = $("#dvSearch").dialog({ resizable: false, width: "500px", modal: true });

        dialog.parent().appendTo($("form:first"));

        return false;
    }
        
    if(showDialog)
    {
        Search_Click();
    }

</script>
</asp:Content>
