<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="news_doska.aspx.cs"  Inherits="_Default" %>

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
           
                <uc2:banner ID="banner1"  runat="server" />
            </td>
        </tr>
        <tr>
            <td height="28" bgcolor="#85A4C3" align=center valign=middle>
                <uc4:banner_work ID="banner_work1" header="Портал филиала ФГБУ 'ФКП Росреестра' по Пермскому краю" runat="server" />
            </td>
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
                        <div style="margin-bottom:20px">
                        <asp:Label ID="headerRazdel" runat=server Text="Доска почета" CssClass="headerRazdel"></asp:Label></div>
                       
                      
                       
                        <%--<asp:GridView ID="GridView1" runat="server" Width=100% 
                            AutoGenerateColumns="False" DataKeyNames="id_news" PagerSettings-Mode=Numeric AllowPaging=True
                            DataSourceID="SqlDataSourceDoska" GridLines="None" ShowHeader="False" 
                            OnRowDataBound="GridView1_RowDataBound" 
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                                        <table cellpadding=0 cellspacing=0 border=0 width=100%>
                                            <tr height=20px>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" CssClass="textDate" Text='<%# Bind("date_news") %>'></asp:Label><br />
                                                    <asp:Label ID="Label9" runat="server" CssClass="textDate" Text='<%# Bind("time_news") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr height=30px>
                                                <td><asp:Label ID="Label10" runat="server" CssClass="headerText2" 
                                                        Text='<%# Bind("header_news") %>'></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td align=left valign=top>
                                                    <asp:Label ID="LabelItemItems" runat="server" Visible=false CssClass="formText" Text='<%# Bind("items") %>'></asp:Label>
                                                    <asp:CheckBox ID="CheckBoxItemHave_images" runat="server" Checked='<%# Bind("have_images") %>' Visible=false Enabled="false" />

                                                    <table cellpadding=5px cellspacing=0 width=100%>
                                                        <tr>
                                                            <td width=100% align=left valign=top>
                                                            <asp:HyperLink ID="HyperLinkItemText_news" CssClass="text_links" runat=server NavigateUrl="#" >
                                                                <asp:Label ID="LabelItemText_news" runat="server" CssClass="formText" Text='<%# Bind("text_news") %>'></asp:Label>
                                                            </asp:HyperLink>
                                                            </td>
                                                            <td width=234px align=right valign=top>
                                                            <asp:HyperLink ID="HyperLinkItemText_news_img"  runat=server NavigateUrl="#" >
                                                                
                                                                <cc1:HighslideImage ID="ImageItemNews" Width=234px  runat="server" />
                                                                <cc1:HighslideManager ID="HighslideManager1"  runat="server"></cc1:HighslideManager>
                                                             </asp:HyperLink>
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
                                           
                                        </table>
                                        </div>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                            
                                <asp:TemplateField HeaderText="have_images" SortExpression="have_images" Visible="False">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("have_images") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("have_images") %>'
                                            Enabled="false" />
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="type_news" HeaderText="type_news" SortExpression="type_news"
                                    Visible="False" />
                            </Columns>
                        </asp:GridView>--%>
                        
                        
                        <div>

                            <asp:DataList ID="DataListData" runat="server" Width="741px" ShowHeader="False" 
                            ShowFooter="False" DataKeyField="id_news" RepeatDirection="Horizontal"
                            RepeatColumns="4" OnItemDataBound="DataListData_ItemDataBound" 
                            EnableViewState="False" DataSourceID="SqlDataSourceDoska">
                            <ItemTemplate>
                                <div id="input_border1" style="height: 360px; width: 351px; margin: 0px 10px 10px 0px">
                                    <div style="margin-bottom: 5px;  text-align: left; height:19px;overflow: hidden; font-family:Tahoma; font-size:15px; font-weight:bold; color:#1e5a92">
                                        <asp:Label ID="LabelItemHeader_text" runat="server" Text='<%# Bind("header_news") %>'></asp:Label>
                                    </div>
                                     <div style="margin-bottom: 10px;  text-align: left; height:19px;overflow: hidden; font-family:Tahoma; font-size:15px; font-weight:bold; color:#f37844">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("text_news_short") %>'></asp:Label>
                                    </div>
                                    <div style="clear: both">
                                    </div>
                                  <%--  <div style="float: right; margin-bottom: 5px;">
                                        <asp:Label ID="Label5" runat="server" CssClass="textDate"></asp:Label>
                                    </div>
                                    <div style="clear: both">
                                    </div>--%>
                                    <div style="float: left; border: 0px solid #8A8A8A; padding: 1px 1px 1px 1px; margin-right: 10px;
                                        height: 280px; overflow: hidden">
                                     
                                         <asp:HyperLink ID="HyperLinkItemText_news_img"  runat=server NavigateUrl="#" >
                                                                
                                                                <cc1:HighslideImage ID="ImageItemNews" Width=220px  runat="server" />
                                                                <cc1:HighslideManager ID="HighslideManager1"  runat="server"></cc1:HighslideManager>
                                                             </asp:HyperLink>
                                    </div>
                                    <div style="text-align: left">
                                        <div style="height: 130px; overflow: hidden">
                                            <%--<asp:Label ID="LabelItemText_news" runat="server" CssClass="formText" Text='<%# Bind("description_text") %>'></asp:Label>--%>
                                            <asp:HyperLink ID="HyperLinkItemText_news" CssClass="text_links" runat=server NavigateUrl="#" >
                                                                <asp:Label ID="LabelItemText_news" runat="server" CssClass="formText" Text='<%# Bind("text_news") %>' ToolTip='<%# Bind("text_news") %>'></asp:Label>
                                                            </asp:HyperLink>
                                        </div>
                                        <div style="margin-top: 10px;">
                                            <asp:HyperLink ID="HyperLinkReadBase" runat="server" CssClass="text_links" Visible="true"
                                                Text="интервью"></asp:HyperLink>
                                        </div>
                                    </div>
                                    <div style="clear: both">
                                    </div>
                                    <div>
                                        <asp:Label ID="LabelItemHave_img"  runat="server" Text='<%# Bind("have_images") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="LabelItemItems" runat="server"  Text='<%# Bind("items") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="LabelItemId_news" runat="server" Text='<%# Bind("id_news") %>' Visible="false"></asp:Label>
                                        <asp:CheckBox ID="CheckBoxItemHave_images" runat="server" Checked='<%# Bind("have_images") %>' Visible="false"/>
                                        <%--<asp:Label ID="LabelItemBase_text" runat="server" Visible="false" Text='<%# Bind("base_text") %>'></asp:Label>--%>
                                       <%-- <asp:Label ID="LabelItemId_text" runat="server" Visible="false" Text='<%# Bind("id_text") %>'></asp:Label>
                                        <asp:Label ID="LabelItemId_pages" runat="server" Visible="false" Text='<%# Bind("id_pages") %>'></asp:Label>--%>

                                         
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
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
    
    
                    <asp:SqlDataSource ID="SqlDataSourceDoska" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                        SelectCommand="NewsSelectItems" 
        SelectCommandType="StoredProcedure" DeleteCommand="NewsDelete"
                        DeleteCommandType="StoredProcedure" 
        InsertCommand="NewsInsert" InsertCommandType="StoredProcedure" UpdateCommand="NewsUpdateItems" 
                        UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="01.01.1901" Name="begin_date" Type="String" />
                            <asp:Parameter DefaultValue="01.01.1901" Name="end_date" Type="String" />
                            <asp:Parameter DefaultValue="6" Name="items" Type="String" />
                            <asp:Parameter DefaultValue="30" Name="top" Type="Int32" />
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
                        </InsertParameters>
                    </asp:SqlDataSource>
    
    
    </form>
</body>
</html>
