<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TemplateGrid.ascx.cs" Inherits="ASF.Web.CM.TemplateGrid" %>
<%@ Import Namespace="ASF.BusinessObjects.Models" %>


<asp:GridView ID="grdTemplateGrid" runat="server" CssClass="grid" style="margin: 0px;"
    GridLines="Both" BorderColor="#CCCCCC" AutoGenerateColumns="false" Width="100%" >
    <HeaderStyle CssClass="gridHeader" />
    <RowStyle CssClass="row" />
    <AlternatingRowStyle CssClass="alternatingRow" />
    <Columns>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Left" />
            <HeaderTemplate>
                <label>Student</label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:HyperLink ID="hplStudentApplication" runat="server" ></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Left" />
            <HeaderTemplate>
                <label>Institution</label>
            </HeaderTemplate>
            <ItemStyle HorizontalAlign="Left" />
            <ItemTemplate>
                <asp:HyperLink ID="hplInstitution" runat="server" ></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Center" />
            <HeaderTemplate>
                <label>Course</label>
            </HeaderTemplate>
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# ((StudentApplication)Container.DataItem).InstitutionCourse.Course.Description %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Center" />
            <HeaderTemplate>
                <label>Date of Birth</label>
            </HeaderTemplate>
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:Label runat="server" ID="lblDob" Text='<%# ((StudentApplication)Container.DataItem).Student.DOB.Value.ToString("yyyy-MM-dd") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Center" />
            <HeaderTemplate>
                <label>Label Status</label>
            </HeaderTemplate>
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:Label runat="server" ID="lblLabelStatus" Text=""></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Center" />
            <HeaderTemplate>
                <label>Exclude</label>
                <br />
                <asp:CheckBox runat="server" ID="chkSelectAll" /> 
            </HeaderTemplate>
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:CheckBox ID="cbExclude" runat="server"/>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<script type="text/javascript">
        
    $(document).ready(function() {

        $("[id*=chkSelectAll]").bind("click", function () {
            var chkboxes = $("input[type='checkbox'][id*=cbExclude]");

            if (!$(this).is(":checked")) {
                chkboxes.removeAttr("checked");
            } else {
                chkboxes.attr("checked", "checked");
            }
        });

    });
    
</script>
