<%@ Control Language="C#" AutoEventWireup="true" CodeFile="admin_banner_boot.ascx.cs" Inherits="UC_admin_banner_boot" %>
<nav class="navbar navbar-default menu_banner">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header ">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="../Journal/journal_base.aspx">Мастер документов</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        
        <li><a href="../Journal/Request.aspx">Заявка</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Конфигурация приложения <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../Journal/UpdatePatternNode.aspx">Заполнение узлов дерева</a></li>
            <li><a href="../Journal/UpdatePatternName.aspx">Заполнение наименований</a></li>
            
            <li role="separator" class="divider"></li>
              <li><a href="../Journal/UpdatePatternTypeDoc.aspx">Типы договоров</a></li>
            
          </ul>
        </li>
            <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Справочник<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../Journal/Declarant.aspx">Добавить заявителя</a></li>
            <li><a href="../Journal/Organization.aspx">Добавить организацию</a></li>
            
          </ul>
        </li>
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Отчеты<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../Journal/RequestReport.aspx">В диапазоне дат</a></li>
            
          </ul>
        </li>
      </ul>
    
      <!--<ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>-->
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>