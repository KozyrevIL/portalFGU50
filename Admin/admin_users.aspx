<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_users.aspx.cs" Theme="gridview"  Inherits="Admin_admin_users" %>

<%@ Register Src="../UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>

<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Администрирование СОТРУДНИКИ</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="../jQuery/css/start/jquery-ui-1.8.16.custom.css">
	<script src="../jQuery/jquery-1.6.2.min.js"></script>
	<script src="../jQuery/ui/minified/jquery.ui.core.min.js"></script>
	<script src="../jQuery/ui/minified/jquery.ui.widget.min.js"></script>
	<script src="../jQuery/ui/minified/jquery.ui.datepicker.min.js"></script>
	<script src="../jQuery/ui/i18n/jquery.ui.datepicker-ru-utf8.js"></script>

	<script language="javascript" type="text/javascript">
	    $(function () {
	        $("#TextBoxReg_date").datepicker();
	       
	    });
	</script>

</head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="47">
                <uc2:admin_banner ID="Admin_banner1" header="Пользователи" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td align=left valign=top bgcolor=white style="height: 584px">
            <table cellpadding=0 cellspacing=0 border=1 width=100%>
                <tr>
                    <td width=20% align=left valign=top>
                        <uc1:menu_admin_vert ID="Menu_admin_vert1" runat="server" />
                    </td>
                    <td width=80% valign=top align=left>
                        <div id="menuFiltr" class="formText" style="margin:10px;">
                            <div>
                                Поиск по маске
                                <asp:TextBox ID="TextBoxFind" runat="server"></asp:TextBox>
                                    <asp:Button ID="ButtonFind" runat="server" CssClass="formText" Text="Поиск" 
                                        OnClick="ButtonFind_Click" />
                                        &nbsp;
                                        *Возможен поиск по части слова (имени, фамилии, логину, роли), при пустом поле выдает все строки
                            </div>
                        </div>
                    <div class="posForm">
                        <div id="input_border1">
                        <table cellpadding=0 cellspacing=0 width=800 class="formText">
                            <tr>
                                <td height="30" style="width: 224px">
                                    Сотрудник</td>
                                <td style="width: 205px">
                                    <asp:DropDownList ID="DropDownListSotrudnik" runat="server" Width="230px" DataSourceID="SqlDataSourceSotrudnik" DataTextField="full_name" DataValueField="id_sotrudnik">
                                    </asp:DropDownList></td>
                                <td style="width: 205px">
                                  </td>
                                <td style="width: 205px">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td height="30" style="width: 224px">
                                    Логин</td>
                                <td style="width: 205px">
                                    <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox></td>
                                <td style="width: 205px">
                                    
                                </td>
                                <td style="width: 205px">
                                    &nbsp;</td>
                            </tr>
                            
                            <tr>
                                <td height=30 style="width: 224px" >
                                    Пароль</td><td style="width: 205px">
                                    <asp:TextBox ID="TextBoxPass" runat="server" Enabled="False"></asp:TextBox></td>
                                <td style="width: 205px">
                                    <asp:Button ID="Button2" runat="server" Text="Генерировать пароль" OnClick="Button2_Click" />
                                    &nbsp; </td>
                                <td style="width: 205px">

                                    </td>
                            </tr>
                            <tr>
                                <td height=30 style="width: 224px">
                                    Повтор пароля</td><td style="height: 19px; width: 205px;">
                    <asp:TextBox ID="TextBoxPass2" runat="server" Enabled="False"></asp:TextBox></td>
                                <td style="width: 205px; height: 19px">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height=30 style="width: 224px">
                                    Роль</td>
                                <td style="width: 205px; height: 19px">
                                    <asp:DropDownList ID="DropDownListRoles" runat="server" Width="230px" DataSourceID="SqlDataSourceRoles" DataTextField="name_roles" DataValueField="id_roles">
                                    </asp:DropDownList></td>
                                <td style="width: 205px; height: 19px">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="..." /></td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height="30" style="width: 224px">
                                </td>
                                <td style="width: 205px; height: 19px">
                                    <asp:Label ID="LabelError" runat="server" CssClass="textError" Visible="False"></asp:Label></td>
                                <td style="width: 205px; height: 19px">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height=30 style="width: 224px"></td><td style="width: 205px" align=right>
                                    <asp:Button ID="ButtonInsertFilial" runat="server" CssClass="formText" Text="Добавить" OnClick="ButtonInsertFilial_Click1" /></td>
                                <td align="right" style="width: 205px">
                                </td>
                                <td align="right" style="width: 205px">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                        
                    </td>
                            </tr>
                           
                        </table>
                        </div>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" SkinID=middle
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_users,id_roles" DataSourceID="SqlDataSourceUsers"
                            ForeColor="#333333" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                            PageSize="50" ShowFooter="True" onrowupdating="GridView1_RowUpdating">
                            <FooterStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" CssClass="textGridView2" ForeColor="#333333" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                <asp:TemplateField HeaderText="id_users" InsertVisible="False" SortExpression="id_users"
                                    Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_users") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_users") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="id_sotrudnik" SortExpression="id_sotrudnik" Visible=False>
                                
                                    <ItemTemplate>
                                        <asp:Label ID="LabelItem_id_sotrudnik" Visible=false runat="server" Text='<%# Bind("id_sotrudnik") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Сотрудник" SortExpression="full_name">
                                    <EditItemTemplate>
                                        <asp:Label ID="LabelEditFull_name" runat="server" Text='<%# Eval("full_name") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelItemFull_name" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Логин" SortExpression="logon">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxEditLogon" runat="server" Text='<%# Bind("logon") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelItemLogon" runat="server" Text='<%# Bind("logon") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Пароль" SortExpression="pass">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxEditPass" runat="server" TextMode=SingleLine Text='<%# Bind("pass") %>' Enabled="true"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                      
                                        <asp:TextBox ID="TextBoxItemPass"  Enabled=false runat="server" Text='*****'></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Пароли" SortExpression="full_name">
                                    <EditItemTemplate>
                                        <asp:Button ID="PasswordUsers" runat="server" Text="Генерировать" />
                                    </EditItemTemplate>
                                    <%--<ItemTemplate>
                                        <asp:Button ID="Button4" runat="server" Text="Button" />
                                    </ItemTemplate>--%>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Роль" SortExpression="name_roles">
                                    <EditItemTemplate>
                                        
                                        <asp:Label ID="LabelEditId_roles" Visible=false runat="server" Text='<%# Bind("id_roles") %>'></asp:Label>
                                        <asp:Label ID="LabelEditName_roles" Visible=false runat="server" Enabled=false Text='<%# Bind("name_roles") %>'></asp:Label>
                                        
                                         <asp:DropDownList ID="DropDownListEditRoles" runat="server" Width="100px" DataTextField="name_roles" DataValueField="id_roles">
                                    </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelItemName_roles" runat="server" Text='<%# Bind("name_roles") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="blok_account" HeaderText="Блокировка" 
                                    SortExpression="blok_account" />
                            </Columns>
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>

                      </div>
                    </td>
                </tr>
            </table>
                <asp:SqlDataSource ID="SqlDataSourceSotrudnik" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    DeleteCommand="SotrudnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SotrudnikInsert"
                    InsertCommandType="StoredProcedure" SelectCommand="SotrudnikSelect" SelectCommandType="StoredProcedure"
                    UpdateCommand="SotrudnikUpdate" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                        <asp:Parameter Name="id_otdel" Type="Int32" />
                        <asp:Parameter Name="id_dolgnost" Type="Int32" />
                        <asp:Parameter Name="id_filial" Type="Int32" />
                        <asp:Parameter Name="first_name" Type="String" />
                        <asp:Parameter Name="last_name" Type="String" />
                        <asp:Parameter Name="middle_name" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_otdel" Type="Int32" />
                        <asp:Parameter Name="id_dolgnost" Type="Int32" />
                        <asp:Parameter Name="id_filial" Type="Int32" />
                        <asp:Parameter Name="first_name" Type="String" />
                        <asp:Parameter Name="last_name" Type="String" />
                        <asp:Parameter Name="middle_name" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                &nbsp;&nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    DeleteCommand="UsersDelete" DeleteCommandType="StoredProcedure" SelectCommand="UsersSelect"
                    SelectCommandType="StoredProcedure" UpdateCommand="UsersUpdate" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="id_users" Type="Int32" />
                        <asp:Parameter Name="id_roles" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBoxFind" DefaultValue=" " Name="mask" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_users" Type="Int32" />
                        <asp:Parameter Name="pass" Type="String" />
                        <asp:Parameter Name="logon" Type="String" />
                        
                        <asp:Parameter Name="id_roles" Type="Int32" />
                        
                        <asp:Parameter Name="name_roles" Type="String" />
                        <asp:Parameter Name="blok_account" Type="Boolean" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    DeleteCommand="RolesDelete" DeleteCommandType="StoredProcedure" SelectCommand="RolesSelect"
                    SelectCommandType="StoredProcedure" UpdateCommand="RolesUpdate" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="id_roles" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_roles" Type="Int32" />
                        <asp:Parameter Name="name_roles" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
     
        <tr><td height=28px bgcolor="#85A4C3"></td></tr>
        <tr><td height=6px background="../images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92"></td></tr>
    </table>
    
    </form>
</body>
</html>
