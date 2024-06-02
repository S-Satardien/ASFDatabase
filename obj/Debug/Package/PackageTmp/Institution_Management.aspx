<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Institution_Management.aspx.cs" Inherits="ASF.Web.Institution_Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript">

        function Search_Click()
        {
            var dialog = $("#dvSearch").dialog({ position: [80, 100], resizable: false, width: "500px", modal: true });

            dialog.parent().appendTo($("form:first"));
        }

    </script>

    <h2>Institution Management</h2>

    <div class="gridForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnRefresh" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Refresh.png) no-repeat" Text="Refresh" OnClick="btnRefresh_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Add.png) no-repeat" Text="Add new Institution" OnClick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <span class="toolbarImageButton" onclick="Search_Click();" style="background: url(/Images/Toolbar/Search.png) no-repeat; padding-left: 16px;">Search</span>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>

        <asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0px;"
            GridLines="Both" AutoGenerateColumns="false" Width="100%" 
            OnRowCommand="GridView1_RowCommand" onrowdatabound="GridView1_RowDataBound">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Name</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((ASF.BusinessObjects.Institution)Container.DataItem).Name %>' CommandName="itemDetail" CommandArgument='<%# ((ASF.BusinessObjects.Institution)Container.DataItem).InstitutionID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Institution Type</label>
                    </HeaderTemplate>
                    <ItemStyle Width="100px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblType" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Status</label>
                    </HeaderTemplate>
                    <ItemStyle Width="100px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# ((ASF.BusinessObjects.Institution)Container.DataItem).Status %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Principal</label>
                    </HeaderTemplate>
                    <ItemStyle Width="150px" />
                    <ItemTemplate>
                        <asp:Label ID="lblPrincipal" runat="server" Text='<%# ((ASF.BusinessObjects.Institution)Container.DataItem).Principal %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Contact No</label>
                    </HeaderTemplate>
                    <ItemStyle Width="110px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lblContactNo" runat="server" Text='<%# ((ASF.BusinessObjects.Institution)Container.DataItem).ContactNumber %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


        <div id="dvSearch" title="Institution Search Criteria  <img src='/Images/Filter.png' style='position: relative; top: 2px; left: 10px;' alt=''>" style="display: none;">
        
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
                <%--<tr>
                    <td><label>Award Amount Between</label></td>
                    <td colspan="2">
                        <asp:TextBox ID="txtSearchAwardAmountFrom" runat="server" CssClass="numeric" Width="60px"></asp:TextBox>
                        <label> and </label>
                        <asp:TextBox ID="txtSearchAwardAmountTo" runat="server" CssClass="numeric" Width="60px"></asp:TextBox>
                    </td>
                </tr>--%>
                <tr><td style="height: 10px;"></td></tr>
                <tr>
                    <td><asp:Button ID="btnSearch" runat="server" Text="Search" Width="70px" OnClick="btnSearch_Click" /></td>
                </tr>
            </table>

        </div>

    </div>

</asp:Content>
