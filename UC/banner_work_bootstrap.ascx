<%@ Control Language="C#" AutoEventWireup="true" CodeFile="banner_work_bootstrap.ascx.cs" Inherits="UC_banner_work_bootstrap" %>
<%--<link href="css/bootstrap.min.css" rel="stylesheet" />--%>


<div class="container-fluid" id="banner_work">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
            <h4><asp:Label ID="LabelHeader" CssClass="header" runat="server"></asp:Label></h4>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
           <%-- <div class="input-group">
                <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control"></asp:TextBox>
                <span class="input-group-btn">
                <asp:LinkButton ID="ListBoxSearch" runat="server" CssClass="btn btn-info">
                    <span aria-hidden="true" class="glyphicon glyphicon-search"></span>
                </asp:LinkButton>
                    </span>
            </div>--%>
           
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pull-right text-right">
            <din class="btn-group">
               
                <a href="./../Default.aspx" id="linkReturnDefault" class="btn btn-link" runat="server"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> ВЕРНУТЬСЯ НА ГЛАВНУЮ</a>
                <a href="Admin/admin.aspx" class="btn btn-link"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> Администрирование</a>
            </din>
            

        </div>
    </div>
</div>


<%--<table cellpadding=0 cellspacing=0 border=0 width=100%>
    <tr bgcolor="#85A4C3">
         <td height="28" bgcolor="#85A4C3" align=center valign=middle width=80%>
              
             
         </td>
         <td width=30%>
             <div style=" float:left; padding-right:20px; color: white;">
            </div>
            <div style=" float:left; color: white;">
            </div>
            
         </td>
    </tr>
</table>--%>
