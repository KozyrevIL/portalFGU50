<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminControlForm.aspx.cs" StylesheetTheme="global" Inherits="Admin_admin_filial" %>

<%@ Register Assembly="Dune5.DateTimeUI" Namespace="Dune5.DateTimeUI" TagPrefix="cc1" %>

<%@ Register Src="~/UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>

<%@ Register Src="~/UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Контрольная форма форма приема обращений</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
    <script src="../scripts/CalScript.js"></script>
    
</head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="47">
                <uc2:admin_banner header="Контрольная форма форма приема обращений" ID="Admin_banner1" runat="server" />
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
                                    Номер офиса</td>
                                <td width=500px>
                                    <div style="margin-left:8px">
                                        <asp:DropDownList ID="DropDownListNum_office" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="DropDownListNum_office_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:Button ID="ButtonViewAll" runat="server" onclick="ButtonViewAll_Click" Text="Показать все" />
                                    </div>
                                </td>
                            </tr>
                            <asp:Panel ID="PanelFilial" runat=server>     
                            <tr height=30px>
                                <td >
                                    Дата регистрации
                                </td>
                                <td >
                                <div style="margin-left:10px">
                                    <asp:TextBox ID="TextBoxReg_date" runat="server" Width="70px"></asp:TextBox>
                                    <a href="javascript:OpenCalendar2('TextBoxReg_date', false)">
                                    <img border="0" src="../images/24x24/icon-calendar.gif" /></a>
                                    </div>
                                </td>
                            </tr>
                            <tr height=30px>
                                <td>
                                    Наименование номер, дата издания документа
                                </td>
                                <td>
                                <div style="margin-left:10px">
                                    <asp:TextBox ID="TextBoxIn_doc" TextMode=MultiLine Height=50px runat="server" Width="500px"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                            </asp:Panel> 
                            
                         
                           <asp:Panel ID="PanelFGU" runat=server>
                          
                                <tr height=30px>
                                    <td>
                                        Дата поступления сведений в работу
                                        </td>
                                        <td>
                                        <div style="margin-left:10px">
                                         <asp:TextBox ID="TextBoxWork_date" runat="server" Width="70px"></asp:TextBox>
                                        <a href="javascript:OpenCalendar2('TextBoxWork_date', false)">
                                        <img border="0" src="../images/24x24/icon-calendar.gif" /></a>
                                        </div>
                                            </td>
                                </tr>
                                <tr height=30px>
                                    <td>
                                        Результат обработки сведений</td>
                                    <td>
                                    <div style="margin-left:8px">
                                        <asp:DropDownList ID="DropDownListResult_work" runat="server">
                                            <asp:ListItem Selected=True></asp:ListItem>
                                            <asp:ListItem>Сведения внесены в ГКН</asp:ListItem>
                                            <asp:ListItem>Сведения не внесены в ГКН</asp:ListItem>
                                        </asp:DropDownList>
                                        </div>
                                    </td>
                                </tr>
                                <tr height=30px>
                                    <td>
                                        Дата выполнений обмена</td>
                                    <td>
                                    <div style="margin-left:10px">
                                        <asp:TextBox ID="TextBoxExec_date" runat="server" Width="70px"></asp:TextBox>
                                        <a href="javascript:OpenCalendar2('TextBoxExec_date', false)">
                                        <img border="0" src="../images/24x24/icon-calendar.gif" /></a>
                                        </div>
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
                             
                           </asp:Panel>
                            
                            
                           <asp:Panel ID="PanelElectron_date" runat=server>
                                <tr height=30px>
                                    <td>
                                        Дата доформирования эл.</td>
                                    <td>
                                    <div style="margin-left:10px">
                                         <asp:TextBox ID="TextBoxElectron_date" runat="server" Width="70px"></asp:TextBox>
                                        <a href="javascript:OpenCalendar2('TextBoxElectron_date', false)">
                                        <img border="0" src="../images/24x24/icon-calendar.gif" /></a>
                                        </div>
                                        </td>
                                </tr>
                           </asp:Panel>
                           <asp:Panel ID="PanelManual_date" runat=server>
                                <tr height=30px>
                                    <td>
                                        Дата доформирования бум.</td>
                                    <td>
                                    <div style="margin-left:10px">
                                         <asp:TextBox ID="TextBoxManual_date" runat="server" Width="70px"></asp:TextBox>
                                        <a href="javascript:OpenCalendar2('TextBoxManual_date', false)">
                                        <img border="0" src="../images/24x24/icon-calendar.gif" /></a>
                                        </div>
                                        </td>
                                </tr>
                           </asp:Panel>
                               
                                                       
                            </table>
                         </div>
                        <asp:Button ID="ButtonInsert" runat="server" CssClass="formText" Text="Добавить" OnClick="ButtonInsertFilial_Click" />
                        <asp:Button ID="ButtonCancel" runat="server" CssClass="formText" 
                            OnClick="ButtonCancel_Click" Text="Отменить" Visible="False" />
                        <asp:Button ID="ButtonEdit" runat="server" CssClass="formText" 
                            OnClick="ButtonEdit_Click" Text="Редактировать" Visible="False" />
                        <br />
                                     <asp:GridView ID="GridView1" runat="server"  
                                         DataSourceID="SqlDataSourceControlFormPriem"  
                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                            DataKeyNames="id_controlFormPriem" onrowdatabound="GridView1_RowDataBound" PageSize="50" 
                            onrowcommand="GridView1_RowCommand" onrowupdating="GridView1_RowUpdating" 
                            onselectedindexchanged="GridView1_SelectedIndexChanged" Width=700px>
                                         <Columns>
                                             <asp:BoundField DataField="id_controlFormPriem" 
                                                 HeaderText="id_controlFormPriem" InsertVisible="False" ReadOnly="True" 
                                                 SortExpression="id_controlFormPriem" Visible="False" />
                                             <asp:TemplateField HeaderText="Филиал" SortExpression="name_filial">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("name_filial") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label4" runat="server" Text='<%# Bind("name_filial") %>' Width="150px"></asp:Label>
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
                                             <asp:TemplateField HeaderText="Оператор" SortExpression="operator">
                                                 <EditItemTemplate>
                                                     <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("operator") %>'></asp:TextBox>
                                                 </EditItemTemplate>
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label6" runat="server" Text='<%# Bind("operator") %>' Width="100px"></asp:Label>
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
                    <InsertParameters>
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                        <asp:Parameter Name="count_otdel_real" Type="Int32" />
                    </InsertParameters>
                    <DeleteParameters>
                    
                        <asp:Parameter Name="id_journal_error" Type="Int32" />
                        
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
                    </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp;
                <asp:SqlDataSource ID="SqlDataSourceControlFormPriem" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                    SelectCommand="ControlFormPriemSelect" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="" Name="name_filial" Type="String" />
                    </SelectParameters>
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
