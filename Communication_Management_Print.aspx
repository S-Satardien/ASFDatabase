<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Communication_Management_Print.aspx.cs"
    Inherits="ASF.Web.Communication_Management_Print" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Address To Print</title>
    <style>
        body
        {
            margin: 0 auto;
            padding: 0px;
            width: 793.70px;
            zoom: 1;
        }
        /* padding of 19px per side */
        .label-item
        {
            padding: 19px;
            margin: 0px;
            width: 226.5px; /*  width of 264.5px ~ 70mm */
            height: 101.84px; /* height of 140px ~ 37mm */
            font-size: 12px;
            font-family: "Verdana";
            float: left;
            line-height: 16px;
        }
        .label-page
        {
            margin: 0px;
            padding: 0px;
            height: 1118.74px;
            width: 793.70px;
            clear: both;
        }
        table, table tr, table tr td
        {
            padding: 0px;
            margin: 0px;
        }
    </style>
    <style media="print">
        .label-page { page-break-after: always; }
    </style>
</head>
<body>
    <form runat="server" id="MainForm">
         <asp:PlaceHolder runat="server" ID="Labels"></asp:PlaceHolder>
    </form>
</body>
</html>
