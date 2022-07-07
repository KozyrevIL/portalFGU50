<%@ Page Language="C#" AutoEventWireup="true" CodeFile="logon.aspx.cs" Inherits="logon" %>

<!DOCTYPE html PUBLIC>

<html>
<head id="Head1" runat="server">
    <title>Авторизация</title>
    <link rel="shrtcut icon" href="images/FKPR.ico" />
    

    <link href="css/bootstrap5/logon.css" rel="stylesheet" />

    <script type="text/javascript" src="jQuery/jquery-1.6.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(window).resize(function () {
                $('.Background').css({
                    position: 'absolute',
                    left: ($(window).width() - $('.Background').outerWidth()) / 2,
                    top: ($(window).height() - $('.Background').outerHeight()) / 2
                });
            });
            $(window).resize();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Background">
            <div style="text-align: center;">
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/FKPR.png" Width="115" Height="115" />
                <br /><br />
                <asp:Label ID="Label1" runat="server" Text="Логин (Фамилия):" CssClass="Label"></asp:Label><br />
                <asp:TextBox ID="UsernameText" runat="server" CssClass="TextBox" ></asp:TextBox>
                <br /><br />
                <asp:Label ID="Label2" runat="server" Text="Пароль:" CssClass="Label"></asp:Label><br />
                <asp:TextBox ID="PasswordText" runat="server" EnableViewState="False" TextMode="Password" CssClass="TextBox"></asp:TextBox>
                <br /><br />
                <asp:Button ID="ButtonLogon" runat="server" OnClick="ButtonLogon_Click" Text="Вход" CssClass="Button" />
                <br /><br />
                <asp:Label ID="LegendStatus" runat="server" ForeColor="White" CssClass="Label"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
