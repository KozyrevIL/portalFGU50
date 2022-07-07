<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="Admin_admin" Theme="gridview" ValidateRequest="false" %> 

<%@ Register Src="../UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>

<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Администрирование. Главная</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="47">
                <uc2:admin_banner header="Главная" ID="Admin_banner1" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td height=594px align=left valign=top bgcolor=white>
            <table cellpadding=0 cellspacing=0 border=1 width=100%>
                <tr>
                    <td width=20% align=left valign=top>
                        <uc1:menu_admin_vert ID="Menu_admin_vert1" runat="server" />
                    </td>
                    <td width=80% valign=top align=left>
                    <div class="posForm">
                        <div class=headerText2>Не исполненные поручения</div>
                        <div style=" margin-top:10px">
                        </div>
                      </div>
                    </td>
                </tr>
            </table>
                <asp:SqlDataSource ID="SqlDataSourceOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    InsertCommand="OtdelInsert" InsertCommandType="StoredProcedure" SelectCommand="OtdelSelect"
                    SelectCommandType="StoredProcedure">
                    <InsertParameters>
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                        <asp:Parameter Name="count_otdel_real" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDocNoReady" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    SelectCommand="DocSelectNoReady" SelectCommandType="StoredProcedure" UpdateCommand="DocUpdate" 
                         UpdateCommandType="StoredProcedure" DeleteCommand="DocDeleteNew" 
                    DeleteCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="id_doc" Type="Int32" />
                        <asp:Parameter Name="id_docs_sotrudnik" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="id_sotrudnik" SessionField="id_sotrudnik" 
                            Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                         <asp:Parameter Name="id_doc" Type="Int32" />
                         <asp:Parameter Name="number_in_doc" Type="String" />
                         <asp:Parameter Name="number_out_doc" Type="String" />
                         <asp:Parameter Name="avtor_send_doc" Type="String" />
                         <asp:Parameter Name="tema" Type="String" />
                         <asp:Parameter Name="delo" Type="String" />
                         <asp:Parameter Name="vid_doc" Type="String" />
                         <asp:Parameter Name="date_reg" Type="String" />
                         <asp:Parameter Name="time_reg" Type="String" />
                         <asp:Parameter Name="date_control" Type="String" />
                         <asp:Parameter Name="time_control" Type="String" />
                         <asp:Parameter Name="date_ready" Type="String" />
                         <asp:Parameter Name="time_ready" Type="String" />
                         <asp:Parameter Name="date_in" Type="String" />
                         <asp:Parameter Name="date_out" Type="String" />
                         <asp:Parameter Name="user_add_doc" Type="String" />
                         <asp:Parameter Name="user_work" Type="String" />
                         <asp:Parameter Name="user_control" Type="String" />
                         <asp:Parameter Name="status_doc" Type="String" />
                         <asp:Parameter Name="comments" Type="String" />
                         <asp:Parameter Name="items" Type="String" />
                         <asp:Parameter Name="prioritet" Type="Int32" />
                         <asp:Parameter Name="prioritet_str" Type="String" />
                         <asp:Parameter Name="fileNames" Type="String" />
                         <asp:Parameter Name="name_otdel" Type="String" />
                         <asp:Parameter Name="id_sotrudnik_control" Type="Int32" />
                         <asp:Parameter Name="name_otdel_control" Type="String" />
                         <asp:Parameter Name="id_docs_sotrudnik" Type="Int32" />
                         <asp:Parameter Name="status_under_type" Type="Int32" />
                         <asp:Parameter Name="items_under_type" Type="String" />
                         <asp:Parameter Name="fileNames2" Type="String" />
                         <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                       
                         
                         <asp:Parameter Name="comments_under_type" Type="String" />
                       
                         
                         <asp:Parameter Name="id_sotrudnik_executive" Type="Int32" />
                       
                         
                         <asp:Parameter Name="docs_links" Type="String" />
                       
                         
                     </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp;
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
                         <asp:Parameter Name="id_otdel_fact" Type="Int32" />
                         <asp:Parameter Name="id_dolgnost" Type="Int32" />
                         <asp:Parameter Name="id_filial" Type="Int32" />
                         <asp:Parameter Name="first_name" Type="String" />
                         <asp:Parameter Name="last_name" Type="String" />
                         <asp:Parameter Name="middle_name" Type="String" />
                         <asp:Parameter Name="number_cab" Type="String" />
                         <asp:Parameter Name="number_phone" Type="String" />
                         <asp:Parameter Name="number_ip_phone" Type="Int32" />
                         <asp:Parameter Name="email" Type="String" />
                         <asp:Parameter Name="email2" Type="String" />
                         <asp:Parameter Name="active" Type="Boolean" />
                         <asp:Parameter Name="initSed" Type="Boolean" />
                         <asp:Parameter Name="id_groupQuery" Type="Int32" />
                         <asp:Parameter Name="id_sotrudnik_ref" Type="Int32" />
                         <asp:Parameter Name="items" Type="String" />
                         <asp:Parameter Name="comments" Type="String" />
                     </UpdateParameters>
                     <InsertParameters>
                         <asp:Parameter Name="id_otdel" Type="Int32" />
                         <asp:Parameter Name="id_otdel_fact" Type="Int32" />
                         <asp:Parameter Name="id_dolgnost" Type="Int32" />
                         <asp:Parameter Name="id_filial" Type="Int32" />
                         <asp:Parameter Name="first_name" Type="String" />
                         <asp:Parameter Name="last_name" Type="String" />
                         <asp:Parameter Name="middle_name" Type="String" />
                         <asp:Parameter Name="number_cab" Type="String" />
                         <asp:Parameter Name="number_phone" Type="String" />
                         <asp:Parameter Name="number_ip_phone" Type="Int32" />
                         <asp:Parameter Name="email" Type="String" />
                         <asp:Parameter Name="email2" Type="String" />
                         <asp:Parameter Name="active" Type="Boolean" />
                         <asp:Parameter Name="initSed" Type="Boolean" />
                         <asp:Parameter Name="id_groupQuery" Type="Int32" />
                         <asp:Parameter Name="id_sotrudnik_ref" Type="Int32" />
                         <asp:Parameter Name="items" Type="String" />
                         <asp:Parameter Name="comments" Type="String" />
                     </InsertParameters>
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
