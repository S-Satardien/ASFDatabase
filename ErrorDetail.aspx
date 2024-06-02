<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ErrorDetail.aspx.cs" Inherits="ASF.Web.ErrorDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="detailsForm">

        <h2>Exception Detail</h2>
        <br />
        <table>
            <tr>
                <td style="width: 150px;"><label>Message</label></td>
                <td><asp:TextBox ID="txtMessage" runat="server" Width="600px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Date</label></td>
                <td><asp:TextBox ID="txtDate" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td valign="top"><label>Stack Trace</label></td>
                <td><asp:TextBox ID="txtStackTrace" runat="server" Width="600px" Height="300px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
        </table>

    </div>

</asp:Content>
