<%@ Control Language="C#" AutoEventWireup="true" CodeFile="right_col.ascx.cs" Inherits="UC_right_col" %>
<div style="margin-bottom:20px">
                        
                                                   
                            

                            <asp:Label ID="LabelNewsType2" runat=server Text="Служебная информация" CssClass="headerRazdel"></asp:Label><br /><br />
                            
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="id_news" PagerSettings-Mode=Numeric AllowPaging=True
                            DataSourceID="SqlDataSourceForTypeNews" GridLines="None" ShowHeader="False" 
                             ShowFooter="True" PageSize="5">
                            <Columns>
                              
                               
                               
                                <asp:TemplateField HeaderText="header_news" SortExpression="header_news">
                                   
                                    <ItemTemplate>
                                        
                                        <div id="border_type6">
                                        <table cellpadding=0 cellspacing=0 border=0 width=100%>
                                           
                                          
                                           
                                            <tr height=30px>
                                                <td class="headerText2">
                                                   
                                                    <asp:Label ID="LabelItem2Header_news" runat="server" CssClass="headerText2" Text='<%# Bind("header_news") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><asp:Label ID="LabelItem2Text_news" runat="server" CssClass="formText" Text='<%# Bind("text_news") %>'></asp:Label></td>
                                             </tr>
                                            <tr>
                                                <td  align=right><br />
                                                    <div class="textAvtor">
                                                        <b>Автор:</b> 
                                                      
                                                        <asp:Label ID="Label14" runat="server"  Text='<%# Bind("last_name") %>'></asp:Label>
                                                        <asp:Label ID="Label15" runat="server"  Text='<%# Bind("first_name") %>'></asp:Label>
                                                        <asp:Label ID="Label16" runat="server"  Text='<%# Bind("middle_name") %>'></asp:Label><br />
                                                       
                                                        
                                                    </div>
                                                 </td>
                                            </tr>
                                        </table>
                                        </div>
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                               
                            </Columns>
                        </asp:GridView>
                            
</div>
        <asp:SqlDataSource ID="SqlDataSourceDoc" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="DocDelete" DeleteCommandType="StoredProcedure" SelectCommand="DocSelect"
            SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_doc" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="01.01.1901" Name="begin_date" SessionField="begin_date"
                    Type="String" />
                <asp:SessionParameter DefaultValue="01.01.1901" Name="end_date" SessionField="end_date"
                    Type="String" />
                <asp:Parameter DefaultValue="20" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    
        <asp:SqlDataSource ID="SqlDataSourceForTypeNews" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="NewsDelete" DeleteCommandType="StoredProcedure" SelectCommand="NewsSelectItems"
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="01.01.1901" Name="begin_date" Type="String" />
                <asp:Parameter DefaultValue="01.01.1901" Name="end_date" Type="String" />
                <asp:Parameter DefaultValue="5" Name="items" Type="String" />
                <asp:Parameter DefaultValue="10" Name="top" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="id_news" Type="Int32" />
                <asp:Parameter Name="items" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
        

        