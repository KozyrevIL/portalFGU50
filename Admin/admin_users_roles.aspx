<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_users_roles.aspx.cs" Inherits="Admin_admin_users" %>

<%@ Register Src="../UC/admin_banner.ascx" TagName="admin_banner" TagPrefix="uc2" %>

<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Администрирование СОТРУДНИКИ</title>
    <link href="../portalFGU59.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin=0 leftmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
     <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="99">
                <uc2:admin_banner ID="Admin_banner1" header="Роли" runat="server" />
            </td>
        </tr>
        
        <tr>
            <td align=left valign=top bgcolor=white style="height: 584px">
            <table cellpadding=0 cellspacing=0 border=1 width=100%>
                <tr>
                    <td width=20% align=left valign=top>
                        <uc1:menu_admin_vert ID="Menu_admin_vert1" runat="server" />
                    </td>
                    <td width=80% valign=top align=left>
                    <div class="posForm">
                        <table cellpadding=0 cellspacing=0 width=800 class="formText">
                            
                            <tr>
                                <td height=30 style="width: 224px" >
                                    Роль</td><td style="width: 205px">
                                    <asp:TextBox ID="TextBoxName_roles" runat="server" Width="300px"></asp:TextBox></td>
                                <td style="width: 205px">
                                    &nbsp; </td>
                                <td style="width: 205px">
                                    </td>
                            </tr>
                            <tr>
                                <td height="30" style="width: 224px">
                                </td>
                                <td style="width: 205px; height: 19px">
                                    <asp:Label ID="LabelError" runat="server" CssClass="textError" Visible="False"></asp:Label></td>
                                <td style="width: 205px; height: 19px">
                                </td>
                                <td style="width: 205px; height: 19px">
                                </td>
                            </tr>
                            <tr>
                                <td height=30 style="width: 224px"></td><td style="width: 205px" align=right>
                                    <asp:Button ID="ButtonInsertFilial" runat="server" CssClass="formText" Text="Добавить" OnClick="ButtonInsertFilial_Click1" /></td>
                                <td align="right" style="width: 205px">
                                </td>
                                <td align="right" style="width: 205px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 224px"></td><td style="width: 205px"></td>
                                <td style="width: 205px">
                                </td>
                                <td style="width: 205px">
                                </td>
                            </tr>
                           
                        </table>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceRoles" ForeColor="#333333"
                                        GridLines="None" AllowPaging="True" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" DataKeyNames="id_roles">
                                        <FooterStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="textGridView2"  />
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/22х22/cancel.png" DeleteImageUrl="~/images/22х22/editdelete.png"
                                                EditImageUrl="~/images/22х22/pencil.png" SelectImageUrl="~/images/22х22/pencil.png"
                                                ShowDeleteButton="True" ShowEditButton="True" UpdateImageUrl="~/images/22х22/reload.png" />
                                            <asp:BoundField DataField="id_roles" HeaderText="id_roles" InsertVisible="False"
                                                ReadOnly="True" SortExpression="id_roles" Visible="False" />
                                            <asp:TemplateField HeaderText="Роль" SortExpression="name_roles">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name_roles") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name_roles") %>' Width="300px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" CssClass="textGridView" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                      </div>
                    </td>
                </tr>
            </table>
                &nbsp; &nbsp; &nbsp;
            </td>
        </tr>
     
        <tr><td height=28px bgcolor="#85A4C3"></td></tr>
        <tr><td height=6px background="../images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92"></td></tr>
    </table>
        <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="RolesDelete" DeleteCommandType="StoredProcedure" SelectCommand="RolesSelect"
            SelectCommandType="StoredProcedure" UpdateCommand="RolesUpdate" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_roles" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_roles" Type="Int32" />
                <asp:Parameter Name="name_roles" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </form>
</body>
</html>
