<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Student_Reject_ExistingAndNew.ascx.cs" Inherits="ASF.Web.CM.Student_Reject_ExistingAndNew" %>
<%@ Register src="TemplateGrid.ascx" tagname="TemplateGrid" tagprefix="tg" %>
<br/>
<h4>Rejected Students - New & Existing</h4>
<br/>
<tg:TemplateGrid runat="server" ID="TemplateGrid"></tg:TemplateGrid>