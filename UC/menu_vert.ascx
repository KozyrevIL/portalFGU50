<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu_vert.ascx.cs" Inherits="UC_menu_admin_vert" %>
<asp:TreeView ID="TreeView1" runat="server" ImageSet="WindowsHelp" 
    onselectednodechanged="TreeView1_SelectedNodeChanged">
	<ParentNodeStyle Font-Bold="False" />
	<HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
	<SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
		VerticalPadding="0px" />
	<Nodes>
		<asp:TreeNode Text="Справочники" ToolTip="Справочники" Value="Справочники" 
            SelectAction="Expand" Expanded="True">
			<asp:TreeNode Text="Филиалы" Value="Филиалы" NavigateUrl="~/filial.aspx"></asp:TreeNode>
			<asp:TreeNode Text="Телефонные справочники" Value="Телефонный справочники" SelectAction="Expand">
			    <asp:TreeNode NavigateUrl="https://phone.kadastr.ru/" Target="top" Text="ФГБУ" Value="ФГБУ"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/spravochnik.aspx" Text="Телефоны Учреждения" Value="Телефоны и email"></asp:TreeNode>
			</asp:TreeNode>
		</asp:TreeNode>
		<asp:TreeNode Text="Новости" ToolTip="Новости" Value="Новости"
			Expanded="False" SelectAction="Expand">
			<asp:TreeNode NavigateUrl="~/Default.aspx" Text="Текущие" Value="Текущие"></asp:TreeNode>
			<asp:TreeNode Text="Архив" Value="Архив" Expanded="False" NavigateUrl="~/news_arhiv.aspx">
			</asp:TreeNode>
		</asp:TreeNode>
		<asp:TreeNode Text="Журналы" Value="Журналы"
			Expanded="False" SelectAction="Expand">
			<asp:TreeNode NavigateUrl="~/Admin/close_request.aspx" Text="Журнал закрытых заявлений. Ввод." Value="Журнал закрытых заявлений. Ввод."></asp:TreeNode>
			
		    <asp:TreeNode NavigateUrl="~/Admin/Archive_scan.aspx" Text="Сканирование ДПД" Value="Сканирование ДПД"></asp:TreeNode>

		</asp:TreeNode>
	</Nodes>
	<NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
		NodeSpacing="0px" VerticalPadding="1px" />
</asp:TreeView>
