<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuControl.ascx.cs" Inherits="ASF.Web.UserControls.MenuControl" %>

<script type="text/javascript">

    /*
    $(document).ready(function ()
    {
        $("#<%= MainMenu.ClientID %> ul:first").removeClass("level1").removeClass("static");
        $("#<%= MainMenu.ClientID %> ul:first").addClass("dropdown");
    });
    */

</script>

<asp:Menu ID="MainMenu" runat="server" CssClass="dropdown" RenderingMode="List" 
    Orientation="Horizontal" ClientIDMode="Static" DynamicHorizontalOffset="2" ForeColor="#494949" 
    Font-Names="Arial" Font-Size="13px" Font-Bold="true" 
    StaticSubMenuIndent="0px">
    <DynamicHoverStyle ForeColor="White" CssClass="menuHover" />
    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" BackColor="#b0bbbb" />
    <DynamicMenuStyle BackColor="#b0bbbb" />
    <DynamicSelectedStyle />
    <Items>
    </Items>
    <StaticHoverStyle BackColor="#666666" ForeColor="White" />
    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <StaticSelectedStyle BackColor="#1C5E55" />
</asp:Menu>
