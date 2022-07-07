<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="filial.aspx.cs" Inherits="filial" %>

<%@ Register Src="UC/banner.ascx" TagName="banner" TagPrefix="uc2" %>

<%@ Register Src="UC/menu_vert.ascx" TagName="menu_vert" TagPrefix="uc1" %>

<%@ Register src="UC/banner_work.ascx" tagname="banner_work" tagprefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="portalFGU59.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Портал ФГУ ЗКП по Пермскому краю-ФИЛИАЛЫ</title>
    <link href="css/bootstrap5/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap5/bootstrap-5-fgu59.css" rel="stylesheet" />
</head>
<body leftmargin=0 topmargin=0 bgcolor="#1E5A92">
    <script src="css/bootstrap5/js/bootstrap.bundle.min.js"></script>
    <script src="css/bootstrap5/js/bootstrap.min.js"></script>
    <form id="form1" runat="server">
    
    
    <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="123" bgcolor="#1E5A92" align=left valign=top>
           
                <uc2:banner ID="Banner1" runat="server" />
            </td>
        </tr>
        <tr><td height="28" bgcolor="#9999CC" align=center valign=middle>


            <uc3:banner_work ID="banner_work1" header="Портал филиала ФГБУ 'ФКП Росреестра' по Пермскому краю" runat="server" showReturnDefault="true" />

            

        </td>
        </tr>
       
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
                    <div class="p-5">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-responsive table-success table-striped"
                             DataKeyNames="id_filial,id_phone,id_ip_phone,id_email" DataSourceID="SqlDataSourceFilial"
                             PageSize="40" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" OnDataBound="GridView1_DataBound">
                            
                            <Columns>
                              
                                <asp:BoundField DataField="id_filial" HeaderText="id_filial" InsertVisible="False" ReadOnly="True" SortExpression="id_filial" Visible="False" />
                                <asp:BoundField DataField="kad_number" HeaderText="Кад. номер" SortExpression="kad_number" />
                                <asp:BoundField DataField="name_filial" HeaderText="Наименование" SortExpression="name_filial" />
                                <asp:TemplateField HeaderText="Город/село" SortExpression="city_filial">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("city_filial") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("city_filial") %>' Width="110px"></asp:Label>
                                        <asp:Label ID="LabelItemfor_report" runat="server" Text='<%# Bind("for_report") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="street_filial" HeaderText="Улица" SortExpression="street_filial" />
                                <asp:BoundField DataField="home_filial" HeaderText="Дом" SortExpression="home_filial" />
                                <asp:BoundField DataField="index_filial" HeaderText="Индекс" SortExpression="index_filial" />
                             
                                <asp:TemplateField HeaderText="Тип канала" SortExpression="type_kanal">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("type_kanal") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("type_kanal") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Тариф" SortExpression="tarif_kanal" 
                                    Visible="False">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("tarif_kanal") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelItemTarif_kanal" runat="server" Text='<%# Bind("tarif_kanal") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooterTarif_kanal" runat="server"></asp:Label><br />
                                        <asp:Label ID="LabelFooterNoKanal" runat="server">нет канала:</asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="v_kanal" HeaderText="Скорость канала" SortExpression="v_kanal"
                                    Visible="False" />
                                <asp:BoundField DataField="provayder_kanal" HeaderText="Провайдер" SortExpression="provayder_kanal"
                                    Visible="False" />
                                <asp:TemplateField HeaderText="VPN" SortExpression="have_vpn" Visible="False">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("have_vpn") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBoxItemVPN" runat="server" Checked='<%# Bind("have_vpn") %>' Enabled="false" />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="LabelFooterVPN" runat="server"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>
                              
                                <asp:TemplateField HeaderText="FTP" SortExpression="have_ftp" Visible="False">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("have_ftp") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBoxItemFTP" runat="server" Checked='<%# Bind("have_ftp") %>' Enabled="false" />
                                    </ItemTemplate>
                                     <FooterTemplate>
                                        <asp:Label ID="LabelFooterFTP" runat="server"></asp:Label>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="have_rnd" HeaderText="Вместе с упр." SortExpression="have_rnd" />
                                <asp:BoundField DataField="id_phone" HeaderText="id_phone" InsertVisible="False"
                                    ReadOnly="True" SortExpression="id_phone" Visible="False" />
                                <asp:TemplateField HeaderText="Номер. тел" SortExpression="number_phone">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("number_phone") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1"  runat="server" Text='<%# Bind("number_phone") %>' Width="90px"></asp:Label>
                                    </ItemTemplate>                                    
                                </asp:TemplateField>
                                <asp:BoundField DataField="id_ip_phone" HeaderText="id_ip_phone" InsertVisible="False"
                                    ReadOnly="True" SortExpression="id_ip_phone" Visible="False" />
                                <asp:BoundField DataField="number_ip_phone" HeaderText="Ном. IP тел." SortExpression="number_ip_phone" />
                                <asp:BoundField DataField="id_email" HeaderText="id_email" InsertVisible="False"
                                    ReadOnly="True" SortExpression="id_email" Visible="False" />
                                <asp:TemplateField HeaderText="Статус" SortExpression="name_email">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBoxEditname_email" runat="server" Text='<%# Bind("name_email") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelEditName_email" runat="server" Text='<%# Bind("name_email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="v_kanal" HeaderText="Скорость канала" SortExpression="v_kanal" />
                                <asp:BoundField DataField="type_router" HeaderText="Тип роутера" SortExpression="type_router" />
                                
                                <asp:BoundField DataField="type_phone" HeaderText="Тип телефона" 
                                    SortExpression="type_phone" />
                                
                               
                                
                            </Columns>
                            <FooterStyle  />
                            <PagerStyle />
                            <SelectedRowStyle  />
                            <HeaderStyle CssClass="table table-secondary"  />
                            <EditRowStyle  />
                            <AlternatingRowStyle />
                        </asp:GridView>
                        
                      </div>
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
            InsertCommandType="StoredProcedure" SelectCommand="	SELECT DISTINCT
		f.id_filial,
		f.kad_number,
		f.name_filial,
		f.city_filial,
		f.street_filial,
		f.home_filial,
		f.index_filial,
		t.id_type_kanal,
		t.type_kanal,
		f.tarif_kanal,
		f.v_kanal,
		f.ip_address_vpn,
		f.provayder_kanal,
		f.have_vpn,
		f.have_ip_phone,
		f.have_ftp,
		f.have_rnd,
		p.id_phone,
		p.number_phone,
		i.id_ip_phone,
		i.number_ip_phone,
		e.id_email,
		e.name_email,
		f.type_router,
		f.ip_lan,
		f.ip_lan_mask,
		f.ip_lan_router,
		f.ip_address_vpn_mask,
		type_phone = CASE WHEN f.type_phone IS NULL THEN 'нет IP тел' ELSE f.type_phone END,
		f.for_report,
		f.for_delete,
		f.name_router,
		f.active,
		f.ip_address_server
		
	FROM 
		Filial f left join Phone p on f.id_filial=p.id_filial left join
		Email e on f.id_filial=e.id_filial left join 
		IP_phone i on f.id_filial=i.id_filial left join 
		Type_Kanal t on f.id_type_kanal=t.id_type_kanal
	where
		
		(f.id_filial &lt;&gt; 0) and f.active=1 and f.for_report=1 and t.type_kanal!='нет'"
            UpdateCommand="FilialUpdate" UpdateCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="id_filial" Type="Int32" />
                <asp:Parameter Name="name_otdel" Type="String" />
                <asp:Parameter Name="name_otdel_abr" Type="String" />
                <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                <asp:Parameter Name="count_otdel_real" Type="Int32" />
                <asp:Parameter Name="active" Type="Boolean" />
                <asp:Parameter Name="shift_count_report" Type="Boolean" />
                <asp:Parameter Name="type_otdel" Type="String" />
                <asp:Parameter Name="pos_dom_gen" Type="Int32" />
                <asp:Parameter Name="id_boss" Type="Int32" />
                <asp:Parameter Name="id_curator" Type="Int32" />
                <asp:Parameter Name="type_finance" Type="String" />
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
                <asp:Parameter Name="type_phone" Type="String" />
                <asp:Parameter Name="for_report" Type="Boolean" />
                <asp:Parameter Name="for_delete" Type="Boolean" />
                <asp:Parameter Name="name_router" Type="String" />
                <asp:Parameter Name="active" Type="Boolean" />
                <asp:Parameter Name="ip_address_server" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    
    </form>
</body>
</html>
