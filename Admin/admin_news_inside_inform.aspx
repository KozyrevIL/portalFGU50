<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true"
    CodeFile="admin_news_inside_inform.aspx.cs" Theme="gridview" Inherits="Admin_smi" ValidateRequest="false" Title="Администрирование новостей" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<%@ Register Src="../UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>
<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>



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
                    <%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>--%>
                    <uc2:admin_banner ID="admin_banner1" header="Служебная информация" runat="server" />
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
                                    <div id="input_border">
                                        <table cellpadding="0" cellspacing="0" width="800" class="formText">
                                            <tr>
                                                <td style="width: 205px; height: 19px">
                                                    <table cellpadding="0" cellspacing="0" width="800" class="formText">
                                                        <tr>
                                                            <td height="30" style="width: 230px">
                                                                Заголовок
                                                            </td>
                                                            <td colspan="3">
                                                                <asp:TextBox ID="TextBoxHeader_news" runat="server" Width="570px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Краткое содержание (показывается на первой странице)
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="TextBoxText_news_short" runat="server" Width="600px" Height="50px" MaxLength="255" TextMode="MultiLine"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" style="width: 224px">
                                                                Текст
                                                            </td>
                                                            <td colspan="3">
                                                                <div class="formText">
                                                                    <strong>перенос строки Ctrl+Enter</strong>
                                                                  

                                                                    <asp:TextBox ID="TextBoxEditor" runat="server" Height="200px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                                                                   
                                                                    <asp:HtmlEditorExtender id="TextBoxEditor_HtmlEditorExtender" runat="server" targetcontrolid="TextBoxEditor"></asp:HtmlEditorExtender>
                                                                   
                                                                   
                                                                    <%--<cc1:Editor ID="Editor3" runat="server" ActiveMode=Design Height="200px" Width="600px" />--%>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" style="width: 224px">
                                                                Фото
                                                            </td>
                                                            <td style="width: 205px; height: 19px">
                                                                <asp:FileUpload ID="FileUploadImage" runat="server" />
                                                            </td>
                                                            <td style="width: 205px; height: 19px">
                                                                &nbsp; Файл
                                                            </td>
                                                            <td style="width: 205px; height: 19px">
                                                                <asp:FileUpload ID="FileUploadFile" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" colspan="4">
                                                                <asp:Label ID="LabelError" runat="server" CssClass="textError" Visible="False"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" style="width: 224px">
                                                                <asp:Button ID="ButtonInsertNews" runat="server" CssClass="formText" Text="Добавить"
                                                                    OnClick="ButtonInsertNews_Click" />
                                                            </td>
                                                            <td style="width: 205px" align="right">
                                                                &nbsp;
                                                            </td>
                                                            <td align="right" style="width: 205px">
                                                            </td>
                                                            <td align="right" style="width: 205px">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <asp:GridView ID="GridView1" runat="server" SkinID="Grid_small" AutoGenerateColumns="False"
                                        DataKeyNames="id_news,items" DataSourceID="SqlDataSourceNews" 
                                        AllowPaging="True" PageSize="30"
                                        Width="100%" OnRowDataBound="GridView1_RowDataBound1" 
                                        onrowcommand="GridView1_RowCommand" 
                                        onselectedindexchanged="GridView1_SelectedIndexChanged1" 
                                        onrowupdating="GridView1_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <div style="width: 90px">
                                                        <asp:LinkButton Width="50px" ID="LinkButton1" runat="server" CausesValidation="False"
                                                            CommandName="Edit" Text="Правка"></asp:LinkButton>
                                                        <br></br>
                                                        <asp:LinkButton Width="50px" ID="LinkButton2" runat="server" OnClientClick="return confirm('Удалить запись?');" CommandArgument='<%# Bind("items") %>' CausesValidation="False"
                                                            CommandName="Delete" Text="Удалить"></asp:LinkButton>
                                                    </div>
                                                </ItemTemplate>
                                                
                                                <ItemStyle Width=50px />
                                                
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
                                                
                                                <ItemStyle Width=200px />
                                                
                                                <EditItemTemplate>
                                                
                                                    <asp:ImageButton Visible="false" ID="ImageButtonEditFiles" CausesValidation="False" CommandName="Select" 
                                                        CommandArgument='<%# Bind("items") %>' ImageUrl="~/images/22х22/filesave.png"
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
                                            
                                            <asp:TemplateField HeaderText="Текст" SortExpression="text_news">
                                                <ItemTemplate>
                                                    <asp:Label Width="70%" ID="Label4" runat="server" Text='<%# Bind("text_news") %>'></asp:Label>
                                                </ItemTemplate>
                                                
                                                <ItemStyle Width=100% />
                                                <EditItemTemplate>
                                                    <div>
                                                        <strong>Заголовок</strong>
                                                    </div>
                                                    <div>
                                                        <asp:TextBox ID="TextBoxEditHeader_news" runat="server" Height="50" Text='<%# Bind("header_news") %>' TextMode="MultiLine" Width="600px"></asp:TextBox>
                                                    </div>
                                                    <div>
                                                        <strong>Текст:</strong>
                                                    </div>
                                                    <div>
                                                        <asp:TextBox ID="TextBoxEditText_news" TextMode=MultiLine Width=100% Height=300px runat="server" Text='<%# Bind("text_news") %>'></asp:TextBox>
                                                    </div>
                                                </EditItemTemplate>

                                            </asp:TemplateField>
                                            
                                           
                                            
                                            <asp:TemplateField HeaderText="Фото">
                                                
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemItems" Visible="false" runat="server" Text='<%# Bind("items") %>'></asp:Label>
                                                    <asp:Image ID="ImageCatalog" ImageUrl="~/photoDB.ashx?" Height="50px" runat="server" />
                                                </ItemTemplate>
                                                
                                                <ItemStyle Width=100px />
                                                
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Файл" SortExpression="fileNames">
                                                <ItemTemplate>
                                                    <asp:ImageButton Visible="true" ID="ImageButtonFiles" AlternateText='<%# Bind("fileNames") %>'
                                                        CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("items") %>'
                                                        ImageUrl="~/images/22х22/filesave.png" runat="server" />
                                                        
                                                     <asp:HyperLink ID="HyperLinkItemFilePath" runat=server NavigateUrl='<%# Bind("filePath") %>' Text='<%# Bind("fileNames") %>'></asp:HyperLink>
                                                      
                                                     <asp:Label Visible=false ID="LabelItemFileGUIDNames" runat="server" Text='<%# Bind("fileGUIDNames") %>'></asp:Label>   
                                                     <asp:Label Visible=false ID="Label5" runat="server" Text='<%# Bind("date_news") %>'></asp:Label>
                                                     <asp:Label Visible=false ID="Label6" runat="server" Text='<%# Bind("time_news") %>'></asp:Label>
                                                     <asp:CheckBox Visible=false ID="CheckBox1" runat="server" Checked='<%# Bind("have_file") %>' Enabled="false" />
                                                     <asp:CheckBox Visible=false ID="CheckBoxItemhave_images" runat="server" Checked='<%# Bind("have_images") %>' Enabled="false" />
                                                                                                      
                                                        <asp:Label Visible=false ID="Label1" runat="server" Text='<%# Bind("id_news") %>'></asp:Label>
                                                        
                                                </ItemTemplate>
                                                <ItemStyle Width=100% />
                                            </asp:TemplateField>
                                            
                                        </Columns>
                                    </asp:GridView>
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
                        ondeleted="SqlDataSourceNews_Deleted">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="01.01.1901" Name="begin_date" Type="String" />
                            <asp:Parameter DefaultValue="01.01.1901" Name="end_date" Type="String" />
                            <asp:Parameter DefaultValue="5" Name="items" Type="String" />
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
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
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
