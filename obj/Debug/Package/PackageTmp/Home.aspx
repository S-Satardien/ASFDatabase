<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ASF.Web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        
        .homeGraph
        {
            width: 350px;
            min-height: 200px;
            border: solid 1px #CCCCCC;
            margin: 5px;
            padding: 5px;
        }
        
        .homeDetails
        {
            width: 200px;
            min-height: 100px;
            border: solid 1px #CCCCCC;
            margin: 5px;
            padding: 5px;
        }
                
    </style>

    <div id="pageWrapper">
        
        <table>
            <tr>
                <td>
                    <div class="homeGraph roundCorners">
                        &nbsp;
                    </div>
                </td>
                <td>
                    <div class="homeDetails roundCorners"><h3>Institution Status data</h3></div>
                    <div class="homeDetails roundCorners"><h3>Donor Details</h3></div>
                </td>
                <td>
                    <div class="homeDetails roundCorners"><h3>Institution Status data</h3></div>
                    <div class="homeDetails roundCorners"><h3>Donor Details</h3></div>
                </td>
                <td>
                    <div class="homeGraph roundCorners">&nbsp;</div>
                </td>
            </tr>
        </table>

    </div>

</asp:Content>
