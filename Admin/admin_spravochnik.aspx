<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_spravochnik.aspx.cs" Inherits="Admin_admin_spravochnik" %>

<%@ Register Src="~/UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>

<%@ Register Src="~/UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Администрирование Справочник телефонный и эл.почты</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="99">
                <uc2:admin_banner header="Справочник - телефоны и email" ID="Admin_banner1" runat="server" />
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
                    <div class="posForm">
                        <table cellpadding=0 cellspacing=0 width=800 class="formText">
                            <tr>
                                <td height="30" style="width: 224px">
                                    Филиал</td>
                                <td style="width: 205px">
                                    <asp:DropDownList ID="DropDownListFilial" runat="server" Width="230px">
                                    </asp:DropDownList></td>
                                <td width="90">
                                </td>
                                <td width="95">
                                </td>
                                <td width="95">
                                </td>
                                <td style="width: 205px">
                                </td>
                            </tr>
                            <tr>
                                <td height="30" style="width: 224px">
                                    Отдел</td>
                                <td style="width: 205px">
                                    <asp:DropDownList ID="DropDownListOtdel" runat="server" Width="230px" AutoPostBack="True" OnSelectedIndexChanged="DropDownListOtdel_SelectedIndexChanged">
                                    </asp:DropDownList></td>
                                <td width="90">
                                </td>
                                <td width="95">
                                </td>
                                <td width="95">
                                </td>
                                <td style="width: 205px">
                                </td>
                            </tr>
                            <tr>
                                <td height="30" style="width: 224px">
                                    Фамилия</td>
                                <td style="width: 205px"><asp:DropDownList ID="DropDownListSotrudnik" runat="server" Width="230px" AutoPostBack="True" OnSelectedIndexChanged="DropDownListSotrudnik_SelectedIndexChanged">
                                </asp:DropDownList></td>
                                <td width="90">
                                    Имя</td>
                                <td width="95">
                                    <asp:TextBox ID="TextBoxFirst_name" runat="server" Width="95px"></asp:TextBox></td>
                                <td width="95">
                                    &nbsp;Отчество</td>
                                <td style="width: 205px">
                                    <asp:TextBox ID="TextBoxMiddle_name" runat="server" Width="95px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td height=30 style="width: 224px">
                                    Должность</td>
                                <td style="width: 205px; height: 19px"><asp:DropDownList ID="DropDownListDolgnost" runat="server" Width="230px">
                                </asp:DropDownList></td>
                                <td style="height: 19px" width="90">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height="30" style="width: 224px">
                                    Номер кабинета</td>
                                <td style="width: 205px; height: 19px">
                                    <asp:TextBox ID="TextBoxNumber_cab" runat="server" Width="50px"></asp:TextBox></td>
                                <td style="height: 19px" width="90">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height="30" style="width: 224px">
                                    Номер телефона</td>
                                <td style="width: 205px; height: 19px">
                                    <asp:TextBox ID="TextBoxNumber_phone" runat="server" Width="236px"></asp:TextBox></td>
                                <td style="height: 19px" width="90">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height="30" style="width: 224px">
                                    Номер IP телефона</td>
                                <td style="width: 205px; height: 19px">
                                    <asp:TextBox ID="TextBoxNumber_ip_phone" runat="server" Width="50px"></asp:TextBox></td>
                                <td style="height: 19px" width="90">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height="30" style="width: 224px">
                                    Электронная почта</td>
                                <td style="width: 205px; height: 19px">
                                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="236px"></asp:TextBox></td>
                                <td style="height: 19px" width="90">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height="30" style="width: 224px">
                                </td>
                                <td style="width: 205px; height: 19px">
                                    <asp:Label ID="LabelError" runat="server" CssClass="textError" Visible="False"></asp:Label></td>
                                <td style="height: 19px" width="90">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="height: 19px" width="95">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 224px; height: 26px;"></td><td style="width: 205px; height: 26px;" align=right>
                                    <asp:Button ID="ButtonInsertFilial" runat="server" CssClass="formText" Text="Добавить сотрудника" OnClick="ButtonInsertFilial_Click1" /></td>
                                <td align="right" style="height: 26px" width="90">
                                </td>
                                <td align="right" style="height: 26px;" width="95">
                                    <asp:Button ID="ButtonCancel" runat="server" CssClass="formText" OnClick="ButtonCancel_Click"
                                        Text="Отменить" Visible="False" /></td>
                                <td align="right" style="height: 26px;" width="95">
                                </td>
                                <td align="right" style="width: 205px; height: 26px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 224px"></td><td style="width: 205px"></td>
                                <td width="90">
                                </td>
                                <td width="95">
                                </td>
                                <td width="95">
                                </td>
                                <td style="width: 205px">
                                    <br />
                                </td>
                            </tr>
                           
                        </table>
                        <table border="1" bordercolor="white" cellpadding="5" cellspacing="0" width="700">
                            <tbody>
                                <tr>
                                    <td bgcolor="buttonface" colspan="7" style="height: 36px">
                                        <div class="textGridView">Можно искать по любому параметру - части <strong>слова, числа.</strong><br /> 
                                        <strong>Примеры:</strong><br />  
                                        - набираем <strong>Ива</strong>, нажимаем <strong>Поиск</strong> - получаем <strong>Иванов Иван Иванович</strong>;<br /> 
                                        - набираем <strong>фин</strong>, нажимаем <strong>Поиск</strong> - получаем данные по всем сотрудникам<strong> Финансового отдела</strong>;<br /> 
                                        - набираем <strong>301</strong>, нажимаем <strong>Поиск</strong> - получаем данные по всем сотрудникам<strong> 301 кабинета</strong>.. и т.д.<br /><br />
                                        Что бы получить <strong>все данные</strong> необходимо оставить поле поиска <strong>пустым</strong>. 
                                        </div>
                                        </td>
                                </tr>
                                <tr>
                                    <td bgcolor="buttonface" style="height: 36px" width="100">
                                        <div class="textGridView">
                                            Поиск по маске</div>
                                    </td>
                                    <td bgcolor="buttonface" colspan="4" style="height: 36px">
                                        <asp:TextBox ID="TextBoxFind" runat="server" Width="476px"></asp:TextBox></td>
                                    <td bgcolor="buttonface" colspan="2" style="height: 36px">
                                        <asp:Button ID="ButtonFindDoc" runat="server" OnClick="ButtonFindDoc_Click" Text="Поиск" /></td>
                                </tr>
                                <tr height="5">
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td width="60">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataKeyNames="id_spravochnik" 
                            DataSourceID="SqlDataSourceSpravochnikForOtdel" ForeColor="#333333" AllowPaging="True" AllowSorting="True" 
                            OnRowDataBound="GridView1_RowDataBound" 
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                            OnSelectedIndexChanging="GridView1_SelectedIndexChanging" PageSize="20" 
                            Width="100%">
                                        <FooterStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="textGridView2"  />
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" ButtonType="Image" DeleteImageUrl="~/images/22х22/editdelete.png" DeleteText="Удаление" SelectImageUrl="~/images/22х22/pencil.png" SelectText="Редактировать" />
                                            <asp:TemplateField HeaderText="id_spravochnik" InsertVisible="False" SortExpression="id_spravochnik"
                                                Visible="False">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("id_spravochnik") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemId_spravochnik" runat="server" Text='<%# Bind("id_spravochnik") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="id_sotrudnik" SortExpression="id_sotrudnik" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("id_sotrudnik") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("id_sotrudnik") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Фамилия" SortExpression="last_name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("last_name") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemLast_name" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Имя" SortExpression="first_name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("first_name") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemFirst_name" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Отчество" SortExpression="middle_name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("middle_name") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemMiddle_name" runat="server" Text='<%# Bind("middle_name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Полное имя" SortExpression="full_name" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("full_name") %>'></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemFull_name" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="id_filial" SortExpression="id_filial" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("id_filial") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemId_filial" runat="server" Text='<%# Bind("id_filial") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Филиал" SortExpression="name_filial">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("name_filial") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemFilial" runat="server" Text='<%# Bind("name_filial") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="id_otdel" SortExpression="id_otdel" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("id_otdel") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemId_otdel" runat="server" Text='<%# Bind("id_otdel") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Отдел" SortExpression="name_otdel">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("name_otdel") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemOtdel" runat="server" Text='<%# Bind("name_otdel") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="id_dolgnost" SortExpression="id_dolgnost" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("id_dolgnost") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemId_dolgnost" runat="server" Text='<%# Bind("id_dolgnost") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Должность" SortExpression="name_dolgnost">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("name_dolgnost") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemDolgnost" runat="server" Text='<%# Bind("name_dolgnost") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="№ каб." SortExpression="number_cab">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("number_cab") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemNumber_cab" runat="server" Text='<%# Bind("number_cab") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="телефон" SortExpression="number_phone">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("number_phone") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemNumber_phone" runat="server" Text='<%# Bind("number_phone") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IP тел." SortExpression="number_ip_phone">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("number_ip_phone") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemNumber_ip_phone" runat="server" Text='<%# Bind("number_ip_phone") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Эл.почта" SortExpression="email">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" CssClass="textGridView" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                      </div>
                    </td>
                </tr>
            </table>
                <asp:SqlDataSource ID="SqlDataSourceOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    DeleteCommand="OtdelDelete" DeleteCommandType="StoredProcedure" InsertCommand="OtdelInsert"
                    InsertCommandType="StoredProcedure" SelectCommand="OtdelSelect" SelectCommandType="StoredProcedure"
                    UpdateCommand="OtdelUpdate" UpdateCommandType="StoredProcedure">
                    <InsertParameters>
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                        <asp:Parameter Name="count_otdel_real" Type="Int32" />
                    </InsertParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id_otdel" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_otdel" Type="Int32" />
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                        <asp:Parameter Name="count_otdel_real" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDolgnost" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    DeleteCommand="DolgnostDelete" DeleteCommandType="StoredProcedure" InsertCommand="DolgnostInsert"
                    InsertCommandType="StoredProcedure" SelectCommand="DolgnostSelect" SelectCommandType="StoredProcedure"
                    UpdateCommand="DolgnostUpdate" UpdateCommandType="StoredProcedure">
                    <InsertParameters>
                        <asp:Parameter Name="name_dolgnost" Type="String" />
                    </InsertParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id_dolgnost" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_dolgnost" Type="Int32" />
                        <asp:Parameter Name="name_dolgnost" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSpravochnikForOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    DeleteCommand="SpravochnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SpravochnikInsert"
                    InsertCommandType="StoredProcedure" SelectCommand="SpravochnikSelectForOtdel" SelectCommandType="StoredProcedure"
                    UpdateCommand="SpravochnikUpdate" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListOtdel" Name="id_otdel" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id_spravochnik" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_spravochnik" Type="Int32" />
                        <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                        <asp:Parameter Name="id_filial" Type="Int32" />
                        <asp:Parameter Name="id_otdel" Type="Int32" />
                        <asp:Parameter Name="id_dolgnost" Type="Int32" />
                        <asp:Parameter Name="number_cab" Type="String" />
                        <asp:Parameter Name="number_phone" Type="String" />
                        <asp:Parameter Name="number_ip_phone" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                        <asp:Parameter Name="id_filial" Type="Int32" />
                        <asp:Parameter Name="id_otdel" Type="Int32" />
                        <asp:Parameter Name="id_dolgnost" Type="Int32" />
                        <asp:Parameter Name="number_cab" Type="String" />
                        <asp:Parameter Name="number_phone" Type="String" />
                        <asp:Parameter Name="number_ip_phone" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSotrudnikForOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    DeleteCommand="SotrudnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SotrudnikInsert"
                    InsertCommandType="StoredProcedure" SelectCommand="SotrudnikSelectForOtdel" SelectCommandType="StoredProcedure"
                    UpdateCommand="SotrudnikUpdate" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListOtdel" Name="id_otdel" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
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
                <asp:SqlDataSource ID="SqlDataSourceFilial" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    DeleteCommand="FilialDelete" DeleteCommandType="StoredProcedure" InsertCommand="OtdelInsert"
                    InsertCommandType="StoredProcedure" SelectCommand="FilialSelect" SelectCommandType="StoredProcedure"
                    UpdateCommand="FilialUpdate" UpdateCommandType="StoredProcedure">
                    <InsertParameters>
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                        <asp:Parameter Name="count_otdel_real" Type="Int32" />
                    </InsertParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id_filial" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_filial" Type="Int32" />
                        <asp:Parameter Name="kad_number" Type="Int32" />
                        <asp:Parameter Name="name_filial" Type="String" />
                        <asp:Parameter Name="city_filial" Type="String" />
                        <asp:Parameter Name="street_filial" Type="String" />
                        <asp:Parameter Name="home_filial" Type="String" />
                        <asp:Parameter Name="index_filial" Type="Int32" />
                        <asp:Parameter Name="kanal" Type="String" />
                        <asp:Parameter Name="tarif_kanal" Type="String" />
                        <asp:Parameter Name="v_kanal" Type="Int32" />
                        <asp:Parameter Name="provayder_kanal" Type="String" />
                        <asp:Parameter Name="have_vpn" Type="Boolean" />
                        <asp:Parameter Name="have_ip_phone" Type="Boolean" />
                        <asp:Parameter Name="have_ftp" Type="Boolean" />
                        <asp:Parameter Name="have_rnd" Type="Boolean" />
                        <asp:Parameter Name="number_phone" Type="String" />
                        <asp:Parameter Name="number_ip_phone" Type="Int32" />
                        <asp:Parameter Name="name_email" Type="String" />
                        <asp:Parameter Name="id_email" Type="Int32" />
                        <asp:Parameter Name="id_phone" Type="Int32" />
                        <asp:Parameter Name="id_ip_phone" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp;
                &nbsp;&nbsp;
            </td>
        </tr>
     
        <tr><td height=28px bgcolor="#85A4C3"></td></tr>
        <tr><td height=6px background="../images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92"></td></tr>
    </table>
    
        <asp:SqlDataSource ID="SqlDataSourceSpravochnikForMask" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="SpravochnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SpravochnikInsert"
            InsertCommandType="StoredProcedure" SelectCommand="SpravochnikSelectForMask" SelectCommandType="StoredProcedure"
            UpdateCommand="SpravochnikUpdate" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_spravochnik" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_spravochnik" Type="Int32" />
                <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                <asp:Parameter Name="id_filial" Type="Int32" />
                <asp:Parameter Name="id_otdel" Type="Int32" />
                <asp:Parameter Name="id_dolgnost" Type="Int32" />
                <asp:Parameter Name="number_cab" Type="String" />
                <asp:Parameter Name="number_phone" Type="String" />
                <asp:Parameter Name="number_ip_phone" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                <asp:Parameter Name="id_filial" Type="Int32" />
                <asp:Parameter Name="id_otdel" Type="Int32" />
                <asp:Parameter Name="id_dolgnost" Type="Int32" />
                <asp:Parameter Name="number_cab" Type="String" />
                <asp:Parameter Name="number_phone" Type="String" />
                <asp:Parameter Name="number_ip_phone" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxFind" DefaultValue=" " Name="mask" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    
    </form>
</body>
</html>
