<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuControl.ascx.cs" Inherits="ASF.Web.UserControls.MenuControl" %>

<div id="menuContainer" style="display:none;">
    <asp:Menu ID="MainMenu" runat="server" CssClass="dropdown" RenderingMode="List" 
        Orientation="Horizontal" ClientIDMode="Static" DynamicHorizontalOffset="2" ForeColor="#494949" 
        Font-Names="Arial" Font-Size="12px" Font-Bold="true"
        StaticSubMenuIndent="0px" style="float: none;" >
        <DynamicHoverStyle ForeColor="White" CssClass="menuHover" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="5px" BackColor="#b0bbbb" />
        <DynamicMenuStyle BackColor="#b0bbbb" />
        <DynamicSelectedStyle />
        <StaticHoverStyle BackColor="#666666" ForeColor="White" />
        <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" />
        <StaticSelectedStyle BackColor="#1C5E55" />
    </asp:Menu>
</div>
<script>
    $(function() {
        $("#menuContainer").show();
    });
</script>