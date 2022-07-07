<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Personnel_Management.aspx.cs" Inherits="journal_backup" %>

<%@ Register Src="UC/banner.ascx" TagName="banner" TagPrefix="uc2" %>

<%@ Register Src="UC/menu_vert.ascx" TagName="menu_vert" TagPrefix="uc1" %>

<%@ Register src="UC/banner_work.ascx" tagname="banner_work" tagprefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<link href="portalFGU59.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Портал ФБУ КП по Пермскому краю</title>
</head>
<body leftmargin=0 topmargin=0 bgcolor="#1E5A92">
    <form id="form1" runat="server">
    
    
    <table cellpadding="0" cellspacing="0" border="0" width=100%>
        <tr>
            <td height="123" bgcolor="#1E5A92" align=left valign=top>
           
                <uc2:banner ID="Banner1" runat="server" />
            </td>
        </tr>
        <tr><td height="28" bgcolor="#9999CC" align=center valign=middle>
        
            <uc3:banner_work ID="banner_work1" header="Портал филиала ФГБУ 'ФКП Росреестра' по Пермскому краю"  runat="server" />
        
        </td></tr>
        <tr><td height="7" background="images/background1.gif"></td></tr>
       
        <tr><td height=594px bgcolor=white>
        <table cellpadding=0 cellspacing=0 border=0 width=100%>
                <tr>
                    <td width=15% align=left valign=top height=594px>
                    <div class="posMenu">
                        <uc1:menu_vert ID="Menu_vert1" runat="server" />
                       </div>
                    </td>
                    <td width=1px bgcolor="#85A4C3"><img src="images/point.gif" /></td>
                    <td width=85% valign=top align=left>
                    <div class="posForm">
                        &nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:GridView ID="GridViewDirList"  CellPadding=5 runat="server" AutoGenerateColumns="False" DataKeyNames="FullName" OnSelectedIndexChanged="GridViewDirList_SelectedIndexChanged">
                            <FooterStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" CssClass="textGridView"  ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width=30px>
                                    <ItemTemplate> 
                                        <asp:Image ID="imgTypeDir" ImageUrl="~/images/icon_files/folder_yellow.png" runat=server />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Список папок" ItemStyle-Width=400px>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text='<%# Bind("name") %>'></asp:LinkButton>
                                        <asp:Label ID="LabelItemName" runat="server" Text='<%# Bind("name") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="LabelItemDirPath" runat="server" Text='<%# Bind("FullName") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="LabelItemDirType" runat="server" Text='<%# Bind("Extension") %>'
                                            Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Дата создания" ItemStyle-Width=50px>
                                    <ItemTemplate>
                                        <asp:Label ID="LabelItemCreationTime" runat="server" Text='<%# Bind("CreationTime") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Размер файла" ItemStyle-Width=50px>
                                    <ItemTemplate>
                                        
                                            <asp:Label ID="LabelItemFileLength" runat="server"  Text='-'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                            </Columns>
                            <PagerStyle BackColor="#ffffff" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                        </asp:GridView>
                                                
                      <asp:GridView ID="GridViewFileList"  ShowHeader=false CellPadding=5 runat="server" AutoGenerateColumns="False" DataKeyNames="FullName" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridViewFileList_RowDataBound">
                      
                      <FooterStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                            
                          <Columns>
                           <asp:TemplateField ItemStyle-Width=30px>
                                    <ItemTemplate>
                                        <asp:Image ID="imgTypeFile" ImageUrl="~/images/icon_files/unknown.png" runat=server />
                                    </ItemTemplate>
                                </asp:TemplateField>
                          
                          <asp:TemplateField ShowHeader="False" HeaderText="Список документов" ItemStyle-Width=400px>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server"  CausesValidation="False" CommandName="Select"
                                            Text='<%# Bind("name") %>' ></asp:LinkButton>
                                            <asp:Label ID="LabelItemName" runat="server" Visible=false Text='<%# Bind("name") %>'></asp:Label>
                                            <asp:Label ID="LabelItemFilePath" runat="server" Visible=false Text='<%# Bind("FullName") %>'></asp:Label>
                                            
                                            <asp:Label ID="LabelItemFileType" runat="server" Visible=false Text='<%# Bind("Extension") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Дата создания" ItemStyle-Width=50px>
                                    <ItemTemplate>
                                        
                                            <asp:Label ID="LabelItemCreationTime" runat="server"  Text='<%# Bind("CreationTime") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Размер файла" ItemStyle-Width=50px>
                                    <ItemTemplate>
                                        
                                            <asp:Label ID="LabelItemFileLength" runat="server"  Text='<%# Bind("Length") %>'></asp:Label>
                                            <asp:Label ID="LabelItemExtension" Visible=false runat="server"  Text='<%# Bind("Extension") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                              
                          </Columns>
                           
                          <RowStyle BackColor="#ffffff" CssClass="textGridView"  ForeColor="#333333" />
                            <EditRowStyle BackColor="#999999" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#5D7B9D" CssClass="textGridView" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                        
                      </div>
                    </td>
                </tr>
            </table>
            </td></tr>
        <tr><td height=28px bgcolor="#85A4C3"></td></tr>
        <tr><td height=6px background="images/background2.gif"></td></tr>
        <tr><td height=32px bgcolor="#1E5A92">
            &nbsp;</td></tr>
       
    </table>
        &nbsp;&nbsp;&nbsp;</form>
</body>
</html>
