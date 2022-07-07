<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" Theme="gridview" CodeFile="admin_doc_edit.aspx.cs" Inherits="Admin_admin_doc" %>

<%@ Register Src="~/UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>


<%@ Register Src="~/UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Администрирование ДОКУМЕНТООБОРОТ</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" href="../jQuery/css/start/jquery-ui-1.8.16.custom.css">
	<script src="../jQuery/jquery-1.6.2.min.js"></script>
	<script src="../jQuery/ui/minified/jquery.ui.core.min.js"></script>
	<script src="../jQuery/ui/minified/jquery.ui.widget.min.js"></script>
	<script src="../jQuery/ui/minified/jquery.ui.datepicker.min.js"></script>
	<script src="../jQuery/ui/i18n/jquery.ui.datepicker-ru-utf8.js"></script>

	<script language="javascript" type="text/javascript">
		$(function() {
			$("#TextBoxDate_control").datepicker();
			$("#TextBoxDateReg").datepicker();
		});
	</script>

    <style type="text/css">
        .textGridView td
        {
            border-color: Black;
            border-width: 1px;
            border-style: solid;
        }
        </style>
    </head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" >
                 </asp:ScriptManager>
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="47">
                <uc2:admin_banner  header="Редактирование документов" ID="Admin_banner1" runat="server" />
            </td>
        </tr>
        
         <tr>
             <td align="left" valign="top" bgcolor="white" style="height: 584px">
                 <div style="margin: 10px">
                     <a href="admin.aspx" class="text_links"><font color="#1E5A92">Администрирование</font></a>
                     &nbsp;&nbsp; <a href="../Default.aspx" class="text_links"><font color="#1E5A92">Выход
                         на портал</font></a>
                     <div class="formText" style="display: inline; padding-left: 10px;">
                         Выбрать исполнителя &nbsp;&nbsp;
                         <asp:DropDownList ID="DropDownListUserWorksFiltr" runat="server" AutoPostBack="True"
                             OnSelectedIndexChanged="DropDownListUserWorksFiltr_SelectedIndexChanged">
                         </asp:DropDownList>
                         <div class="formText" style="display: inline; padding-left: 10px;">
                             Автор
                             <asp:DropDownList ID="DropDownListUser_control" runat="server" Width="230px" DataSourceID="SqlDataSourceForOtdel2"
                                 DataTextField="full_name" DataValueField="id_sotrudnik">
                             </asp:DropDownList>
                         </div>
                         <div class="formText" style="display: inline; padding-left: 10px;">
                             Поиск по маске&nbsp;&nbsp;
                             <asp:TextBox ID="TextBoxMask" runat="server" Width="150px" />
                             <asp:Button ID="ButtonFind" Text="Поиск" runat="server" OnClick="ButtonFind_Click" />
                         </div>
                         <div class="formText" style="display: inline; padding-left: 10px;">
                             <asp:CheckBox ID="CheckBoxHistory" Text="Показывать историю" runat="server" />
                         </div>
                     </div>
                 <table cellpadding="0" cellspacing="0" border="1" width="100%">
                     <tr>
                         <td width="100%" valign="top" align="left">
                             <div class="posForm1">
                                 
                                 <div style="position: relative">
                                 
                                     <asp:GridView ID="GridViewParent" runat="server" AutoGenerateColumns="False" SkinID="middle_no_alter"
                                         Width="100%" DataKeyNames="id_doc,id_docs_sotrudnik" ForeColor="#333333" AllowPaging="True" AllowSorting="True"
                                         OnRowDataBound="GridViewParent_RowDataBound" PageSize="50" 
                                         ShowFooter="True" DataSourceID="SqlDataSourceDoc"
                                         OnRowCommand="GridViewParent_RowCommand" 
                                         OnRowUpdating="GridViewParent_RowUpdating" 
                                         OnSelectedIndexChanged="GridViewParent_SelectedIndexChanged" 
                                         onrowediting="GridViewParent_RowEditing">
                                         
                                         
                                         <Columns>
                                             <asp:TemplateField ShowHeader="False">
                                                 <ItemTemplate>
                                                     <div style="width:55px">
                                                         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                             Text="Правка"></asp:LinkButton><br />
                                                         <asp:LinkButton ID="LinkButtonItemDelete" runat="server" CommandArgument='<%# Bind("items") %>' OnClientClick="return confirm('Удалить запись?');"
                                                             CausesValidation="False" CommandName="Delete" Text="Удалить"></asp:LinkButton>
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
                                                     <asp:TextBox ID="TextBoxEditNumber_in_doc" CssClass="textGridView3" Enabled="true" Width="50px" runat="server"
                                                         Text='<%# Bind("number_in_doc") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="LabelItemNumber_in_doc" Width="50px" runat="server" Text='<%# Bind("number_in_doc") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <ItemStyle Width="45px" />
                                             </asp:TemplateField>
                                             
                                             <asp:TemplateField HeaderText="Дата рег." SortExpression="date_reg">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBoxEditDate_reg" Width="50px" CssClass="textGridView3" runat="server" Enabled="false"
                                                         Text='<%# Bind("date_reg") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label4" Width="50px" runat="server" Text='<%# Bind("date_reg") %>'></asp:Label><br />
                                                     <asp:Label ID="Label10" Width="50px" runat="server" Text='<%# Bind("time_reg") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 
                                                 <ItemStyle Width="55px" />
                                             </asp:TemplateField>
                                             
                                             <asp:TemplateField HeaderText="Статус" SortExpression="status_doc">
                                                 <ItemTemplate>
                                                 
                                                     <asp:Label ID="LabelItemStatus_doc" CssClass="textGridView3" Width="70px" runat="server" Text='<%# Bind("status_doc") %>' Visible=false></asp:Label>
                                                     <asp:Label ID="LabelItemDate_ready" CssClass="textGridView3" Width="70px" runat="server" Text='<%# Bind("date_ready") %>' Visible=false></asp:Label>
                                                     <asp:Label ID="LabelItemStatus_under_type" CssClass="textGridView3" runat="server" Text='<%# Bind("status_under_type") %>' Visible=false></asp:Label>
                                                     
                                                     
                                                     
                                                     <asp:Image ID="ImageItemStatus" runat=server ImageUrl="~/images/16х16/ball_blue.gif" />
                                                     
                                                 </ItemTemplate>
                                                 <EditItemTemplate>
                                                 
                                                     <asp:Label ID="LabelEditStatus_doc" Visible="false" runat="server" Text='<%# Bind("status_doc") %>'></asp:Label>
                                                     <asp:CheckBox ID="CheckBoxStatus_doc" Text="Исполнено" Width="70px" runat="server"
                                                         OnCheckedChanged="CheckBoxStatus_doc_CheckedChanged"  Visible=false />
                                                         
                                                     <asp:TextBox ID="TextBoxEditDate_ready" CssClass="textGridView3" Width="70px" runat="server" Text='<%# Bind("date_ready") %>'></asp:TextBox>
                                                     <asp:DropDownList ID="DropDownListEditStatus_under_type" SelectedValue='<%# Bind("status_under_type") %>' runat=server CssClass="textGridView3">
                                                        <asp:ListItem Text="В работу" Value=0></asp:ListItem>
                                                        <asp:ListItem Text="Исполнено" Value=1></asp:ListItem>
                                                        <asp:ListItem Text="Ознакомлен" Value=2></asp:ListItem>
                                                     </asp:DropDownList>
                                                     
                                                     <asp:Label ID="LabelItemId_docs_sotrudnik" CssClass="textGridView3" Width="70px" runat="server" Text='<%# Bind("id_docs_sotrudnik") %>' Visible=false></asp:Label>
                                                     
                                                 </EditItemTemplate>
                                                 <ItemStyle Width="15px" />
                                                 
                                             </asp:TemplateField>
                                             
                                             <asp:TemplateField HeaderText="Краткое содержание" SortExpression="tema">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBoxEditTema" CssClass="textGridView3" Width="300px" TextMode="MultiLine"
                                                         runat="server" Text='<%# Bind("tema") %>'></asp:TextBox>

                                                          <asp:GridView ID="GridViewChild" runat="server" SkinID=middle_no_alter AutoGenerateColumns="False" DataKeyNames="id_log"
                                                         DataSourceID="SqlDataSourceLogSite">
                                                         <Columns>
                                                             <asp:BoundField Visible=false DataField="id_log" HeaderText="id_log" InsertVisible="False" ReadOnly="True"
                                                                 SortExpression="id_log" />
                                                             <asp:BoundField Visible=false DataField="items" HeaderText="items" SortExpression="items" />
                                                             <asp:BoundField DataField="date_edit" HeaderText="Дата" SortExpression="date_edit" />
                                                             <asp:BoundField DataField="operator" HeaderText="Оператор" SortExpression="operator" />
                                                             

                                                             <asp:TemplateField HeaderText="Текст" SortExpression="text_correct">
                                                                 <ItemTemplate>
                                                                     <asp:Label ID="LabelItemText_correct"  runat="server" Text='<%# Bind("text_correct") %>'></asp:Label>
                                                                 </ItemTemplate>        
                                                             </asp:TemplateField>

                                                             <asp:BoundField DataField="type_operations" HeaderText="Тип" SortExpression="type_operations" />
                                                         </Columns>
                                                     </asp:GridView>


                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="LabelItemTema" Width="300px" TextMode="MultiLine" runat="server" Text='<%# Bind("tema") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             
                                             <asp:TemplateField HeaderText="Автор" SortExpression="full_name_control">
                                                 <ItemTemplate>
                                                     <asp:Label ID="LabelItemFull_name_control" Width="94px"  runat="server" Text='<%# Bind("full_name_control") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <EditItemTemplate>
                                                     <asp:Label ID="LabelEditId_sotrudnik_control"  runat="server" Text='<%# Bind("id_sotrudnik_control") %>' Enabled=false Visible=false></asp:Label>
                                                     <asp:DropDownList ID="DropDownListFull_name_control"  CssClass="textGridView3" runat=server Width=100px></asp:DropDownList>
                                                 </EditItemTemplate>
                                                 <ItemStyle Width="105px" />
                                             </asp:TemplateField>
                                             
                                             <asp:TemplateField HeaderText="Отдел отправителя" SortExpression="name_otdel_control">
                                                 <ItemTemplate>
                                                     <asp:Label ID="LabelItemName_otdel_control" Width="94px"  runat="server" Text='<%# Bind("name_otdel_control") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <ItemStyle Width="145px" />
                                             </asp:TemplateField>
                                             
                                             <asp:TemplateField HeaderText="Срок исп." SortExpression="date_control">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox4" Width="50px" CssClass="textGridView3" runat="server" Enabled="false"
                                                         Text='<%# Bind("date_control") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="LabelItemDate_control" Width="50px" runat="server" Text='<%# Bind("date_control") %>'></asp:Label><br />
                                                     <asp:Label ID="LabelItemTime_control" Width="50px" runat="server" Text='<%# Bind("time_control") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <ItemStyle Width="55px" />
                                             </asp:TemplateField>
                                             
                                             <asp:TemplateField HeaderText="Адресат" SortExpression="user_work">
                                                 <EditItemTemplate>
                                                     
                                                     <asp:Label ID="LabelEditId_sotrudnik"  runat="server" Text='<%# Bind("id_sotrudnik") %>' Enabled=false Visible=false></asp:Label>
                                                     <asp:DropDownList ID="DropDownListEditFull_name"  CssClass="textGridView3" runat=server Width=100px></asp:DropDownList>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label7" Width="94px" runat="server" Text='<%# Bind("full_name") %>'></asp:Label>
                                                     
                                                 </ItemTemplate>
                                                 <ItemStyle Width="105px" />
                                             </asp:TemplateField>
                                             
                                             <asp:TemplateField HeaderText="Отдел адресата" SortExpression="name_otdel">
                                                 <EditItemTemplate>
                                                     <asp:Label ID="Label1" Width="105px" CssClass="textGridView3" runat="server" Text='<%# Eval("name_otdel") %>'></asp:Label>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label9" Width="105px" runat="server" Text='<%# Bind("name_otdel") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <ItemStyle Width="105px" />
                                             </asp:TemplateField>
                                             
                                             <asp:TemplateField HeaderText="Прим." SortExpression="comments">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox7" TextMode="MultiLine" CssClass="textGridView3" Width="100px"
                                                         runat="server" Text='<%# Bind("comments") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label8" TextMode="MultiLine" Width="100px" runat="server" Text='<%# Bind("comments") %>'></asp:Label>
                                                 </ItemTemplate>
                                                 <ItemStyle Width="145px" />
                                             </asp:TemplateField>
                                             
                                             <asp:TemplateField HeaderText="Файл автора" SortExpression="fileNames">
                                                 <ItemTemplate>
                                                 <div style="width:36px">
                                                     <asp:ImageButton Visible="false" ID="ImageButtonFilesItem" AlternateText='<%# Bind("fileNames") %>'
                                                         CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("items") %>'
                                                         ImageUrl="~/images/22х22/filesave.png" runat="server" /></div>
                                                         
                                                          <asp:HyperLink ID="HyperLinkItemFilePath" runat=server ImageUrl="~/images/22х22/filesave.png" NavigateUrl='<%# Bind("filePath") %>' ToolTip='<%# Bind("fileNames") %>'></asp:HyperLink>
                                                         
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
                                                     <asp:CheckBox ID="CheckBoxFileDelete" Text="Удалить файл" runat="server" /><br /><br />
                                                     
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
                                             
                                             <asp:BoundField DataField="number_out_doc" HeaderText="number_out_doc" 
                                                 SortExpression="number_out_doc" Visible="False" />
                                             <asp:BoundField DataField="user_add_doc" HeaderText="Оператор" SortExpression="user_add_doc"
                                                 Visible="False" />
                                             <asp:BoundField DataField="delo" HeaderText="delo" SortExpression="delo" Visible="False" />
                                             <asp:BoundField DataField="vid_doc" HeaderText="vid_doc" SortExpression="vid_doc"
                                                 Visible="False" />
                                            
                                             <asp:BoundField DataField="avtor_send_doc" HeaderText="Оператор1" SortExpression="avtor_send_doc"
                                                 Visible="False" />
                                             <asp:BoundField DataField="time_ready" HeaderText="time_ready" SortExpression="time_ready"
                                                 Visible="False" />
                                             <asp:BoundField DataField="date_in" HeaderText="date_in" SortExpression="date_in"
                                                 Visible="False" />
                                             <asp:BoundField DataField="date_out" HeaderText="date_out" SortExpression="date_out"
                                                 Visible="False" />
                                             <asp:BoundField DataField="items" HeaderText="items" SortExpression="items" Visible="False" />
                                             <asp:BoundField DataField="prioritet" HeaderText="prioritet" SortExpression="prioritet"
                                                 Visible="False" />
                                             <asp:BoundField DataField="prioritet_str" HeaderText="prioritet_str" SortExpression="prioritet_str"
                                                 Visible="False" />
                                            
                                            
                                             
                                             
                                             
                                             <asp:TemplateField HeaderText="Файл исп." SortExpression="fileNames2">
                                                 <ItemTemplate>
                                                 <div style="width:36px">
                                                     <asp:ImageButton Visible="false" ID="ImageButtonFilesItem2" AlternateText='<%# Bind("fileNames2") %>' 
                                                         CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("items_under_type") %>' 
                                                         ImageUrl="~/images/22х22/filesave.png" runat="server" />
                                                         
                                                         
                                                         
                                                         <asp:HyperLink ID="HyperLinkItemFilePath2" runat=server ImageUrl="~/images/22х22/filesave.png" NavigateUrl='<%# Bind("filePath2") %>' ToolTip='<%# Bind("fileNames2") %>'></asp:HyperLink>
                                                         <asp:Label ID="LabelItemFileGUIDNames2" runat="server" Visible="false" Text='<%# Bind("fileGUIDNames2") %>'></asp:Label>
                                                         </div>
                                                 </ItemTemplate>
                                               
                                                 <ItemStyle Width="45px" />
                                                 <EditItemTemplate>
                                                 </EditItemTemplate>
                                             </asp:TemplateField>
                                            
                                            
                                         </Columns>
                                         <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                         <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" CssClass="textGridView3" />
                                         <EditRowStyle BackColor="#cccccc" />
                                         
                                     </asp:GridView>
                                 </div>
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
                 <asp:SqlDataSource ID="SqlDataSourceForOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                     DeleteCommand="SotrudnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SotrudnikInsert"
                     InsertCommandType="StoredProcedure" SelectCommand="SotrudnikSelectForOtdel" SelectCommandType="StoredProcedure"
                     UpdateCommand="SotrudnikUpdate" UpdateCommandType="StoredProcedure">
                     <SelectParameters>
                         <asp:SessionParameter DefaultValue="" Name="id_otdel" SessionField="id_otdel" Type="Int32" />
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
                 <asp:SqlDataSource ID="SqlDataSourceForOtdel2" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                     DeleteCommand="SotrudnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SotrudnikInsert"
                     InsertCommandType="StoredProcedure" SelectCommand="SotrudnikSelectForOtdel" SelectCommandType="StoredProcedure"
                     UpdateCommand="SotrudnikUpdate" UpdateCommandType="StoredProcedure">
                     <SelectParameters>
                         <asp:SessionParameter DefaultValue="" Name="id_otdel" SessionField="id_otdel2" Type="Int32" />
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
                 <asp:SqlDataSource ID="SqlDataSourceDoc" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                     SelectCommand="DocSelectNew" SelectCommandType="StoredProcedure" DeleteCommand="DocDeleteNew"
                     DeleteCommandType="StoredProcedure" InsertCommand="DocInsertNew" 
                         InsertCommandType="StoredProcedure" UpdateCommand="DocUpdate" 
                     UpdateCommandType="StoredProcedure">
                     <DeleteParameters>
                         <asp:Parameter Name="id_doc" Type="Int32" />
                         <asp:Parameter Name="id_docs_sotrudnik" Type="Int32" />
                     </DeleteParameters>
                     <SelectParameters>
                         <asp:SessionParameter DefaultValue="01.01.1901" Name="begin_date" SessionField="begin_date"
                             Type="String" />
                         <asp:SessionParameter DefaultValue="01.01.1901" Name="end_date" SessionField="end_date"
                             Type="String" />
                         <asp:Parameter DefaultValue="100" Name="top" Type="Int32" />
                         <asp:SessionParameter DefaultValue="-1" Name="id_sotrudnik" 
                             SessionField="UserWorksFiltr" Type="Int32" />
                         <asp:ControlParameter ControlID="DropDownListUser_control" 
                             Name="id_sotrudnik_control" PropertyName="SelectedValue" Type="Int32" />
                         <asp:SessionParameter DefaultValue="-1" Name="mask" SessionField="mask" 
                             Type="String" />
                     </SelectParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="id_doc" Type="Int32" />
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
                         <asp:Parameter Name="fileNames" Type="String" />
                         <asp:Parameter Name="name_otdel" Type="String" />
                         <asp:Parameter Name="id_sotrudnik_control" Type="Int32" />
                         <asp:Parameter Name="name_otdel_control" Type="String" />
                         <asp:Parameter Name="id_docs_sotrudnik" Type="Int32" />
                         <asp:Parameter Name="status_under_type" Type="Int32" />
                         <asp:Parameter Name="items_under_type" Type="String" />
                         <asp:Parameter Name="fileNames2" Type="String" />
                         <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                     </UpdateParameters>
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
                     </InsertParameters>
                 </asp:SqlDataSource>
                 
                 
                 <asp:SqlDataSource ID="SqlDataSourceDocMany" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                     SelectCommand="DocSelectNew" SelectCommandType="StoredProcedure" DeleteCommand="DocDelete"
                     DeleteCommandType="StoredProcedure" InsertCommand="DocInsertNewMany" InsertCommandType="StoredProcedure"
                      UpdateCommand="DocUpdate" 
                     UpdateCommandType="StoredProcedure">
                     <DeleteParameters>
                         <asp:Parameter Name="id_doc" Type="Int32" />
                     </DeleteParameters>
                     <SelectParameters>
                         <asp:SessionParameter DefaultValue="01.01.1901" Name="begin_date" SessionField="begin_date"
                             Type="String" />
                         <asp:SessionParameter DefaultValue="01.01.1901" Name="end_date" SessionField="end_date"
                             Type="String" />
                         <asp:Parameter DefaultValue="50" Name="top" Type="Int32" />
                         <asp:ControlParameter ControlID="DropDownListUserWorksFiltr" DefaultValue="-1" 
                             Name="id_sotrudnik" PropertyName="SelectedValue" Type="Int32" />
                     </SelectParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="id_doc" Type="Int32" />
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
                         <asp:Parameter Name="fileNames" Type="String" />
                         <asp:Parameter Name="name_otdel" Type="String" />
                         <asp:Parameter Name="full_name" Type="String" />
                         <asp:Parameter Name="id_sotrudnik_control" Type="Int32" />
                         <asp:Parameter Name="name_otdel_control" Type="String" />
                     </UpdateParameters>
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
                     </InsertParameters>
                 </asp:SqlDataSource>
                 
                 
                 <br />
                 <asp:ObjectDataSource ID="ObjectDataSourceDocForDate" runat="server" SelectMethod="DocSelectForDate"
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
    <asp:SqlDataSource ID="SqlDataSourceLogSite" runat="server" 
        ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
        SelectCommand="LogSiteSelect" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="items" SessionField="items" Type="String" />
        </SelectParameters>
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
