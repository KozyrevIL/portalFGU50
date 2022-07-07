<%@ Page Language="C#"  AutoEventWireup="true" MasterPageFile="~/Admin/MasterPageAdmin.master"
    CodeFile="admin_news_doska.aspx.cs" Theme="gridview" Inherits="Admin_smi" ValidateRequest="false" Title="Администрирование новостей" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<%@ Register Src="../UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>
<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


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
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td height="47">
                  <%--  <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>--%>
                    <uc2:admin_banner ID="admin_banner1" header="Новости" runat="server" />
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
                                <div class="posForm">
                                    <div id="input_border" class="formText">
                                        <div>
                                            Заголовок</div>
                                        <div>
                                            <asp:TextBox ID="TextBoxHeader_news" runat="server" Width="600px" Height="50px" TextMode="MultiLine"></asp:TextBox></div>
                                        <div>
                                            Текст</div>
                                        <div>
                                            Краткое содержание (показывается на первой странице)
                                        </div>
                                        <div>
                                            <asp:TextBox ID="TextBoxText_news_short" runat="server" Width="600px" Height="50px" MaxLength="255" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                        <div>
                                            Текст (показывается на второй странице)
                                        </div>
                                        <div>
                                            <asp:TextBox ID="TextBoxEditor" runat="server" Height="200px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                                            <asp:HtmlEditorExtender ID="TextBoxEditor_HtmlEditorExtender" runat="server" TargetControlID="TextBoxEditor"  EnableSanitization="false">
                                            </asp:HtmlEditorExtender>
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
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Разрешены форматы: jpg, gif, png, doc, docx, xls, xlsx, rar, zip, pdf"
                                                ValidationExpression=".*((\.jpg)|(\.JPG)|(\.jpeg)|(\.JPEG)|(\.bmp)|(\.gif)|(\.GIF)|(\.png)|(\.PNG)|(\.doc)|(\.docx)|(\.DOC)|(\.DOCX)|(\.rar)|(\.RAR)|(\.zip)|(\.ZIP)|(\.xls)|(\.XLS)|(\.xlsx)|(\.XLSX)|(\.pdf)|(\.PDF)|(\.txt)|(\.TXT))"
                                                ControlToValidate="FileUploadFile"></asp:RegularExpressionValidator></div>
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
                                                        <div style="width: 90px">
                                                            <asp:LinkButton Width="50px" ID="LinkButton1" runat="server" CausesValidation="False"
                                                                CommandName="Edit" Text="Правка"></asp:LinkButton>
                                                            <br></br>
                                                            <asp:LinkButton Width="50px" ID="LinkButton2" runat="server" OnClientClick="return confirm('Удалить запись?');"
                                                                CommandArgument='<%# Bind("items") %>' CausesValidation="False" CommandName="Delete"
                                                                Text="Удалить"></asp:LinkButton>
                                                        </div>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="50px" />
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
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
                                                    </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Текст" SortExpression="text_news">
                                                    <ItemTemplate>
                                                        <asp:Label Width="70%" ID="Label4" runat="server" Text='<%# Bind("text_news") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="100%" />
                                                    <EditItemTemplate>
                                                        <strong>Заголовок</strong><br>
                                                        <asp:TextBox ID="TextBoxEditHeader_news" runat="server" Height="50" Text='<%# Bind("header_news") %>'
                                                            TextMode="MultiLine" Width="600px"></asp:TextBox>
                                                        <strong>Текст:</strong>
                                                        <asp:Label ID="LabelEditText_news" runat="server" Text='<%# Bind("text_news") %>'
                                                            Visible="false"></asp:Label>
                                                        
                                                            <asp:TextBox id="TextBoxEditorGrid" Height=300px TextMode=MultiLine Width=100% text='<%# Bind("text_news") %>' runat=server></asp:TextBox>
                                                        <asp:Label Visible="false" ID="LabelEditPrioritet_news" runat="server" Text='<%# Bind("prioritet_news") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Фото">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelItemItems" Visible="false" runat="server" Text='<%# Bind("items") %>'></asp:Label>
                                                        <asp:Image ID="ImageCatalog" ImageUrl="~/photoDB.ashx?" Height="50px" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="100px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Файл" SortExpression="fileNames">
                                                    <ItemTemplate>
                                                        <asp:ImageButton Visible="true" ID="ImageButtonFiles" AlternateText='<%# Bind("fileNames") %>'
                                                            CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("items") %>'
                                                            ImageUrl="~/images/22х22/filesave.png" runat="server" />
                                                        <asp:HyperLink ID="HyperLinkItemFilePath" runat="server" NavigateUrl='<%# Bind("filePath") %>'
                                                            Text='<%# Bind("fileNames") %>'></asp:HyperLink>
                                                        <asp:Label Visible="false" ID="LabelItemFileGUIDNames" runat="server" Text='<%# Bind("fileGUIDNames") %>'></asp:Label>
                                                        <asp:Label Visible="false" ID="Label5" runat="server" Text='<%# Bind("date_news") %>'></asp:Label>
                                                        <asp:Label Visible="false" ID="Label6" runat="server" Text='<%# Bind("time_news") %>'></asp:Label>
                                                        <asp:CheckBox Visible="false" ID="CheckBox1" runat="server" Checked='<%# Bind("have_file") %>'
                                                            Enabled="false" />
                                                        <asp:CheckBox Visible="false" ID="CheckBoxItemhave_images" runat="server" Checked='<%# Bind("have_images") %>'
                                                            Enabled="false" />
                                                        <asp:Label Visible="false" ID="Label1" runat="server" Text='<%# Bind("id_news") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="100%" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    &nbsp;&nbsp;&nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
&nbsp;<asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                        SelectCommand="NewsSelectItems" SelectCommandType="StoredProcedure" DeleteCommand="NewsDelete"
                        DeleteCommandType="StoredProcedure" InsertCommand="NewsInsert" InsertCommandType="StoredProcedure"
                        OnInserting="SqlDataSourceSmi_Inserting" UpdateCommand="NewsUpdateItems" 
                        UpdateCommandType="StoredProcedure" 
                        oninserted="SqlDataSourceNews_Inserted" 
                        ondeleted="SqlDataSourceNews_Deleted">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="01.01.1901" Name="begin_date" Type="String" />
                            <asp:Parameter DefaultValue="01.01.1901" Name="end_date" Type="String" />
                            <asp:Parameter DefaultValue="6" Name="items" Type="String" />
                            <asp:Parameter DefaultValue="100" Name="top" Type="Int32" />
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
