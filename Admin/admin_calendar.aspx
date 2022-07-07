<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="admin_calendar.aspx.cs" Inherits="Admin_admin_news" %>

<%@ Register Src="../UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Администрирование НОВОСТИ</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="47">
                <uc2:admin_banner header="Добавление новостей" ID="Admin_banner1" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td align=left valign=top bgcolor=white style="height: 584px">
            <table cellpadding=0 cellspacing=0 border=1 >
                <tr>
                    <td width=20% align=left valign=top>
                        <uc1:menu_admin_vert ID="Menu_admin_vert1" runat="server" />
                    </td>
                    <td width=80% valign=top align=left>
                    <div class="posForm">
                        <table id="TableCurrentYear" cellpadding=3 cellspacing=0  class="formText">
                            <tr>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar01" runat="server" 
                                        onselectionchanged="Calendar1_SelectionChanged" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar01_DayRender" >
                                            <WeekendDayStyle BackColor="#FFFFCC" />
                                            <TodayDayStyle BackColor="#FFCC66" />
                                            <OtherMonthDayStyle ForeColor="White" />
                                            <DayHeaderStyle BackColor="#CCFF99" />
                                        </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar02" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar02_DayRender" 
                                        onselectionchanged="Calendar02_SelectionChanged">
                                        <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar03" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar03_DayRender" 
                                        onselectionchanged="Calendar03_SelectionChanged">
                                        <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar04" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar04_DayRender" 
                                        onselectionchanged="Calendar04_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    &nbsp;</td>
                            </tr>
                             <tr>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar05" runat="server"  
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar05_DayRender" 
                                        onselectionchanged="Calendar05_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                 </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar06" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar06_DayRender" 
                                        onselectionchanged="Calendar06_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                 </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar07" runat="server"  
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar07_DayRender" 
                                        onselectionchanged="Calendar07_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                 </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar08" runat="server" 
                                        onselectionchanged="Calendar08_SelectionChanged"  
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar08_DayRender">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                 </td>
                                <td align=left valign=top>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar09" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar09_DayRender" 
                                        onselectionchanged="Calendar09_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar10" runat="server"  
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar10_DayRender" 
                                        onselectionchanged="Calendar10_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar11" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar11_DayRender" 
                                        onselectionchanged="Calendar11_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar12" runat="server"  
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar12_DayRender" 
                                        onselectionchanged="Calendar12_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    &nbsp;</td>
                            </tr>
                            
                           
                        </table>
                      </div>
                        <div class="posForm">
                        <table id="TableNewYear" cellpadding=3 cellspacing=0  class="formText">
                            <tr>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar13" runat="server" 
                                        onselectionchanged="Calendar13_SelectionChanged" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar13_DayRender" >
                                            <WeekendDayStyle BackColor="#FFFFCC" />
                                            <TodayDayStyle BackColor="#FFCC66" />
                                            <OtherMonthDayStyle ForeColor="White" />
                                            <DayHeaderStyle BackColor="#CCFF99" />
                                        </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar14" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar14_DayRender" 
                                        onselectionchanged="Calendar14_SelectionChanged">
                                        <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar15" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar15_DayRender" 
                                        onselectionchanged="Calendar15_SelectionChanged">
                                        <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar16" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar16_DayRender" 
                                        onselectionchanged="Calendar16_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    &nbsp;</td>
                            </tr>
                             <tr>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar17" runat="server"  
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar17_DayRender" 
                                        onselectionchanged="Calendar17_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                 </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar18" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar18_DayRender" 
                                        onselectionchanged="Calendar18_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                 </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar19" runat="server"  
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar19_DayRender" 
                                        onselectionchanged="Calendar19_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                        <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                 </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar20" runat="server" 
                                        onselectionchanged="Calendar20_SelectionChanged"  
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar20_DayRender">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                 </td>
                                <td align=left valign=top>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar21" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar21_DayRender" 
                                        onselectionchanged="Calendar21_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar22" runat="server"  
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar22_DayRender" 
                                        onselectionchanged="Calendar22_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar23" runat="server" 
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar23_DayRender" 
                                        onselectionchanged="Calendar23_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    <asp:Calendar ID="Calendar24" runat="server"  
                                        ShowGridLines="True" ShowNextPrevMonth="False" 
                                        ondayrender="Calendar24_DayRender" 
                                        onselectionchanged="Calendar24_SelectionChanged">
                                    <WeekendDayStyle BackColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="White" />
                                        <DayHeaderStyle BackColor="#CCFF99" />
                                        <TodayDayStyle BackColor="#FFCC66" />
                                    </asp:Calendar>
                                </td>
                                <td align=left valign=top>
                                    &nbsp;</td>
                            </tr>
                            
                           
                        </table>
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
                </asp:SqlDataSource>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                &nbsp;&nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSourceAds" runat="server" 
                ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                DeleteCommand="NewsDelete" DeleteCommandType="StoredProcedure" 
                SelectCommand="NewsSelectForTypeNews" SelectCommandType="StoredProcedure" 
                UpdateCommand="NewsUpdate" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="id_news" Type="Int32" />
                    <asp:Parameter Name="items" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_news" Type="Int32" />
                    <asp:Parameter Name="header_news" Type="String" />
                    <asp:Parameter Name="text_news" Type="String" />
                    <asp:Parameter Name="date_news" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
                </td>
        </tr>
     
        <tr><td height=28px bgcolor="#85A4C3">
            <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" 
                ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                DeleteCommand="NewsDelete" DeleteCommandType="StoredProcedure" 
                SelectCommand="NewsSelect" SelectCommandType="StoredProcedure" 
                UpdateCommand="NewsUpdate" UpdateCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter DefaultValue="01.01.2011" Name="begin_date" Type="String" />
                    <asp:Parameter DefaultValue="31.12.2011" Name="end_date" Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="id_news" Type="Int32" />
                    <asp:Parameter Name="items" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_news" Type="Int32" />
                    <asp:Parameter Name="header_news" Type="String" />
                    <asp:Parameter Name="text_news" Type="String" />
                    <asp:Parameter Name="date_news" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </td></tr>
        <tr><td height=6px background="../images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92"></td></tr>
    </table>
    
    </form>
</body>
</html>
