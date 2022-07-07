<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="status_request.aspx.cs" Inherits="doc" StylesheetTheme="global"%>

<%@ Register Src="UC/banner.ascx" TagName="banner" TagPrefix="uc2" %>

<%@ Register Src="UC/menu_vert.ascx" TagName="menu_vert" TagPrefix="uc1" %>

<%@ Register src="UC/banner_work.ascx" tagname="banner_work" tagprefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Портал ФГУ ЗКП по Пермскому краю-Информационный обмен</title>
    <script src="scripts/CalScript.js" type="text/css"></script>
    <link href="portalFGU59.css" rel="stylesheet" type="text/css" />
   
   

    
   
    
   
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
        
            <uc3:banner_work ID="banner_work1" runat="server" header="Портал филиала ФГБУ 'ФКП Росреестра' по Пермскому краю" />
        
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
                    <div class="posForm">
                      <div id=input_border>
                        <table cellpadding=0 cellspacing=0 width=430px class="formText4">
                                    
                            <tr height=25px>
                                <td width=70px>
                                    <span class="formText4">Номер заявки</span>
                                </td>
                                <td width=330px align=right>
                                    
                                    
                                     <div style="display:block">
                                    <asp:TextBox ID="TextBoxRequestText" CssClass="formText4" runat="server" Width=200px></asp:TextBox>
                                         <span style="margin:10px">
                                        <asp:Button ID="Button1" CssClass="formText4" runat="server" Text="Показать" 
                                             Width=70px onclick="Button1_Click" /></div>
                                     </span>
                                    
                                     
                                </td>
                               
                              
                            </tr>
                         
                               
                                                       
                            </table>
                            
                         </div>
                        <br />
                        <div class="formText">
                                <b>Статус:</b> <asp:Label ID="LabelStatus" runat=server CssClass="formText"></asp:Label>
                            </div>
                        
                      </div>
                    </td>
                </tr>
            </table>
            </td></tr>
        <tr><td height=28px bgcolor="#85A4C3"></td></tr>
        <tr><td height=6px background="images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92">
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
                    
                </asp:SqlDataSource>
                                     <asp:SqlDataSource ID="SqlDataSourceControlFormPriem" 
                    runat="server" 
                    ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                    DeleteCommand="ControlFormPriemDelete" DeleteCommandType="StoredProcedure" 
                    SelectCommand="ControlFormPriemSelect" SelectCommandType="StoredProcedure">
                                         <SelectParameters>
                                             <asp:SessionParameter Name="name_filial" SessionField="filial" Type="String" />
                                             <asp:SessionParameter Name="begin_date" SessionField="begin_date" 
                                                 Type="DateTime" />
                                             <asp:SessionParameter Name="end_date" SessionField="end_date" Type="DateTime" />
                                         </SelectParameters>
                                         <DeleteParameters>
                                             <asp:Parameter Name="id_controlFormPriem" Type="Int32" />
                                         </DeleteParameters>
                </asp:SqlDataSource>
                                     </td></tr>
       
    </table>
        &nbsp;</form>
</body>
</html>
