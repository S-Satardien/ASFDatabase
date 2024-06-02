<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Student_Existing_AppNewAndExist.ascx.cs" Inherits="ASF.Web.CM.Student_Existing_AppNewAndExist" %>

<br/>
<h4>Students - New & Existing</h4>
<br/>

<asp:GridView ID="GridView1" runat="server" CssClass="grid" style="margin: 0px;"
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
                <asp:Label ID="Label1" runat="server" Text='<%# ((ASF.BusinessObjects.StudentApplication)Container.DataItem).Student.DisplayName %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Left" />
            <HeaderTemplate>
                <label>Institution</label>
            </HeaderTemplate>
            <ItemStyle HorizontalAlign="Left" />
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# ((ASF.BusinessObjects.StudentApplication)Container.DataItem).Institution.Name %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Center" />
            <HeaderTemplate>
                <label>Course</label>
            </HeaderTemplate>
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# ((ASF.BusinessObjects.StudentApplication)Container.DataItem).InstitutionCourse.Course.Description %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderStyle HorizontalAlign="Center" />
            <HeaderTemplate>
                <label>Date of Birth</label>
            </HeaderTemplate>
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:Label runat="server" ID="lblDob" Text='<%# ((ASF.BusinessObjects.StudentApplication)Container.DataItem).Student.DOB.Value.ToString("yyyy-MM-dd") %>'></asp:Label>
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
            </HeaderTemplate>
            <ItemStyle HorizontalAlign="Center" />
            <ItemTemplate>
                <asp:CheckBox ID="cbExclude" runat="server"/>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
