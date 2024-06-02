<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="ApplicationForm_Wizard_Print.aspx.cs" 
    Inherits="ASF.Web.ApplicationForm_Wizard_Print" %>

<!DOCTYPE html>
<html>
<head>
    <title>Institution Addresses To Print</title>
    <style>
        body {
            margin: 0 auto;
            padding: 0px;
            width: 793.70px;
            zoom: 1;
        }
        /* padding of 19px per side */
        .label-item {
            padding: 19px;
            margin: 0px;
            width: 226.5px; /*  width of 264.5px ~ 70mm */
            height: 101.84px; /* height of 140px ~ 37mm */
            font-size: 12px;
            font-family: "Verdana";
            float: left;
            line-height: 16px;
        }

        .label-page {
            margin: 0px;
            padding: 0px;
            height: 1118.74px;
            width: 793.70px;
            clear: both;
        }

        table, table tr, table tr td {
            padding: 0px;
            margin: 0px;
        }

        .toolbar {
            width: 100%;
            height: 18px;
            border: solid 1px #99acb5;
            margin-top: 5px;
            background-color: #EEF1F1;
            font-family: Verdana;
            font-size: 9pt;
        }

        .detailsForm .toolbar {
            width: 98%;
            height: 18px;
            border: solid 1px #99acb5;
            margin-bottom: 20px;
            margin-top: 5px;
        }

        .gridForm .toolbar {
            margin-bottom: 5px;
        }

        .toolbarCell {
            text-align: left;
        }

        .toolbarImageButton {
            position: relative;
            top: 0px;
            cursor: pointer;
            border-right: solid 1px #CCCCCC;
            background-color: transparent;
            margin: 1px 1px 1px 1px;
            text-indent: 20px;
            font-family: Tahoma;
            font-size: 8pt;
            padding-right: 3px;
            color: #464646;
            height: 22px;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
            border-bottom-style: none;
            border-bottom-color: inherit;
            border-bottom-width: medium;
        }

            .toolbarImageButton.print {
                background: url("/Images/Toolbar/Print.png") no-repeat;
            }
    </style>

    <style media="print">
        * {
            overflow: visible !important;
        }

        .label-page {
            page-break-after: always;
        }

        .noprint {
            display: none;
        }
    </style>

    <script type="text/javascript">
        function Print_Click() {
            window.print();
        }
    </script>

</head>
<body>
    <form runat="server" id="MainForm">
        <table class="toolbar noprint">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnPrint" runat="server" CssClass="toolbarImageButton" Style="background: url(/Images/Toolbar/Print.png) no-repeat" Text="Print Labels " OnClientClick="return Print_Click();" />
                </td>
                <td style="width: 100%;">&nbsp;</td>
            </tr>
        </table>

        <asp:PlaceHolder runat="server" ID="Labels"></asp:PlaceHolder>
    </form>
</body>
</html>
