<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="organizer.aspx.cs" Inherits="filial" %>

<%@ Register Assembly="EventCalendar" Namespace="ExtendedControls" TagPrefix="cc1" %>

<%@ Register Src="UC/banner.ascx" TagName="banner" TagPrefix="uc2" %>

<%@ Register Src="UC/menu_vert.ascx" TagName="menu_vert" TagPrefix="uc1" %>

<%@ Register src="UC/banner_work.ascx" tagname="banner_work" tagprefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="portalFGU59.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Портал ФГУ ЗКП по Пермскому краю-планирование</title>
</head>
<body leftmargin=0 topmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
    
    <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="123" bgcolor="#1E5A92" align=left valign=top>
           
                <uc2:banner ID="Banner1" runat="server" />
            </td>
        </tr>
        <tr><td height="28" bgcolor="#9999CC" align=center valign=middle>
        
            <uc3:banner_work ID="banner_work1" header="Портал филиала ФГБУ 'ФКП Росреестра' по Пермскому краю" runat="server" />
        
        </td></tr>
        <tr><td height="7" background="images/background1.gif"></td></tr>
       
        <tr><td height=594px bgcolor=white>
        <table cellpadding=0 cellspacing=0 border=0 width=100%>
                <tr>
                    <td width=15% align=left valign=top height=594px>
                    <div class="posMenu">
                        <uc1:menu_vert ID="Menu_vert1" runat="server" />
                       </div>
                    </td>
                    <td width=1px bgcolor="#85A4C3"><img src="images/point.gif" /></td>
                    <td width=85% valign=top align=left>
                    <div style="margin-left:20px; margin-top:20px; margin-right:20px;">
                        <cc1:eventcalendar ID="Calendar1" runat="server" BackColor="#FDFDD8" BorderColor="#FFCC66"
                        BorderWidth="1px" Font-Names="Verdana"
                        Font-Size="10pt" ForeColor="Black" Height="700px"
                        Width="100%" FirstDayOfWeek="Monday" NextMonthText="Next &gt;" 
                        PrevMonthText="&lt; Prev" SelectionMode="DayWeekMonth" ShowGridLines="True" 
                        NextPrevFormat="ShortMonth" 
                        ShowDescriptionAsToolTip="True" BorderStyle="Solid" EventDateColumnName="" 
                        EventDescriptionColumnName="" EventHeaderColumnName="" 
                        OnSelectionChanged="Calendar1_SelectionChanged">

                        <DayStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                        <DayHeaderStyle Font-Bold="True" BackColor="#FFCC66" Font-Size="12pt" BorderColor=White Height=40px />

                        <SelectedDayStyle BackColor="#CCCCFF" ForeColor="White" />
                        <TodayDayStyle BackColor="#FFCC66" />
                        <SelectorStyle BackColor="#FFFFCC"  />
                        <OtherMonthDayStyle  ForeColor="#999999"  Font-Size="8pt" />
                        <NextPrevStyle Font-Size="10pt" ForeColor="#FFFFCC" Font-Bold="True" VerticalAlign="Bottom" />
                        
                        <WeekendDayStyle BackColor="#FFFFCC" ForeColor="#CC9966" />
                                           
                        <TitleStyle BackColor="#990000" BorderColor="#FFCC66" BorderWidth="1px" Font-Bold="True" Height=40px
                            Font-Size="12pt" ForeColor="#FFFFCC" HorizontalAlign="Center" VerticalAlign="Middle" />
                        
                        </cc1:eventcalendar>
                        <asp:GridView ID="gvSelectedDateEvents" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" >
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_organiser"
                            ForeColor="#333333" GridLines="None" PageSize="25">
                            <FooterStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" CssClass="textGridView2" ForeColor="#333333" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:TemplateField HeaderText="id_organiser" InsertVisible="False" SortExpression="id_organiser"
                                    Visible="False">
                                  
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_organiser") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="id_sotrudnik" SortExpression="id_sotrudnik" Visible="False">
                                    
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_sotrudnik") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Дата события" SortExpression="date_events">
                                   
                                    <ItemTemplate>
                                        <asp:Label ID="LabelItemDate_events" runat="server" Text='<%# Bind("date_events") %>' Width="100"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Заголовок события" SortExpression="name_events">
                                   
                                    <ItemTemplate>
                                        <asp:Label ID="LabelItemName_events" runat="server" Text='<%# Bind("name_events") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Описание события" SortExpression="description_events">
                                   
                                    <ItemTemplate>
                                        <asp:Label ID="LabelItemDescription_events" runat="server" Text='<%# Bind("description_events") %>' Width="500"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Статус" SortExpression="status" Visible="False">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("status") %>' Enabled="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView></div>
                        
                    </td>
                </tr>
            </table>
            </td></tr>
        <tr><td height=28px bgcolor="#85A4C3"></td></tr>
        <tr><td height=6px background="images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92"></td></tr>
       
    </table>
        <asp:SqlDataSource ID="SqlDataSourceFilial" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="FilialDelete" DeleteCommandType="StoredProcedure" InsertCommand="OtdelInsert"
            InsertCommandType="StoredProcedure" SelectCommand="FilialSelect" SelectCommandType="StoredProcedure"
            UpdateCommand="FilialUpdate" UpdateCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="name_otdel" Type="String" />
                <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                <asp:Parameter Name="count_otdel_real" Type="Int32" />
            </InsertParameters>
            <DeleteParameters>
                <asp:Parameter Name="id_filial" Type="Int32" />
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
            </UpdateParameters>
        </asp:SqlDataSource>
    
    
    </form>
</body>
</html>
