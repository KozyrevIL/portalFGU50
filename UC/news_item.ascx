<%@ Control Language="C#" AutoEventWireup="true" CodeFile="news_item.ascx.cs" Inherits="UC_news_item" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>
<div style="margin-bottom: 0px">
    <asp:Label ID="LabelNewsType2" runat="server" Text="Общественные новости" CssClass="headerRazdel"></asp:Label><br />
    <br />
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
        DataKeyNames="id_news" PagerSettings-Mode="Numeric" AllowPaging="True"
        DataSourceID="SqlDataSourceForTypeNews" GridLines="None" ShowHeader="False" OnRowDataBound="GridView2_RowDataBound"
        ShowFooter="True" PageSize="5">
        <Columns>
            <asp:TemplateField HeaderText="header_news" SortExpression="header_news">
                <ItemTemplate>
                    <div id="border_type5">

                        <div class="card" style="width: 18rem;">
                            
                            <div class="card-body">
                                <h5 class="card-title"><asp:Label ID="LabelItem2Header_news" runat="server" CssClass="headerText2" Text='<%# Bind("header_news") %>'></asp:Label></h5>
                                <p class="card-text"><asp:Label ID="LabelItem2Text_news" runat="server" Text='<%# Bind("text_news") %>'></asp:Label></p>
                                <a href="#" class="btn btn-primary">Go somewhere</a>

                                <div class="textAvtor">
                                    <b>Автор:</b>

                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("middle_name") %>'></asp:Label><br />
                                </div>
                            </div>
                            <div>
                                <asp:HyperLink ID="HyperLinkItemFilePath" runat="server" NavigateUrl='<%# Bind("filePath") %>'
                                    Text='<%# Bind("fileNames") %>'></asp:HyperLink>
                                <asp:Label ID="LabelItemFilePath" runat="server" Visible="false" CssClass="formText"
                                    Text='<%# Bind("filePath") %>'></asp:Label>
                                <asp:Label ID="LabelItemFileType" runat="server" Visible="false" CssClass="formText"
                                    Text='<%# Bind("fileType") %>'></asp:Label>
                                <asp:Label ID="LabelItemFileNames" runat="server" Visible="false" CssClass="formText"
                                    Text='<%# Bind("fileNames") %>'></asp:Label>
                                <asp:Label ID="LabelItemFileLength" runat="server" Visible="false" CssClass="formText"
                                    Text='<%# Bind("fileLength") %>'></asp:Label>
                                <asp:Label Visible="false" ID="LabelItemFileGUIDNames" runat="server" Text='<%# Bind("fileGUIDNames") %>'></asp:Label>
                            </div>
                        </div>

                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                           
                            <tr>
                                <td>
                                    <asp:Label ID="LabelItemFiles" CssClass="formText" Text="скачать вложение: " runat="server"></asp:Label>
                                    <asp:ImageButton Visible="false" ID="ImageButtonFiles" CausesValidation="False" CommandName="Select"
                                        AlternateText='<%# Bind("fileNames") %>' CommandArgument='<%# Bind("fileNames") %>'
                                        runat="server" />
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
        <asp:Parameter DefaultValue="1" Name="items" Type="String" />
        <asp:Parameter DefaultValue="10" Name="top" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="id_news" Type="Int32" />
        <asp:Parameter Name="items" Type="String" />
    </DeleteParameters>
</asp:SqlDataSource>
        

        