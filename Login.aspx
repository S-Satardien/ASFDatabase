<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ASF.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="StyleSheet" href="/CSS/Main.css" type="text/css" />
    <script type="text/javascript" src="/Scripts/jquery.min.js"></script>
    <link rel="StyleSheet" href="/CSS/jQueryUI/jquery-ui-1.8.9.custom.css" type="text/css" />
    <script type="text/javascript" src="/Scripts/jquery-ui.min.js"></script>
    
    <script type="text/javascript">

        $(document).ready(function ()
        {
            $("#footer").css({ position: "absolute", top: ($(window).scrollTop() + $(window).height() - $("#footer").height()) + "px" });
            $('input:submit').button();
        }); 

    </script>

    <style type="text/css">
        body
        {
            /*background: transparent url(/Images/background.gif);*/
        }
        
        #loginWrapper
        {
            width: 100%;
            margin: 0px auto;
            background-color: transparent;
        }
        
        .mainContentxxx
        {
            background: #EEF1F1 url(/Images/backgroundtile.png) repeat-x;
            margin-bottom: 50px;
            padding-top: 100px;
        }
        
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div id="loginWrapper">

            <div id="header-container">
            <div id="header">
                <img src="/Images/Header_option2.png" alt="" />
            </div>
            </div>
            
            <div class="mainContent">
                <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false" FailureText="Invalid username or password">
                    <LayoutTemplate>
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

                                <p runat="server" Visible="false">
                                    <br />
                                    <asp:CheckBox ID="RememberMe" runat="server"/>
                                    <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                                </p>
                                <br />
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Login" ValidationGroup="LoginUserValidationGroup" Width="100px"/>
                                <br />
                                <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" 
                                    CssClass="failureNotification" 
                                    ValidationGroup="LoginUserValidationGroup"/>
                                <span class="failureNotification">
                                    <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                </span>
                            </div>
                        </div>
                    </LayoutTemplate>
                </asp:Login>
            </div>
        </div>
         <div id="footer">
    </div>
    </form>
</body>
</html>
