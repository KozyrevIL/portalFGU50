<%@ Page Language="C#" AutoEventWireup="true" CodeFile="users_SHIFT_GROUP_EDITOR.aspx.cs" StylesheetTheme="global" Inherits="Admin_admin_filial" %>

<%@ Register Assembly="Dune5.DateTimeUI" Namespace="Dune5.DateTimeUI" TagPrefix="cc1" %>

<%@ Register Src="~/UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>

<%@ Register Src="~/UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >


<head id="Head1" runat="server">
    <title>Контрольная форма приема обращений</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
    <script src="../scripts/CalScript.js"></script>
      <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
    <link href="../scripts/calendar/aglemann-calendar-daaebd8/skins/default/alternate.css"
        rel="stylesheet" type="text/css" />
    <link href="../scripts/calendar/aglemann-calendar-daaebd8/skins/default/calendar.css"
        rel="stylesheet" type="text/css" />
    <script src="../scripts/calendar/mootools.js" type="text/javascript"></script>
    <script src="../scripts/calendar/aglemann-calendar-daaebd8/calendar.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    window.addEvent('domready', function() { myCal1 = new Calendar({ date: 'd.m.Y' }); });
    
  </script>
   
</head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="99">
                <uc2:admin_banner header="Контрольная  форма по приему обращений" ID="Admin_banner1" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td height=594px align=left valign=top bgcolor=white>
            <table cellpadding=0 cellspacing=0 border=1 width=100%>
                <tr>
                    <td width=20% align=left valign=top style="width: 100%">
                    <div class="posForm">
                      <div id=input_border>
                        <table cellpadding=5 cellspacing=0 width=780px class="formText">
                                    
                            <tr height=30px>
                                <td width=280px >
                                    Отдел:</td>
                                <td width=500px>
                                    
                                        <asp:DropDownList ID="ddlOtdel" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="ddlOtdel_SelectedIndexChanged"  
                                            Width=200px DataSourceID="sdsOtdels" DataTextField="name_otdel" 
                                            DataValueField="id_otdel">
                                        </asp:DropDownList>
                                    
                                </td>
                                
                            </tr>
                            
                            <tr height=30px>
                                <td width=280px >
                                    Сотрудник:</td>
                                <td width=500px>
                                        <asp:DropDownList ID="ddlSotrudnik" runat="server"  
                                            Width=200px DataSourceID="sdsSotrudnik" 
                                        DataTextField="full_name" DataValueField="id_sotrudnik">
                                        </asp:DropDownList>
                                </td>
                                
                            </tr>
                            
                            <tr height=30px>
                                <td width=280px >
                                    Кол-во смен:</td>
                                <td width=500px>
                                        <asp:TextBox ID="tbShiftCount" runat="server" Width="70px"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr height=30px>
                                <td width=280px >
                                    Кол-во часов:</td>
                                <td width=500px>
                                        <asp:TextBox ID="tbHoursCount" runat="server" Width="70px" OnTextChanged="tbShiftCount_TextChanged"></asp:TextBox>
                                </td>
                            </tr>
                            
                                                       
                            
                            
                           
                                </table>
                         </div>
                        <asp:Button ID="ButtonInsert" runat="server" CssClass="formText" Text="Добавить" OnClick="ButtonInsertFilial_Click" />
                        <asp:Button ID="ButtonCancel" runat="server" CssClass="formText" 
                            Text="Отменить" Visible="False" />
                        <asp:Button ID="ButtonEdit" runat="server" CssClass="formText" 
                            Text="Редактировать" Visible="False" />
                        <br />
                                     <asp:GridView ID="GridView1" runat="server"  
                                         DataSourceID="sdsShiftCount"  
                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                            DataKeyNames="ID" PageSize="50" Width=700px>
                                         <Columns>
                                             <asp:BoundField DataField="ID" 
                                                 HeaderText="ID" InsertVisible="False" ReadOnly="True" 
                                                 SortExpression="ID" />
                                             <asp:BoundField DataField="SOTRUDNIK_ID" HeaderText="SOTRUDNIK_ID" 
                                                 SortExpression="SOTRUDNIK_ID" />
                                             <asp:BoundField DataField="COUNT_SHIFT" HeaderText="COUNT_SHIFT" 
                                                 SortExpression="COUNT_SHIFT" />
                                             <asp:BoundField DataField="COUNT_HOURS" HeaderText="COUNT_HOURS" 
                                                 SortExpression="COUNT_HOURS" />
                                             <asp:BoundField DataField="FULLNAME" HeaderText="FULLNAME" ReadOnly="True" 
                                                 SortExpression="FULLNAME" />
                                             <asp:BoundField DataField="SHIFT_GROUP_ID" HeaderText="SHIFT_GROUP_ID" 
                                                 SortExpression="SHIFT_GROUP_ID" />
                                         </Columns>
                                         
                                     </asp:GridView>
                        <br />
                      </div>
                    </td>
                </tr>
            </table>
                &nbsp;<asp:SqlDataSource ID="sdsOtdels" runat="server" 
							ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
							SelectCommand="OtdelForFilialSelect1" SelectCommandType="StoredProcedure">
						    <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="show_inactive" Type=Int16 />
                            </SelectParameters>
						</asp:SqlDataSource>
					<asp:SqlDataSource ID="sdsSotrudnik" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
						SelectCommand="SotrudnikSelectForOtdel" SelectCommandType="StoredProcedure">
						<SelectParameters>
							<asp:ControlParameter Name="id_otdel" ControlID="ddlOtdel" PropertyName="SelectedValue" />
						</SelectParameters>
					</asp:SqlDataSource>
		<asp:SqlDataSource ID="sdsShiftCount" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
			DeleteCommand="SHIFT_COUNT_DELETE" DeleteCommandType="StoredProcedure" InsertCommand="SHIFT_COUNT_INSERT1"
			InsertCommandType="StoredProcedure" SelectCommand="SHIFT_COUNT_SELECT" SelectCommandType="StoredProcedure"
			UpdateCommand="SHIFT_COUNT_UPDATE" UpdateCommandType="StoredProcedure" 
            OnInserting="sdsShiftCount_Inserting">
			<DeleteParameters>
				<asp:Parameter Name="ID" Type="Int32" />
			</DeleteParameters>
			<InsertParameters>
				<asp:Parameter Name="SHIFT_GROUP_ID" Type="Int32" />
				<asp:Parameter Name="SOTRUDNIK_ID" Type="Int32" />
				<asp:Parameter Name="COUNT_SHIFT" Type="Int32" />
			    <asp:Parameter Name="COUNT_HOURS" Type="Int32" />
			</InsertParameters>
			<SelectParameters>
				<asp:ControlParameter ControlID="ddlOtdel" Name="SHIFT_GROUP_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
			</SelectParameters>
			<UpdateParameters>
				<asp:Parameter Name="ID" Type="Int32" />
				<asp:Parameter Name="SOTRUDNIK_ID" Type="Int32" />
				<asp:Parameter Name="COUNT_SHIFT" Type="Int32" />
			    <asp:Parameter Name="COUNT_HOURS" Type="Int32" />
			</UpdateParameters>
		</asp:SqlDataSource>
                &nbsp;</td>
        </tr>
     
        <tr><td height=28px bgcolor="#85A4C3"></td></tr>
        <tr><td height=6px background="../images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92"></td></tr>
    </table>
        &nbsp;
            
    </form>
</body>
</html>
