<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Donor_Details.aspx.cs" Inherits="ASF.Web.Donor_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {

            $(".datepicker").datepicker(
            {
                showOn: 'button',
                buttonImage: '/Images/Calendar.png',
                buttonImageOnly: true,
                dateFormat: 'yy-m-dd',
                changeYear: true,
                changeMonth: true,
                yearRange: '1975:2011'
            });

            $(".datepicker").next("img").css("cursor", "pointer").css("position", "relative").css("top", "3px").css("margin-left", "3px");

        });

    </script>

    <h2>Donor Details</h2>

    <div class="detailsForm">

        <table class="toolbar">
            <tr>
                <td class="toolbarCell">
                    <asp:Button ID="btnSave" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Save.png) no-repeat" Text="Save Details" OnClick="btnSave_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnGridView" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/GridView.png) no-repeat" Text="Donor List" OnClick="btnGridView_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnAdd" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Add.png) no-repeat" Text="Add new Donor" OnClick="btnAdd_Click" />
                </td>
                <td class="toolbarCell">
                    <asp:Button ID="btnSponsorship" runat="server" CssClass="toolbarImageButton" style="background: url(/Images/Toolbar/Sponsor.png) no-repeat" Text="Sponsorship details" OnClick="btnSponsorship_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        
        <br />

        <table>
            <tr>
                <td style="width: 150px;"><label>First Name</label></td>
                <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Last Name</label></td>
                <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Status</label></td>
                <td><asp:DropDownList ID="ddStatus" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><label>Date Of Birth</label></td>
                <td><asp:TextBox ID="txtDOB" runat="server" CssClass="datepicker" Width="70px" style="text-align: center;"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Gender</label></td>
                <td><asp:DropDownList ID="ddGender" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><label>Email</label></td>
                <td><asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Landline</label></td>
                <td><asp:TextBox ID="txtLandline" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><label>Mobile</label></td>
                <td><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td>
            </tr>
        </table>

        <br />
        <hr style="width: 880px;" />
        <br />

        <h5>Donor Address</h5>

        <table>
            <tr>
                <td style="width: 420px;">
                    <table>
                        <tr>
                            <td style="width: 150px;"><label>Address Line 1</label></td>
                            <td><asp:TextBox ID="txtAddressLine1" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Address Line 2</label></td>
                            <td><asp:TextBox ID="txtAddressLine2" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Address Line 3</label></td>
                            <td><asp:TextBox ID="txtAddressLine3" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Suburb</label></td>
                            <td><asp:TextBox ID="txtAddressSuburb" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td style="width: 150px;"><label>City</label></td>
                            <td><asp:TextBox ID="txtAddressCity" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><label>Province</label></td>
                            <td><asp:DropDownList ID="ddAddressProvince" runat="server" DataValueField="ProvinceID" DataTextField="Description"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td><label>Country</label></td>
                            <td><asp:DropDownList ID="ddAddressCountry" runat="server" DataValueField="CountryID" DataTextField="Description"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td><label>Postal Code</label></td>
                            <td><asp:TextBox ID="txtAddressPostCode" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>

</asp:Content>
