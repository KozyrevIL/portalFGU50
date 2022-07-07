<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="admin_doc_poruchenie.aspx.cs" Inherits="Admin_admin_doc" %>

<%@ Register Src="~/UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>


<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Администрирование ДОКУМЕНТООБОРОТ</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
    <script src="../scripts/CalScript.js"></script>
</head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="47">
                <uc2:admin_banner  header="Ввод документов" ID="Admin_banner1" runat="server" />
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
                        <table cellpadding=0 cellspacing=0  class="formText">
                            
                            <tr>
                                <td width="110">
                                    <div class="formTextMargin">№ вх. док.</div></td>
                                <td style="height: 30px;" width="200">
                                    <asp:TextBox ID="TextBoxNumber_in_doc" runat="server" Width="100px" CssClass="formTextMargin"></asp:TextBox></td>
                                <td style="height: 30px;" width="110" align="right" valign="middle">
                                    <div class="formTextMargin" style=" margin-right:5px">Оператор:</div> </td>
                                <td style="width: 205px; height: 30px;">
                                <asp:Label ID="LabelUser_add" runat=server CssClass="formTextMarginData"></asp:Label>
                                    </td>
                            </tr>
                            
                            <tr>
                                <td height="30" width="110">
                                    <div class="formTextMargin">Формулировка задачи</div></td>
                                <td align="left" colspan="3" style="height: 19px" valign="top">
                                    <FTB:FreeTextBox ID="FreeTextBoxTema" runat="server" Height="100px" Width="600px" Focus="True">
                                    </FTB:FreeTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td height="30" width="110">
                                    <div class="formTextMargin">Отдел</div></td>
                                <td style="height: 19px" width="140">
                                    <asp:DropDownList ID="DropDownList1" CssClass="formTextMargin" runat="server" Width="200px">
                                        <asp:ListItem>Выбрать</asp:ListItem>
                                        <asp:ListItem Value="Руководство ФГУ ЗКП">Руководство ФГУ ЗКП</asp:ListItem>
                                        <asp:ListItem>Роснедвижимость</asp:ListItem>
                                        <asp:ListItem Value="ФГУ ЗКП">ФГУ ЗКП</asp:ListItem>
                                        <asp:ListItem>Теруправление</asp:ListItem>
                                        <asp:ListItem>Юридическое лицо</asp:ListItem>
                                        <asp:ListItem>Росрегистрация</asp:ListItem>
                                        <asp:ListItem Selected="True">Начальник отдела</asp:ListItem>
                                        <asp:ListItem>ИФНС</asp:ListItem>
                                        <asp:ListItem>Росреестр</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td style="height: 19px" width="110">
                                    <div class="formTextMargin">Отдел</div></td>
                                <td style="width: 205px; height: 19px">
                                    <asp:DropDownList ID="DropDownList2" CssClass="formTextMargin" runat="server" Width="200px">
                                        <asp:ListItem>Выбрать</asp:ListItem>
                                        <asp:ListItem Value="Руководство ФГУ ЗКП">Руководство ФГУ ЗКП</asp:ListItem>
                                        <asp:ListItem>Роснедвижимость</asp:ListItem>
                                        <asp:ListItem Value="ФГУ ЗКП">ФГУ ЗКП</asp:ListItem>
                                        <asp:ListItem>Теруправление</asp:ListItem>
                                        <asp:ListItem>Юридическое лицо</asp:ListItem>
                                        <asp:ListItem>Росрегистрация</asp:ListItem>
                                        <asp:ListItem Selected="True">Начальник отдела</asp:ListItem>
                                        <asp:ListItem>ИФНС</asp:ListItem>
                                        <asp:ListItem>Росреестр</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td height="30" width="110">
                                    <div class="formTextMargin">
                                        Контроль</div></td>
                                <td style="height: 19px" width="140" align="left">
                                    <asp:DropDownList ID="DropDownListAvtor_send_doc" CssClass="formTextMargin" runat="server" Width="200px">
                                        <asp:ListItem>Выбрать</asp:ListItem>
                                        <asp:ListItem Value="Руководство ФГУ ЗКП">Руководство ФГУ ЗКП</asp:ListItem>
                                        <asp:ListItem>Роснедвижимость</asp:ListItem>
                                        <asp:ListItem Value="ФГУ ЗКП">ФГУ ЗКП</asp:ListItem>
                                        <asp:ListItem>Теруправление</asp:ListItem>
                                        <asp:ListItem>Юридическое лицо</asp:ListItem>
                                        <asp:ListItem>Росрегистрация</asp:ListItem>
                                        <asp:ListItem Selected="True">Начальник отдела</asp:ListItem>
                                        <asp:ListItem>ИФНС</asp:ListItem>
                                        <asp:ListItem>Росреестр</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td style="height: 19px" width="110">
                                    <div class="formTextMargin">Исполнитель</div></td>
                                <td style="width: 205px; height: 19px">
                                    <asp:DropDownList ID="DropDownListUser_work" runat="server" Width="150px" CssClass="formTextMargin">
                                </asp:DropDownList></td>
                            </tr>
                            <tr>
                            
                                <td height=30 width="110">
                                    <div class="formTextMargin">Дата контр.</div></td><td style="height: 19px;" width="140">
                    <asp:TextBox ID="TextBoxDate_control" runat="server" Width="100px" CssClass="formTextMargin"></asp:TextBox>
                    <A href="javascript:OpenCalendar2('TextBoxDate_control', false)">
                                        <img src="../images/24x24/icon-calendar.gif" border=0 />
                                    </A>
                    </td>
                                <td style="height: 19px" width="110">
                                    <div class="formTextMargin">Время контр.</div></td>
                                <td style="width: 205px; height: 19px">
                                    <asp:TextBox ID="TextBoxTime_control" runat="server" Width="100px" CssClass="formTextMargin"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td height=30 width="110">
                                    <div class="formTextMargin">Статус</div></td>
                                <td style="height: 19px" width="140">
                                    <asp:DropDownList ID="DropDownListStatus" CssClass="formTextMargin" runat="server" Width="150px" >
                                    <asp:ListItem>Выбор</asp:ListItem>
                                    <asp:ListItem Selected="True">В работу</asp:ListItem>
                                    <asp:ListItem>Для ознакомления</asp:ListItem>
                                    <asp:ListItem>Учесть в работе</asp:ListItem>
                                    <asp:ListItem>Просрочено</asp:ListItem>
                                    <asp:ListItem>Отложено</asp:ListItem>
                                </asp:DropDownList>
                                    <asp:CheckBox ID="CheckBoxStatus" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBoxStatus_CheckedChanged"
                                        Text="Исполнено" Visible="False" CssClass="formTextMargin" /></td>
                                <td style="height: 19px" width="110">
                                    <div class="formTextMargin">Важность</div></td>
                                <td style="width: 205px; height: 19px">
                                    <asp:DropDownList ID="DropDownListPrioritet" CssClass="formTextMargin" runat="server" Width="150px">
                                        <asp:ListItem Value="-1">Выбор</asp:ListItem>
                                        <asp:ListItem Value="1" Selected="True">низкая</asp:ListItem>
                                        <asp:ListItem Value="2">средняя</asp:ListItem>
                                        <asp:ListItem Value="3">высокая</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="height: 30px" width="110">
                                </td>
                                <td style="height: 30px" width="140">
                                </td>
                                <td bgcolor="gainsboro" style="height: 30px" width="110">
                                    <div class="formTextMargin">Файл</div></td>
                                <td bgcolor="gainsboro" style="width: 205px; height: 30px">
                                    <asp:FileUpload id="FileUpload1" runat="server" CssClass="formTextMargin" /></td>
                            </tr>
                            <tr>
                                <td style="height: 30px;" width="110">
                                    </td>
                                <td style="height: 30px" width="140"></td>
                                <td style="height: 30px" width="110">
                                    </td>
                                <td style="width: 205px; height: 30px"></td>
                            </tr>
                            <tr>
                                <td style="height: 30px" width="110">
                                    <div class="formTextMargin">Комментарий<br />
                                        исполнителя</div></td>
                                <td colspan="3" style="height: 30px" width="140"><FTB:FreeTextBox ID="FreeTextBox1" runat="server" Height="100px" Width="600px" Focus="True">
                                </FTB:FreeTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px;" width="110">
                                    <div class="formTextMargin">
                                        &nbsp;</div></td>
                                <td style="height: 30px" width="140">
                                    &nbsp;<asp:Button ID="ButtonInsertDoc" runat="server" CssClass="formText" Text="Добавить " OnClick="ButtonInsertDoc_Click" />
                                </td>
                                <td style="height: 30px" width="110">
                                <asp:Button ID="ButtonCancel" runat="server" CssClass="formText" Text="Отменить" OnClick="ButtonCancel_Click" Visible="False" /></td>
                                <td style="width: 205px; height: 30px">
                                </td>
                            </tr>
                            <asp:Panel ID="PanelDateTime_ready" runat=server>
                                <tr>
                            
                                <td style="height: 30px" width="110">
                                    <asp:Label ID="LabelDate_ready" CssClass="formTextMargin" runat=server>Дата исполнения</asp:Label></td>
                                <td style="height: 30px" width="140">
                                    <asp:TextBox ID="TextBoxDate_ready" runat="server" Width="100px" Enabled="False"></asp:TextBox>
                                    <A href="javascript:OpenCalendar2('TextBoxDate_ready', false)">
                                        <img src="../images/24x24/icon-calendar.gif" border=0 />
                                    </A>
                                    </td>
                                <td style="height: 30px" width="110">
                                    <asp:Label ID="LabelTime_ready" CssClass="formTextMargin" runat=server>Время исполнения</asp:Label></td>
                                <td style="width: 205px; height: 30px">
                                    <asp:TextBox ID="TextBoxTime_ready" runat="server" Width="100px" Enabled="False"></asp:TextBox></td>
                            </tr>
                            </asp:Panel>
                            <tr>
                                <td height="30" width="110">
                                    </td>
                                <td style="height: 19px" width="140">
                                    <asp:Label ID="LabelError" runat="server" CssClass="textError" Visible="False"></asp:Label></td>
                                <td style="height: 19px" width="110">
                                    </td>
                                <td style="width: 205px; height: 19px"></td>
                            </tr>
                            <tr>
                                <td height="30" width="110">
                                    </td>
                                <td style="height: 19px" width="140">
                                    </td>
                                <td style="height: 19px" width="110">
                                    <div class="formTextMargin">
                                        &nbsp;</div></td>
                                <td style="width: 205px; height: 19px">
                                    &nbsp;</td>
                            </tr>
                           
                        </table>
                        <table cellpadding=5 cellspacing=0 border=1 bordercolor=white width=1000px>
                            <tr>
                                <td width=250px bgcolor=ThreeDShadow style="height: 37px"><div class="formText1">Выбрать строки неисполненных поручений</div></td>
                                <td width=10px bgcolor="ThreeDShadow" style="height: 37px">
                                    <asp:CheckBox ID="CheckBoxNoReadyDoc" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBoxNoReadyDoc_CheckedChanged" /></td>
                               
                                <td width=150px bgcolor="ThreeDShadow" style="height: 37px"><div class="formText1">Поиск по параметру</div></td>
                                <td width=150px bgcolor="ThreeDShadow" style="height: 37px">
                                    <asp:DropDownList ID="DropDownListFindParametr" runat="server">
                                        <asp:ListItem>выбор</asp:ListItem>
                                        <asp:ListItem Value="№ вх. док">№ вх. док</asp:ListItem>
                                        <asp:ListItem>Исполнитель</asp:ListItem>
                                        <asp:ListItem>Контроль</asp:ListItem>
                                    </asp:DropDownList></td>
                                <td width=100px bgcolor="ThreeDShadow" style="height: 37px">
                                    <asp:TextBox ID="TextBoxFindDoc" runat="server" Width="100px"></asp:TextBox></td>
                                <td width=50px bgcolor="ThreeDShadow" style="height: 37px">
                                    <asp:Button ID="ButtonFindDoc" runat="server" OnClick="ButtonFindDoc_Click" Text="Поиск" /></td>
                                <td width=100px style="height: 37px"></td>
                                <td width=100px bgcolor=ThreeDShadow style="height: 37px"><div class="formText1">Выбор по дате</div></td>
                                <td width=100px bgcolor=ThreeDShadow style="height: 37px"><asp:DropDownList ID="DropDownListDate" Width=100px runat=server AutoPostBack="True" OnSelectedIndexChanged="DropDownListDate_SelectedIndexChanged">
                                    <asp:ListItem>выбор</asp:ListItem>
                                    <asp:ListItem>день</asp:ListItem>
                                    <asp:ListItem>неделя</asp:ListItem>
                                    <asp:ListItem>месяц</asp:ListItem>
                                    <asp:ListItem>все</asp:ListItem>
                                </asp:DropDownList></td>
                            
                            </tr>
                             <tr height=5px>
                                <td><div class="formTextMargin">Кол-во:</div></td>
                                <td>
                                    <asp:Label ID="LabelCountQuery" CssClass="formTextMargin" runat="server"></asp:Label></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr height=5px>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            
                                
                        </table>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataKeyNames="id_doc" ForeColor="#333333" AllowPaging="True" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="50" ShowFooter="True" Width="800px">
                                        <FooterStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="textGridView2"  />
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                       <table cellpadding=3 cellspacing=0 border=0>
                                                    <tr>
                                                        <td> <asp:ImageButton ID="ImageButton1"  runat="server" CausesValidation="False" CommandName="Select"
                                                        ImageUrl="~/images/22х22/pencil.png" Text="Редактировать" /></td>
                                                        <td width=1px></td>
                                                        <td><asp:ImageButton ID="ImageButton2" OnClientClick="return confirm('Удалить документ?');" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/images/22х22/editdelete.png"
                                                            Text="Удалить" /></td>
                                                    </tr>
                                                </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="id_doc" InsertVisible="False" SortExpression="id_doc"
                                                Visible="False">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemId_doc" runat="server" Text='<%# Bind("id_doc") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="№ вх." SortExpression="number_in_doc">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemNumber_in_doc" runat="server" Text='<%# Bind("number_in_doc") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="№ исх." SortExpression="number_out_doc" Visible="False">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemNumber_out_doc" runat="server" Text='<%# Bind("number_out_doc") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="От куда" SortExpression="avtor_send_doc" Visible="False">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemAvtor_send_doc" runat="server" Text='<%# Bind("avtor_send_doc") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Задача" SortExpression="tema">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemTema" Width=350px runat="server" Text='<%# Bind("tema") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Дело" SortExpression="delo" Visible="False">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemDelo" runat="server" Text='<%# Bind("delo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Вид док." SortExpression="vid_doc" Visible="False">
                                                
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemVid_doc" runat="server" Text='<%# Bind("vid_doc") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Дата рег." SortExpression="date_reg">
                                                
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemDate_reg" runat="server" Text='<%# Bind("date_reg") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Время рег." SortExpression="time_reg">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemTime_reg" runat="server" Text='<%# Bind("time_reg") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Дата контр." SortExpression="date_control">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemDate_control" runat="server" Text='<%# Bind("date_control") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Время контр." SortExpression="time_control">
                                                
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemTime_control" runat="server" Text='<%# Bind("time_control") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Дата исп." SortExpression="date_ready">
                                              
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemDate_ready" runat="server" Text='<%# Bind("date_ready") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Время исп." SortExpression="time_ready">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemTime_ready" runat="server" Text='<%# Bind("time_ready") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Польз. доб. док." SortExpression="user_add_doc" Visible="False">
                                                
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemUser_add_doc" runat="server" Text='<%# Bind("user_add_doc") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Исполнитель" SortExpression="user_work">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemUser_work" runat="server" Text='<%# Bind("user_work") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Контроль" SortExpression="user_control">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemUser_control" runat="server" Text='<%# Bind("user_control") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Статус" SortExpression="status_doc" Visible="False">
                                                
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemStatus_doc" runat="server" Text='<%# Bind("status_doc") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Комментарий" SortExpression="comments">
                                                
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemComments" runat="server" Width=150px Text='<%# Bind("comments") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="№ поруч." SortExpression="number_poruchenie" Visible="False">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemNumber_poruchenie" runat="server" Text='<%# Bind("number_poruchenie") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Приоритет" SortExpression="prioritet" Visible="False">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemPrioritet" runat="server" Text='<%# Bind("prioritet") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Приоритет строковый" SortExpression="prioritet_str" Visible="False">
                                               
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemPrioritet_str" runat="server" Text='<%# Bind("prioritet_str") %>'></asp:Label>
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
                &nbsp;&nbsp;
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
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="name_dolgnost" Type="String" />
                        <asp:Parameter Name="name_filial" Type="String" />
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
                </asp:SqlDataSource><asp:SqlDataSource ID="SqlDataSourceForOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    DeleteCommand="SotrudnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SotrudnikInsert"
                    InsertCommandType="StoredProcedure" SelectCommand="SotrudnikSelectForOtdel" SelectCommandType="StoredProcedure"
                    UpdateCommand="SotrudnikUpdate" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="25" Name="id_otdel" Type="Int32" />
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
                &nbsp;
                &nbsp;&nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSourceDoc" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    SelectCommand="DocSelect" SelectCommandType="StoredProcedure" DeleteCommand="DocDelete" DeleteCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="id_doc" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <br />
                &nbsp;<asp:ObjectDataSource ID="ObjectDataSourceDocForDate" runat="server" SelectMethod="DocSelectForDate"
                    TypeName="Doc">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="&quot;-1&quot;" Name="date_begin" Type="String" />
                        <asp:Parameter DefaultValue="&quot;-1&quot;" Name="date_end" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
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
            </td>
        </tr>
     
        <tr><td height=28px bgcolor="#85A4C3"></td></tr>
        <tr><td height=6px background="../images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92"></td></tr>
    </table>
    
    </form>
</body>
</html>
