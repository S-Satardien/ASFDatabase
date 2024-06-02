<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Communication_Wizzard.aspx.cs" Inherits="ASF.Web.Communication_Wizzard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td>
                <label>
                    Application Year:</label>
            </td>
            <td colspan="2">
                <tgs:IntegerDropdownList ID="ddYear" runat="server" Width="150px" 
                    AutoPostBack="True" onselectedindexchanged="ddYear_SelectedIndexChanged">
                </tgs:IntegerDropdownList>
            </td>
        </tr>
    </table>
    <br />
    <h2 style="padding-left:2px;">
        Accepted Students</h2>
    <asp:GridView ID="grdAcceptedStudents" runat="server" CssClass="grid" Style="margin: 0px;"
        GridLines="Both" BorderColor="#CCCCCC" AutoGenerateColumns="false" Width="100%"
        OnRowCommand="GridView1_RowCommand">
        <HeaderStyle CssClass="gridHeader" />
        <RowStyle CssClass="row" />
        <AlternatingRowStyle CssClass="alternatingRow" />
        <Columns>
            <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left" Width="350" />
                <HeaderTemplate>
                    <label>
                        Template Name</label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((TemplateItem)Container.DataItem).Description %>'
                        CommandName="TemplateDetail" CommandArgument='<%# ((TemplateItem)Container.DataItem).TemplateID %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left" />
                <HeaderTemplate>
                    <label>
                        Template Description</label>
                </HeaderTemplate>
            <ItemTemplate>
                    <asp:Label ID="lblDescriptionDetails" runat="server" Text='<%# ((TemplateItem)Container.DataItem).DescriptionDetails %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Center" Width="50" />
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                <HeaderTemplate>
                    <label>
                        Students</label>
                </HeaderTemplate>
            <ItemTemplate>
                    <asp:Label ID="lblCount" runat="server" Text='<%# ((TemplateItem)Container.DataItem).StudentCount %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <h2 style="padding-left:2px;">
        Rejected Students</h2>
    <asp:GridView ID="grdRejectedStudents" runat="server" CssClass="grid" Style="margin: 0px;"
        GridLines="Both" BorderColor="#CCCCCC" AutoGenerateColumns="false" Width="100%"
        OnRowCommand="GridView1_RowCommand">
        <HeaderStyle CssClass="gridHeader" />
        <RowStyle CssClass="row" />
        <AlternatingRowStyle CssClass="alternatingRow" />
        <Columns>
            <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left" Width="350" />
                <HeaderTemplate>
                    <label>
                        Template Name</label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((TemplateItem)Container.DataItem).Description %>'
                        CommandName="TemplateDetail" CommandArgument='<%# ((TemplateItem)Container.DataItem).TemplateID %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left" />
                <HeaderTemplate>
                    <label>
                        Template Description</label>
                </HeaderTemplate>
            <ItemTemplate>
                    <asp:Label ID="lblDescriptionDetails" runat="server" Text='<%# ((TemplateItem)Container.DataItem).DescriptionDetails %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Center" Width="50" />
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                <HeaderTemplate>
                    <label>
                        Students</label>
                </HeaderTemplate>
            <ItemTemplate>
                    <asp:Label ID="lblCount" runat="server" Text='<%# ((TemplateItem)Container.DataItem).StudentCount %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
    
    
    <br />
    <h2 style="padding-left:2px;">Misc</h2>
    <asp:GridView ID="grdMisc" runat="server" CssClass="grid" Style="margin: 0px;"
        GridLines="Both" BorderColor="#CCCCCC" AutoGenerateColumns="false" Width="100%"
        OnRowCommand="GridView1_RowCommand">
        <HeaderStyle CssClass="gridHeader" />
        <RowStyle CssClass="row" />
        <AlternatingRowStyle CssClass="alternatingRow" />
        <Columns>
            <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left" Width="350" />
                <HeaderTemplate>
                    <label>Template Name</label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((TemplateItem)Container.DataItem).Description %>'
                        CommandName="TemplateDetail" CommandArgument='<%# ((TemplateItem)Container.DataItem).TemplateID %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left" />
                <HeaderTemplate>
                    <label>
                        Template Description</label>
                </HeaderTemplate>
            <ItemTemplate>
                    <asp:Label ID="lblDescriptionDetails" runat="server" Text='<%# ((TemplateItem)Container.DataItem).DescriptionDetails %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Center" Width="50" />
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                <HeaderTemplate>
                    <label>
                        Students</label>
                </HeaderTemplate>
            <ItemTemplate>
                    <asp:Label ID="lblCount" runat="server" Text='<%# ((TemplateItem)Container.DataItem).StudentCount %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
    
    

    <br />
    <h2 style="padding-left:2px;">
        Payment Templates</h2>
    <asp:GridView ID="grdPaymentTemplates" runat="server" CssClass="grid" Style="margin: 0px;"
        GridLines="Both" BorderColor="#CCCCCC" AutoGenerateColumns="false" Width="100%"
        OnRowCommand="GridView1_RowCommand">
        <HeaderStyle CssClass="gridHeader" />
        <RowStyle CssClass="row" />
        <AlternatingRowStyle CssClass="alternatingRow" />
        <Columns>
            <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left" Width="350" />
                <HeaderTemplate>
                    <label>
                        Template Name</label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((TemplateItem)Container.DataItem).Description %>'
                        CommandName="TemplateDetail" CommandArgument='<%# ((TemplateItem)Container.DataItem).TemplateID %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left" />
                <HeaderTemplate>
                    <label>
                        Template Description</label>
                </HeaderTemplate>
            <ItemTemplate>
                    <asp:Label ID="lblDescriptionDetails" runat="server" Text='<%# ((TemplateItem)Container.DataItem).DescriptionDetails %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Center" Width="50" />
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                <HeaderTemplate>
                    <label>
                        Students</label>
                </HeaderTemplate>
            <ItemTemplate>
                    <asp:Label ID="lblCount" runat="server" Text='<%# ((TemplateItem)Container.DataItem).StudentCount %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <h2 style="padding-left:2px;">
        Pdf Only Templates</h2>
    <asp:GridView ID="grdPdfOnlyTemplates" runat="server" CssClass="grid" Style="margin: 0px;"
        GridLines="Both" BorderColor="#CCCCCC" AutoGenerateColumns="false" Width="100%"
        OnRowCommand="GridView1_RowCommand">
        <HeaderStyle CssClass="gridHeader" />
        <RowStyle CssClass="row" />
        <AlternatingRowStyle CssClass="alternatingRow" />
        <Columns>
            <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left" Width="350" />
                <HeaderTemplate>
                    <label>
                        Template Name</label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# ((TemplateItem)Container.DataItem).Description %>'
                        CommandName="TemplateDetail" CommandArgument='<%# ((TemplateItem)Container.DataItem).TemplateID %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left" />
                <HeaderTemplate>
                    <label>
                        Template Description</label>
                </HeaderTemplate>
            <ItemTemplate>
                    <asp:Label ID="lblDescriptionDetails" runat="server" Text='<%# ((TemplateItem)Container.DataItem).DescriptionDetails %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Center" Width="50" />
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                <HeaderTemplate>
                    <label>
                        Students</label>
                </HeaderTemplate>
            <ItemTemplate>
                    <asp:Label ID="lblCount" runat="server" Text='<%# ((TemplateItem)Container.DataItem).StudentCount %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
</asp:Content>
