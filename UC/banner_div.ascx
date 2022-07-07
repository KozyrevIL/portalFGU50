<%@ Control Language="C#" AutoEventWireup="true" CodeFile="banner_div.ascx.cs" Inherits="UC_banner_div" %>
<div class="banner">
    <div class="banner_pos">
        <asp:Label ID="LabelAdminHeader"  CssClass="logo_text" runat=server></asp:Label>
    </div>
</div>
<div class="banner_boottom1">
    <div class="banner_pos1">
        <asp:Label ID="LabelUserLogon" CssClass="logo_text" runat=server></asp:Label>
    </div>
</div>
<div class="banner_boottom2">
    <div class="banner_pos1">
        <a href="../Admin/admin.aspx">Возврат на панель администрирования</a>
    </div>
</div>