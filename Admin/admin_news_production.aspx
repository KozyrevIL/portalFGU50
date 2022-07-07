<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true"
    CodeFile="admin_news_production.aspx.cs" Theme="gridview" Inherits="Admin_smi" ValidateRequest="false" Title="Производственные новости" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<%@ Register Src="../UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>
<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<%--<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>--%>


<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.HTMLEditor" tagprefix="obout" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .formText
        {
            font-family: Tahoma;
            font-size: 12px;
            font-weight: normal;
            color: #000000;
            margin-left: 5px;
        }
        .textError
        {
            font-family: Tahoma;
            font-size: 12px;
            font-weight: bold;
            color: Red;
        }
    </style>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="../jQuery/css/start/jquery-ui-1.8.16.custom.css"/>
	    <script type="text/javascript" src="../jQuery/jquery-1.6.2.min.js"></script>
	    <script type="text/javascript" src="../jQuery/ui/minified/jquery.ui.core.min.js"></script>
	    <script type="text/javascript" src="../jQuery/ui/minified/jquery.ui.widget.min.js"></script>
	    <script type="text/javascript" src="../jQuery/ui/minified/jquery.ui.datepicker.min.js"></script>
	    <script type="text/javascript" src="../jQuery/ui/i18n/jquery.ui.datepicker-ru-utf8.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            $("#ctl00_ContentPlaceHolder1_TextBoxBegin").datepicker();
            $("#ctl00_ContentPlaceHolder1_TextBoxEnd").datepicker();

        });
	</script>
    
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td height="47">
                    <uc2:admin_banner ID="admin_banner1" header="Новости производственные" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" bgcolor="white" style="height: 584px">
                    <table cellpadding="0" cellspacing="0" border="1" width="100%">
                        <tr>
                            <td width="20%" align="left" valign="top">
                                <uc1:menu_admin_vert ID="menu_admin_vert1" runat="server" />
                            </td>
                            <td width="80%" valign="top" align="left">
                                 <div id="border_type6" style="padding: 10px 10px 10px 10px; margin: 0px;" class="formText">
                                    <div style="float:left;">
                                        <b>Фильтр</b></div>
                                    <div style="margin-left:20px; float:left; ">
                                        <div style="float:left;">
                                            Начало</div>
                                        <div style="float:left;margin-left:5px;;">
                                            <asp:TextBox ID="TextBoxBegin" Width="50px" CssClass="formText4" runat="server"></asp:TextBox></div>
                                    </div>
                                    <div style="margin-left:20px; float:left; ">
                                        <div style="float:left">
                                            Конец</div>
                                        <div style="float:left;margin-left:5px;;">
                                            <asp:TextBox ID="TextBoxEnd" Width="50px" CssClass="formText4" runat="server"></asp:TextBox></div>

                                    </div>
                                    <div style="float: left; margin-left: 10px;">
                                        Поиск по маске
                                    </div>
                                    <div style="float: left; margin-left: 10px; ">
                                        <asp:TextBox ID="TextBoxFind" runat="server" Width="200px"></asp:TextBox>
                                    </div>
                                    <div style="float: left; ">
                                        <asp:Button ID="ButtonFind" runat="server" CssClass="formText" Text="Поиск" CausesValidation="false"
                                            OnClick="ButtonFind_Click" />
                                    </div>
                                    <div style="">
                                        *Возможен поиск по части слова, при пустом поле выдает все строки
                                    </div>

                                </div>
                                <div class="posForm">
                                    <div id="input_border" class="formText">
                                         <div>
                                            Приоритет
                                        </div>
                                        <div>
                                            <asp:DropDownList ID="DropDownListPrioritet" runat="server">
                                                <asp:ListItem Text="Низкий" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Средний" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Высокий" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div>
                                            Заголовок (показывается на первой странице) </div>
                                        <div>
                                            <asp:TextBox ID="TextBoxHeader_news" runat="server" Width="600px" Height="50px" TextMode="MultiLine" Mode="Encode"></asp:TextBox></div>
                                        <div>
                                            Краткое содержание (показывается на первой странице)
                                        </div>
                                        <div>
                                            <asp:TextBox ID="TextBoxText_news_short" runat="server" Width="600px" Height="50px" MaxLength="255" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                        <div>
                                            Текст (показывается на второй странице)</div>
                                        <div>
                                            <asp:TextBox ID="Editor5" runat="server" Width="600px" Height="50px" MaxLength="255" TextMode="MultiLine" Mode="Encode"></asp:TextBox>
                                            <%--<cc1:Editor ID="Editor5" runat="server" ActiveMode="Html" Height="200px" Width="600px" Enabled="True" EnableTheming="True" />--%>
                                        </div>
                                        <div>
                                            Фото</div>
                                        <div>
                                            <asp:FileUpload ID="FileUploadImage" runat="server" /></div>
                                        <div class=textError>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Разрешены только графические форматы: jpg, gif, png"
                                                ValidationExpression=".*((\.jpg)|(\.JPG)|(\.jpeg)|(\.JPEG)|(\.bmp)|(\.gif)|(\.GIF)|(\.png)|(\.PNG))"
                                                ControlToValidate="FileUploadImage"></asp:RegularExpressionValidator></div>
                                        <div>
                                            Файл</div>
                                        <div>
                                            <asp:FileUpload ID="FileUploadFile" runat="server" /></div>
                                        <div>
                                        <div class=textError>
                                            <!--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Разрешены форматы: jpg, gif, png, doc, docx, xls, xlsx, rar, zip, pdf"
                                                ValidationExpression=".*((\.jpg)|(\.JPG)|(\.jpeg)|(\.JPEG)|(\.bmp)|(\.gif)|(\.GIF)|(\.png)|(\.PNG)|(\.doc)|(\.docx)|(\.DOC)|(\.DOCX)|(\.rar)|(\.RAR)|(\.zip)|(\.ZIP)|(\.xls)|(\.XLS)|(\.xlsx)|(\.XLSX)|(\.pdf)|(\.PDF)|(\.txt)|(\.TXT))"
                                                ControlToValidate="FileUploadFile"></asp:RegularExpressionValidator>--></div>
                                        <div>
                                            <asp:Label ID="LabelError" runat="server" CssClass="textError" Visible="False"></asp:Label></div>
                                        <div>
                                            <asp:Button ID="ButtonInsertNews" runat="server" CssClass="formText" 
                                                Text="Добавить" onclick="ButtonInsertNews_Click" /></div>
                                    </div>
                                    <div>
                                        <asp:GridView ID="GridView1" runat="server" SkinID="Grid_small" AutoGenerateColumns="False"
                                            DataKeyNames="id_news,items" DataSourceID="SqlDataSourceNews" AllowPaging="True"
                                            PageSize="30" Width="100%" OnRowDataBound="GridView1_RowDataBound1" OnRowCommand="GridView1_RowCommand"
                                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" OnRowUpdating="GridView1_RowUpdating">
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <div style="width: 50px">
                                                            <asp:LinkButton Width="50px" ID="LinkButton1" runat="server" CausesValidation="False"
                                                                CommandName="Edit" Text="Правка"></asp:LinkButton>
                                                            
                                                            <asp:LinkButton Width="50px" ID="LinkButton2" runat="server" OnClientClick="return confirm('Удалить запись?');"
                                                                CommandArgument='<%# Bind("items") %>' CausesValidation="False" CommandName="Delete"
                                                                Text="Удалить"></asp:LinkButton>
                                                        </div>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="50px" />
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update"
                                                            Text="Обновить"></asp:LinkButton>
                                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                            Text="Отмена"></asp:LinkButton>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Заголовок" SortExpression="header_news">
                                                    <ItemTemplate>
                                                        <asp:Label Width="30%" ID="LabelItemHeader_news" runat="server" Text='<%# Bind("header_news") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="200px" />
                                                    <EditItemTemplate>
                                                        <asp:ImageButton Visible="false" ID="ImageButtonEditFiles" CausesValidation="False"
                                                            CommandName="Select" CommandArgument='<%# Bind("items") %>' ImageUrl="~/images/22х22/filesave.png"
                                                            runat="server" />
                                                        <asp:Label ID="LabelEditItemsFile" runat="server" Visible="false" Text='<%# Bind("items") %>'></asp:Label>
                                                        <asp:Label ID="LabelFileNames" runat="server" Visible="false" Text='<%# Bind("fileNames") %>'></asp:Label>
                                                        Загрузить фото:<br />
                                                        <asp:FileUpload ID="FileUploadImageDG" runat="server" /><br />
                                                        Загрузить файл:<br />
                                                        <asp:FileUpload ID="FileUploadEdit" runat="server" /><br />
                                                        <asp:CheckBox ID="CheckBoxFileDelete" Text="Удалить файл" runat="server" />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Краткий текст" SortExpression="text_news_short">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("text_news_short") %>' TextMode="MultiLine" Width="300px" Height="50px"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("text_news_short") %>'></asp:Label>
                                                        </ItemTemplate>
                                                     <ItemStyle Width="200px" />
                                                    </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Текст" SortExpression="text_news">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelItemText_news" runat="server" Text='<%# Bind("text_news") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    
                                                    <EditItemTemplate>
                                                        <strong>Заголовок</strong><br>
                                                        <asp:TextBox ID="TextBoxEditHeader_news" runat="server" Height="50" Text='<%# Bind("header_news") %>'
                                                            TextMode="MultiLine" Width="600px"></asp:TextBox>
                                                        <strong>Текст:</strong>
                                                        <asp:Label ID="LabelEditText_news" runat="server" Text='<%# Bind("text_news") %>'
                                                            Visible="false"></asp:Label>
                                                       <asp:TextBox ID="TextBoxEditorGrid" Height="300px" TextMode=MultiLine Text='<%# Bind("text_news") %>'
                                                            Width="100%" runat="server" />
                                                        
                                                          
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Фото">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelItemItems" Visible="false" runat="server" Text='<%# Bind("items") %>'></asp:Label>
                                                        <asp:Image ID="ImageCatalog" ImageUrl="~/photoDB.ashx?" widht="50px" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="50px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Файл" SortExpression="fileNames">
                                                    <ItemTemplate>
                                                        <asp:ImageButton Visible="true" ID="ImageButtonFiles" AlternateText='<%# Bind("fileNames") %>'
                                                            CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("items") %>'
                                                            ImageUrl="~/images/22х22/filesave.png" runat="server" />
                                                        <asp:HyperLink ID="HyperLinkItemFilePath" runat="server" NavigateUrl='<%# Bind("filePath") %>'
                                                            ></asp:HyperLink>
                                                        <asp:Label Visible="false" ID="LabelItemFileGUIDNames" runat="server" Text='<%# Bind("fileGUIDNames") %>'></asp:Label>
                                                        <asp:Label Visible="false" ID="Label5" runat="server" Text='<%# Bind("date_news") %>'></asp:Label>
                                                        <asp:Label Visible="false" ID="Label6" runat="server" Text='<%# Bind("time_news") %>'></asp:Label>
                                                        <asp:CheckBox Visible="false" ID="CheckBox1" runat="server" Checked='<%# Bind("have_file") %>'
                                                            Enabled="false" />
                                                        <asp:CheckBox Visible="false" ID="CheckBoxItemhave_images" runat="server" Checked='<%# Bind("have_images") %>'
                                                            Enabled="false" />
                                                        <asp:Label Visible="false" ID="Label1" runat="server" Text='<%# Bind("id_news") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="50px" />
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Приоритет" SortExpression="prioritet_news">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBoxEditPrioritet" Width="50px" runat="server" Text='<%# Bind("prioritet_news") %>'></asp:TextBox>
                                                            <%--<asp:DropDownList ID="DropDownListPrioritet" runat="server" SelectedValue='<%# Bind("prioritet_news") %>'>
                                                                <asp:ListItem Text="Низкий" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Средний" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Высокий" Value="3"></asp:ListItem>
                                                            </asp:DropDownList>--%>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("prioritet_news") %>'></asp:Label>

                                                             <%--<asp:DropDownList ID="DropDownListPrioritet" runat="server" SelectedValue='<%# Bind("prioritet_news") %>' Enabled="false">
                                                                <asp:ListItem Text="Низкий" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Средний" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Высокий" Value="3"></asp:ListItem>
                                                            </asp:DropDownList>--%>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="50px" />
                                                    </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    &nbsp;&nbsp;&nbsp;
                    <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                        SelectCommand="NewsSelectItems" SelectCommandType="StoredProcedure" DeleteCommand="NewsDelete"
                        DeleteCommandType="StoredProcedure" InsertCommand="NewsInsert" InsertCommandType="StoredProcedure"
                        OnInserting="SqlDataSourceSmi_Inserting" UpdateCommand="NewsUpdateItems" 
                        UpdateCommandType="StoredProcedure" 
                        oninserted="SqlDataSourceNews_Inserted" 
                        ondeleted="SqlDataSourceNews_Deleted" OnUpdating="SqlDataSourceNews_Updating">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBoxBegin" DefaultValue="" Name="begin_date" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="TextBoxEnd" DefaultValue="" Name="end_date" PropertyName="Text" Type="String" />
                            <asp:Parameter DefaultValue="7" Name="items" Type="String" />
                            <asp:Parameter DefaultValue="20" Name="top" Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="id_news" Type="Int32" />
                            <asp:Parameter Name="items" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="id_news" Type="Int32" />
                            <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                            <asp:Parameter Name="prioritet_news" Type="Int32" />
                            <asp:Parameter Name="header_news" Type="String" />
                            <asp:Parameter Name="text_news" Type="String" />
                            <asp:Parameter Name="date_news" Type="String" />
                            <asp:Parameter Name="time_news" Type="String" />
                            <asp:Parameter Name="have_file" Type="Boolean" />
                            <asp:Parameter Name="path_file" Type="String" />
                            <asp:Parameter Name="have_images" Type="Boolean" />
                            <asp:Parameter Name="type_news" Type="Int32" />
                            <asp:Parameter Name="items" Type="String" />
                            <asp:Parameter Name="filePath" Type="String" />
                            <asp:Parameter Name="fileGUIDNames" Type="String" />
                            <asp:Parameter Name="text_news_short" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                            <asp:Parameter Name="prioritet_news" Type="Int32" />
                            <asp:Parameter Name="header_news" Type="String" />
                            <asp:Parameter Name="text_news" Type="String" />
                            <asp:Parameter Name="date_news" Type="String" />
                            <asp:Parameter Name="time_news" Type="String" />
                            <asp:Parameter Name="have_file" Type="Boolean" />
                            <asp:Parameter Name="path_file" Type="String" />
                            <asp:Parameter Name="have_images" Type="Boolean" />
                            <asp:Parameter Name="type_news" Type="Int32" />
                            <asp:Parameter Name="items" Type="String" />
                            <asp:Parameter Name="text_news_short" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td height="28px" bgcolor="#85A4C3">
                </td>
            </tr>
            <tr>
                <td height="6px" background="../images/background2.gif">
                </td>
            </tr>
            <tr>
                <td height="32px" bgcolor="#1E5A92">
                </td>
            </tr>
        </table>
    </body>
</asp:Content>
