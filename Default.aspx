<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="UC/banner_work.ascx" TagName="banner_work" TagPrefix="uc4" %>
<%@ Register Src="UC/footer.ascx" TagName="footer" TagPrefix="uc3" %>
<%@ Register Src="UC/banner.ascx" TagName="banner" TagPrefix="uc2" %>
<%@ Register Src="UC/menu_vert.ascx" TagName="menu_vert" TagPrefix="uc1" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>
<%@ Register Src="UC/right_col.ascx" TagName="right_col" TagPrefix="uc5" %>
<%@ Register Src="UC/uc_organiser.ascx" TagName="uc_organiser" TagPrefix="uc6" %>

<%@ Register Src="~/UC/Events_timer2.ascx" TagPrefix="uc1" TagName="Events_timer2" %>


<%@ Register Src="UC/news_civil.ascx" TagName="news_civil" TagPrefix="uc8" %>
<%@ Register Src="~/UC/banner_work.ascx" TagPrefix="uc1" TagName="banner_work" %>


<!DOCTYPE html PUBLIC>
<style>
    span#newyear {
        font-family: Tahoma;
        font-size: 14px;
        font-weight: normal;
        color: #990000;
        font-weight: bold;
    }
</style>

<link rel="shrtcut icon" href="images/FKPR.ico" />
<link href="portalFGU59.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/bootstrap-fgu59.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Портал КП по Московской области</title>

    <script src="css/bootstrap5/js/bootstrap.min.js"></script>

    <link href="css/bootstrap5/css/bootstrap.min.css" rel="stylesheet" />


    <link href="css/font-awesome.min.css" rel="stylesheet" />

    <link href="css/bootstrap-fgu59.css" rel="stylesheet" />
