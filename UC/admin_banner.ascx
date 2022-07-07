<%@ Control Language="C#" AutoEventWireup="true" CodeFile="admin_banner.ascx.cs" Inherits="UC_admin_banner" %>
<link rel="stylesheet" href="../portalFGU59.css" />
<div style="margin-bottom:0px; width:100%;height: 47px; background-color: white">

    <div style="height: 20px; background-color: #1E5A92">
        <div style="margin-left: 16px; font-family: Verdana; font-size: 14px; color: White; font-weight: bold">
            <asp:Label ID="LabelAdminHeader" runat="server"></asp:Label>
        </div>
    </div>

    <div style="height: 20px; background-color: #9999CC; width:100%">
        
        <div style="text-align: right; margin-right: 10px;">
            
            <div style="float:left; width:70px;">
                <asp:LinkButton ID="LinkButtonOutConsol" CssClass="header_links" runat="server" Text="Выход"
                    OnClick="LinkButtonOutConsol_Click" CausesValidation=false></asp:LinkButton>
            </div>
            <div style="margin-right: 5px; width:350px; float:left;">
                <a href="../Admin/admin.aspx" class="header_links">Возврат на панель администрирования</a>
            </div>
             <div style="margin-right: 5px; width:350px; float:left;">
                <a href="./../Default.aspx" class="header_links">Возврат на главную страницу сайта</a>
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
                
          
                
            
                
          
