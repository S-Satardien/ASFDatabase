<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ErrorLog.aspx.cs" Inherits="ASF.Web.ErrorLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="gridForm">

        <asp:GridView ID="GridView1" runat="server" CssClass="grid"  
            GridLines="Both" AutoGenerateColumns="false" Width="95%" OnRowCommand="GridView1_RowCommand">
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />

            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>Error</label>
                    </HeaderTemplate>
                    <ItemStyle Width="90%" />
                    <ItemTemplate>
                        <asp:LinkButton ID="btnError" runat="server" Text='<%# ((ASF.BusinessObjects.ExceptionItem)Container.DataItem).Error %>' CommandName="itemDetail" CommandArgument='<%# ((ASF.BusinessObjects.ExceptionItem)Container.DataItem).ExceptionID %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" />
                    <HeaderTemplate>
                        <label>Date</label>
                    </HeaderTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# ((ASF.BusinessObjects.ExceptionItem)Container.DataItem).DateAdded.ToString("yyyy-MM-dd HH:mm:ss") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>

</asp:Content>