</head>
<body leftmargin="0" topmargin="0" bgcolor="#1E5A92">
    <form id="form1" runat="server">

        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="font-size: 12px; text-align: center; color: Purple">
            <tr>
                <td height="123" bgcolor="#1E5A92" align="left" valign="top">

                    <uc2:banner ID="Banner1" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="28" bgcolor="#85A4C3" align="center" valign="middle">
                    <uc1:banner_work runat="server" id="banner_work" header="Основная страница портала ФИЛИАЛА" />
                </td>
            </tr>
            <tr>
                <td height="7" background="images/background1.gif"></td>
            </tr>

            <tr>
                <td height="594px" bgcolor="white">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td width="234px" align="left" valign="top" height="594px">
                                <div class="posMenu">
                                    <uc1:menu_vert ID="Menu_vert1" runat="server" />
                                </div>
                            </td>
                            <td width="1px" bgcolor="#85A4C3">
                                <img src="images/point.gif" /></td>
                            <td width="100%" valign="top" align="left">
                                <div class="posForm">
                                    <div id="bottom_base_text" style="width: 100%;">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                      


                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                                                        SelectCommand="SELECT  count(*) C ,  CONVERT(date, date_contract, 104) DATED
  FROM[portalFGU59].[dbo].[Reception_applications]
  where(CONVERT(date, date_contract, 104) BETWEEN CONVERT(date, DATEADD(day,-5, GETDATE()), 104) AND CONVERT(date, DATEADD(day,-1, GETDATE()), 104))
  group by CONVERT(date, date_contract, 104)
  order by 1 desc"></asp:SqlDataSource>

                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                   


                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                                                        SelectCommand="SELECT  count(*) C ,  CONVERT(date, date_consult, 104) DATED
  FROM[portalFGU59].[dbo].Paid_consult
  where(CONVERT(date, date_consult, 104) BETWEEN CONVERT(date, DATEADD(day,-5, GETDATE()), 104) AND CONVERT(date, DATEADD(day,-1, GETDATE()), 104))
  group by CONVERT(date, date_consult, 104)
  order by 1 desc"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>



                                        <div style="clear: both">
                                            <div style="margin-bottom: 20px">
                                                <asp:Label ID="Label2" runat="server" Text="Производственные новости" CssClass="headerRazdel"></asp:Label>
                                            </div>

                                        </div>
                                        <br />
                                        <asp:GridView ID="GridView2" runat="server" Width="100%" AutoGenerateColumns="False"
                                            DataKeyNames="id_news" PagerSettings-Mode="Numeric" AllowPaging="True" DataSourceID="SqlDataSourceNewsProduction"
                                            GridLines="None" ShowHeader="False" CssClass="formText4" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                                                                <tr height="10px">
                                                                    <td>
                                                                        <div style="float: left; margin-right: 10px">
                                                                            <asp:Label ID="Label3" runat="server" CssClass="textDate" Text='<%# Bind("date_news") %>'></asp:Label>
                                                                        </div>
                                                                        <div>
                                                                            <asp:Label ID="Label1" runat="server" CssClass="headerText2" Text='<%# Bind("header_news") %>'></asp:Label>
                                                                        </div>
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

                                                                                    <asp:Label ID="LabelItemText_news" runat="server" CssClass="snippet-text" Text='<%# Bind("text_news") %>'></asp:Label><%--CssClass="formText"--%>

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
                                                                    <td>

                                                                        <asp:Label ID="LabelItemFiles" CssClass="formText" Text="скачать вложение: " runat="server"></asp:Label>
                                                                        <asp:ImageButton Visible="false" ID="ImageButtonFiles" CausesValidation="False" CommandName="Select"
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
                                                                    <td align="right">
                                                                        <div class="textAvtor">
                                                                            <label>Время размещения: </label>
                                                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("time_news") %>'></asp:Label>
                                                                            <label>Автор новости:</label>
                                                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                                                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                                                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("middle_name") %>'></asp:Label><br />
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
                                    <div id="top_base_text" style="width: 100%;">
                                        <div style="margin-bottom: 20px">
                                            <asp:Label ID="headerRazdel" runat="server" Text="Поздравления" CssClass="headerRazdel"></asp:Label>
                                        </div>
                                            <ContentTemplate>
                                                <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                                                    DataKeyNames="id_news" PagerSettings-Mode="Numeric" AllowPaging="True" DataSourceID="SqlDataSourceNews"
                                                    GridLines="None" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                                                                <div id="input_border">
                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                        <tr>
                                                                            <td height="10px">
                                                                                <div style="float: left; margin-right: 10px">
                                                                                    <asp:Label ID="Label3" runat="server" CssClass="textDate" Text='<%# Bind("date_news") %>'></asp:Label>
                                                                                </div>
                                                                                <div>
                                                                                    <asp:Label ID="Label9" runat="server" CssClass="headerText2" Text='<%# Bind("header_news") %>'></asp:Label>
                                                                                </div>

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
                                                                                            <asp:Label ID="LabelItemText_news" runat="server" CssClass="formText" Text='<%# Bind("text_news") %>'></asp:Label>
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
                                                                            <td align="right">
                                                                                <div class="textAvtor">
                                                                                    Автор новости:
                                                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("middle_name") %>'></asp:Label>

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
                                            </ContentTemplate>
                                      
                                    </div>
                                    <div style="clear: both"></div>
                                </div>
                                </div>
                            </td>
                            <td width="350px" valign="top" align="left" bgcolor="#F9F9F9">
                                <div class="posForm">
                                    <div style="margin-bottom: 15px">
                                        <hr />
                                        <uc6:uc_organiser ID="uc_organiser1" runat="server" />
                                        <br />
                                        <br />
                                        <uc1:Events_timer2 runat="server" ID="Events_timer2" />
                                        <uc8:news_civil ID="news_civil1" runat="server" />


                                    </div>
                                    <div class="hr">
                                        <hr />
                                    </div>
                                    <div style="margin-bottom: 15px">
                                        <asp:Label ID="Label11" runat="server" Text="Календарь событий" CssClass="headerRazdel"></asp:Label>
                                    </div>
                                    <div class="formText4">
                                        Для выборки новостей за определенную дату - нажмите на день календаря
                                    </div>
                                    <div style="margin-bottom: 15px; margin-top: 10px">
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                            BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                            ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" OnDayRender="Calendar1_DayRender"
                                            OnSelectionChanged="Calendar1_SelectionChanged">
                                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                            <SelectorStyle BackColor="#FFCC66" />
                                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                            <OtherMonthDayStyle ForeColor="#CC9966" />
                                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                        </asp:Calendar>
                                    </div>
                                    <div class="hr">
                                        <hr />
                                    </div>
                                    <uc5:right_col ID="right_col1" runat="server" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="28px" bgcolor="#85A4C3">
                    <uc3:footer ID="Footer1" runat="server" />

                </td>
            </tr>
            <tr>
                <td height="6px" background="images/background2.gif"></td>
            </tr>
            <tr>
                <td bgcolor="#1E5A92" style="height: 32px"></td>
            </tr>

        </table>
        <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="NewsDelete" DeleteCommandType="StoredProcedure" SelectCommand="NewsSelectItems"
            SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_news" Type="Int32" />
                <asp:Parameter Name="items" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="01.01.1901" Name="begin_date" SessionField="begin_dateNews"
                    Type="String" />
                <asp:SessionParameter DefaultValue="01.01.1901" Name="end_date" SessionField="end_dateNews"
                    Type="String" />
                <asp:Parameter DefaultValue="1" Name="items" Type="String" />
                <asp:Parameter DefaultValue="10" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceNewsProduction" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="NewsDelete" DeleteCommandType="StoredProcedure" SelectCommand="NewsSelectItems"
            SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_news" Type="Int32" />
                <asp:Parameter Name="items" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="01.01.1901" Name="begin_date" SessionField="begin_dateNews"
                    Type="String" />
                <asp:SessionParameter DefaultValue="01.01.1901" Name="end_date" SessionField="end_dateNews"
                    Type="String" />
                <asp:Parameter DefaultValue="7" Name="items" Type="String" />
                <asp:Parameter DefaultValue="10" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;<br />
    </form>
</body>
</html>
