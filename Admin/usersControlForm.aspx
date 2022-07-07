<%@ Page Language="C#" AutoEventWireup="true" CodeFile="usersControlForm.aspx.cs" StylesheetTheme="global" Inherits="Admin_admin_filial" %>

<%@ Register Assembly="Dune5.DateTimeUI" Namespace="Dune5.DateTimeUI" TagPrefix="cc1" %>

<%@ Register Src="../UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>

<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >


<head id="Head1" runat="server">
    <title>Контрольная форма приема обращений</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
    <script src="../scripts/CalScript.js"></script>
      <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
    <link href="../scripts/calendar/aglemann-calendar-daaebd8/skins/default/alternate.css"
        rel="stylesheet" type="text/css" />
    <link href="../scripts/calendar/aglemann-calendar-daaebd8/skins/default/calendar.css"
        rel="stylesheet" type="text/css" />
    <script src="../scripts/calendar/mootools.js" type="text/javascript"></script>
    <script src="../scripts/calendar/aglemann-calendar-daaebd8/calendar.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    window.addEvent('domready', function() { myCal1 = new Calendar({ date: 'd.m.Y' }); });
    
  </script>
   
</head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="99">
                <uc2:admin_banner header="Контрольная  форма по приему обращений" ID="Admin_banner1" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td height=594px align=left valign=top bgcolor=white>
            <table cellpadding=0 cellspacing=0 border=1 width=100%>
                <tr>
                    <td width=20% align=left valign=top style="width: 100%">
                    <div class="posForm">
                      <div id=input_border>
                        <table cellpadding=0 cellspacing=0 width=780px class="formText">
                                    
                            <tr height=30px>
                                <td width=280px >
                                    Филиал:</td>
                                <td width=500px>
                                    <div style="margin-left:8px">
                                        <asp:DropDownList ID="DropDownListNum_office" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="DropDownListNum_office_SelectedIndexChanged"  
                                            Width=200px>
                                        </asp:DropDownList>
                                        <asp:Button ID="ButtonViewAll" runat="server" onclick="ButtonViewAll_Click" 
                                            Text="Показать все" Visible="False" />
                                    </div>
                                </td>
                                
                            </tr>
                            
                            <tr height=30px>
                                <td width=280px >
                                    Кол-во принятых заявлений:</td>
                                <td width=500px><div style="margin-left:10px">
                                        <asp:TextBox ID="TextBoxStatements" runat="server" Width="70px"></asp:TextBox></div>
                                </td>
                            </tr>
                            
                            <tr height=30px>
                                <td width=280px >
                                    Кол-во принятых запросов:</td>
                                <td width=500px><div style="margin-left:10px">
                                        <asp:TextBox ID="TextBoxInquiries" runat="server" Width="70px"></asp:TextBox></div>
                                </td>
                            </tr>
                            
                            <tr height=30px>
                                <td width=280px >
                                    Кол-во документов по информобмену:</td>
                                <td width=500px><div style="margin-left:10px">
                                        <asp:TextBox ID="TextBoxInformobmen" runat="server" Width="70px"></asp:TextBox></div>
                                </td>
                            </tr>
                            
                            <tr height=30px>
                                <td width=280px >
                                    Дата поступления</td>
                                <td width=500px>
                                    <div style="margin-left:10px">
                                    <input id="date" class="calendar" name="date" type="text" runat=server /></div>
                                 </td>
                            </tr>
                            
                                <tr height=70px>
                                    <td>
                                        Комментарий</td>
                                    <td>
                                    <div style="margin-left:10px">
                                        <asp:TextBox ID="TextBoxСomments" runat="server" Height="50px" 
                                            TextMode="MultiLine" Width="305px"></asp:TextBox>
                                            </div>
                                    </td>
                                </tr>
                             
                           
                            
                            
                           
                                </table>
                         </div>
                        <asp:Button ID="ButtonInsert" runat="server" CssClass="formText" Text="Добавить" OnClick="ButtonInsertFilial_Click" />
                        <asp:Button ID="ButtonCancel" runat="server" CssClass="formText" 
                            Text="Отменить" Visible="False" />
                        <asp:Button ID="ButtonEdit" runat="server" CssClass="formText" 
                            Text="Редактировать" Visible="False" />
                        <br />
                                     <asp:GridView ID="GridView1" runat="server"  
                                         DataSourceID="SqlDataSourceControlFormPriem"  
                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                            DataKeyNames="id_controlFormPriem" PageSize="50" Width=700px>
                                         <Columns>
                                             <asp:TemplateField ShowHeader="False">
                                                 <EditItemTemplate>
                                                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                                         CommandName="Update" Text="Обновить"></asp:LinkButton>
                                                     &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                         CommandName="Cancel" Text="Отмена"></asp:LinkButton>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                         CommandName="Edit" Text="Правка"></asp:LinkButton>
                                                     &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                         CommandName="Delete" Text="Удалить" OnClientClick="return confirm('Удалить документ?');"></asp:LinkButton>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:BoundField DataField="id_controlFormPriem" 
                                                 HeaderText="id_controlFormPriem" InsertVisible="False" ReadOnly="True" 
                                                 SortExpression="id_controlFormPriem" Visible="False" />
                                             <asp:TemplateField HeaderText="Филиал" SortExpression="name_filial">
                                                 <EditItemTemplate>
                                                     
                                                     <asp:DropDownList ID="DropDownList1" runat="server" 
                                                         DataSourceID="SqlDataSourceFilial"   DataTextField="name_filial" Width=150px DataValueField="name_filial"
                                                         SelectedValue='<%# Bind("name_filial") %>'>
                                                     </asp:DropDownList>
                                                     
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label4" runat="server" Text='<%# Bind("name_filial") %>' Width="150px"></asp:Label>
                                                     
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Дата актуальности" SortExpression="actual_date">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("actual_date") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label8" runat="server" Text='<%# Bind("actual_date") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Заявления" SortExpression="statements">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("statements") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("statements") %>' Width="50px"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Запросы" SortExpression="inquiries">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("inquiries") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("inquiries") %>' Width="50px"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Информ. обмен" SortExpression="informobmen">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("informobmen") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label3" runat="server" Text='<%# Bind("informobmen") %>' Width="50px"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Оператор" SortExpression="user_add_doc">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("user_add_doc") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label6" runat="server" Text='<%# Bind("user_add_doc") %>' Width="100px"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Комментарий" SortExpression="comments">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("comments") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label7" runat="server" Text='<%# Bind("comments") %>' Width="150px"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Дата заполнения" SortExpression="reg_date">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("reg_date") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label5" runat="server" Text='<%# Bind("reg_date") %>' Width="150px"></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         </Columns>
                                         
                                     </asp:GridView>
                        <br />
                      </div>
                    </td>
                </tr>
            </table>
                <asp:SqlDataSource ID="SqlDataSourceFilial" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    InsertCommand="OtdelInsert" InsertCommandType="StoredProcedure" SelectCommand="FilialSelect"
                    SelectCommandType="StoredProcedure" DeleteCommand="FilialDelete" DeleteCommandType="StoredProcedure" UpdateCommand="FilialUpdate" UpdateCommandType="StoredProcedure">
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
                        <asp:Parameter Name="ip_address_vpn" Type="String" />
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
                        <asp:Parameter Name="type_router" Type="String" />
                        <asp:Parameter Name="ip_lan" Type="String" />
                        <asp:Parameter Name="ip_lan_mask" Type="String" />
                        <asp:Parameter Name="ip_lan_router" Type="String" />
                        <asp:Parameter Name="ip_address_vpn_mask" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_filial" Type="Int32" />
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="name_otdel_abr" Type="String" />
                        <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                        <asp:Parameter Name="count_otdel_real" Type="Int32" />
                        <asp:Parameter Name="active" Type="Boolean" />
                        <asp:Parameter Name="shift_count_report" Type="Boolean" />
                    </InsertParameters>
                    <DeleteParameters>
                    
                        <asp:Parameter Name="id_filial" Type="Int32" />
                        
                        <asp:Parameter Name="id_email" Type="Int32" />
                        <asp:Parameter Name="id_phone" Type="Int32" />
                        <asp:Parameter Name="id_ip_phone" Type="Int32" />
                        
                    </DeleteParameters>
                    
                </asp:SqlDataSource>
                &nbsp;<asp:SqlDataSource ID="SqlDataSourceOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    InsertCommand="OtdelInsert" InsertCommandType="StoredProcedure" SelectCommand="OtdelSelect"
                    SelectCommandType="StoredProcedure" DeleteCommand="OtdelDelete" DeleteCommandType="StoredProcedure" UpdateCommand="OtdelUpdate" UpdateCommandType="StoredProcedure">
                    <InsertParameters>
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                        <asp:Parameter Name="count_otdel_real" Type="Int32" />
                    </InsertParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id_otdel" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_otdel" Type="Int32" />
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                        <asp:Parameter Name="count_otdel_real" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp;<asp:SqlDataSource ID="SqlDataSourceControlFormPriem" 
                    runat="server" 
                    ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                    DeleteCommand="ControlFormPriemDelete" DeleteCommandType="StoredProcedure" 
                    SelectCommand="ControlFormPriemSelect" SelectCommandType="StoredProcedure" 
                    UpdateCommand="ControlFormPriemUpdate" UpdateCommandType="StoredProcedure" 
                    onselecting="SqlDataSourceControlFormPriem_Selecting">
                                         <SelectParameters>
                                             <asp:SessionParameter Name="name_filial" SessionField="filial" Type="String" />
                                             <asp:SessionParameter Name="begin_date" SessionField="begin_date" 
                                                 Type="DateTime" />
                                             <asp:SessionParameter Name="end_date" SessionField="end_date" Type="DateTime" />
                                         </SelectParameters>
                                         <DeleteParameters>
                                             <asp:Parameter Name="id_controlFormPriem" Type="Int32" />
                                         </DeleteParameters>
                                         <UpdateParameters>
                                             <asp:Parameter Name="id_controlFormPriem" Type="Int32" />
                                             <asp:Parameter Name="statements" Type="Int32" />
                                             <asp:Parameter Name="inquiries" Type="Int32" />
                                             <asp:Parameter Name="informobmen" Type="Int32" />
                                             <asp:Parameter Name="name_filial" Type="String" />
                                             <asp:Parameter Name="reg_date" Type=DateTime />
                                             <asp:Parameter Name="user_add_doc" Type="String" />
                                             <asp:Parameter Name="comments" Type="String" />
                                             <asp:Parameter Name="actual_date" Type=DateTime />
                                         </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
     
        <tr><td height=28px bgcolor="#85A4C3"></td></tr>
        <tr><td height=6px background="../images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92"></td></tr>
    </table>
        &nbsp;
            
    </form>
</body>
</html>
