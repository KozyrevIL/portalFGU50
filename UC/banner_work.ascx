<%@ Control Language="C#" AutoEventWireup="true" CodeFile="banner_work.ascx.cs" Inherits="UC_banner_work" %>
<link href="./../css/bootstrap.min.css" rel="stylesheet" />
<table cellpadding=0 cellspacing=0 border=0 width=100%>
    <tr bgcolor="#85A4C3">
         <td height="28" bgcolor="#85A4C3" align=center valign=middle width=80%>
              
             <asp:Label ID="LabelHeader" CssClass="header" runat=server></asp:Label>
         </td>
         <td width=30%>
             <%--<div style=" float:left; padding-right:20px; color: white;"><a href="Default.aspx" class="admin">ВЕРНУТЬСЯ НА ГЛАВНУЮ</a>
            </div>--%>
            <div style=" float:left; color: white;"><a href="Admin/admin.aspx" class="admin">Администрирование</a>
            </div>
            
         </td>
    </tr>
</table>
