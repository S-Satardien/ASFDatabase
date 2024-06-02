<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Donor_Management.aspx.cs" Inherits="ASF.Web.Donor_Management" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>
<%@ Register src="UserControls/GridExportControl.ascx" tagname="GridExportControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Donor Management</h2>

    <div class="gridForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton add" Text="Add new Donor" OnClick="btnAdd_Click" />
                </td>
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

        <asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0px;"
            GridLines="Both" AutoGenerateColumns="false" Width="100%" AllowPaging="True"
            OnRowCommand="GridView1_RowCommand" onrowdatabound="GridView1_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging">
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
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((Donor)Container.DataItem).Firstname %>' CommandName="itemDetail" CommandArgument='<%# ((Donor)Container.DataItem).DonorID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Last Name</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:Label ID="lblLastname" runat="server" Text='<%# ((Donor)Container.DataItem).Lastname %>'></asp:Label>
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
                        <label>Email</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# ((Donor)Container.DataItem).Email %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                    <HeaderTemplate>
                        <label>Contact Number</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblContactNo" runat="server"></asp:Label>
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
                    <HeaderStyle HorizontalAlign="Center" Width="60px" />
                    <HeaderTemplate>
                        <label>Status</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblDonorStatus" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="110px" />
                    <HeaderTemplate>
                        <label>Current Year Students Sponsored</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblStudentsSponsored" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="/Images/Delete.png" CssClass="gridImageButton" ToolTip="Delete" OnClientClick="return confirm('Are you sure you want to delete this item?');" CommandName="deleteItem" CommandArgument='<%# ((Donor)Container.DataItem).DonorID %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Mode="NumericFirstLast" Visible="True" Position="Bottom" FirstPageText="First" NextPageText="Next" LastPageText="Last"></PagerSettings>
        </asp:GridView>

        <div id="dvSearch" title="Donor Search Criteria" style="display: none; overflow: hidden;">
        
        <table>
            <tr>
                <td style="width: 110px;"><label>First Name</label></td>
                <td><asp:DropDownList ID="ddSearchFirstNameOperator" runat="server" Width="80px"></asp:DropDownList></td>
                <td><asp:TextBox ID="txtSearchFirstName" runat="server" Width="120px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Last Name</label></td>
                <td><asp:DropDownList ID="ddSearchLastNameOperator" runat="server" Width="80px"></asp:DropDownList></td>
                <td><asp:TextBox ID="txtSearchLastName" runat="server" Width="120px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Email</label></td>
                <td><asp:DropDownList ID="ddSearchEmailOperator" runat="server" Width="80px"></asp:DropDownList></td>
                <td><asp:TextBox ID="txtSearchEmail" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr><td style="height: 10px;"></td></tr>
            <tr>
                <td><label>Status</label></td>
                <td colspan="2"><asp:DropDownList ID="ddSearchStatus" runat="server" Width="150px" DataValueField="ProvinceID" DataTextField="Description"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><label>Region</label></td>
                <td colspan="2"><asp:DropDownList ID="ddSearchProvince" runat="server" Width="150px" DataValueField="ProvinceID" DataTextField="Description"></asp:DropDownList></td>
            </tr>
            <tr><td style="height: 10px;"></td></tr>
            <tr>
                <td><asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" OnClick="btnSearch_Click" /></td>
            </tr>
        </table>

    </div>

    </div>
    
    <script type="text/javascript">
        
        BindCalendars("<%=DateTime.Now.AddYears(-90).Year %>", "<%=DateTime.Now.AddYears(-12).Year %>", 40);
        var showDialog = <%= (!Page.IsPostBack).ToString().ToLowerInvariant() %>;
        
        function Search_Click()
        {
            var dlg = $("#dvSearch").dialog({ resizable: false, width: "450px", modal: true });
            dlg.parent().appendTo($("form:first"));
        }
        
        if(showDialog)
        {
            Search_Click();
        }

    </script>
</asp:Content>
