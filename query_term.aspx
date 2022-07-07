<%@ Page Title="" Language="C#" MasterPageFile="~/bootstrap_base.master" AutoEventWireup="true" CodeFile="query_term.aspx.cs" Inherits="query_term" %>

<%@ Register src="UC/banner_work_bootstrap.ascx" tagname="banner_work_bootstrap" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<script language="javascript" type="text/javascript">
	    $(function () {

	        $("#TextBoxBeginDate").datepicker();
	        $("#TextBoxEndDate").datepicker();
	    });
	</script>
     <div class="container-fluid" id="Div1" runat="server">

         <div class="row">
           
             <uc1:banner_work_bootstrap ID="banner_work_bootstrap1" runat="server" header="Просроки запросов" showReturnDefault="true" />
           
        </div>
         <div>
             <div class="content">
                 <div class="formText2 content--form-wrapper">
                     <h3 class="header-3">Выберите диапазон дат</h3>
                     <div class="content--edits-wrapper">
                         <div class="content--edits--item">
                             <asp:Label ID="Label1" runat="server" Text="Начало диапазона" CssClass="content--label"></asp:Label>
                             <asp:TextBox ID="TextBoxBeginDate" runat="server" CssClass="content--text-box"
                                 Width="75px"></asp:TextBox>
                         </div>

                         <div class="content--edits--item">
                             <asp:Label ID="Label2" runat="server" Text="Конец диапазона" CssClass="content--label"></asp:Label>
                             <asp:TextBox ID="TextBoxEndDate" runat="server" CssClass="content--text-box"
                                 Width="75px"></asp:TextBox>
                         </div>

                         <div class="content--edits--item">
                             <asp:Label ID="Label3" runat="server" Text="БТИ:" CssClass="content--label"></asp:Label>
                             <asp:DropDownList ID="DropDownList1" runat="server">
                                 <asp:ListItem Selected="True">Все</asp:ListItem>
                                 <asp:ListItem>Ростех</asp:ListItem>
                                 <asp:ListItem>ЦТИ</asp:ListItem>
                                 <asp:ListItem>Ординское БТИ</asp:ListItem>
                                 <asp:ListItem>Чердынское БТИ</asp:ListItem>
                             </asp:DropDownList>
                         </div>
                     </div>

                     <div class="content--buttons--wrapper">
                         <asp:Button ID="Button1" runat="server" Text="Запросить подробные данные"
                             OnClick="Button1_Click" CssClass="content--button--fetch-data" />

                         <asp:Button ID="Button3" runat="server" Text="Общая статистика"
                             CssClass="content--button--fetch-general-data" OnClick="Button3_Click" />

                         <asp:Button ID="Button2" runat="server" Text="Сохранить в excel"
                             CssClass="content--button--export-to-xls" OnClick="Button2_Click" />
                     </div>
                     <div class="content--error-data">
                         <asp:CompareValidator ID="CompareValidator2" runat="server"
                             ControlToValidate="TextBoxEndDate" ErrorMessage="Некорректная дата окончания"
                             Operator="DataTypeCheck" BorderStyle="Solid" Type="Date" BorderWidth="1px"
                             Display="Dynamic"></asp:CompareValidator>

                         <asp:CompareValidator ID="CompareValidator1" runat="server"
                             ControlToValidate="TextBoxBeginDate" ErrorMessage="Некорректная дата начала"
                             Operator="DataTypeCheck" Type="Date" BorderStyle="Solid" BorderWidth="1px"
                             Display="Dynamic"></asp:CompareValidator>
                     </div>

                     <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2"
                         CssClass="content--grid-view textGridView3" AllowSorting="True"
                         CellSpacing="2">
                         <HeaderStyle CssClass="form--text-grid-view--first-row" />
                         <RowStyle CssClass="form--text-grid-view--row" />

                     </asp:GridView>

                     <br />

                 </div>


             </div>

             <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                 ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                 ProviderName="<%$ ConnectionStrings:portalFGU59ConnectionString.ProviderName %>"
                 SelectCommand="	select 'ЦТИ', count(*) &quot;Кол-во&quot;,      
		   case 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt; [portalFGU59].[dbo].to_date(getdate()) and  ready_dateCTY is null  then 'в работе' 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) = [portalFGU59].[dbo].to_date(getdate()) and  ready_dateCTY is null then 'последний день в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateCTY is null then 'просрочен и все еще в работе'        
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateCTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateCTY) &gt; [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateCTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateCTY) &lt;= [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt;= [portalFGU59].[dbo].to_date(getdate()) and ready_dateCTY is not null then 'закрыт'
		   end &quot;Состояние&quot;
	from [portalFGU59].[dbo].[OTUTI_journal] a where reg_date&gt;= @BeginDate and reg_date &lt;= @EndDate
	group by 
		   case 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt; [portalFGU59].[dbo].to_date(getdate()) and  ready_dateCTY is null then 'в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) = [portalFGU59].[dbo].to_date(getdate()) and  ready_dateCTY is null then 'последний день в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateCTY is null then 'просрочен и все еще в работе'        
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateCTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateCTY) &gt; [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateCTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateCTY) &lt;= [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt;= [portalFGU59].[dbo].to_date(getdate()) and ready_dateCTY is not null then 'закрыт'
		   end
union
	select 'Ростех', count(*) &quot;Кол-во&quot;,      
		   case 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt; [portalFGU59].[dbo].to_date(getdate()) and  ready_dateRosreh is null  then 'в работе' 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) = [portalFGU59].[dbo].to_date(getdate()) and  ready_dateRosreh is null then 'последний день в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateRosreh is null then 'просрочен и все еще в работе'        
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateRosreh is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateRosreh) &gt; [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateRosreh is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateRosreh) &lt;= [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt;= [portalFGU59].[dbo].to_date(getdate()) and ready_dateRosreh is not null then 'закрыт'
		   end &quot;Состояние&quot;
	from [portalFGU59].[dbo].[OTUTI_journal] a where reg_date&gt;= @BeginDate and reg_date &lt;= @EndDate
	group by 
		   case 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt; [portalFGU59].[dbo].to_date(getdate()) and  ready_dateRosreh is null then 'в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) = [portalFGU59].[dbo].to_date(getdate()) and  ready_dateRosreh is null then 'последний день в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateRosreh is null then 'просрочен и все еще в работе'        
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateRosreh is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateRosreh) &gt; [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateRosreh is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateRosreh) &lt;= [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt;= [portalFGU59].[dbo].to_date(getdate()) and ready_dateRosreh is not null then 'закрыт'
		   end
union
	select 'ЧБТИ', count(*) &quot;Кол-во&quot;,      
		   case 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt; [portalFGU59].[dbo].to_date(getdate()) and  ready_dateChBTY is null  then 'в работе' 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) = [portalFGU59].[dbo].to_date(getdate()) and  ready_dateChBTY is null then 'последний день в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateChBTY is null then 'просрочен и все еще в работе'        
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateChBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateChBTY) &gt; [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateChBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateChBTY) &lt;= [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt;= [portalFGU59].[dbo].to_date(getdate()) and ready_dateChBTY is not null then 'закрыт'
		   end &quot;Состояние&quot;
	from [portalFGU59].[dbo].[OTUTI_journal] a where reg_date&gt;= @BeginDate and reg_date &lt;= @EndDate
	group by 
		   case 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt; [portalFGU59].[dbo].to_date(getdate()) and  ready_dateChBTY is null then 'в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) = [portalFGU59].[dbo].to_date(getdate()) and  ready_dateChBTY is null then 'последний день в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateChBTY is null then 'просрочен и все еще в работе'        
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateChBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateChBTY) &gt; [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateChBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateChBTY) &lt;= [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt;= [portalFGU59].[dbo].to_date(getdate()) and ready_dateChBTY is not null then 'закрыт'
		   end
union
	select 'ОБТИ', count(*) &quot;Кол-во&quot;,      
		   case 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt; [portalFGU59].[dbo].to_date(getdate()) and  ready_dateOBTY is null  then 'в работе' 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) = [portalFGU59].[dbo].to_date(getdate()) and  ready_dateOBTY is null then 'последний день в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateOBTY is null then 'просрочен и все еще в работе'        
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateOBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateOBTY) &gt; [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateOBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateOBTY) &lt;= [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt;= [portalFGU59].[dbo].to_date(getdate()) and ready_dateOBTY is not null then 'закрыт'
		   end &quot;Состояние&quot;
	from [portalFGU59].[dbo].[OTUTI_journal] a where reg_date&gt;= @BeginDate and reg_date &lt;= @EndDate
	group by 
		   case 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt; [portalFGU59].[dbo].to_date(getdate()) and  ready_dateOBTY is null then 'в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) = [portalFGU59].[dbo].to_date(getdate()) and  ready_dateOBTY is null then 'последний день в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateOBTY is null then 'просрочен и все еще в работе'        
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateOBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateOBTY) &gt; [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateOBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateOBTY) &lt;= [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt;= [portalFGU59].[dbo].to_date(getdate()) and ready_dateOBTY is not null then 'закрыт'
		   end
union
	select 'ВБТИ', count(*) &quot;Кол-во&quot;,      
		   case 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt; [portalFGU59].[dbo].to_date(getdate()) and  ready_dateVBTY is null  then 'в работе' 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) = [portalFGU59].[dbo].to_date(getdate()) and  ready_dateVBTY is null then 'последний день в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateVBTY is null then 'просрочен и все еще в работе'        
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateVBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateVBTY) &gt; [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateVBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateVBTY) &lt;= [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt;= [portalFGU59].[dbo].to_date(getdate()) and ready_dateVBTY is not null then 'закрыт'
		   end &quot;Состояние&quot;
	from [portalFGU59].[dbo].[OTUTI_journal] a where reg_date&gt;= @BeginDate and reg_date &lt;= @EndDate 
	group by 
		   case 
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt; [portalFGU59].[dbo].to_date(getdate()) and  ready_dateVBTY is null then 'в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) = [portalFGU59].[dbo].to_date(getdate()) and  ready_dateVBTY is null then 'последний день в работе'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateVBTY is null then 'просрочен и все еще в работе'        
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateVBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateVBTY) &gt; [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт с просроком'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &lt; [portalFGU59].[dbo].to_date(getdate()) and ready_dateVBTY is not null and 
				 [portalFGU59].[dbo].to_date(ready_dateVBTY) &lt;= [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) then 'закрыт'
			when [portalFGU59].[dbo].WorkdaysSelectedControlDay1(reg_date,5) &gt;= [portalFGU59].[dbo].to_date(getdate()) and ready_dateVBTY is not null then 'закрыт'
		   end
">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="TextBoxBeginDate" DbType="Date"
                         Name="BeginDate" PropertyName="Text" />
                     <asp:ControlParameter ControlID="TextBoxEndDate" DbType="Date" Name="EndDate"
                         PropertyName="Text" />
                 </SelectParameters>

             </asp:SqlDataSource>

             <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                 ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                 ProviderName="<%$ ConnectionStrings:portalFGU59ConnectionString.ProviderName %>"
                 SelectCommand="SelectQueryTermBTI" SelectCommandType="StoredProcedure">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="DropDownList1" Name="Organization"
                         PropertyName="SelectedValue" Type="String" />
                     <asp:ControlParameter ControlID="TextBoxBeginDate" Name="begin_date"
                         PropertyName="Text" Type="DateTime" />
                     <asp:ControlParameter ControlID="TextBoxEndDate"
                         Name="end_date" PropertyName="Text" Type="DateTime" />
                 </SelectParameters>
             </asp:SqlDataSource>
         </div>
</div>



   

</asp:Content>

