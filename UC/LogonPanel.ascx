<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LogonPanel.ascx.cs" Inherits="UC_LogonPanel" %>
<asp:Panel ID="panelLogin" runat="server">
	<asp:Label ID="labelError" runat="server" Visible="False" SkinID="Label_LoginError"></asp:Label>
	<table>
		<tr>
			<td style="width: 100px">
				Имя
			</td>
			<td style="width: 100px">
				<asp:TextBox ID="LOGIN" runat="server" SkinID="TextBox_HeaderText" Width="100px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td>
				Пароль
			</td>
			<td>
				<asp:TextBox ID="PASSWORD" runat="server" SkinID="TextBox_HeaderText" TextMode="Password"
					Width="100px"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td>
				<asp:CheckBox ID="chkRemember" runat="server" Text="Запомнить" />
			</td>
			<td align="right">
				<asp:ImageButton ID="btnLogin" runat="server" OnClick="btnLogin_Click" ImageUrl="~/images/door_in.png" AlternateText="Войти"/>
			</td>
		</tr>
	</table>
</asp:Panel>
<asp:Panel ID="panelLogout" runat="server">
	<asp:ImageButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" ImageUrl="~/images/door_out.png" AlternateText="Выйти" />
</asp:Panel>
