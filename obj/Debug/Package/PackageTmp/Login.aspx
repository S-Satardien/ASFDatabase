<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ASF.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="StyleSheet" href="/CSS/Main.css" type="text/css" />

    <style type="text/css">
        body
        {
            /*background: transparent url(/Images/background.gif);*/
        }
        
        #loginWrapper
        {
            width: 800px;
            margin: 10px auto;
            border: solid 1px #CCCCCC;
        }
        
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div id="loginWrapper">

            <table style="background-color: Black" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="background: url(/Images/header-top.jpg) 0px 32px no-repeat; height: 188px; width: 200px;"></td>
                    <td style="background: url(/Images/header-newer.jpg) no-repeat; height: 218px; width: 600px;"></td>
                </tr>
            </table>
            
            <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false">
                <LayoutTemplate>
                    <span class="failureNotification">
                        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="LoginUserValidationGroup"/>
                    <div class="accountInfo">
                        <div class="login roundCorners">
                            <p>
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                            <br />
                            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                    CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                                    ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>

                            <p>
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            <br />
                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                    CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                                    ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>

                            <p>
                                <br />
                                <asp:CheckBox ID="RememberMe" runat="server"/>
                                <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                            </p>
                            <p>
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Login" ValidationGroup="LoginUserValidationGroup" Width="60px"/>
                            </p>
                        </div>
                    </div>
                </LayoutTemplate>
            </asp:Login>     

        </div>
        
    </form>
</body>
</html>
