<%@ Control Language="C#" AutoEventWireup="true" CodeFile="admin_banner_Regions.ascx.cs" Inherits="UC_admin_banner_RND" %>
<link rel="stylesheet" href="../portalFGU59.css" />
<div style="margin-bottom:0px; width:100%;height: 47px; background-color: white">

    <div style="height: 20px; background-color: #1E5A92">
        <div style="margin-left: 16px; font-family: Verdana; font-size: 14px; color: White; font-weight: bold">
            <asp:Label ID="LabelAdminHeader" runat="server"></asp:Label>
        </div>
    </div>

    <div style="height: 20px; background-color: #9999CC; width:100%">
        
        <div style="text-align: right; margin-right: 10px;">
            
           <%-- <div style="float:left; width:70px;">
                <asp:LinkButton ID="LinkButtonOutConsol" CssClass="header_links" runat="server" Text="Выход"
                    OnClick="LinkButtonOutConsol_Click" CausesValidation=false></asp:LinkButton>
            </div>--%>

           <%-- <div style="margin-right: 5px; width:350px; float:left;">
                <a href="../RND/admin_info_reception_RND.aspx" class="header_links">Информационный прием</a>
            </div>--%>
             <div style="margin-right: 5px; width:380px; float:left;">
                <a href="../RND/error_gkn.aspx" class="header_links">Журнал исправления ошибок в АИС ГКН</a>
            </div>
            <div style="margin-right: 5px; width:250px; float:left;">
                <a href="../RND/protocol_workgroup_RND.aspx" class="header_links">Протоколы рабочих групп</a>
            </div>
            <div style="margin-right: 5px; width:350px; float:left;">
                <a href="../RND/admin_query_registr_nbd_RND.aspx" class="header_links">Журнал запросов к регистраторам</a>
            </div>
           <div style="margin-right: 5px; width:350px; float:left;">
                <a href="../RND/EGRN_Verification_RND.aspx" class="header_links">Верификация ЕГРН</a>
            </div>
           

        </div>
        <div>
            <div style="margin-right: 16px; float: right; font-family: Verdana; font-size: 14px;
                color: White; font-weight: bold">
                <asp:Label ID="LabelUserLogon" runat="server"></asp:Label>
            </div>
        </div>
        <div style="clear:both"></div>
    </div>

    <div style="background-image:url(../images/background1.gif); background-repeat:repeat-x;  width:100%; height:7px;" ></div>
    
</div>
                
          
                
            
                
          
