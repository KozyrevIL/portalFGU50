<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<%@ Register Src="~/UC/news_bloks.ascx" TagPrefix="uc1" TagName="news_bloks" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6"><uc1:news_bloks runat="server" id="news_bloks" TypeNews="7" /></div>
            <div class="col-lg-6"><uc1:news_bloks runat="server" id="news_bloks1" TypeNews="1" /></div>
        </div>
    </div>
    
</asp:Content>

