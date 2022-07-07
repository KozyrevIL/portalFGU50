<%@ Control Language="C#" AutoEventWireup="true" CodeFile="news_bloks.ascx.cs" Inherits="UC_news_bloks" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>

<asp:GridView ID="GridView2" runat="server" Width="100%" AutoGenerateColumns="False"
                                            DataKeyNames="id_news" PagerSettings-Mode="Numeric" AllowPaging="True"
                                            GridLines="None" ShowHeader="False" CssClass="formText4" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                            <Columns>
                                                <asp:TemplateField HeaderText="id_news" InsertVisible="False" SortExpression="id_news"
                                                    Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LabelItemId_news" runat="server" Text='<%# Bind("id_news") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_news") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="id_sotrudnik" HeaderText="id_sotrudnik" SortExpression="id_sotrudnik"
                                                    Visible="False" />
                                                <asp:BoundField DataField="prioritet_news" HeaderText="prioritet_news" SortExpression="prioritet_news"
                                                    Visible="False" />
                                                <asp:TemplateField HeaderText="header_news" SortExpression="header_news">
                                                    <ItemTemplate>
                                                        <div class="well">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr height="10px">
                                                                    <td>
                                                                        <div style="float: left; margin-right: 10px">
                                                                            <asp:Label ID="Label3" runat="server" CssClass="textDate" Text='<%# Bind("date_news") %>'></asp:Label>
                                                                        </div>
                                                                        <div>
                                                                            <asp:Label ID="Label1" runat="server" CssClass="headerText2" Text='<%# Bind("header_news") %>'></asp:Label>
                                                                        </div>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td align="left" valign="top">
                                                                        <asp:Label ID="LabelItemItems" runat="server" Visible="false" CssClass="formText"
                                                                            Text='<%# Bind("items") %>'></asp:Label>
                                                                        <asp:CheckBox ID="CheckBoxItemHave_images" runat="server" Checked='<%# Bind("have_images") %>'
                                                                            Visible="false" Enabled="false" />
                                                                        <table cellpadding="5px" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td width="100%" align="left" valign="top">

                                                                                    <asp:Label ID="LabelItemText_news" runat="server" CssClass="formText" Text='<%# Bind("text_news") %>'></asp:Label>

                                                                                </td>
                                                                                <td width="234px" align="right" valign="top">
                                                                                    <asp:HyperLink ID="HyperLinkItemText_news_img" runat="server" NavigateUrl="#">
                                                                                        <cc1:HighslideImage ID="ImageItemNews" Width="140px" runat="server" />
                                                                                        <cc1:HighslideManager ID="HighslideManager1" runat="server">
                                                                                        </cc1:HighslideManager>
                                                                                    </asp:HyperLink>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="LabelItemFiles" CssClass="formText" Text="скачать вложение: " runat="server"></asp:Label>
                                                                        <asp:ImageButton Visible="false" ID="ImageButtonFiles" CausesValidation="False" CommandName="Select"
                                                                            AlternateText='<%# Bind("fileNames") %>' CommandArgument='<%# Bind("fileNames") %>'
                                                                            ImageUrl="~/images/22х22/filesave.png" runat="server" />
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
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td align="right">
                                                                        <div class="textAvtor">
                                                                            Автор новости:
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                                                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                                                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("middle_name") %>'></asp:Label><br />
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="have_file" SortExpression="have_file" Visible="False">
                                                    <EditItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("have_file") %>' />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBoxHave_file" runat="server" Checked='<%# Bind("have_file") %>'
                                                            Enabled="false" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="path_file" SortExpression="path_file" Visible="False">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("path_file") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("path_file") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="have_images" SortExpression="have_images" Visible="False">
                                                    <EditItemTemplate>
                                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("have_images") %>' />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("have_images") %>'
                                                            Enabled="false" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="type_news" HeaderText="type_news" SortExpression="type_news"
                                                    Visible="False" />
                                            </Columns>
                                        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceNewsProduction" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="NewsDelete" DeleteCommandType="StoredProcedure" SelectCommand="NewsSelectItems"
            SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_news" Type="Int32" />
                <asp:Parameter Name="items" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="01.01.1901" Name="begin_date" SessionField="begin_dateNews"
                    Type="String" />
                <asp:SessionParameter DefaultValue="01.01.1901" Name="end_date" SessionField="end_dateNews"
                    Type="String" />
                <asp:Parameter DefaultValue="7" Name="items" Type="String" />
                <asp:Parameter DefaultValue="10" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        