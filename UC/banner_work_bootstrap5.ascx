<%@ Control Language="C#" AutoEventWireup="true" CodeFile="banner_work_bootstrap5.ascx.cs" Inherits="UC_banner_work_bootstrap5" %>

<div class="container-fluid" id="banner_work">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <h4><asp:Label ID="LabelHeader" CssClass="text-white" runat="server"></asp:Label></h4>
        </div>
        
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
            <div class="btn-group pull-right text-right">
                <a href="./../Default.aspx" id="linkReturnDefault" class="btn btn-link" runat="server"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> ВЕРНУТЬСЯ НА ГЛАВНУЮ</a>
                <a href="Admin/admin.aspx" class="btn btn-link"><i class="fa-solid fa-user"></i> Администрирование</a>
            </div>
            

        </div>
    </div>
</div>


