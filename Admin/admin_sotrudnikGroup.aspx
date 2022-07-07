<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" Theme="gridview" CodeFile="admin_sotrudnikGroup.aspx.cs" Inherits="Admin_admin_sotrudnikGroup" %>

<%@ Register src="../UC/menu_admin_vert.ascx" tagname="menu_admin_vert" tagprefix="uc2" %>
<%@ Register src="../UC/admin_banner.ascx" tagname="admin_banner" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="99">
                <uc1:admin_banner ID="admin_banner1" header="Добавление групп сотрудников" runat="server" />
            </td>
        </tr>
        <tr>
            <td height=594px align=left valign=top bgcolor=white>
                <table cellpadding=0 cellspacing=0 border=1 width=100%>
                    <tr>
                        <td width=20% align=left valign=top>
                            <uc2:menu_admin_vert ID="menu_admin_vert1" runat="server" />
                        </td>
                        <td width=80% valign=top align=left>

                            <div class="posForm">
                                <div id="menuNavig" style="margin: 10px; border-bottom-style: solid; border-bottom-width: 1px;
                                    border-bottom-color: #FED17E; padding-bottom: 10px;" class="formText">
                                    <a href="admin_sotrudnik.aspx" class="text_links"><font color="#1E5A92">Назначить группу сотруднику</font></a>
                                    &nbsp;&nbsp; <a href="admin_doc_create.aspx" class="text_links"><font color="#1E5A92">Добавление документов</font></a>
                                </div>
                                
                                <div id="input_border" class="formText">
                                    <div  style="margin: 5px">
                                        <div style="width: 150px; float: left">Наименовние группы</div>
                                        <div><asp:TextBox ID="TextBoxNameGroupQuery" Width="150px" runat="server"></asp:TextBox></div>
                                    </div>
                                    <div style="margin: 5px">
                                        <div style="height: 11px; width: 150px; float: left">Описание</div>
                                        <div><asp:TextBox ID="TextBoxComments" Width="150px" runat="server"></asp:TextBox></div>
                                    </div>
                                    <div  style="margin: 5px">

                                        <asp:Label ID="LabelError" runat=server CssClass="textError" Visible="False"></asp:Label>
                                       
                                    </div>
                                    <div style="margin: 5px">
                                       <asp:Button ID="ButtonGroup" Text="Добавить" runat=server 
                                            onclick="ButtonGroup_Click" />
                                    </div>
                                </div>
                            <div>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  SkinID=middle
                                    DataKeyNames="id_groupQuery" DataSourceID="SqlDataSourceSotrudnikGroup" 
                                    AllowSorting="True">
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                            ShowSelectButton="True" />
                                        <asp:BoundField DataField="id_groupQuery" HeaderText="id_groupQuery" 
                                            InsertVisible="False" ReadOnly="True" SortExpression="id_groupQuery" 
                                            Visible="False" />
                                        <asp:BoundField DataField="nameGroupQuery" HeaderText="Наименование" 
                                            SortExpression="nameGroupQuery" />
                                        <asp:BoundField DataField="comments" HeaderText="Описание" 
                                            SortExpression="comments" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                                <asp:SqlDataSource ID="SqlDataSourceSotrudnikGroup" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                                    DeleteCommand="SotrudnikGroupDelete" DeleteCommandType="StoredProcedure" 
                                    InsertCommand="SotrudnikGroupInsert" InsertCommandType="StoredProcedure" 
                                    SelectCommand="SotrudnikGroupSelect" SelectCommandType="StoredProcedure" 
                                    UpdateCommand="SotrudnikGroupUpdate" UpdateCommandType="StoredProcedure" 
                                    oninserting="SqlDataSourceSotrudnikGroup_Inserting">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id_groupQuery" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="nameGroupQuery" Type="String" />
                                        <asp:Parameter Name="comments" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="id_groupQuery" Type="Int32" />
                                        <asp:Parameter Name="nameGroupQuery" Type="String" />
                                        <asp:Parameter Name="comments" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </td>
                    </tr>
                </table>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td height=28px bgcolor="#85A4C3">
            </td>
        </tr>
        <tr>
            <td height=6px background="../images/background2.gif">
            </td>
        </tr>
        <tr>
            <td height=32px bgcolor="#1E5A92">
                <asp:SqlDataSource ID="SqlDataSourceCounts" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                DeleteCommand="CountsDelete" DeleteCommandType="StoredProcedure" SelectCommand="CountsSelectAll"
                SelectCommandType="StoredProcedure" UpdateCommand="CountsUpdate" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="numerators" Type="String" />
                        <asp:Parameter Name="id_object_str" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="counts" Type="Int32" />
                        <asp:Parameter Name="numerators" Type="String" />
                        <asp:Parameter Name="id_object_str" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>


