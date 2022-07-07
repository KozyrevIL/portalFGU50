<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="news_zakon.aspx.cs"  Inherits="_Default" %>

<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>

<%@ Register Src="UC/banner_work.ascx" TagName="banner_work" TagPrefix="uc4" %>

<%@ Register Src="UC/footer.ascx" TagName="footer" TagPrefix="uc3" %>

<%@ Register Src="UC/banner.ascx" TagName="banner" TagPrefix="uc2" %>







<%@ Register src="UC/menu_vert.ascx" tagname="menu_vert" tagprefix="uc6" %>
<%@ Register src="UC/right_col.ascx" tagname="right_col" tagprefix="uc7" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="portalFGU59.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Сайт филиала ФГБУ «ФКП Росреестра» по Пермскому краю</title>
</head>
<body leftmargin=0 topmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
    
    <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="123" bgcolor="#1E5A92" align=left valign=top>
           
                <uc2:banner ID="banner1" runat="server" />
            </td>
        </tr>
        <tr>
            <td height="28" bgcolor="#85A4C3" align=center valign=middle>
                &nbsp;</td>
        </tr>
        <tr><td height="7" background="images/background1.gif"></td></tr>
       
        <tr><td height=594px bgcolor=white>
        <table cellpadding=0 cellspacing=0 border=0 width=100%>
                <tr>
                    <td width=234px align=left valign=top height=594px>
                    <div class="posMenu">
                        <uc6:menu_vert ID="menu_vert1" runat="server" />
                        
                        
                       
                            
                       </div>
                    </td>
                    <td width=1px bgcolor="#85A4C3"><img src="images/point.gif" /></td>
                    <td width=100% valign=top align=left>
                        <div class="posForm">
                            <div id="bottom_base_text" style="width: 100%;">
                                <div style="margin-bottom: 20px">
                                    <asp:Label ID="Label2" runat="server" Text="Законодательство" CssClass="headerRazdel"></asp:Label>
                                </div>
                                <asp:GridView ID="GridView2" runat="server" Width="100%" AutoGenerateColumns="False"
                                    DataKeyNames="id_news" PagerSettings-Mode="Numeric" AllowPaging="false" DataSourceID="SqlDataSourceNews"
                                    GridLines="None" ShowHeader="False" 
                                    OnRowDataBound="GridView1_RowDataBound" 
                                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="50">
                                    <Columns>
                                        <asp:TemplateField HeaderText="id_news" InsertVisible="False" SortExpression="id_news"
                                            Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="LabelItemId_news" runat="server" Text='<%# Bind("id_news") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_news") %>'></asp:Label>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id_sotrudnik" HeaderText="id_sotrudnik" SortExpression="id_sotrudnik"
                                            Visible="False" />
                                        <asp:BoundField DataField="prioritet_news" HeaderText="prioritet_news" SortExpression="prioritet_news"
                                            Visible="False" />
                                        <asp:TemplateField HeaderText="header_news" SortExpression="header_news">
                                            <ItemTemplate>
                                                <div id="border_type5">
                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                        <tr height="20px">
                                                            <td>
                                                                <asp:Label ID="Label3" runat="server" CssClass="textDate" Text='<%# Bind("date_news") %>'></asp:Label><br />
                                                                <asp:Label ID="Label9" runat="server" CssClass="textDate" Text='<%# Bind("time_news") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr height="30px">
                                                            <td>
                                                                <asp:Label ID="Label1" runat="server" CssClass="headerText2" Text='<%# Bind("header_news") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top">
                                                                <asp:Label ID="LabelItemItems" runat="server" Visible="false" CssClass="formText"
                                                                    Text='<%# Bind("items") %>'></asp:Label>
                                                                <asp:CheckBox ID="CheckBoxItemHave_images" runat="server" Checked='<%# Bind("have_images") %>'
                                                                    Visible="false" Enabled="false" />
                                                                <table cellpadding="5px" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td width="100%" align="left" valign="top">
                                                                            <asp:HyperLink ID="HyperLinkItemText_news" CssClass="text_links" runat="server" NavigateUrl="#">
                                                                                <asp:Label ID="LabelItemText_news" runat="server" CssClass="formText" Text='<%# Bind("text_news") %>'></asp:Label>
                                                                            </asp:HyperLink>
                                                                        </td>
                                                                        <td width="234px" align="right" valign="top">
                                                                            <asp:HyperLink ID="HyperLinkItemText_news_img" runat="server" NavigateUrl="#">
                                                                                <cc1:HighslideImage ID="ImageItemNews" Width="140px" runat="server" />
                                                                                <cc1:HighslideManager ID="HighslideManager1" runat="server">
                                                                                </cc1:HighslideManager>
                                                                            </asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="10px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="10px">
                                                                <asp:Label ID="LabelItemFiles" CssClass="formText" Text="скачать вложение: " runat="server"></asp:Label>
                                                                <asp:ImageButton Visible="true" ID="ImageButtonFiles" CausesValidation="False" CommandName="Select"
                                                                    AlternateText='<%# Bind("fileNames") %>' CommandArgument='<%# Bind("fileNames") %>'
                                                                    ImageUrl="~/images/22х22/filesave.png" runat="server" />
                                                                <asp:HyperLink ID="HyperLinkItemFilePath" runat="server" NavigateUrl='<%# Bind("filePath") %>'
                                                                    Text='<%# Bind("fileNames") %>'></asp:HyperLink>
                                                                <asp:Label ID="LabelItemFilePath" runat="server" Visible="false" CssClass="formText"
                                                                    Text='<%# Bind("filePath") %>'></asp:Label>
                                                                <asp:Label ID="LabelItemFileType" runat="server" Visible="false" CssClass="formText"
                                                                    Text='<%# Bind("fileType") %>'></asp:Label>
                                                                <asp:Label ID="LabelItemFileNames" runat="server" Visible="false" CssClass="formText"
                                                                    Text='<%# Bind("fileNames") %>'></asp:Label>
                                                                <asp:Label ID="LabelItemFileLength" runat="server" Visible="false" CssClass="formText"
                                                                    Text='<%# Bind("fileLength") %>'></asp:Label>
                                                                <asp:Label Visible="false" ID="LabelItemFileGUIDNames" runat="server" Text='<%# Bind("fileGUIDNames") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="10px">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <div class="textAvtor">
                                                                    Автор новости:
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("middle_name") %>'></asp:Label><br />
                                                                    подразделение:
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("name_otdel") %>'></asp:Label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="have_file" SortExpression="have_file" Visible="False">
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("have_file") %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBoxHave_file" runat="server" Checked='<%# Bind("have_file") %>'
                                                    Enabled="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="path_file" SortExpression="path_file" Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("path_file") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("path_file") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="have_images" SortExpression="have_images" Visible="False">
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("have_images") %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("have_images") %>'
                                                    Enabled="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="type_news" HeaderText="type_news" SortExpression="type_news"
                                            Visible="False" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </td>
                    
                    
                </tr>
            </table>
            </td></tr>
        <tr>
            <td height=28px bgcolor="#85A4C3">
                <uc3:footer ID="footer1" runat="server" />
                
            </td>
        </tr>
        <tr><td height=6px background="images/background2.gif"></td></tr>
        <tr><td bgcolor="#1E5A92" style="height: 32px"></td></tr>
       
    </table>
        &nbsp;<br />
    
    
        <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="NewsDelete" DeleteCommandType="StoredProcedure" SelectCommand="NewsSelectItems"
            SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_news" Type="Int32" />
                <asp:Parameter Name="items" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="01.01.1901" Name="begin_date" Type="String" />
                <asp:Parameter DefaultValue="01.01.1901" Name="end_date" Type="String" />
                <asp:Parameter DefaultValue="9" Name="items" Type="String" />
                <asp:Parameter DefaultValue="100" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    
    </form>
</body>
</html>
