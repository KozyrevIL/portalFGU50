<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu_admin_vert.ascx.cs" Inherits="UC_menu_admin_vert" %>
<div style="padding-left:10px; padding-top:10px;">
<asp:TreeView ID="TreeView1" runat="server"  ImageSet="WindowsHelp">
    <ParentNodeStyle Font-Bold="False" />
    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
        VerticalPadding="0px" />
    <Nodes>
        <asp:TreeNode SelectAction="Expand" Text="Персональная информация" 
            Value="Персоналные настройки">
            <asp:TreeNode NavigateUrl="~/Admin/admin.aspx" Text="Общая информация" 
                Value="Общая информация"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="Новости" ToolTip="Новости" Value="Новости" 
            SelectAction="Expand">
            <asp:TreeNode Text="Общественные" ToolTip="Общественные" Value="Общественные" 
                NavigateUrl="~/Admin/admin_news.aspx"></asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Admin/admin_news_production.aspx" 
                Text="Производственные" ToolTip="Производственные" Value="Производственные">
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Admin/admin_news_inside_inform.aspx" 
                Text="Служебные" ToolTip="Служебные" Value="Служебные"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="Справочники" ToolTip="Справочники" Value="Справочники" 
            SelectAction="Expand" Expanded="True">
            <asp:TreeNode Text="Организация" Value="Организация" Expanded="True" 
                SelectAction="Expand">
                <asp:TreeNode Text="Филиалы" Value="Филиалы" NavigateUrl="~/Admin/admin_filial.aspx"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/admin_otdel.aspx" Text="Отделы" Value="Отделы"></asp:TreeNode>
                <asp:TreeNode Text="Сотрудники" Value="Сотрудники" NavigateUrl="~/Admin/admin_sotrudnik.aspx"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/admin_dolgnost.aspx" Text="Должности" Value="Должности">
                </asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/admin_spravochnik.aspx" Text="Телефоны и email"
                    Value="Телефоны и email"></asp:TreeNode>
            </asp:TreeNode>
        </asp:TreeNode>
        
            <asp:TreeNode  Text="Администрирование"  Value="Администрирование" 
            SelectAction="Expand" Expanded="False">
                <asp:TreeNode NavigateUrl="~/Admin/admin_users.aspx" Text="Пользователи" Value="Пользователи">
                </asp:TreeNode>
                <asp:TreeNode Text="Роли" Value="Роли" NavigateUrl="~/Admin/admin_users_roles.aspx"></asp:TreeNode>
            </asp:TreeNode>
        
        <asp:TreeNode SelectAction="Expand" Text="Настройка страниц портала" 
            Value="Настройка страниц портала" Expanded="False">
            <asp:TreeNode Text="Страницы" Value="Страницы"></asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Admin/admin_sotrudnikGroup.aspx" 
                Text="Группы сотрудников" Value="Группы сотрудников"></asp:TreeNode>
            <asp:TreeNode Text="Константы" Value="Константы"></asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Admin/admin_calendar.aspx" Text="Рабочие дни" 
                Value="Рабочие дни"></asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Admin/admin_doctype.aspx" Text="Типы документов" 
                Value="Типы документов"></asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Admin/admin_reporttype.aspx" Text="Типы отчетов" 
                Value="Типы отчетов"></asp:TreeNode>
        </asp:TreeNode>
        
    </Nodes>
    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
        NodeSpacing="0px" VerticalPadding="1px" />
</asp:TreeView>
</div>