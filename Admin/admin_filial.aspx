<%@ Page Language="C#" AutoEventWireup="true" Theme="gridview" CodeFile="admin_filial.aspx.cs" Inherits="Admin_admin_filial" %>

<%@ Register Src="~/UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>

<%@ Register Src="~/UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Администрирование ФИЛИАЛЫ</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
    </head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="47">
                <uc2:admin_banner header="Справочинк - ФИЛИАЛЫ" ID="Admin_banner1" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td height=594px align=left valign=top bgcolor=white>
                    <table cellpadding=0 cellspacing=0 border=1 width=100%>
                        <tr>
                            <td align=left valign=top style="width: 100%">
                            <div class="posForm">
                                <div id="input_border">
                                    <div style="float: left">
                                        <table cellpadding="3" cellspacing="0" width="600px" class="formText">
                                            <tr>
                                                <td>
                                                    Наименование филиала
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxName_filial" runat="server" Width="236px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    Кадастровый номер
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxKad_number" runat="server" Width="80px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Город
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxCity_filial" runat="server" Width="236px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    IP ПК ПВД 2</td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxIP_adddress_server" runat="server" Width="80px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Улица
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxStreet_filial" runat="server" Width="236px"></asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Дом
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxHome_filial" runat="server" Width="80px"></asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Индекс
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxIndex" runat="server" Width="80px"></asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Телефон
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxNumber_phone" runat="server" Width="236px"></asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    E-mail
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxName_email" runat="server" Width="236px"></asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    В одном зданиии с управлением
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="CheckBoxHave_rnd" runat="server" />
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Канал связи
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListKanal" runat="server" Width="100px" OnSelectedIndexChanged="DropDownListKanal_SelectedIndexChanged">
                                                        <asp:ListItem>нет</asp:ListItem>
                                                        <asp:ListItem>ADSL</asp:ListItem>
                                                        <asp:ListItem>SHDSL</asp:ListItem>
                                                        <asp:ListItem>ком.дост.</asp:ListItem>
                                                        <asp:ListItem>оптика</asp:ListItem>
                                                        <asp:ListItem>другой</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    Тип телефона
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListType_phone" runat="server" Width="140px">
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>нет IP тел</asp:ListItem>
                                                        <asp:ListItem>Cisco 7941</asp:ListItem>
                                                        <asp:ListItem>Cisco 7911</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    IP телефон
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxNumber_ip_phone" runat="server" Width="236px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    Тип роутера
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListType_router" runat="server" Width="140px">
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>нет</asp:ListItem>
                                                        <asp:ListItem>Дионис FW</asp:ListItem>
                                                        <asp:ListItem>ZyWALL 2 plus</asp:ListItem>
                                                        <asp:ListItem>Zywall USG 20</asp:ListItem>
                                                        <asp:ListItem>ZyWALL 35 EE</asp:ListItem>
                                                        <asp:ListItem>Застава</asp:ListItem>
                                                        <asp:ListItem>другой</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Скорость канала
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListV_kanal" runat="server" Width="100px" Height="16px">
                                                        <asp:ListItem>0</asp:ListItem>
                                                        <asp:ListItem>64</asp:ListItem>
                                                        <asp:ListItem>128</asp:ListItem>
                                                        <asp:ListItem>256</asp:ListItem>
                                                        <asp:ListItem>512</asp:ListItem>
                                                         <asp:ListItem>768</asp:ListItem>
                                                        <asp:ListItem>1024</asp:ListItem>
                                                        <asp:ListItem>2048</asp:ListItem>
                                                        <asp:ListItem>4096</asp:ListItem>
                                                        <asp:ListItem>8192</asp:ListItem>
                                                        <asp:ListItem>10000</asp:ListItem>
                                                        <asp:ListItem>20000</asp:ListItem>
                                                        <asp:ListItem>30000</asp:ListItem>
                                                        <asp:ListItem>50000</asp:ListItem>
                                                        <asp:ListItem>100000</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    IP адрес VPN
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxIP_address_vpn" runat="server" Width="144px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Тариф
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListTarif_kanal" runat="server" Width="100px">
                                                        <asp:ListItem>нет</asp:ListItem>
                                                        <asp:ListItem>ВКС край</asp:ListItem>
                                                        <asp:ListItem>турбо</asp:ListItem>
                                                        <asp:ListItem>централизовано</asp:ListItem>
                                                        <asp:ListItem>другой</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    VPN mask
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxIP_address_vpn_mask" runat="server" Width="144px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Провайдер
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownListProvayder_kanal" runat="server" Width="100px">
                                                        <asp:ListItem>нет</asp:ListItem>
                                                        <asp:ListItem>Ростелеком</asp:ListItem>
                                                        <asp:ListItem>РТКОММ</asp:ListItem>
                                                        <asp:ListItem>Синтерра</asp:ListItem>
                                                        <asp:ListItem>другой</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    LAN сеть
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxIp_lan" runat="server" Width="144px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Наличие VPN
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="CheckBoxHave_vpn" runat="server" />
                                                </td>
                                                <td>
                                                    LAN mask
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxIp_lan_mask" runat="server" Width="144px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Наличие FTP
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="CheckBoxHave_ftp" runat="server" />
                                                </td>
                                                <td>
                                                    LAN router
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBoxIp_lan_router" runat="server" Width="144px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:Button ID="ButtonInsertFilial" runat="server" CssClass="formText" Text="Добавить филиал"
                                                        OnClick="ButtonInsertFilial_Click" />
                                                </td>
                                                <td>
                                                    Окна на пл. Управления
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="CheckBoxPlaceRnd" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Label ID="LabelError" CssClass="textError" runat="server"></asp:Label>
                                                    <asp:Button ID="ButtonDelete" runat=server onclick="ButtonDelete_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div style="float: left">
                                        <asp:GridView ID="GridViewLinks" SkinID=Grid_small20 runat="server" 
                                            AutoGenerateColumns="False" DataKeyNames="id_comp_bd">
                                            <Columns>
                                                <asp:BoundField DataField="id_comp_bd" HeaderText="id_comp_bd" 
                                                    InsertVisible="False" ReadOnly="True" SortExpression="id_comp_bd" />
                                                <asp:BoundField DataField="id_filial" HeaderText="id_filial" 
                                                    SortExpression="id_filial" />
                                                <asp:BoundField DataField="id_computer" HeaderText="id_computer" 
                                                    SortExpression="id_computer" />
                                                <asp:BoundField DataField="id_sotrudnik" HeaderText="id_sotrudnik" 
                                                    SortExpression="id_sotrudnik" />
                                                <asp:BoundField DataField="date_in_work" HeaderText="date_in_work" 
                                                    SortExpression="date_in_work" />
                                                <asp:BoundField DataField="join_comp" HeaderText="join_comp" 
                                                    SortExpression="join_comp" />
                                                <asp:BoundField DataField="inv_number" HeaderText="inv_number" 
                                                    SortExpression="inv_number" />
                                                <asp:BoundField DataField="serial_number" HeaderText="serial_number" 
                                                    SortExpression="serial_number" />
                                                <asp:BoundField DataField="status_comp" HeaderText="status_comp" 
                                                    SortExpression="status_comp" />
                                                <asp:BoundField DataField="uses_comp" HeaderText="uses_comp" 
                                                    SortExpression="uses_comp" />
                                                <asp:BoundField DataField="date_actual" HeaderText="date_actual" 
                                                    SortExpression="date_actual" />
                                                <asp:BoundField DataField="room" HeaderText="room" SortExpression="room" />
                                            </Columns>
                                        </asp:GridView>
                                        
                                    </div>
                                    <div style="clear:both"></div>
                                </div>
                               
                                
                                <div>
                                    <asp:GridView ID="GridView1" SkinID="small" runat="server" AutoGenerateColumns="False"
                                        DataKeyNames="id_filial,id_ip_phone,id_phone,id_email" DataSourceID="SqlDataSourceFilial"
                                        OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating"
                                        Width="100%" OnRowUpdated="GridView1_RowUpdated" 
                                        OnRowDeleted="GridView1_RowDeleted" onrowcommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <div style="width: 55px">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                            Text="Правка"></asp:LinkButton><br />
                                                        <asp:LinkButton ID="LinkButtonItemDelete" runat="server" CommandArgument='<%# Bind("id_filial") %>'
                                                            OnClientClick="return confirm('Удалить запись?');" CausesValidation="False" CommandName="Delete"
                                                            Text="Удалить" Enabled="true"></asp:LinkButton>
                                                    </div>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update"
                                                        Text="Обновить"></asp:LinkButton><br />
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                        Text="Отмена"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="id_filial" InsertVisible="False" SortExpression="id_filial"
                                                Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("id_filial") %>'></asp:Label>
                                                  
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_filial") %>'></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Кад. ном." SortExpression="kad_number">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("kad_number") %>' Width="40px"
                                                        CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("kad_number") %>'></asp:Label>

                                                    <asp:Label ID="LabelItemActive" runat="server" Text='<%# Bind("active") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="LabelItemFor_report" runat="server" Text='<%# Bind("for_report") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="LabelItemFor_delete" runat="server" Text='<%# Bind("for_delete") %>' Visible="false"></asp:Label>

                                                </ItemTemplate>
                                                <ItemStyle Width="70px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Филиал" SortExpression="name_filial">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("name_filial") %>' Width="100px"
                                                        CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("name_filial") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Город" SortExpression="city_filial">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("city_filial") %>' Width="100px"
                                                        CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("city_filial") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Улица" SortExpression="street_filial">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("street_filial") %>' Width="100px"
                                                        CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("street_filial") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Дом" SortExpression="home_filial">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("home_filial") %>' Width="20px"
                                                        CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("home_filial") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Индекс" SortExpression="index_filial">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("index_filial") %>' Width="50px"
                                                        CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("index_filial") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Канал" SortExpression="type_kanal">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label23" runat="server" Text='<%# Bind("type_kanal") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="LabelEditId_type_kanal" Text='<%# Eval("id_type_kanal") %>' Visible="false"
                                                        runat="server"></asp:Label>
                                                    <asp:DropDownList ID="DropDownListEditType_kanal" runat="server" CssClass="textGridView3">
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Тариф" SortExpression="tarif_kanal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("tarif_kanal") %>' Width="40px"
                                                        CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("tarif_kanal") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="V канал" SortExpression="v_kanal">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="DropDownListV_kanal" runat="server" Width="100px" SelectedValue='<%# Bind("v_kanal") %>'
                                                        Enabled="true" CssClass="textGridView3">
                                                       <asp:ListItem>0</asp:ListItem>
                                                        <asp:ListItem>64</asp:ListItem>
                                                        <asp:ListItem>128</asp:ListItem>
                                                        <asp:ListItem>256</asp:ListItem>
                                                        <asp:ListItem>512</asp:ListItem>
                                                         <asp:ListItem>768</asp:ListItem>
                                                        <asp:ListItem>1024</asp:ListItem>
                                                        <asp:ListItem>2048</asp:ListItem>
                                                        <asp:ListItem>4096</asp:ListItem>
                                                        <asp:ListItem>8192</asp:ListItem>
                                                        <asp:ListItem>10000</asp:ListItem>
                                                        <asp:ListItem>20000</asp:ListItem>
                                                        <asp:ListItem>30000</asp:ListItem>
                                                        <asp:ListItem>50000</asp:ListItem>
                                                        <asp:ListItem>100000</asp:ListItem>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("v_kanal") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Провайдер" SortExpression="provayder_kanal">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("provayder_kanal") %>'
                                                        Width="50px" CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("provayder_kanal") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CheckBoxField DataField="have_vpn" HeaderText="VPN" SortExpression="have_vpn" />
                                            <asp:TemplateField HeaderText="IP VPN" SortExpression="ip_address_vpn">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxEditIp_address_vpn" runat="server" Text='<%# Bind("ip_address_vpn") %>'
                                                        Width="70px" CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label Width="100px" ID="LabelItemIp_address_vpn" runat="server" Text='<%# Bind("ip_address_vpn") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CheckBoxField DataField="have_ip_phone" HeaderText="IP тел." SortExpression="have_ip_phone"
                                                Visible="False" />
                                            <asp:CheckBoxField DataField="have_ftp" HeaderText="FTP" SortExpression="have_ftp" />
                                            <asp:CheckBoxField DataField="have_rnd" HeaderText="с  RND" SortExpression="have_rnd" />
                                            <asp:TemplateField HeaderText="id_phone" InsertVisible="False" SortExpression="id_phone"
                                                Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("id_phone") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("id_phone") %>' CssClass="textGridView3"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Номер тел." SortExpression="number_phone">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("number_phone") %>' Width="80px"
                                                        CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("number_phone") %>' Width="60px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="id_ip_phone" InsertVisible="False" SortExpression="id_ip_phone"
                                                Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label18" runat="server" Text='<%# Bind("id_ip_phone") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("id_ip_phone") %>' CssClass="textGridView3"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ном.  IP тел." SortExpression="number_ip_phone">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("number_ip_phone") %>'
                                                        Width="40px" CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("number_ip_phone") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Статус" SortExpression="name_email">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("name_email") %>' CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("name_email") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="id_email" InsertVisible="False" SortExpression="id_email"
                                                Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label19" runat="server" Text='<%# Bind("id_email") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("id_email") %>' CssClass="textGridView3"></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Тип роутера" SortExpression="type_router">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="DropDownListEditType_router" SelectedValue='<%# Bind("type_router") %>'
                                                        runat="server" Width="140px" CssClass="textGridView3">
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>нет</asp:ListItem>
                                                        <asp:ListItem>Дионис FW</asp:ListItem>
                                                        <asp:ListItem>ZyWALL 2 plus</asp:ListItem>
                                                        <asp:ListItem>Zywall USG 20</asp:ListItem>
                                                        <asp:ListItem>ZyWALL 35 EE</asp:ListItem>
                                                        <asp:ListItem>Застава</asp:ListItem>
                                                        <asp:ListItem>другое</asp:ListItem>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemType_router" runat="server" Text='<%# Bind("type_router") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LAN сеть" SortExpression="ip_lan">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label20" runat="server" Text='<%# Bind("ip_lan") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("ip_lan") %>' CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LAN mask" SortExpression="ip_lan_mask">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label21" runat="server" Text='<%# Bind("ip_lan_mask") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("ip_lan_mask") %>' CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Router" SortExpression="ip_lan_router">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label22" runat="server" Text='<%# Bind("ip_lan_router") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("ip_lan_router") %>' CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Router mask" SortExpression="ip_address_vpn_mask">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("ip_address_vpn_mask") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("ip_address_vpn_mask") %>'
                                                        CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Маршрутизатор" SortExpression="name_router">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelItemName_router" runat="server" Text='<%# Bind("name_router") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBoxEditName_router" runat="server" Text='<%# Bind("name_router") %>'
                                                        CssClass="textGridView3"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ip_address_server" HeaderText="IP ПК ПВД" SortExpression="ip_address_server" />
                                            <asp:TemplateField HeaderText="Тип телефона" SortExpression="type_phone">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("type_phone") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="DropDownListEditType_phone" SelectedValue='<%# Bind("type_phone") %>'
                                                        runat="server" Width="140px" CssClass="textGridView3">
                                                        <asp:ListItem></asp:ListItem>
                                                        <asp:ListItem>нет IP тел</asp:ListItem>
                                                        <asp:ListItem>Cisco 7941</asp:ListItem>
                                                        <asp:ListItem>Cisco 7911</asp:ListItem>
                                                        <asp:ListItem>другое</asp:ListItem>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CheckBoxField DataField="for_report" HeaderText="Для отчетов" SortExpression="for_report" />
                                            <asp:CheckBoxField DataField="for_delete" HeaderText="Пометить на удаление" SortExpression="for_delete" />
                                            <asp:CheckBoxField DataField="active" HeaderText="АКТИВЕН" SortExpression="active" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                              </div>
                            </td>
                        </tr>
                    </table>
                <asp:SqlDataSource ID="SqlDataSourceFilial" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    InsertCommand="FilialInsert" InsertCommandType="StoredProcedure" SelectCommand="FilialSelect"
                    SelectCommandType="StoredProcedure" DeleteCommand="FilialDelete" 
                        DeleteCommandType="StoredProcedure" UpdateCommand="FilialUpdate" 
                        UpdateCommandType="StoredProcedure" 
                        onupdating="SqlDataSourceFilial_Updating">
                    <InsertParameters>
                        <asp:Parameter Name="kad_number" Type="Int32" />
                        <asp:Parameter Name="name_filial" Type="String" />
                        <asp:Parameter Name="city_filial" Type="String" />
                        <asp:Parameter Name="street_filial" Type="String" />
                        <asp:Parameter Name="home_filial" Type="String" />
                        <asp:Parameter Name="index_filial" Type="Int32" />
                        <asp:Parameter Name="id_type_kanal" Type="Int32" />
                        <asp:Parameter Name="tarif_kanal" Type="String" />
                        <asp:Parameter Name="v_kanal" Type="Int32" />
                        <asp:Parameter Name="provayder_kanal" Type="String" />
                        <asp:Parameter Name="have_vpn" Type="Boolean" />
                        <asp:Parameter Name="ip_address_vpn" Type="String" />
                        <asp:Parameter Name="have_ip_phone" Type="Boolean" />
                        <asp:Parameter Name="have_ftp" Type="Boolean" />
                        <asp:Parameter Name="have_rnd" Type="Boolean" />
                        <asp:Parameter Name="number_phone" Type="String" />
                        <asp:Parameter Name="number_ip_phone" Type="String" />
                        <asp:Parameter Name="name_email" Type="String" />
                        <asp:Parameter Name="type_router" Type="String" />
                        <asp:Parameter Name="ip_lan" Type="String" />
                        <asp:Parameter Name="ip_lan_mask" Type="String" />
                        <asp:Parameter Name="ip_lan_router" Type="String" />
                        <asp:Parameter Name="ip_address_vpn_mask" Type="String" />
                        <asp:Parameter Name="type_phone" Type="String" />
                        <asp:Parameter Name="placeRnd" Type="Boolean" />
                        <asp:Parameter Name="ip_address_server" Type="String" />
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
                        <asp:Parameter Name="id_type_kanal" Type="Int32" />
                        <asp:Parameter Name="tarif_kanal" Type="String" />
                        <asp:Parameter Name="v_kanal" Type="Int32" />
                        <asp:Parameter Name="ip_address_vpn" Type="String" />
                        <asp:Parameter Name="provayder_kanal" Type="String" />
                        <asp:Parameter Name="have_vpn" Type="Boolean" />
                        <asp:Parameter Name="have_ip_phone" Type="Boolean" />
                        <asp:Parameter Name="have_ftp" Type="Boolean" />
                        <asp:Parameter Name="have_rnd" Type="Boolean" />
                        <asp:Parameter Name="number_phone" Type="String" />
                        <asp:Parameter Name="number_ip_phone" Type="String" />
                        <asp:Parameter Name="name_email" Type="String" />
                        <asp:Parameter Name="id_email" Type="Int32" />
                        <asp:Parameter Name="id_phone" Type="Int32" />
                        <asp:Parameter Name="id_ip_phone" Type="Int32" />
                        <asp:Parameter Name="type_router" Type="String" />
                        <asp:Parameter Name="ip_lan" Type="String" />
                        <asp:Parameter Name="ip_lan_mask" Type="String" />
                        <asp:Parameter Name="ip_lan_router" Type="String" />
                        <asp:Parameter Name="ip_address_vpn_mask" Type="String" />
                        <asp:Parameter Name="type_phone" Type="String" />
                        <asp:Parameter Name="for_report" Type="Boolean" />
                        <asp:Parameter Name="for_delete" Type="Boolean" />
                        <asp:Parameter Name="name_router" Type="String" />
                        <asp:Parameter Name="active" Type="Boolean" />
                        <asp:Parameter Name="ip_address_server" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp;<asp:SqlDataSource ID="SqlDataSourceFilialSelectlinks" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                        SelectCommand="FilialSelectLinks" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="id_filial" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
&nbsp;<asp:SqlDataSource ID="SqlDataSourceTypeKanal" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                        SelectCommand="SELECT [id_type_kanal], [type_kanal] FROM [Type_kanal]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceFilialDelete" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                        DeleteCommand="FilialDeleteNew" DeleteCommandType="StoredProcedure" 
                        SelectCommand="FilialSelect" SelectCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="id_filial" Type="Int32" />
                            <asp:Parameter Name="id_email" Type="Int32" />
                            <asp:Parameter Name="id_phone" Type="Int32" />
                            <asp:Parameter Name="id_ip_phone" Type="Int32" />
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
