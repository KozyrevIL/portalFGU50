<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_docs_new2.aspx.cs"
	StylesheetTheme="gridview" Inherits="Admin_admin_sotrudnik" %>

<%@ Register Src="~/UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>
<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<%@ Register assembly="System.Web.DataVisualization" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Документооборот</title>
	 
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" href="../jQuery/css/start/jquery-ui-1.8.16.custom.css">
	<script src="../jQuery/jquery-1.6.2.min.js"></script>
	<script src="../jQuery/ui/minified/jquery.ui.core.min.js"></script>
	<script src="../jQuery/ui/minified/jquery.ui.widget.min.js"></script>
	<script src="../jQuery/ui/minified/jquery.ui.datepicker.min.js"></script>
	<script src="../jQuery/ui/i18n/jquery.ui.datepicker-ru-utf8.js"></script>

	<script language="javascript" type="text/javascript">
	    $(function () {
	        
	        $("#TextBoxDate").datepicker();
	        $("#TextBoxBeginDate").datepicker();
	        $("#TextBoxEndDate").datepicker();
	    });
	</script>
   


	</head>
<body topmargin="0" leftmargin="0">

    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
    <div id="page">

       <uc2:admin_banner ID="Admin_banner1" header="Документооборот" runat="server" />
        <div id="menuFiltr" class="formText">
            <div style="margin: 10px">
                <div id="border_type6">
                    <div class="formText4">
                        <div style="float: left;">
                            Выбор по дате</div>
                        <div style="float: left; margin-left: 15px;">
                            Начало периода</div>
                        <div style="float: left; margin-left: 10px;">
                            <asp:TextBox ID="TextBoxBeginDate" runat="server" Width="50px" CssClass="textGridView3"></asp:TextBox></div>
                        <div style="float: left; margin-left: 10px;">
                            Конец периода</div>
                        <div style="float: left; margin-left: 10px;">
                            <asp:TextBox ID="TextBoxEndDate" runat="server" Width="50px" CssClass="textGridView3"></asp:TextBox></div>
                        <div style="float: left; margin-left: 10px;">
                            <asp:DropDownList ID="FiltrDD" runat="server" CssClass="textGridView3" 
                                onselectedindexchanged="FiltrDD_SelectedIndexChanged">
                                <asp:ListItem Value="без фильтра">без фильтра</asp:ListItem>
                                <asp:ListItem Value="Неисполненные">Неисполненные</asp:ListItem>
                                <asp:ListItem Value="Автор">Автор</asp:ListItem>
                                <asp:ListItem Value="Исполнитель">Исполнитель</asp:ListItem>
                                <asp:ListItem Value="Адресат">Адресат</asp:ListItem>
                                <asp:ListItem Value="Исполненные с просроком">Исполненные с просроком</asp:ListItem>
                                <asp:ListItem Value="Примечание">Примечание</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div style="float: left; margin-left: 10px; height: 20px;">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Выбор" CssClass="textGridView3" /></div>
                        <div style="float: left; margin-left: 10px;">
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Весь диапазон"
                                CssClass="textGridView3" /></div>
                        <div style="clear: both">
                        </div>
                        <div id="search_for_mask">
                            <div style="float: left;">
                                Поиск по маске</div>
                            <div style="float: left; margin-left: 10px;">
                                <asp:TextBox ID="TextBoxFind" runat="server" Width="200px" CssClass="textGridView3"></asp:TextBox>
                            </div>
                            <div style="float: left;">
                                <asp:Button ID="ButtonFind" runat="server" Text="Поиск" CausesValidation="false"
                                    OnClick="ButtonFind_Click" CssClass="textGridView3" />
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin: 10px">
            <div id="input_border" class="formText">
                <div id="row1" style="margin: 10px">
                    <div style="width: 134px; float: left;">
                        Рег. №
                        <asp:TextBox ID="TextBoxNumber_in_doc" runat="server" Width="73px" Enabled="true"></asp:TextBox>
                    </div>
                    <div style="padding-left: 10px; float: left;">
                        Дата регистрации
                        <asp:TextBox ID="TextBoxDateReg" runat="server" Width="73px" Enabled="true"></asp:TextBox>
                    </div>
                </div>
                <div style="clear: both">
                </div>
                <div id="row2" style="width: 913px; vertical-align: middle; position: relative; margin-bottom: 10px;
                    top: 0px; left: 0px;">
                    <div style="width: 50px; display: inline;">
                        <div style="float: left">
                            Краткое содержание</div>
                        <div style="padding-left: 10px; float: left">
                            <asp:TextBox ID="TextBoxTema" runat="server" TextMode="MultiLine" Height="50px" Width="650px"></asp:TextBox>
                        </div>
                        <div style="display: inline; padding-left: 10px; float: left">
                            Оператор<br />
                            <asp:Label ID="LabelUserAdd_doc" runat="server" CssClass="button"></asp:Label>
                        </div>
                    </div>
                </div>
                <div style="clear: both">
                </div>
                <div id="Group1" style="float: left">
                    <div>
                        Выбрать отдел
                    </div>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownListOtdel2" runat="server" Width="350px" DataTextField="name_otdel"
                                    DataValueField="id_otdel" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div id="Group2" style="float: left;">
                    <div>
                        Группа
                    </div>
                    <div style="float: left;">
                        <asp:DropDownList ID="DropDownListGroupQuery" runat="server" Width="100px" OnSelectedIndexChanged="DropDownListGroupQuery_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                    <div style="float: left;">
                        <asp:Button ID="ButtonGroup" runat="server" Text="..." OnClick="ButtonGroup_Click" /></div>
                </div>
                <div id="Group3" style="float: left;">
                    <div>
                        Выбрать отдел
                    </div>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownListOtdel1" runat="server" Width="400px" DataTextField="name_otdel"
                                    DataValueField="id_otdel" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div style="clear: both">
                </div>
                <div id="Row4">
                    <div>
                        <div id="Avtor" style="width: 235px; float: left;">
                            <div style="width: 90px;">
                                Автор
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div style="width: 230px;">
                                        <asp:DropDownList ID="DropDownListUser_control" runat="server" Width="230px" DataSourceID="SqlDataSourceForOtdel2"
                                            DataTextField="full_name" DataValueField="id_sotrudnik">
                                        </asp:DropDownList>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div id="Div1" style="width: 255px; float: left; padding-left: 10px;">
                            <div>
                                Исполнитель</div>
                            <div>
                                <asp:DropDownList ID="DropDownListExecutive" runat="server" Width="250px">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div id="Adresat" style="width: 235px; float: left; margin-left: 15px">
                            <div style="width: 93px;">
                                Адресат</div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div style="width: 230px;">
                                        <asp:DropDownList ID="DropDownListUser_work" runat="server" Width="230px" DataSourceID="SqlDataSourceForOtdel"
                                            DataTextField="FULL_NAME" DataValueField="ID_SOTRUDNIK" OnSelectedIndexChanged="DropDownListUser_work_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div style="clear: both">
                        </div>
                        <div id="Row5" style="margin-top: 10px">
                            <div style="float: left; width: 131px;">
                                Срок исполнения</div>
                            <div style="float: left; width: 85px;">
                                <asp:TextBox ID="TextBoxDate_control" runat="server" Width="73px" Enabled="true"></asp:TextBox>
                            </div>
                            <div style="float: left; width: 56px; height: 12px;">
                                Время
                            </div>
                            <div style="float: left; width: 50px;">
                                <asp:DropDownList ID="DropDownListHours" runat="server" Width="40px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div style="float: left; width: 192px;">
                                <asp:DropDownList ID="DropDownListMinutes" runat="server" Width="40px">
                                    <asp:ListItem>00</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>35</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>45</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>55</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div style="float: left; width: 100px;">
                                Добавить файл</div>
                            <div style="float: left; width: 100px;">
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </div>
                            <div>
                                <div class="textError">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Разрешены форматы: jpg, gif, png, doc, docx, xls, xlsx, rar, zip, pdf"
                                        ValidationExpression=".*((\.jpg)|(\.JPG)|(\.jpeg)|(\.JPEG)|(\.bmp)|(\.gif)|(\.GIF)|(\.png)|(\.PNG)|(\.doc)|(\.docx)|(\.DOC)|(\.DOCX)|(\.rar)|(\.RAR)|(\.zip)|(\.ZIP)|(\.xls)|(\.XLS)|(\.xlsx)|(\.XLSX)|(\.pdf)|(\.PDF)|(\.txt)|(\.TXT))"
                                        ControlToValidate="FileUpload2"></asp:RegularExpressionValidator></div>
                                <div style="clear: both">
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="ButtonInsertDoc" runat="server" CssClass="formText" Text="Добавить "
                        OnClick="ButtonInsertDoc_Click" />
                    <asp:Label ID="LabelError" runat="server" CssClass="textError" Visible="False"></asp:Label>
                </div>
            </div>
        </div>
        <div style="margin: 10px">
            <asp:GridView ID="GridView1" runat="server"  SkinID=middle_no_alter
                onrowdatabound="GridView1_RowDataBound1" 
                DataKeyNames="id_doc,id_docs_sotrudnik" 
                onrowcancelingedit="GridView1_RowCancelingEdit" 
                onrowcommand="GridView1_RowCommand" onrowdeleting="GridView1_RowDeleting" 
                onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <div style="width: 55px">
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Правка"></asp:LinkButton><br />
                                <asp:LinkButton ID="LinkButtonItemDelete" runat="server" CommandArgument='<%# Bind("items") %>'
                                    OnClientClick="return confirm('Удалить запись?');" CausesValidation="False" CommandName="Delete"
                                    Text="Удалить"></asp:LinkButton>
                            </div>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                Text="Обновить"></asp:LinkButton><br />
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="Отмена"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_doc" HeaderText="id_doc" InsertVisible="False" ReadOnly="True"
                        SortExpression="id_doc" Visible="False" />
                    <asp:TemplateField HeaderText="Рег. №" SortExpression="number_in_doc">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxEditNumber_in_doc" CssClass="textGridView3" Enabled="true"
                                Width="50px" runat="server" Text='<%# Bind("number_in_doc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelItemNumber_in_doc" Width="50px" runat="server" Text='<%# Bind("number_in_doc") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Дата рег." SortExpression="date_reg">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxEditDate_reg" Width="50px" CssClass="textGridView3" runat="server"
                                Enabled="false" Text='<%# Bind("date_reg") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" Width="50px" runat="server" Text='<%# Bind("date_reg") %>'></asp:Label><br />
                            <asp:Label ID="Label10" Width="50px" runat="server" Text='<%# Bind("time_reg") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="55px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Стат." SortExpression="status_doc">
                        <ItemTemplate>
                            <asp:Label ID="LabelItemStatus_doc" CssClass="textGridView3" Width="70px" runat="server"
                                Text='<%# Bind("status_doc") %>' Visible="false"></asp:Label>
                            <asp:Label ID="LabelItemDate_ready" CssClass="textGridView3" Width="70px" runat="server"
                                Text='<%# Bind("date_ready") %>' Visible="false"></asp:Label>
                            <asp:Label ID="LabelItemStatus_under_type" CssClass="textGridView3" runat="server"
                                Text='<%# Bind("status_under_type") %>' Visible="false"></asp:Label>
                            <asp:Image ID="ImageItemStatus" runat="server" ImageUrl="~/images/16х16/ball_blue.gif" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="LabelEditStatus_doc" Visible="false" runat="server" Text='<%# Bind("status_doc") %>'></asp:Label>
                            <asp:CheckBox ID="CheckBoxStatus_doc" Text="Исполнено" Width="70px" runat="server"
                                OnCheckedChanged="CheckBoxStatus_doc_CheckedChanged" Visible="false" />
                            <asp:TextBox ID="TextBoxEditDate_ready" CssClass="textGridView3" Width="70px" runat="server"
                                Text='<%# Bind("date_ready") %>'></asp:TextBox>
                            <asp:DropDownList ID="DropDownListEditStatus_under_type" SelectedValue='<%# Bind("status_under_type") %>'
                                runat="server" CssClass="textGridView3">
                                <asp:ListItem Text="В работу" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Прочитано" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Исполненно" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="LabelItemId_docs_sotrudnik" CssClass="textGridView3" Width="70px"
                                runat="server" Text='<%# Bind("id_docs_sotrudnik") %>' Visible="false"></asp:Label>
                        </EditItemTemplate>
                        <ItemStyle Width="10px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Краткое содержание" SortExpression="tema">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxEditTema" CssClass="textGridView3" Width="100%" TextMode="MultiLine"
                                runat="server" Text='<%# Bind("tema") %>'></asp:TextBox>
                            
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelItemItems" Width="1px" runat="server" Text='<%# Bind("items") %>'
                                Visible="false"></asp:Label>
                            <asp:Label ID="LabelItemTema" TextMode="MultiLine" runat="server" Text='<%# Bind("tema") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Автор" SortExpression="full_name_control">
                        <ItemTemplate>
                            <asp:Label ID="LabelItemFull_name_control" Width="94px" runat="server" Text='<%# Bind("full_name_control") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="LabelEditId_sotrudnik_control" runat="server" Text='<%# Bind("id_sotrudnik_control") %>'
                                Enabled="false" Visible="false"></asp:Label>
                            <asp:DropDownList ID="DropDownListFull_name_control" CssClass="textGridView3" runat="server"
                                Width="100px">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Отдел отправителя" SortExpression="name_otdel_control">
                        <ItemTemplate>
                            <asp:Label ID="LabelItemName_otdel_control" Width="94px" runat="server" Text='<%# Bind("name_otdel_control") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Исполнитель" SortExpression="full_name_executive">
                        <EditItemTemplate>
                            <asp:Label ID="LabelEditId_sotrudnik_executive" runat="server" Text='<%# Bind("id_sotrudnik_executive") %>'
                                Enabled="false" Visible="false"></asp:Label>
                            <asp:DropDownList ID="DropDownListFull_name_executive" CssClass="textGridView3" runat="server"
                                Width="100px">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelItemFull_name_executive" Width="94px" runat="server" Text='<%# Bind("full_name_executive") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Срок исп." SortExpression="date_control">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxEditDate_control" Width="50px" CssClass="textGridView3" runat="server"
                                Enabled="true" Text='<%# Bind("date_control") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelItemDate_control" Width="50px" runat="server" Text='<%# Bind("date_control") %>'></asp:Label><br />
                            <asp:Label ID="LabelItemTime_control" Width="50px" runat="server" Text='<%# Bind("time_control") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Адресат" SortExpression="full_name">
                        <EditItemTemplate>
                            <asp:Label ID="LabelEditId_sotrudnik" runat="server" Text='<%# Bind("id_sotrudnik") %>'
                                Enabled="false" Visible="false"></asp:Label>
                            <asp:DropDownList ID="DropDownListEditFull_name" CssClass="textGridView3" runat="server"
                                Width="100px">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" Width="94px" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Отдел адресата" SortExpression="name_otdel">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" Width="105px" CssClass="textGridView3" runat="server" Text='<%# Eval("name_otdel") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" Width="105px" runat="server" Text='<%# Bind("name_otdel") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="kad_number_addresat" HeaderText="№" SortExpression="kad_number_addresat"
                        ReadOnly="True">
                        <ItemStyle Width="20px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Прим." SortExpression="comments">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxEditComments_under_type" TextMode="MultiLine" CssClass="textGridView3" Width="100px"
                                runat="server" Text='<%# Bind("comments_under_type") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" TextMode="MultiLine" Width="100px" runat="server" Text='<%# Bind("comments_under_type") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Файл автора" SortExpression="fileNames">
                        <ItemTemplate>
                            <div style="width: 36px">
                                <asp:ImageButton Visible="false" ID="ImageButtonFilesItem" AlternateText='<%# Bind("fileNames") %>'
                                    CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("items") %>'
                                    ImageUrl="~/images/22х22/filesave.png" runat="server" /></div>
                            <asp:HyperLink ID="HyperLinkItemFilePath" Target="_blank" runat="server" ImageUrl="~/images/22х22/filesave.png"
                                NavigateUrl='<%# Bind("filePath") %>' ToolTip='<%# Bind("fileNames") %>'></asp:HyperLink>
                            <asp:Label ID="LabelItemFileGUIDNames" runat="server" Visible="false" Text='<%# Bind("fileGUIDNames") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <b>Файл автора:</b><br />
                            <asp:ImageButton Visible="false" ID="ImageButtonFilesEdit" CausesValidation="False"
                                CommandName="Select" CommandArgument='<%# Bind("items") %>' ImageUrl="~/images/22х22/filesave.png"
                                runat="server" />
                            <asp:Label ID="LabelEditItems" runat="server" Visible="false" Text='<%# Bind("items") %>'></asp:Label>
                            <asp:Label ID="LabelFileNames" runat="server" Visible="false" Text='<%# Bind("fileNames") %>'></asp:Label>
                            <asp:FileUpload ID="FileUploadEdit" runat="server" Width="150px" />
                            <asp:CheckBox ID="CheckBoxFileDelete" Text="Удалить файл" runat="server" /><br />
                            <br />
                            <b>Файл исполнителя:</b><br />
                            <asp:ImageButton Visible="false" ID="ImageButtonFilesEdit2" CausesValidation="False"
                                CommandName="Select" CommandArgument='<%# Bind("items_under_type") %>' ImageUrl="~/images/22х22/filesave.png"
                                runat="server" />
                            <asp:Label ID="LabelItemEdit_under_type" runat="server" Visible="false" Text='<%# Bind("items_under_type") %>'></asp:Label>
                            <asp:Label ID="LabelFileNames2" runat="server" Visible="false" Text='<%# Bind("fileNames2") %>'></asp:Label>
                            <asp:FileUpload ID="FileUploadEdit2" runat="server" Width="150px" />
                            <asp:CheckBox ID="CheckBoxFileDelete2" Text="Удалить файл" runat="server" />
                        </EditItemTemplate>
                        <ItemStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Файл исп." SortExpression="fileNames2">
                        <ItemTemplate>
                            <div style="width: 36px">
                                <asp:ImageButton Visible="false" ID="ImageButtonFilesItem2" AlternateText='<%# Bind("fileNames2") %>'
                                    CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("items_under_type") %>'
                                    ImageUrl="~/images/22х22/filesave.png" runat="server" />
                                <asp:HyperLink ID="HyperLinkItemFilePath2" runat="server" ImageUrl="~/images/22х22/filesave.png"
                                    Target="_blank" NavigateUrl='<%# Bind("filePath2") %>' ToolTip='<%# Bind("fileNames2") %>'></asp:HyperLink>
                                <asp:Label ID="LabelItemFileGUIDNames2" runat="server" Visible="false" Text='<%# Bind("fileGUIDNames2") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                        <ItemStyle Width="45px" />
                        <EditItemTemplate>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    
    </div>
                 <asp:SqlDataSource ID="SqlDataSourceOtdelDD" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                     SelectCommand="OtdelSelectDD" SelectCommandType="StoredProcedure">
                 </asp:SqlDataSource>
                 
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
                     </InsertParameters>
                 </asp:SqlDataSource>
    
                 <asp:SqlDataSource ID="SqlDataSourceForOtdel2" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                     DeleteCommand="SotrudnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SotrudnikInsert"
                     InsertCommandType="StoredProcedure" SelectCommand="SotrudnikSelectForOtdel" SelectCommandType="StoredProcedure"
                     UpdateCommand="SotrudnikUpdate" UpdateCommandType="StoredProcedure">
                     <SelectParameters>
                         <asp:SessionParameter DefaultValue="" Name="id_otdel" SessionField="id_otdel2" Type="Int32" />
                         <asp:Parameter DefaultValue="false" Name="FACT" Type="Boolean" />
                         <asp:Parameter DefaultValue="false" Name="SHOW_INACTIVE" Type="Boolean" />
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
                         <asp:Parameter Name="number_ip_phone" Type="String" />
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
                         <asp:Parameter Name="number_ip_phone" Type="String" />
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
                 
                 <asp:ObjectDataSource ID="ObjectDataSourceDoc" runat="server" 
        SelectMethod="DocSelectObj" TypeName="Doc" 
        oninserting="ObjectDataSourceDoc_Inserting" 
        onselecting="ObjectDataSourceDoc_Selecting" 
        ondeleting="ObjectDataSourceDoc_Deleting" DeleteMethod="DocDelete" 
        InsertMethod="InsertDoc" UpdateMethod="UpdateDoc">
                     <DeleteParameters>
                         <asp:Parameter Name="id_doc" Type="Int32" />
                         <asp:Parameter Name="id_docs_sotrudnik" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="number_in_doc" Type="String" />
                         <asp:Parameter Name="number_out_doc" Type="String" />
                         <asp:Parameter Name="avtor_send_doc" Type="String" />
                         <asp:Parameter Name="tema" Type="String" />
                         <asp:Parameter Name="delo" Type="String" />
                         <asp:Parameter Name="vid_doc" Type="String" />
                         <asp:Parameter Name="date_reg" Type="String" />
                         <asp:Parameter Name="time_reg" Type="String" />
                         <asp:Parameter Name="date_control" Type="String" />
                         <asp:Parameter Name="time_control" Type="String" />
                         <asp:Parameter Name="date_ready" Type="String" />
                         <asp:Parameter Name="time_ready" Type="String" />
                         <asp:Parameter Name="date_in" Type="String" />
                         <asp:Parameter Name="date_out" Type="String" />
                         <asp:Parameter Name="user_add_doc" Type="String" />
                         <asp:Parameter Name="user_work" Type="String" />
                         <asp:Parameter Name="user_control" Type="String" />
                         <asp:Parameter Name="status_doc" Type="String" />
                         <asp:Parameter Name="comments" Type="String" />
                         <asp:Parameter Name="items" Type="String" />
                         <asp:Parameter Name="prioritet" Type="Int32" />
                         <asp:Parameter Name="prioritet_str" Type="String" />
                         <asp:Parameter Name="id_sotrudnik_work" Type="Int32" />
                         <asp:Parameter Name="id_sotrudnik_control" Type="Int32" />
                         <asp:Parameter Name="id_groupQuery" Type="Int32" />
                         <asp:Parameter Name="id_sotrudnik_executive" Type="Int32" />
                         <asp:Parameter Name="docs_links" Type="String" />
                     </InsertParameters>
                     <SelectParameters>
                         <asp:Parameter Name="begin_date" Type="String" />
                         <asp:Parameter Name="end_date" Type="String" />
                         <asp:Parameter Name="top" Type="Int32" />
                         <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                         <asp:Parameter Name="id_sotrudnik_control" Type="Int32" />
                     </SelectParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="id_doc" Type="Int32" />
                         <asp:Parameter Name="number_in_doc" Type="String" />
                         <asp:Parameter Name="tema" Type="String" />
                         <asp:Parameter Name="date_reg" Type="String" />
                         <asp:Parameter Name="date_control" Type="String" />
                         <asp:Parameter Name="date_ready" Type="String" />
                         <asp:Parameter Name="time_ready" Type="String" />
                         <asp:Parameter Name="user_add_doc" Type="String" />
                         <asp:Parameter Name="status_doc" Type="String" />
                         <asp:Parameter Name="comments" Type="String" />
                         <asp:Parameter Name="id_sotrudnik_control" Type="Int32" />
                         <asp:Parameter Name="id_docs_sotrudnik" Type="Int32" />
                         <asp:Parameter Name="status_under_type" Type="Int32" />
                         <asp:Parameter Name="items_under_type" Type="String" />
                         <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                         <asp:Parameter Name="comments_under_type" Type="String" />
                         <asp:Parameter Name="id_sotrudnik_executive" Type="Int32" />
                         <asp:Parameter Name="docs_links" Type="String" />
                     </UpdateParameters>
    </asp:ObjectDataSource>
                 
                 <asp:ObjectDataSource ID="ObjectDataSourceDocFiltr" runat="server" 
        SelectMethod="DocSelectObjFiltr" TypeName="Doc" 
        oninserting="ObjectDataSourceDoc_Inserting" 
        onselecting="ObjectDataSourceDoc_Selecting" 
        ondeleting="ObjectDataSourceDoc_Deleting" DeleteMethod="DocDelete" 
        InsertMethod="InsertDoc" UpdateMethod="UpdateDoc" 
        OldValuesParameterFormatString="original_{0}">
                     <DeleteParameters>
                         <asp:Parameter Name="id_doc" Type="Int32" />
                         <asp:Parameter Name="id_docs_sotrudnik" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="number_in_doc" Type="String" />
                         <asp:Parameter Name="number_out_doc" Type="String" />
                         <asp:Parameter Name="avtor_send_doc" Type="String" />
                         <asp:Parameter Name="tema" Type="String" />
                         <asp:Parameter Name="delo" Type="String" />
                         <asp:Parameter Name="vid_doc" Type="String" />
                         <asp:Parameter Name="date_reg" Type="String" />
                         <asp:Parameter Name="time_reg" Type="String" />
                         <asp:Parameter Name="date_control" Type="String" />
                         <asp:Parameter Name="time_control" Type="String" />
                         <asp:Parameter Name="date_ready" Type="String" />
                         <asp:Parameter Name="time_ready" Type="String" />
                         <asp:Parameter Name="date_in" Type="String" />
                         <asp:Parameter Name="date_out" Type="String" />
                         <asp:Parameter Name="user_add_doc" Type="String" />
                         <asp:Parameter Name="user_work" Type="String" />
                         <asp:Parameter Name="user_control" Type="String" />
                         <asp:Parameter Name="status_doc" Type="String" />
                         <asp:Parameter Name="comments" Type="String" />
                         <asp:Parameter Name="items" Type="String" />
                         <asp:Parameter Name="prioritet" Type="Int32" />
                         <asp:Parameter Name="prioritet_str" Type="String" />
                         <asp:Parameter Name="id_sotrudnik_work" Type="Int32" />
                         <asp:Parameter Name="id_sotrudnik_control" Type="Int32" />
                         <asp:Parameter Name="id_groupQuery" Type="Int32" />
                         <asp:Parameter Name="id_sotrudnik_executive" Type="Int32" />
                         <asp:Parameter Name="docs_links" Type="String" />
                     </InsertParameters>
                     <SelectParameters>
                         <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                     </SelectParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="id_doc" Type="Int32" />
                         <asp:Parameter Name="number_in_doc" Type="String" />
                         <asp:Parameter Name="tema" Type="String" />
                         <asp:Parameter Name="date_reg" Type="String" />
                         <asp:Parameter Name="date_control" Type="String" />
                         <asp:Parameter Name="date_ready" Type="String" />
                         <asp:Parameter Name="time_ready" Type="String" />
                         <asp:Parameter Name="user_add_doc" Type="String" />
                         <asp:Parameter Name="status_doc" Type="String" />
                         <asp:Parameter Name="comments" Type="String" />
                         <asp:Parameter Name="id_sotrudnik_control" Type="Int32" />
                         <asp:Parameter Name="id_docs_sotrudnik" Type="Int32" />
                         <asp:Parameter Name="status_under_type" Type="Int32" />
                         <asp:Parameter Name="items_under_type" Type="String" />
                         <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                         <asp:Parameter Name="comments_under_type" Type="String" />
                         <asp:Parameter Name="id_sotrudnik_executive" Type="Int32" />
                         <asp:Parameter Name="docs_links" Type="String" />
                     </UpdateParameters>
    </asp:ObjectDataSource>
                 
                 <asp:SqlDataSource ID="SqlDataSourceForOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                     DeleteCommand="SotrudnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SotrudnikInsert"
                     InsertCommandType="StoredProcedure" SelectCommand="SotrudnikSelectForOtdel" SelectCommandType="StoredProcedure"
                     UpdateCommand="SotrudnikUpdate" UpdateCommandType="StoredProcedure">
                     <SelectParameters>
                         <asp:SessionParameter DefaultValue="" Name="id_otdel" SessionField="id_otdel" Type="Int32" />
                         <asp:Parameter DefaultValue="false" Name="FACT" Type="Boolean" />
                         <asp:Parameter DefaultValue="false" Name="SHOW_INACTIVE" Type="Boolean" />
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
                         <asp:Parameter Name="number_ip_phone" Type="String" />
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
                         <asp:Parameter Name="number_ip_phone" Type="String" />
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
                 
    </form>
</body>
</html>
