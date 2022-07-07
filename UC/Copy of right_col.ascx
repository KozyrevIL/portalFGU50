<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Copy of right_col.ascx.cs" Inherits="UC_right_col" %>
<div style="margin-bottom:20px">
                        <div style="border-width:1px;border-color:#FFCC66;border-style:solid; background-color:#FFFFCC; text-align:center; width:212px;  padding-left:3px; padding-right:3px; margin-bottom:10px;">
                            <span id="newyear">Отсчет времени</span>
                            <style>span#newyear { font-family:Tahoma; font-size:14px; font-weight:normal; color:#990000;}</style>
                            <span><script type="text/javascript"> 
<!--
function newYearIn()
{
    var days=" дней "
    var now = new Date();
    var newYear = new Date("02,23,2012,00:00:00");
    var totalRemains = (newYear.getTime()-now.getTime());
	//alert(totalRemains);
    if (totalRemains>1)
    {
        var RemainsSec=(parseInt(totalRemains/1000));
          var RemainsFullDays=(parseInt(RemainsSec/(24*60*60)));
        if (
            RemainsFullDays==2 ||
            RemainsFullDays==3 ||
            RemainsFullDays==4 ||
            RemainsFullDays==22 ||
            RemainsFullDays==23 ||
            RemainsFullDays==24 ||
            RemainsFullDays==32 ||
            RemainsFullDays==33 ||
            RemainsFullDays==34
            ) {
            days=" дня "
        }
        if (
            RemainsFullDays==1 ||
            RemainsFullDays==21 ||
            RemainsFullDays==31 
            ) {
            days=" день "
        }
          var secInLastDay=RemainsSec-RemainsFullDays*24*3600;
          var RemainsFullHours=(parseInt(secInLastDay/3600));
          if (RemainsFullHours<10){RemainsFullHours="0"+RemainsFullHours};
          var secInLastHour=secInLastDay-RemainsFullHours*3600;
          var RemainsMinutes=(parseInt(secInLastHour/60));
          if (RemainsMinutes<10){RemainsMinutes="0"+RemainsMinutes};
          var lastSec=secInLastHour-RemainsMinutes*60;
          if (lastSec<10){lastSec="0"+lastSec};
        document.getElementById('newyear').innerHTML = "До 23 февраля:<br/><b style='font-size:14px; font-weight:bold; color:#990000;'>"+RemainsFullDays+days+RemainsFullHours+":"+RemainsMinutes+":"+lastSec+"</b>";
          setTimeout("newYearIn()",10);
    } 
      else {document.getElementById("newyear").innerHTML = "";}
}
newYearIn();
-->
</script></span>
                        </div>
                                                   
                            

                            <asp:Label ID="LabelNewsType2" runat=server Text="Служебная информация" CssClass="headerRazdel"></asp:Label><br /><br />
                            
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="id_news" PagerSettings-Mode=Numeric AllowPaging=True
                            DataSourceID="SqlDataSourceForTypeNews" GridLines="None" ShowHeader="False" 
                             ShowFooter="True" PageSize="3">
                            <Columns>
                              
                               
                               
                                <asp:TemplateField HeaderText="header_news" SortExpression="header_news">
                                   
                                    <ItemTemplate>
                                        
                                        <div id="border_type6">
                                        <table cellpadding=0 cellspacing=0 border=0 width=100%>
                                           
                                          
                                           
                                            <tr height=30px>
                                                <td class="headerText2">
                                                   
                                                    <asp:Label ID="LabelItem2Header_news" runat="server" CssClass="headerText2" Text='<%# Bind("header_news") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><asp:Label ID="LabelItem2Text_news" runat="server" CssClass="formText" Text='<%# Bind("text_news") %>'></asp:Label></td>
                                             </tr>
                                            <tr>
                                                <td  align=right><br />
                                                    <div class="textAvtor">
                                                        <b>Автор:</b> 
                                                      
                                                        <asp:Label ID="Label14" runat="server"  Text='<%# Bind("last_name") %>'></asp:Label>
                                                        <asp:Label ID="Label15" runat="server"  Text='<%# Bind("first_name") %>'></asp:Label>
                                                        <asp:Label ID="Label16" runat="server"  Text='<%# Bind("middle_name") %>'></asp:Label><br />
                                                       
                                                        
                                                    </div>
                                                 </td>
                                            </tr>
                                        </table>
                                        </div>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                               
                            </Columns>
                        </asp:GridView>
                            ...............................................................<br /><br />
                            <asp:Label ID="Label8" runat=server Text="ДОКУМЕНТООБОРОТ" CssClass="headerRazdel"></asp:Label>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="id_doc" PagerSettings-Mode=Numeric AllowPaging=True
                            DataSourceID="SqlDataSourceDoc" GridLines="None" ShowHeader="False" 
                            OnRowDataBound="GridView2_RowDataBound" ShowFooter="True" PageSize="5">
                            <Columns>
                                <asp:BoundField DataField="id_doc" HeaderText="id_doc" InsertVisible="False" ReadOnly="True"
                                    SortExpression="id_doc" Visible="False" />
                               
                               
                                <asp:TemplateField HeaderText="vid_doc" SortExpression="vid_doc">
                                   
                                    <ItemTemplate>
                                        <asp:Panel ID="PanelGridView2" runat=server>
                                        <table cellpadding=0 cellspacing=0 border=0 width=100%>
                                            <tr>
                                                <td>...............................................................</td>
                                            </tr>
                                            <tr height=16px>
                                                
                                                <td>
                                                <div class="textDate"><b>Регистрация:</b>
                                                    <asp:Label ID="LabelItemDate_reg" runat="server" CssClass="textDate" Text='<%# Bind("date_reg") %>'></asp:Label>
                                                    <asp:Label ID="LabelItemTime_reg" runat="server" CssClass="textDate" Text='<%# Bind("time_reg") %>'></asp:Label>
                                                </div>
                                                </td>
                                            </tr>
                                            <tr height=16px>
                                                <td>
                                                <div class="textDate"><b>Контроль:</b>
                                                    <asp:Label ID="LabelItemDate_control" runat="server" CssClass="textDate" Text='<%# Bind("date_control") %>'></asp:Label>
                                                    <asp:Label ID="LabelItemTime_control" runat="server" CssClass="textDate" Text='<%# Bind("time_control") %>'></asp:Label>
                                                </div>
                                                </td>
                                            </tr>
                                            <tr height=16px>
                                                <td>
                                                <div class="textDate"><b>Статус:</b>
                                                    <asp:Label ID="LabelStatus_doc" runat="server" CssClass="textDate" Text='<%# Bind("status_doc") %>'></asp:Label>
                                          
                                                </div>
                                                </td>
                                            </tr>
                                            <tr height=30px>
                                                <td class="headerText2">
                                                    № <asp:Label ID="LabelNumber_in_doc" runat="server" CssClass="headerText2" Text='<%# Bind("number_in_doc") %>'></asp:Label>.
                                                    <asp:Label ID="LabelVid_doc" runat="server" CssClass="headerText2" Text='<%# Bind("vid_doc") %>'></asp:Label>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><asp:Label ID="LabelItemTema" runat="server" CssClass="formText" Text='<%# Bind("tema") %>'></asp:Label></td>
                                             </tr>
                                            <tr>
                                                <td  align=right>
                                                    <div class="textAvtor">
                                                        <b>Исполнитель:</b> 
                                                        <asp:Label ID="Label4" runat="server"  Text='<%# Bind("user_work") %>'></asp:Label><br />
                                                        <b>Контроль:</b>
                                                        <asp:Label ID="Label5" runat="server"  Text='<%# Bind("user_control") %>'></asp:Label><br />
                                                        
                                                        <b>подразделение:</b>
                                                        <asp:Label ID="Label10" runat="server"  Text='<%# Bind("name_otdel") %>'></asp:Label>
                                                        
                                                    </div>
                                                 </td>
                                            </tr>
                                        </table>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:CheckBoxField DataField="have_file" HeaderText="have_file" SortExpression="have_file"
                                    Visible="False" />
                                <asp:BoundField DataField="path_file" HeaderText="path_file" SortExpression="path_file"
                                    Visible="False" />
                                <asp:BoundField DataField="type_news" HeaderText="type_news" SortExpression="type_news"
                                    Visible="False" />
                            </Columns>
                        </asp:GridView>
                           
                            </div>
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
                <asp:Parameter DefaultValue="20" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    
        <asp:SqlDataSource ID="SqlDataSourceForTypeNews" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="NewsDelete" DeleteCommandType="StoredProcedure" SelectCommand="NewsSelectItems"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="01.01.1901" Name="begin_date" Type="String" />
                <asp:Parameter DefaultValue="01.01.1901" Name="end_date" Type="String" />
                <asp:Parameter DefaultValue="5" Name="items" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="id_news" Type="Int32" />
                <asp:Parameter Name="items" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
        