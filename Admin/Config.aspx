<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Config.aspx.cs" Inherits="ASF.Web.Admin.Config" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(function () {
            $(".datepicker").datepicker(
            {
                dateFormat: 'yy-mm-dd',
                changeYear: true,
                changeMonth: true
            });

            $.each($("[id*=txtConfigValue]"), function (i, val) {
                var el = $(this);
                el.data("intial-val", $(this).val());
                el.bind("keyup", function () {
                    var chk = el.parent().parent().find("[id*=chkConfigSelected]");
                    if (el.val() == el.data("intial-val")) {
                        chk.removeAttr("checked");
                    }
                    else {
                        chk.attr("checked", "checked");
                    }
                });
            });

            $.each($("[id*=dtConfigValue]"), function (i, val) {
                var el = $(this);
                el.data("intial-val", $(this).val());
                el.bind("change", function () {
                    var chk = el.parent().parent().find("[id*=chkConfigSelected]");
                    if (el.val() == el.data("intial-val")) {
                        chk.removeAttr("checked");
                    }
                    else {
                        chk.attr("checked", "checked");
                    }
                });
            });

            $.each($("[id*=chkConfigValue]"), function (i, val) {
                var el = $(this);
                el.data("intial-val", $(this).is(":checked"));
                el.bind("click dblclick", function () {
                    var chk = el.parent().parent().find("[id*=chkConfigSelected]");
                    if (el.is(":checked") == el.data("intial-val")) {
                        chk.removeAttr("checked");
                    }
                    else {
                        chk.attr("checked", "checked");
                    }
                });
            });

            $("#advanced-features h1").bind("click dblclick", function () {
                $(this).parent().find(".items").slideToggle();
            });
        });
    </script>
    <h2>
        Configuration</h2>
    <div class="detailsForm LeavePageNotiDialog">
        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="SaveConfig" runat="server" CssClass="toolbarImageButton save NoLeavePageNotiDialog" Text="Save" OnClick="SaveConfig_Click" />
                </td>
                <td style="width: 100%;">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <asp:Label runat="server" ID="lblMessage" Text="Configuration saved successfully"
            Visible="False" Style="color: green;"></asp:Label>
        <asp:GridView runat="server" ID="ConfigurationItems" DataKeyNames="ConfigurationID,Type"
            AutoGenerateColumns="false" CssClass="grid" OnRowDataBound="ConfigurationItems_RowDataBound"
            Style='width: 98%;'>
            <HeaderStyle CssClass="gridHeader" />
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="alternatingRow" />
            <Columns>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>
                            Name</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ConfigName" runat="server"><%#Eval("Name")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" />
                    <HeaderTemplate>
                        <label>
                            Description</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ConfigDescription" runat="server"><%#Eval("Description")%></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Left" Width="170" />
                    <HeaderTemplate>
                        <label>
                            Value</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtConfigValue" runat="server" Text='<%#Bind("Value")%>' Visible="False"></asp:TextBox>
                        <asp:TextBox ID="dtConfigValue" runat="server" Text='<%#Bind("Value")%>' Visible="False"
                            CssClass="datepicker"></asp:TextBox>
                        <asp:CheckBox ID="chkConfigValue" runat="server" Visible="False"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderStyle HorizontalAlign="Center" Width="50" />
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    <HeaderTemplate>
                        <label>
                            Selected</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkConfigSelected" runat="server"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
