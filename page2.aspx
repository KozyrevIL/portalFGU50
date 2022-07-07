<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="page2.aspx.cs"  Inherits="_Default" %>

<%@ Register Src="UC/banner_work.ascx" TagName="banner_work" TagPrefix="uc4" %>

<%@ Register Src="UC/footer.ascx" TagName="footer" TagPrefix="uc3" %>

<%@ Register Src="UC/banner.ascx" TagName="banner" TagPrefix="uc2" %>







<%@ Register src="UC/menu_vert.ascx" tagname="menu_vert" tagprefix="uc1" %>







<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="portalFGU59.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Сайт ФГУ ЗКП по Пермскому краю</title>
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
                    <td width=20% align=left valign=top height=594px>
                    <div class="posMenu">
                        <uc1:menu_vert ID="menu_vert1" runat="server" />
                        
                        
                       
                            
                       </div>
                    </td>
                    <td width=1px bgcolor="#85A4C3"><img src="images/point.gif" /></td>
                    <td width=55% valign=top align=left>
                    <div class="posForm">
                        <div style="margin-bottom:20px">
                        <asp:Label ID="headerRazdel" runat=server Text="Новости" CssClass="headerRazdel"></asp:Label></div>
                       
                        <asp:GridView ID="GridView1" runat="server" Width=100% 
                            AutoGenerateColumns="False" DataKeyNames="id_news" PagerSettings-Mode=Numeric 
                            AllowPaging=True GridLines="None" ShowHeader="False" 
                            OnRowDataBound="GridView1_RowDataBound" 
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                            DataSourceID="SqlDataSourceId_news">
                            <Columns>
                                
                                <asp:TemplateField HeaderText="id_news" InsertVisible="False" 
                                    SortExpression="id_news" Visible="False">
                                   
                                    <ItemTemplate>
                                   
                                            <asp:Label ID="LabelItemId_news" runat="server" Text='<%# Bind("id_news") %>'></asp:Label>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:TemplateField HeaderText="prioritet_news" SortExpression="prioritet_news" 
                                    Visible="False">
                                  
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("prioritet_news") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="header_news" SortExpression="header_news">
                                   
                                    <ItemTemplate>
                                        
                                        <table cellpadding=0 cellspacing=0 border=0 width=100%>
                                            <tr height=20px>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" CssClass="textDate" Text='<%# Bind("date_news") %>'></asp:Label><br />
                                                    <asp:Label ID="Label9" runat="server" CssClass="textDate" Text='<%# Bind("time_news") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr height=30px>
                                                <td><asp:Label ID="Label1" runat="server" CssClass="headerText2" Text='<%# Bind("header_news") %>'></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td align=left valign=top>
                                                    <asp:Label ID="LabelItemItems" runat="server" Visible=false CssClass="formText" Text='<%# Bind("items") %>'></asp:Label>
                                                    <asp:CheckBox ID="CheckBoxItemHave_images" runat="server" Checked='<%# Bind("have_images") %>' Visible=false Enabled="false" />
                                                    <table cellpadding=5px cellspacing=0 width=100%>
                                                        <tr>
                                                            <td width=100% align=left valign=top>
                                                                <asp:Label ID="Label2" runat="server" CssClass="formText" Text='<%# Bind("text_news") %>'></asp:Label>
                                                            </td>
                                                            <td width=234px align=right valign=top>
                                                                <asp:Image ID="ImageItemNews" Width=234 runat="server"></asp:Image>
                                                            </td>
                                                            
                                                            
                                                        </tr>
                                                    </table>
                                                    
                                                    
                                                    
                                                </td>
                                             </tr>
                                             <tr>
                                                <td height=10px></td>
                                             </tr>
                                            
                                              <tr>
                                                <td height=10px></td>
                                             </tr>
                                            <tr>
                                                <td  align=right>
                                                    
                                                 </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                
                                <asp:TemplateField HeaderText="have_images" SortExpression="have_images" Visible="False">
                                   
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("have_images") %>'
                                            Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="type_news" SortExpression="type_news" 
                                    Visible="False">
                                   
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("type_news") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        
                       <br /><br />
                        
                      </div>
                    </td>
                    <td width=25% valign=top align=left bgcolor="#F9F9F9">
                    <div class="posForm">
                        <div style="margin-bottom:20px">
                            <asp:Label ID="Label11" runat=server Text="Календарь событий" CssClass="headerRazdel"></asp:Label><br /><br />
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">
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
                <uc3:footer ID="footer1" runat="server" />
                
            </td>
        </tr>
        <tr><td height=6px background="images/background2.gif"></td></tr>
        <tr><td bgcolor="#1E5A92" style="height: 32px"></td></tr>
       
    </table>
        &nbsp;<br />
    
    
    <asp:SqlDataSource ID="SqlDataSourceId_news" runat="server" 
        ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
        SelectCommand="NewsSelectForId" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="id_news" QueryStringField="id_news" 
                Type="String" DefaultValue="" />
            
           
        </SelectParameters>
    </asp:SqlDataSource>
    
    
    </form>
</body>
</html>
