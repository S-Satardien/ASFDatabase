<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InstitutionBlacklistComments.ascx.cs" Inherits="ASF.Web.UserControls.InstitutionBlacklistComments" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>


<script type="text/javascript">
    
    $(function () {

        $("#<%= gvBlacklistDetails.ClientID %> a").click(function () {
            showLeavePageNotification = false;
        });

    });

</script>

<asp:GridView runat="server" ID="gvBlacklistDetails" CssClass="grid" style="margin: 0px;" 
    GridLines="Both" AutoGenerateColumns="false" Width="100%" 
    AutoGenerateEditButton="True"
    OnRowDataBound="gvBlacklistDetails_RowDataBound"
    OnRowEditing="gvBlacklistDetails_RowEditing" 
    OnRowUpdating="gvBlacklistDetails_RowUpdating"
    OnRowCancelingEdit="gvBlacklistDetails_RowCancelingEdit" >
    <HeaderStyle CssClass="gridHeader" />
    <RowStyle CssClass="row" />
    <AlternatingRowStyle CssClass="alternatingRow" />
    <Columns>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Left" />
            <HeaderTemplate>
                <label>Blacklist Status</label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="lblBlacklistStatus" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Left" />
            <HeaderTemplate>
                <label>Blacklist Status Updated</label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="lblBlacklistStatusUpdated" runat="server" Text='<%# ((InstitutionBlacklistProcess)Container.DataItem).BlacklistStatusUpdated.ToString("yyyy-MM-dd HH:mm") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Left" />
            <HeaderTemplate>
                <label>By User</label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="lblUser" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Left" Width="500" Wrap="True" />
            <HeaderTemplate>
                <label>Comment</label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="lblComment" runat="server" Text='<%# ((InstitutionBlacklistProcess)Container.DataItem).Comment %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:HiddenField ID="hdnInstitutionBlacklistProcessID" runat="server" Value='<%# ((InstitutionBlacklistProcess)Container.DataItem).InstitutionBlacklistProcessID %>'/>
                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Height="100px" Width="200px" Text='<%# ((InstitutionBlacklistProcess)Container.DataItem).Comment %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>