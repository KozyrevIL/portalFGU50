<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_sotrudnik.aspx.cs"
	StylesheetTheme="global" Inherits="Admin_admin_sotrudnik" %>

<%@ Register Src="~/UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>
<%@ Register Src="~/UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
		$(function() {
		    $("#TextBoxCharacterisrikDate").datepicker();
		});
	</script>

    <style type="text/css">
        #dopPannel ul li
        {
            padding-bottom:5px;
        }
    </style>

	</head>
<body topmargin="0" leftmargin="0">

	<form id="form1" runat="server">
    <div id="page">
        <uc2:admin_banner ID="Admin_banner1" header="СОТРУДНИКИ" runat="server" />
        <div></div>
        <div id="menuFiltr" class="formText" >

            <div style=" margin-top:5px; margin-left:14px; margin-bottom:10px">
                <div style="float: left; line-height:30px">
                    Поиск по маске</div>
                <div style="float: left; margin-left:10px; line-height:30px">
                    <asp:TextBox ID="TextBoxFind" runat="server" Width="200px"></asp:TextBox>
                </div>
                <div style="float: left; line-height:30px">
                    <asp:Button ID="ButtonFind" runat="server" CssClass="formText" Text="Поиск" OnClick="ButtonFind_Click" />
                </div>
                <div style="line-height:30px">
                    *Возможен поиск по части слова, при пустом поле выдает все строки
                </div>
            </div>

            <div  style="margin-left:17px;">
                <div id="FormFiltr" style="border: 1px solid #FED17E; background-color:#FEF6E1; padding: 10px 10px 10px 10px; margin: 0px 17px 15px 0px;"  >
                    <div style="width: 150px; float:left">
                        Фильтр по отделу</div>
                    <div style="width: 587px;  float:left">
                        <asp:DropDownList ID="DropDownListFiltr" runat="server" Width="580px" AutoPostBack="True"
                            OnSelectedIndexChanged="DropDownListFiltr_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div style="clear:both"></div>
                    <div style="width: 150px; float:left;">
                        Фактически в отделе
                    </div>
                    <div style="width: 126px; float:left">
                        <asp:CheckBox ID="cbFactOtdelFiltr" runat="server" AutoPostBack="True" />
                    </div>
                    <div style="clear:both"></div>
                </div>
                
                <div id="FormsInputData" style="border: 1px solid #FED17E; background-color: #FEF6E1; padding: 10px 10px 10px 10px; margin: 0px 17px 15px 0px; position: relative;">
                    <div style="float: left; width: 150px">
                        Отдел по штату
                    </div>
                    <div style="float: left; width: 580px;">
                        <asp:DropDownList ID="DropDownListOtdel" runat="server" Width="580px">
                        </asp:DropDownList>
                    </div>
                    <div style="clear: both"></div>
                    <div style="float: left; width: 150px;">
                        Отдел, фактически
                    </div>
                    <div>
                        <asp:DropDownList ID="DropDownListOtdelFact" runat="server" Width="580px">
                        </asp:DropDownList>
                    </div>
                    <div style="clear: both"></div>
                    <div id="leftCol" style="float: left">
                        <div style="float: left; width: 150px;">
                            Фамилия
                        </div>
                        <div style="float: left; width: 250px;">
                            <asp:TextBox ID="TextBoxLast_name" runat="server" Width="236px"></asp:TextBox>
                        </div>
                    </div>
                    <div id="rightCol" style="padding-left: 10px">
                        <div style="width: 150px; float: left">
                            Номер кабинета
                        </div>
                        <div style="width: 200px; float: left">
                            <asp:TextBox ID="TextBoxNumber_cab" runat="server" Width="176px"></asp:TextBox>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                    <div id="leftCol1" style="float: left">
                        <div style="float: left; width: 150px;">
                            Имя
                        </div>
                        <div style="float: left; width: 250px;">

                            <asp:TextBox ID="TextBoxFirst_name" runat="server" Width="236px"></asp:TextBox>
                        </div>
                    </div>
                    <div id="rightCol1" style="padding-left: 10px">
                        <div style="width: 150px; float: left">
                            Номер телефона
                        </div>
                        <div style="width: 200px; float: left">

                            <asp:TextBox ID="TextBoxNumber_phone" runat="server" Width="176px"></asp:TextBox>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                    <div id="leftCol2" style="float: left">
                        <div style="float: left; width: 150px;">
                            Отчество
                        </div>
                        <div style="float: left; width: 250px;">

                            <asp:TextBox ID="TextBoxMiddle_name" runat="server" Width="236px"></asp:TextBox>
                        </div>
                    </div>
                    <div id="rightCol2" style="padding-left: 10px">
                        <div style="width: 150px; float: left">
                            Номер IP телефона
                        </div>
                        <div style="width: 200px; float: left">
                            <asp:TextBox ID="TextBoxNumber_ip_phone" runat="server" Width="176px"></asp:TextBox>

                        </div>
                        <div style="width: 150px; float: left">
                            Номер моб.телефона
                        </div>
                        <div style="width: 200px; float: left">
                            <asp:TextBox ID="TextBoxNumber_mob" runat="server" Width="176px"></asp:TextBox>

                        </div>
                    </div>
                    <div style="clear: both"></div>
                    <div id="leftCol3" style="float: left">
                        <div style="float: left; width: 150px;">
                            Филиал
                        </div>
                        <div style="float: left; width: 250px;">
                            <asp:DropDownList ID="DropDownListFilial" runat="server" Width="230px">
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div id="rightCol3" style="padding-left: 10px">
                        <div style="width: 150px; float: left">
                            E-mail
                        </div>
                        <div style="width: 200px; float: left">

                            <asp:TextBox ID="TextBoxEmail" runat="server" Width="176px"></asp:TextBox>
                        </div>
                        <div style="width: 150px; float: left">
                            Кол-во часов в неделю
                        </div>
                        <div style="width: 200px; float: left">
                            <asp:TextBox ID="TextBoxCountHoursInWeek" runat="server" Width="50px"  alt="40 часов по умолчанию"></asp:TextBox>

                        </div>
                    </div>
                    <div style="clear: both"></div>
                    <div id="leftCol4" style="float: left">
                        <div style="float: left; width: 150px;">
                            Группа в СЭД
                        </div>
                        <div style="float: left; width: 250px;">
                            <asp:DropDownList ID="DropDownListGroupQuery" runat="server" Width="230px">
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div id="rightCol4" style="padding-left: 10px">
                        <div style="width: 150px; float: left">
                            E-mail2
                        </div>
                        <div style="width: 200px; float: left">

                            <asp:TextBox ID="TextBoxEmail2" runat="server" Width="176px" OnTextChanged="TextBoxNumber_ip_phone1_TextChanged"></asp:TextBox>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                    <div id="leftCol5" style="float: left">
                        <div style="float: left; width: 150px;">
                            Должность
                        </div>
                        <div style="float: left; width: 250px;">
                            <asp:DropDownList ID="DropDownListDolgnost" runat="server" Width="230px">
                            </asp:DropDownList>

                        </div>
                    </div>

                    <div id="rightCol6" style="padding-left: 10px">
                        <div style="width: 150px; float: left">
                            Фото
                        </div>
                        <div style="width: 230px; float: left">
                            <asp:FileUpload ID="FileUploadImage" runat="server" Width="176px" />

                        </div>
                        <div>
                            <asp:CheckBox ID="CheckBoxDelPhoto" Text="Удалить фото" Width="100px" runat="server" />
                        </div>
                    </div>

                    <div style="clear: both"></div>
                    <div id="leftCol6" style="float: left">
                        <div style="float: left; width: 150px;">
                            Замещающий сотрудник
                        </div>
                        <div style="float: left; width: 250px;">
                            <asp:DropDownList ID="DropDownListSotrudnikRef" runat="server" Width="230px">
                            </asp:DropDownList>

                        </div>
                    </div>


                    <div id="rightCol5" style="padding-left: 10px">
                        <div style="float: left; width: 150px;">
                            Учетная запись активна
                        </div>
                        <div style="line-height: 30px; float: left;">
                            <asp:CheckBox ID="CheckBoxActive" runat="server" Checked="True" />

                        </div>
                        <div style="width: 150px; float: left;">
                            Показать с справочнике
                        </div>
                        <div style="float: left;">
                            <asp:CheckBox ID="CheckBoxShow_phone" runat="server" Checked="True" />
                        </div>

                    </div>
                    <div style="clear: both"></div>

                    <div id="Div1">
                        <div style="width: 150px; float: left">
                            Статус
                        </div>
                        <div style="width: 250px; float: left;">

                            <asp:DropDownList ID="DropDownListType_tabel" Width="230px" runat="server">
                                <asp:ListItem Text="Работает" Value=" "></asp:ListItem>
                                <asp:ListItem Text="Не трудоспособность" Value="Б "></asp:ListItem>
                                <asp:ListItem Text="Отпуск в связи с родами" Value="ОР"></asp:ListItem>
                                <asp:ListItem Text="Уволен" Value="У"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    
                    <div id="rightCol7">
                        <div style="width: 150px; float: left">
                            Примечание
                        </div>
                        <div style="width: 200px; float: left;">
                            <asp:TextBox ID="TextBoxComments" TextMode="MultiLine" runat="server" Height="50px" Width="188px"></asp:TextBox>
                        </div>
                    </div>
                    
                     <div style="clear:both">
                        <div style="width: 150px; float: left">
                            Табельный номер
                        </div>
                        <div style="width: 250px; float: left;">
                            <asp:TextBox ID="TextBoxTabelNumber" runat="server" Width="150px"></asp:TextBox>
                          
                        </div>
                           <div style="width: 150px; float: left">
                            ФИО для договоров (род. падеж)
                        </div>
                        <div style="width: 220px; float: left;">
                            <asp:TextBox ID="TextBoxFIO_for_doc" runat="server" Width="200px" placeholder="иванова ивана ивановича"></asp:TextBox>
                          
                        </div>
                         <div style="width: 170px; float: left">
                            Доверенность на договор
                        </div>
                         <div style="width: 150px; float: left;">
                            <asp:TextBox ID="TextBoxPower_attorney_doc" runat="server" Width="150px" placeholder="дата и номер доверенности"></asp:TextBox>
                          
                        </div>
                    </div>

                    <div id="leftCol7" style="float: left; width: 400px; clear:both">

                        <div>
                            <asp:Label ID="LabelError" runat="server" Text="Тестовая ошибка" CssClass="textError" Visible="true"></asp:Label>

                        </div>
                    </div>
                    <div style="clear: both"></div>
                    <div id="leftCol8" style="float: left; margin-top: 20px; margin-bottom: 20px">
                        <div style="float: left; width: 91px;">
                            <asp:Button ID="ButtonInsertFilial" runat="server" CssClass="formText" Text="Добавить"
                                OnClick="ButtonInsertFilial_Click1" Style="height: 22px" />
                        </div>
                        <div style="float: left; width: 138px;">
                            <asp:Button ID="ButtonUpdate" runat="server" CssClass="formText" Text="Редактировать"
                                OnClick="ButtonUpdate_Click" />
                        </div>
                        <div style="float: left; width: 150px;">
                            <asp:Button ID="ButtonCancel" runat="server" CssClass="formText" Text="Отменить"
                                OnClick="ButtonCancel_Click" />
                        </div>
                    </div>
                    <div style="clear: both"></div>

                    <div id="dopPannel" style="position:absolute; top:10px; right:10px; width:10px; padding:10px; width:300px; display:block; border: 1px solid #808080; background-color:#FEF6E1;">
                        <ul style="list-style-type:none; padding: 0px 0px 0px 0px; margin:0px;">
                            <li>
                                <div style="float: left; margin-right: 20px;">
                                    <asp:Image ID="ImagePhoto" Width="70" Height="70" runat="server" />
                                </div>
                                <div>
                                    <div>Дата</div>
                                    <div>
                                        <asp:TextBox ID="TextBoxCharacterisrikDate" runat="server" Width="60px"></asp:TextBox>
                                    </div>
                                    <div>
                                        Тип характеристики
                                    </div>
                                    <div>
                                        <asp:DropDownList ID="DropDownListType_promotion" runat="server" Width="180px">
                                            <asp:ListItem Text="Благодарность" Value="Благодарность"></asp:ListItem>
                                            <asp:ListItem Text="Поощрение" Value="Поощрение"></asp:ListItem>
                                            <asp:ListItem Text="Доска почета" Value="Доска почета"></asp:ListItem>
                                            <asp:ListItem Text="Награды" Value="Награды"></asp:ListItem>
                                            <asp:ListItem Text="Взыскание" Value="Взыскание"></asp:ListItem>
                                            <asp:ListItem Text="Другое" Value="Другое"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div style="clear: both"></div>
                            </li>
                        
                        <li>Текст характеристики</li>
                        <li><asp:TextBox ID="TextBoxText_promotion" runat="server" Width="290px" TextMode="MultiLine" Height="50px"></asp:TextBox></li>
                            <li><asp:Button ID="ButtonAdd" runat="server" Text="Добавить" OnClick="ButtonAdd_Click" />
                                
                            </li>
                            <li>
                                <div style="width:290px; height:100px; overflow:auto;">
                                <asp:GridView ID="GridViewSotrudnik_promotion" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="id" Width="290px" OnRowDeleting="GridViewSotrudnik_promotion_RowDeleting" OnRowCancelingEdit="GridViewSotrudnik_promotion_RowCancelingEdit" OnRowEditing="GridViewSotrudnik_promotion_RowEditing1" OnRowUpdating="GridViewSotrudnik_promotion_RowUpdating" OnRowDataBound="GridViewSotrudnik_promotion_RowDataBound">

                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <div style="width: 55px">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                        Text="Правка"></asp:LinkButton><br />
                                                    <asp:LinkButton ID="LinkButtonItemDelete" runat="server" CommandArgument='<%# Bind("id") %>'
                                                        OnClientClick="return confirm('Удалить запись?');" CausesValidation="False" CommandName="Delete"
                                                        Text="Удалить"></asp:LinkButton>
                                                </div>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update"
                                                    Text="Обновить"></asp:LinkButton><br />
                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    Text="Отмена"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />

                                        <asp:TemplateField HeaderText="Дата" SortExpression="date_promotion">
                                            <EditItemTemplate>

                                               <asp:TextBox ID="TextBoxEditDate_promotion" runat="server" Width="65px" Text='<%# Bind("date_promotion") %>'></asp:TextBox>

                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="LabelItemDate_promotion" runat="server" Width="65px" Text='<%# Bind("date_promotion") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="65px" />
                                        </asp:TemplateField>

                                     
                                        <asp:TemplateField HeaderText="Тип" SortExpression="type_promotion">
                                            <EditItemTemplate>
                                                
                                                <asp:DropDownList ID="DropDownListEditType_promotion" runat="server" Width="120px" SelectedValue='<%# Bind("type_promotion") %>'>
                                                    <asp:ListItem Text="Благодарность" Value="Благодарность"></asp:ListItem>
                                                    <asp:ListItem Text="Поощрение" Value="Поощрение"></asp:ListItem>
                                                    <asp:ListItem Text="Доска почета" Value="Доска почета"></asp:ListItem>
                                                    <asp:ListItem Text="Награды" Value="Награды"></asp:ListItem>
                                                    <asp:ListItem Text="Взыскание" Value="Взыскание"></asp:ListItem>
                                                    <asp:ListItem Text="Другое" Value="Другое"></asp:ListItem>
                                                </asp:DropDownList>

                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="LabelItemType_promotion" runat="server" Text='<%# Bind("type_promotion") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="120px" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Текст" SortExpression="text_promotion">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBoxEditText_promotion" runat="server" Text='<%# Bind("text_promotion") %>' TextMode="MultiLine" Width="100px" Height="50px"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="LabelItemText_promotion" runat="server" Text='<%# Bind("text_promotion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="items" HeaderText="items" SortExpression="items" Visible="False" />
                                        <asp:BoundField DataField="id_sotrudnik" HeaderText="id_sotrudnik" SortExpression="id_sotrudnik" Visible="False" />
                                    </Columns>
                                </asp:GridView></div>
                            </li>
                        </ul>
                    </div>

                </div>
                <div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
					DataKeyNames="id_sotrudnik" DataSourceID="SqlDataSourceSotrudnikForOtdelMask" ForeColor="#333333"
					AllowPaging="True" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound"
					OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging"
					PageSize="50" BorderStyle="Dotted" Width="100%" onrowupdating="GridView1_RowUpdating">
					<Columns>
						<asp:TemplateField ShowHeader="False">
							<ItemTemplate>
								<table cellpadding="3" cellspacing="0" border="0">
									<tr>
										<td>
											<asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Select"
												ImageUrl="~/images/22х22/pencil.png" AlternateText="Редактировать" />
										</td>
										<td width="1px">
										</td>
										<td>
											<asp:ImageButton ID="ImageButton2" OnClientClick="return confirm('Удалить документ?');"
												runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/images/22х22/editdelete.png"
												AlternateText="Удалить" />
										</td>
									</tr>
								</table>
                                
							</ItemTemplate>
                            <ItemStyle Width="80px" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="ID" InsertVisible="True" SortExpression="id_sotrudnik"
							Visible="True">
							<EditItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# Eval("id_sotrudnik") %>'></asp:Label>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelItemId_sotrudnik" runat="server" Text='<%# Bind("id_sotrudnik") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="id_otdel" SortExpression="id_otdel" Visible="False">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("id_otdel") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelItemId_otdel" runat="server" Text='<%# Bind("id_otdel") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="ID_OTDEL_FACT" SortExpression="ID_OTDEL_FACT" Visible="False">
							<ItemTemplate>
								<asp:Label ID="LabelItemId_otdel_fact" runat="server" Text='<%# Bind("ID_OTDEL_FACT") %>'></asp:Label>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("ID_OTDEL_FACT") %>'></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="id_dolgnost" SortExpression="id_dolgnost" Visible="False">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("id_dolgnost") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelItemId_dolgnost" runat="server" Text='<%# Bind("id_dolgnost") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="id_filial" SortExpression="id_filial" Visible="False">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("id_filial") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelItemId_filial" runat="server" Text='<%# Bind("id_filial") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Отдел" SortExpression="NAME_OTDEL">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox1" Visible="false" runat="server" Text='<%# Bind("name_otdel") %>'></asp:TextBox>
								<asp:DropDownList ID="DropDownListEditOtdel" runat="server">
								</asp:DropDownList>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelItemOtdel" runat="server" Text='<%# Bind("name_otdel") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="135px" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Отдел (факт)" SortExpression="NAME_OTDEL_FACT">
							<ItemTemplate>
								<asp:Label ID="LabelItemOtdelFact" runat="server" Text='<%# Bind("NAME_OTDEL_FACT") %>'></asp:Label>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("NAME_OTDEL_FACT") %>'></asp:TextBox>
							</EditItemTemplate>
                            <ItemStyle Width="135px" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Филиал" SortExpression="name_filial">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name_filial") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelItemFilial" runat="server" Text='<%# Bind("name_filial") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="75px" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Должность" SortExpression="name_dolgnost">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("name_dolgnost") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelItemDolgnost" runat="server" Text='<%# Bind("name_dolgnost") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="75px" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Фамилия" SortExpression="last_name">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("last_name") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelItemLast_name" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="60px" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Имя" SortExpression="first_name">
							<EditItemTemplate>
								<asp:TextBox ID="TextBoxFirst_name" runat="server" Text='<%# Bind("first_name") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelItemFirst_name" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="65px" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Отчество" SortExpression="middle_name">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("middle_name") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="LabelItemMiddle_name" runat="server" Text='<%# Bind("middle_name") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="80px" />
						</asp:TemplateField>
						<asp:TemplateField HeaderText="№ каб." SortExpression="number_cab">
							<ItemTemplate>
								<asp:Label ID="LabelItemNumber_cab" runat="server" Text='<%# Bind("number_cab") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="50px" />
							<EditItemTemplate>
								<asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("number_cab") %>'></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="№ тел." SortExpression="number_phone">
							<ItemTemplate>
								<asp:Label ID="LabelItemNumber_phone" runat="server" Text='<%# Bind("number_phone") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="50px" />
							<EditItemTemplate>
								<asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("number_phone") %>'></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateField>
                        <asp:TemplateField HeaderText="№ моб.тел" SortExpression="number_mob">
							<ItemTemplate>
								<asp:Label ID="LabelItemNumber_mob" runat="server" Text='<%# Bind("number_mob") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="50px" />
							<EditItemTemplate>
								<asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("number_mob") %>'></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="№ ip тел." SortExpression="number_ip_phone">
							<ItemTemplate>
								<asp:Label ID="LabelItemNumber_ip_phone" runat="server" Text='<%# Bind("number_ip_phone") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="50px" />
							<EditItemTemplate>
								<asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("number_ip_phone") %>'></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="E-mail" SortExpression="email">
							<ItemTemplate>
								<asp:Label ID="LabelItemEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="70px" />
							<EditItemTemplate>
								<asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="E-mail2" SortExpression="email2">
							<ItemTemplate>
								<asp:Label ID="LabelItemEmail2" runat="server" Text='<%# Bind("email2") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="70px" />
							<EditItemTemplate>
								<asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("email2") %>'></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateField>
                        <asp:TemplateField HeaderText="Кол-во часов в неделю" SortExpression="count_hours_in_week ">
							<ItemTemplate>
								<asp:Label ID="LabelItemСount_hours_in_week" runat="server" Text='<%# Bind("count_hours_in_week") %>'></asp:Label>
							</ItemTemplate>
                            <ItemStyle Width="70px" />
							<EditItemTemplate>
								<asp:TextBox ID="TextBoxEditCount_hours_in_week" runat="server" Text='<%# Bind("count_hours_in_week") %>'></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateField>
					    <asp:TemplateField HeaderText="Группа" SortExpression="nameGroupQuery">
                            <ItemTemplate>
                                
                                <asp:Label ID="LabelItemNameGroupQuery" runat="server" 
                                    Text='<%# Bind("nameGroupQuery") %>'></asp:Label>
                                <asp:Label ID="LabelItemId_groupQuery" runat="server"  Visible=false
                                    Text='<%# Bind("id_groupQuery") %>'></asp:Label>
                                    
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                            <EditItemTemplate>
                                
                                <asp:TextBox ID="TextBoxNameGroupQuery" runat="server" 
                                    Text='<%# Bind("nameGroupQuery") %>'></asp:TextBox>

                                <asp:DropDownList ID="DropDownListNameGroupQuery" SelectedValue='<%# Bind("id_groupQuery") %>' runat=server CssClass="textGridView3">
                                                        
                                                     </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
						<asp:TemplateField HeaderText="id_sotrudnik_ref" 
                            SortExpression="id_sotrudnik_ref" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="LabelItemId_sotrudnik_ref" runat="server" Text='<%# Bind("id_sotrudnik_ref") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox17" runat="server" 
                                    Text='<%# Bind("id_sotrudnik_ref") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Замещение" 
                            SortExpression="FULL_NAME_REF" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="LabelItemFULL_NAME_REF" runat="server" Text='<%# Bind("FULL_NAME_REF") %>'></asp:Label>
                            </ItemTemplate>
                           <ItemStyle Width="77px" />
                        </asp:TemplateField>
                       
                        
						<asp:TemplateField HeaderText="Примечание" SortExpression="comments1">
							<ItemTemplate>
								<asp:Label ID="LabelItemComments" runat="server" Text='<%# Bind("comments1") %>'></asp:Label>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="TextBoxComments" TextMode=MultiLine runat="server" Text='<%# Bind("comments1") %>'></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateField>

                        <asp:TemplateField HeaderText="active" SortExpression="active">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxItemActive" runat="server" 
                                    Checked='<%# Bind("active") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("active") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Width="40px" />
                        </asp:TemplateField>

                          <asp:TemplateField HeaderText="Справочник" SortExpression="show_phone">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBoxItemShow_phone" runat="server" 
                                    Checked='<%# Bind("show_phone") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                               
                            </EditItemTemplate>
                            <ItemStyle Width="40px" />
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Табель" SortExpression="type_tabel">
                            <ItemTemplate>
                                <asp:Label ID="LabelItemtype_tabel" runat="server" Text='<%# Bind("type_tabel") %>'></asp:Label><br />
                                <asp:Label ID="LabelItemTabel_number" runat="server" Text='<%# Bind("tabel_number") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxEditType_tabel" runat="server" Text='<%# Bind("type_tabel") %>'></asp:TextBox><br />
                                <asp:TextBox ID="TextBoxEditTabel_number" runat="server" Text='<%# Bind("tabel_number") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Width="40px" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ФИО дог." SortExpression="FIO_for_doc">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("FIO_for_doc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelItemFIO_for_doc" runat="server" Text='<%# Bind("FIO_for_doc") %>'></asp:Label><br />
                                <asp:Label ID="LabelItemPower_attorney_doc" runat="server" Text='<%# Bind("power_attorney_doc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Фото">
                            <ItemTemplate>
                                <asp:Label ID="LabelItemItems" Visible="false" runat="server" Text='<%# Bind("items") %>'></asp:Label>
                                <asp:Image ID="ImageCatalog" ImageUrl="~/photoDB.ashx?" Height="50px" runat="server" />
                            </ItemTemplate>
                            <ItemStyle Width="70px" />
                        </asp:TemplateField>

					    
                        
					</Columns>
				</asp:GridView>
                    </div>
            </div>


        </div>

    </div>



	
				
			
			
