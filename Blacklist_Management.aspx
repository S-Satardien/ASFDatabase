<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Blacklist_Management.aspx.cs" Inherits="ASF.Web.Blacklist_Management" %>
<%@ Register src="UserControls/GridExportControl.ascx" tagname="GridExportControl" tagprefix="uc1" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Blacklist Management</h2>

    <div class="gridForm">
        
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="toolbarImgButton" runat="server" CssClass="toolbarImageButton search" OnClientClick="Search_Click(); return false;" Text="Search"></asp:Button>
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

        <asp:GridView runat="server" ID="gvBlacklistManagement" CssClass="grid" style="margin: 0px;"  GridLines="Both" AutoGenerateColumns="false" 
            Width="100%" AllowPaging="True" OnRowDataBound="gvBlacklistManagement_RowDataBound" 
            OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="gvBlacklistManagement_RowCommand">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <EmptyDataTemplate>There are no Blacklist Pending Institutions</EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Institution</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbInstitution" runat="server" Text='<%# Eval("Institution.Name") %>' CommandName="itemDetail" CommandArgument='<%# Eval("InstitutionID") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Blacklist Status</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBlacklistStatus" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Blacklist Status Updated</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblBlacklistStatusUpdated" runat="server" Text='<%# ((InstitutionBlacklistProcess)Container.DataItem).BlacklistStatusUpdated.ToString("yyyy-MM-dd HH:mm") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Principal</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPrincipal" runat="server" Text='<%# ((InstitutionBlacklistProcess)Container.DataItem).Institution.Principal %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Bursary Rep</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBursaryRep" runat="server" Text='<%# ((InstitutionBlacklistProcess)Container.DataItem).Institution.BursaryRepresentitive %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Contact No</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblContactNo" runat="server" Text='<%# ((InstitutionBlacklistProcess)Container.DataItem).Institution.ContactNumber %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Fax No</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFaxNo" runat="server" Text='<%# ((InstitutionBlacklistProcess)Container.DataItem).Institution.FaxNumber %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
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
                    <td><label>Status</label></td>
                    <td colspan="2"><asp:DropDownList ID="ddBlacklistStatus" runat="server" Width="150px"></asp:DropDownList></td>
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
        }
        
        if(showDialog)
        {
            Search_Click();
        }

    </script>

</asp:Content>
