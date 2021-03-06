<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_journal_serv_teh.aspx.cs" Inherits="Admin_admin_journal_serv_teh" %>

<%@ Register Src="../UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>

<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Администрирование ЖУРНАЛ Обслуживания техники</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="47">
                <uc2:admin_banner  header="Журнал обслуживания техники" ID="Admin_banner1" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td align=left valign=top bgcolor=white style="height: 584px">
            <table cellpadding=0 cellspacing=0 border=1 width=100%>
                <tr>
                    <td width=20% align=left valign=top>
                        <uc1:menu_admin_vert ID="Menu_admin_vert1" runat="server" />
                    </td>
                    <td width=80% valign=top align=left>
                    <div class="posForm">
                        <table cellpadding=0 cellspacing=0 width=800 class="formText">
                            <tr>
                                <td height="30" width="140">
                                    &nbsp;Наименование филиала</td>
                                <td style="width: 205px">
                                    <asp:DropDownList ID="DropDownListFilial" runat="server" Width="230px" OnSelectedIndexChanged="DropDownListFilial_SelectedIndexChanged">
                                    </asp:DropDownList></td>
                                <td style="width: 128px">
                                </td>
                                <td style="width: 205px">
                                </td>
                            </tr>
                            
                            <tr>
                                <td height=30 width="140" >
                                    &nbsp;Номер акта</td><td style="width: 205px">
                                    <asp:TextBox ID="TextBoxNumber_acts" runat="server" Width=90px></asp:TextBox></td>
                                <td style="width: 128px">
                                    &nbsp; Дата теста</td>
                                <td style="width: 205px">
                                        <asp:TextBox ID="TextBoxDate_acts" runat="server" Width="90px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td height=30 width="140">
                                    &nbsp;Отв.сотр.филиала</td><td style="height: 19px; width: 205px;">
                      <asp:TextBox ID="TextBoxControl_filial_sotrudnik" runat="server" Width="150px"></asp:TextBox></td>
                                <td style="width: 128px; height: 19px">
                                    &nbsp; Время теста</td>
                                <td style="width: 205px; height: 19px">
                                    <asp:TextBox ID="TextBoxTime_acts" runat="server" Width="90px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td height=30 width="140">
                                    </td>
                                <td style="width: 205px; height: 19px">
                                    </td>
                                <td style="width: 128px; height: 19px">
                                    </td>
                                <td style="width: 205px; height: 19px">
                                    </td>
                            </tr>
                            <tr>
                                <td height="30" width="140">
                                    &nbsp;Выполнены работы</td>
                                <td colspan="3" style="height: 19px">
                                    <asp:TextBox ID="TextBoxWorks" runat="server" Height="50px" TextMode="MultiLine" Width="500px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td height="30" width="140">
                                    &nbsp;Комментарий</td>
                                <td style="height: 19px" colspan="3">
                                    <asp:TextBox ID="TextBoxComments" runat="server" Height="50px" TextMode="MultiLine"
                                        Width="500px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td height="30" width="140">
                                    &nbsp;Оператор </td>
                                <td style="width: 205px; height: 19px">
                                    <asp:Label ID="LabelUserAdd_doc" runat="server" CssClass="button"></asp:Label>
                                             </td>
                                <td style="width: 128px; height: 19px">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height="30" width="140">
                                </td>
                                <td style="width: 205px; height: 19px">
                                    <asp:Label ID="LabelError" runat="server" CssClass="textError" Visible="False"></asp:Label></td>
                                <td style="width: 128px; height: 19px">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height=30 width="140"></td><td style="width: 205px" align=right>
                                    <asp:Button ID="ButtonInsertJournal_VPN" runat="server" CssClass="formText" Text="Добавить событие" OnClick="ButtonInsertJournal_VPN_Click" /></td>
                                <td align="right" style="width: 128px">
                                </td>
                                <td align="right" style="width: 205px">
                                </td>
                            </tr>
                            <tr>
                                <td width="140"></td><td style="width: 205px"></td>
                                <td style="width: 128px">
                                </td>
                                <td style="width: 205px">
                                </td>
                            </tr>
                           
                        </table>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        DataKeyNames="id_journal_serv_teh" DataSourceID="SqlDataSourceJournal_serv_teh" ForeColor="#333333"
                                        GridLines="None" AllowPaging="True" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                                        <FooterStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="textGridView2"  />
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                            <asp:BoundField DataField="id_journal_serv_teh" HeaderText="id_journal_serv_teh"
                                                InsertVisible="False" ReadOnly="True" SortExpression="id_journal_serv_teh" Visible="False" />
                                            <asp:BoundField DataField="number_acts" HeaderText="№ акта" SortExpression="number_acts" />
                                            <asp:BoundField DataField="name_filial" HeaderText="Филиал" SortExpression="name_filial" />
                                            <asp:BoundField DataField="control_filial_sotrudnik" HeaderText="Отв.сотр.филиала"
                                                SortExpression="control_filial_sotrudnik" />
                                            <asp:BoundField DataField="user_test" HeaderText="Оператор" SortExpression="user_test" />
                                            <asp:BoundField DataField="works" HeaderText="Выполнено" SortExpression="works" />
                                            <asp:BoundField DataField="comments" HeaderText="Комментарий" SortExpression="comments" />
                                            <asp:BoundField DataField="date_acts" HeaderText="Дата акта" SortExpression="date_acts" />
                                            <asp:BoundField DataField="time_acts" HeaderText="Время акта" SortExpression="time_acts" />
                                        </Columns>
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" CssClass="textGridView" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
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
                        <asp:Parameter Name="id_filial" Type="Int32" />
                        <asp:Parameter Name="id_email" Type="Int32" />
                        <asp:Parameter Name="id_phone" Type="Int32" />
                        <asp:Parameter Name="id_ip_phone" Type="Int32" />
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
                <asp:SqlDataSource ID="SqlDataSourceJournal_serv_teh" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    DeleteCommand="Journal_serv_tehDelete" DeleteCommandType="StoredProcedure" SelectCommand="Journal_serv_tehSelect"
                    SelectCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="id_journal_serv_teh" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
     
        <tr><td height=28px bgcolor="#85A4C3"></td></tr>
        <tr><td height=6px background="../images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92"></td></tr>
    </table>
    
    </form>
</body>
</html>
