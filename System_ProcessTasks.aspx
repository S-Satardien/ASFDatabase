<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="System_ProcessTasks.aspx.cs" Inherits="ASF.Web.System_ProcessTasks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>System Tasks</h2>
    
    <asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0px;"
            GridLines="Both" AutoGenerateColumns="false" Width="100%" AllowPaging="false" OnRowCommand="GridView1_RowCommand">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Last Name</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:Label ID="lblTaskName" runat="server" Text='<%# ((TaskProxy)Container.DataItem).Name %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:LinkButton ID="btnProcess" runat="server" Text="Process" ToolTip="Process" OnClientClick="return confirm('Are you sure you want to process this?');" CommandName="Process" CommandArgument='<%# ((TaskProxy)Container.DataItem).TypeName %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

</asp:Content>