<asp:SqlDataSource ID="SqlDataSourceFilial" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
		InsertCommand="OtdelInsert" InsertCommandType="StoredProcedure" SelectCommand="FilialSelect"
		SelectCommandType="StoredProcedure" DeleteCommand="FilialDelete" DeleteCommandType="StoredProcedure"
		UpdateCommand="FilialUpdate" UpdateCommandType="StoredProcedure">
		<InsertParameters>
			<asp:Parameter Name="name_otdel" Type="String" />
			<asp:Parameter Name="count_otdel_fakt" Type="Int32" />
			<asp:Parameter Name="count_otdel_real" Type="Int32" />
		</InsertParameters>
		<DeleteParameters>
			<asp:Parameter Name="id_filial" Type="Int32" />
			<asp:Parameter Name="id_email" Type="Int32" />
			<asp:Parameter Name="id_phone" Type="Int32" />
			<asp:Parameter Name="id_ip_phone" Type="Int32" />
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
			<asp:Parameter Name="ip_address_vpn" Type="String" />
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
			<asp:Parameter Name="type_router" Type="String" />
			<asp:Parameter Name="ip_lan" Type="String" />
			<asp:Parameter Name="ip_lan_mask" Type="String" />
			<asp:Parameter Name="ip_lan_router" Type="String" />
			<asp:Parameter Name="ip_address_vpn_mask" Type="String" />
		</UpdateParameters>
	</asp:SqlDataSource>
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
	<asp:SqlDataSource ID="SqlDataSourceSotrudnikForOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
		DeleteCommand="SotrudnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SotrudnikInsert"
		InsertCommandType="StoredProcedure" SelectCommand="SotrudnikSelectForOtdel" SelectCommandType="StoredProcedure"
		UpdateCommand="SotrudnikUpdate" UpdateCommandType="StoredProcedure">
		<SelectParameters>
			<asp:ControlParameter ControlID="DropDownListFiltr" Name="ID_OTDEL" PropertyName="SelectedValue"
				Type="Int32" />
			<asp:ControlParameter ControlID="cbFactOtdelFiltr" DefaultValue="" Name="FACT" PropertyName="Checked"
				Type="Boolean" />
			<asp:Parameter DefaultValue="true" Name="SHOW_INACTIVE" Type="Boolean" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="id_sotrudnik" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="id_sotrudnik" Type="Int32" />
			<asp:Parameter Name="id_otdel" Type="Int32" />
			<asp:Parameter Name="id_otdel_fact" Type="Int32" />
			<asp:Parameter Name="id_dolgnost" Type="Int32" />
			<asp:Parameter Name="id_filial" Type="Int32" />
			<asp:Parameter Name="first_name" Type="String" />
			<asp:Parameter Name="last_name" Type="String" />
			<asp:Parameter Name="middle_name" Type="String" />
			<asp:Parameter Name="number_cab" Type="String" />
			<asp:Parameter Name="number_phone" Type="String" />
			<asp:Parameter Name="number_ip_phone" Type="Int32" />
			<asp:Parameter Name="email" Type="String" />
			<asp:Parameter Name="email2" Type="String" />
			<asp:Parameter Name="active" Type="Boolean" />
		    <asp:Parameter Name="initSed" Type="Boolean" />
		    <asp:Parameter Name="id_groupQuery" Type="Int32" />
		    <asp:Parameter Name="id_sotrudnik_ref" Type="Int32" />
            <asp:Parameter Name="items" Type="String" />
            <asp:Parameter Name="comments" Type="String" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="id_otdel" Type="Int32" />
			<asp:Parameter Name="id_otdel_fact" Type="Int32" />
			<asp:Parameter Name="id_dolgnost" Type="Int32" />
			<asp:Parameter Name="id_filial" Type="Int32" />
			<asp:Parameter Name="first_name" Type="String" />
			<asp:Parameter Name="last_name" Type="String" />
			<asp:Parameter Name="middle_name" Type="String" />
			<asp:Parameter Name="number_cab" Type="String" />
			<asp:Parameter Name="number_phone" Type="String" />
			<asp:Parameter Name="number_ip_phone" Type="Int32" />
			<asp:Parameter Name="email" Type="String" />
			<asp:Parameter Name="email2" Type="String" />
			<asp:Parameter Name="active" Type="Boolean" />
		    <asp:Parameter Name="initSed" Type="Boolean" />
		    <asp:Parameter Name="id_groupQuery" Type="Int32" />
		    <asp:Parameter Name="id_sotrudnik_ref" Type="Int32" />
            <asp:Parameter Name="items" Type="String" />
            <asp:Parameter Name="comments" Type="String" />
		</InsertParameters>
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="SqlDataSourceSotrudnik" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                    SelectCommand="SotrudnikSelect" SelectCommandType="StoredProcedure">
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="SqlDataSourceSotrudnikGroup" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                                    DeleteCommand="SotrudnikGroupDelete" DeleteCommandType="StoredProcedure" 
                                    InsertCommand="SotrudnikGroupInsert" InsertCommandType="StoredProcedure" 
                                    SelectCommand="SotrudnikGroupSelect" SelectCommandType="StoredProcedure" 
                                    UpdateCommand="SotrudnikGroupUpdate" 
                    UpdateCommandType="StoredProcedure">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id_groupQuery" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="nameGroupQuery" Type="String" />
                                        <asp:Parameter Name="comments" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="id_groupQuery" Type="Int32" />
                                        <asp:Parameter Name="nameGroupQuery" Type="String" />
                                        <asp:Parameter Name="comments" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
	<asp:SqlDataSource ID="SqlDataSourceSotrudnikForOtdelMask" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
		DeleteCommand="SotrudnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SotrudnikInsert"
		InsertCommandType="StoredProcedure" SelectCommand="SotrudnikSelectForOtdelMask" SelectCommandType="StoredProcedure"
		UpdateCommand="SotrudnikUpdate" UpdateCommandType="StoredProcedure">
		<SelectParameters>
			<asp:ControlParameter ControlID="DropDownListFiltr" Name="ID_OTDEL" PropertyName="SelectedValue"
				Type="Int32" />
			<asp:ControlParameter ControlID="cbFactOtdelFiltr" DefaultValue="" Name="FACT" PropertyName="Checked"
				Type="Boolean" />
			<asp:Parameter DefaultValue="true" Name="SHOW_INACTIVE" Type="Boolean" />
		    <asp:ControlParameter ControlID="TextBoxFind" DefaultValue="-1" Name="mask" 
                PropertyName="Text" Type="String" />
		</SelectParameters>
		<DeleteParameters>
			<asp:Parameter Name="id_sotrudnik" Type="Int32" />
		</DeleteParameters>
		<UpdateParameters>
			<asp:Parameter Name="id_sotrudnik" Type="Int32" />
			<asp:Parameter Name="id_otdel" Type="Int32" />
			<asp:Parameter Name="id_otdel_fact" Type="Int32" />
			<asp:Parameter Name="id_dolgnost" Type="Int32" />
			<asp:Parameter Name="id_filial" Type="Int32" />
			<asp:Parameter Name="first_name" Type="String" />
			<asp:Parameter Name="last_name" Type="String" />
			<asp:Parameter Name="middle_name" Type="String" />
			<asp:Parameter Name="number_cab" Type="String" />
			<asp:Parameter Name="number_phone" Type="String" />
			<asp:Parameter Name="number_ip_phone" Type="Int32" />
			<asp:Parameter Name="email" Type="String" />
			<asp:Parameter Name="email2" Type="String" />
			<asp:Parameter Name="active" Type="Boolean" />
		    <asp:Parameter Name="initSed" Type="Boolean" />
		    <asp:Parameter Name="id_groupQuery" Type="Int32" />
		    <asp:Parameter Name="id_sotrudnik_ref" Type="Int32" />
            <asp:Parameter Name="items" Type="String" />
            <asp:Parameter Name="comments" Type="String" />
		    <asp:Parameter Name="number_mob" Type="String" />
		</UpdateParameters>
		<InsertParameters>
			<asp:Parameter Name="id_otdel" Type="Int32" />
			<asp:Parameter Name="id_otdel_fact" Type="Int32" />
			<asp:Parameter Name="id_dolgnost" Type="Int32" />
			<asp:Parameter Name="id_filial" Type="Int32" />
			<asp:Parameter Name="first_name" Type="String" />
			<asp:Parameter Name="last_name" Type="String" />
			<asp:Parameter Name="middle_name" Type="String" />
			<asp:Parameter Name="number_cab" Type="String" />
			<asp:Parameter Name="number_phone" Type="String" />
			<asp:Parameter Name="number_ip_phone" Type="Int32" />
			<asp:Parameter Name="email" Type="String" />
			<asp:Parameter Name="email2" Type="String" />
			<asp:Parameter Name="active" Type="Boolean" />
		    <asp:Parameter Name="initSed" Type="Boolean" />
		    <asp:Parameter Name="id_groupQuery" Type="Int32" />
		    <asp:Parameter Name="id_sotrudnik_ref" Type="Int32" />
            <asp:Parameter Name="items" Type="String" />
            <asp:Parameter Name="comments" Type="String" />
		    <asp:Parameter Name="number_mob" Type="String" />
            <asp:Parameter Name="type_tabel" Type="String" />
            <asp:Parameter Name="show_phone" Type="Boolean" />
		</InsertParameters>
	</asp:SqlDataSource>

	    <asp:SqlDataSource ID="SqlDataSourceSotrudnik_promotion" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" DeleteCommand="DELETE FROM Sotrudnik_promotion WHERE (id = @id)" InsertCommand="INSERT INTO Sotrudnik_promotion(date_promotion, type_promotion, text_promotion, items, id_sotrudnik) VALUES (@date_promotion, @type_promotion, @text_promotion, @items, @id_sotrudnik)" SelectCommand="SELECT id, date_promotion, type_promotion, text_promotion, items, id_sotrudnik FROM Sotrudnik_promotion WHERE (id_sotrudnik = @id_sotrudnik)" UpdateCommand="UPDATE Sotrudnik_promotion SET date_promotion = @date_promotion, type_promotion = @type_promotion, text_promotion = @text_promotion, items = @items, id_sotrudnik = @id_sotrudnik WHERE (id = @id)" OnInserting="SqlDataSourceSotrudnik_promotion_Inserting">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="date_promotion" />
                <asp:Parameter Name="type_promotion" />
                <asp:Parameter Name="text_promotion" />
                <asp:Parameter Name="items" />
                <asp:Parameter Name="id_sotrudnik" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="id_sotrudnik" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="date_promotion" />
                <asp:Parameter Name="type_promotion" />
                <asp:Parameter Name="text_promotion" />
                <asp:Parameter Name="items" />
                <asp:Parameter Name="id_sotrudnik" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>

	</form>
</body>
</html>
