<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="news_arhiv.aspx.cs"  Inherits="_Default" %>

<%@ Register Src="UC/banner_work.ascx" TagName="banner_work" TagPrefix="uc4" %>

<%@ Register Src="UC/footer.ascx" TagName="footer" TagPrefix="uc3" %>

<%@ Register Src="UC/banner.ascx" TagName="banner" TagPrefix="uc2" %>

<%@ Register Src="UC/menu_vert.ascx" TagName="menu_vert" TagPrefix="uc1" %>

<%@ Register assembly="HighslideImage" namespace="Encosia" tagprefix="cc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="portalFGU59.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Портал ФГУ ЗКП по Пермскому краю</title>
</head>
<body leftmargin=0 topmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
    
    <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="123" bgcolor="#1E5A92" align=left valign=top>
           
                <uc2:banner ID="Banner1" header="Портал филиала ФГБУ 'ФКП Росреестра' по Пермскому краю" runat="server" />
            </td>
        </tr>
        <tr>
            <td height="28" bgcolor="#85A4C3" align=center valign=middle>
                <uc4:banner_work ID="Banner_work1" runat="server" />
            </td>
        </tr>
        <tr><td height="7" background="images/background1.gif"></td></tr>
       
        <tr><td height=594px bgcolor=white>
        <table cellpadding=0 cellspacing=0 border=0 width=100%>
                <tr>
                    <td width=20% align=left valign=top height=594px>
                    <div class="posMenu">
                        <uc1:menu_vert ID="Menu_vert1" runat="server" />
                       </div>
                    </td>
                    <td width=1px bgcolor="#85A4C3"><img src="images/point.gif" /></td>
                    <td width=55% valign=top align=left>
                    <div class="posForm">
                        <div style="margin-bottom:20px"><asp:Label ID="headerRazdel" runat=server Text="Новости" CssClass="headerRazdel"></asp:Label></div>
                        <TABLE borderColor=white cellSpacing=0 cellPadding=5 width=700 border=1><TBODY><TR><TD width=100 bgColor=buttonface style="height: 36px">
                            <DIV class="textGridView">Поиск по маске</DIV></TD><TD bgColor=buttonface style="height: 36px" colspan="4"><asp:TextBox id="TextBoxFind" runat="server" Width="476px"></asp:TextBox></TD><TD bgColor=buttonface style="height: 36px" colspan="2"><asp:Button id="ButtonFindDoc" onclick="ButtonFindDoc_Click" runat="server" Text="Поиск"></asp:Button></TD></TR><TR 
height=5><TD>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD width=60></TD></TR></TBODY></TABLE>
                        <asp:GridView ID="GridView1" runat="server" Width=100% AutoGenerateColumns="False" DataKeyNames="id_news" PagerSettings-Mode=Numeric AllowPaging=True
                            DataSourceID="SqlDataSourceNews" GridLines="None" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                
                                <asp:TemplateField HeaderText="id_news" InsertVisible="False" 
                                    SortExpression="id_news" Visible="False">
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
                                                                        <cc1:HighslideImage ID="ImageItemNews" Width="234px" runat="server" />
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
                                                            
                                                        <asp:HyperLink ID="HyperLinkItemFilePath" runat=server NavigateUrl='<%# Bind("filePath") %>' Text='<%# Bind("fileNames") %>'></asp:HyperLink>
                                                        <asp:Label ID="LabelItemFilePath" runat="server" Visible="false" CssClass="formText"
                                                            Text='<%# Bind("filePath") %>'></asp:Label>
                                                        <asp:Label ID="LabelItemFileType" runat="server" Visible="false" CssClass="formText"
                                                            Text='<%# Bind("fileType") %>'></asp:Label>
                                                        <asp:Label ID="LabelItemFileNames" runat="server" Visible="false" CssClass="formText"
                                                            Text='<%# Bind("fileNames") %>'></asp:Label>
                                                        <asp:Label ID="LabelItemFileLength" runat="server" Visible="false" CssClass="formText"
                                                            Text='<%# Bind("fileLength") %>'></asp:Label>
                                                        <asp:Label Visible=false ID="LabelItemFileGUIDNames" runat="server" Text='<%# Bind("fileGUIDNames") %>'></asp:Label> 
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
                                        <asp:CheckBox ID="CheckBoxHave_file" runat="server" Checked='<%# Bind("have_file") %>' Enabled="false" />
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
                    </td>
                    <td width=25% valign=top align=left bgcolor="#F9F9F9">
                    <div class="posForm">
                        <div style="margin-bottom:20px">
                            <asp:Label ID="Label11" runat=server Text="Календарь событий" CssClass="headerRazdel"></asp:Label><br /><br />
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px">
                                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                <SelectorStyle BackColor="#FFCC66" />
                                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                <OtherMonthDayStyle ForeColor="#CC9966" />
                                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                            </asp:Calendar>
                            ...............................................................<br /><br />
                            </div>
                        
                      </div>
                    </td>
                </tr>
            </table>
            </td></tr>
        <tr>
            <td height=28px bgcolor="#85A4C3">
                <uc3:footer ID="Footer1" runat="server" />
                
            </td>
        </tr>
        <tr><td height=6px background="images/background2.gif"></td></tr>
        <tr><td bgcolor="#1E5A92" style="height: 32px"></td></tr>
       
    </table>
        <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="NewsDelete" DeleteCommandType="StoredProcedure" SelectCommand="NewsSelectForMask"
            SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_news" Type="Int32" />
                <asp:Parameter Name="items" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="items" Type="String" />
                <asp:Parameter DefaultValue=" " Name="mask" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;<br />
        <asp:SqlDataSource ID="SqlDataSourceDoc" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="DocDelete" DeleteCommandType="StoredProcedure" SelectCommand="DocSelect"
            SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_doc" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="01.01.1901" Name="begin_date" SessionField="begin_date"
                    Type="String" />
                <asp:SessionParameter DefaultValue="01.01.1901" Name="end_date" SessionField="end_date"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceNews_arhiv" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="NewsDelete" DeleteCommandType="StoredProcedure" SelectCommand="NewsSelectForMask"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxFind" DefaultValue="" Name="mask" PropertyName="Text"
                    Type="String" />
                <asp:Parameter DefaultValue="01.01.1901" Name="begin_date" Type="String" />
                <asp:Parameter DefaultValue="01.01.1901" Name="end_date" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="id_news" Type="Int32" />
                <asp:Parameter Name="items" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
    
    
    </form>
</body>
</html>
