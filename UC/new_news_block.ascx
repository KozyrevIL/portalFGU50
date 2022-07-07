<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new_news_block.ascx.cs" Inherits="UC_new_news_block" EnableViewState="False" %>
<%@ Register Assembly="HighslideImage" Namespace="Encosia" TagPrefix="cc1" %>

<div>
    <div style="font-family: Tahoma; font-size: 24px; color: #2169a8; margin-right: 5px;">
        <asp:Label ID="LabelHeader" runat="server"></asp:Label>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" Width="485px" AutoGenerateColumns="False" DataKeyNames="id_news" PagerSettings-Mode="Numeric" GridLines="None" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound" PageSize="<%#PagingNews%>" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true">
            <Columns>
                <asp:TemplateField HeaderText="id_news" InsertVisible="False" SortExpression="id_news" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="LabelItemId_news" runat="server" Text='<%# Bind("id_news") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_news") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="header_news" SortExpression="header_news">
                    <ItemTemplate>
                        <div id="gridview" style="margin-top: 14px;">
                            <div style="border: 1px solid #a8a8a8; width: <%# WidthNews-20 %>; padding: 5px;">
                                <div>
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                        <tr>
                                            <td align="left" valign="top">
                                                <asp:Label ID="LabelItemItems" runat="server" Visible="false" CssClass="formText" Text='<%# Bind("items") %>'></asp:Label>
                                                <asp:CheckBox ID="CheckBoxItemHave_images" runat="server" CssClass="News_3" Checked='<%# Bind("have_images") %>'
                                                    Visible="false" Enabled="false" />
                                                <table cellpadding="5px" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="100%" align="left" valign="top">
                                                            <div>
                                                                <asp:Label ID="LabelItemDate_news" runat="server" CssClass="textDate" Text='<%# Bind("date_news") %>'></asp:Label>
                                                            </div>
                                                            <div style="font-family: Tahoma; font-size: 14px;">
                                                                <div style="float: left; border: 0px solid #8A8A8A; padding: 1px 1px 1px 1px; margin-right: 10px; height: 83px; overflow: hidden; clear: both;">
                                                                    <img id="ImageItemNews" src='<%#".././photoDB.ashx?item=image_low2&w=100&h=100&id_item="+ Eval("items") %>' border="0" width="100" runat="server" />
                                                                </div>
                                                                <br />
                                                                <div>
                                                                    <asp:Label ID="LabelItemHeader_news" runat="server" CssClass="headerTextNSA" Text='<%# Bind("header_news") %>'></asp:Label>
                                                                </div>
                                                                <div style="display: block; margin-top: 12px; text-indent: 15px;">
                                                                    <asp:Label ID="LabelItemText_news_short" runat="server" CssClass="headerTextNSA-1" Text='<%# Bind("text_news_short") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <asp:HyperLink ID="Go" runat="server" Text="Читать далее" CssClass="goToDetails" NavigateUrl="~/test.aspx"></asp:HyperLink>
                                                            </div>
                                                            <div id="modal_form" class="modal_form" runat="server">
                                                                <div id="modal_close" class="modal_close" runat="server">Скрыть новость</div>
                                                                <%--<div id="updown"></div>--%>
                                                                <div>
                                                                    <asp:GridView ID="GridView2" runat="server" Width="100%"
                                                                        AutoGenerateColumns="False" DataKeyNames="id_news" PagerSettings-Mode="Numeric"
                                                                        AllowPaging="True" GridLines="None" ShowHeader="False"
                                                                        OnRowDataBound="GridView2_RowDataBound"
                                                                        OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="id_news" InsertVisible="False"
                                                                                SortExpression="id_news" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="LabelItemId_news" runat="server" Text='<%# Bind("id_news") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="prioritet_news" SortExpression="prioritet_news"
                                                                                Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("prioritet_news") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="header_news" SortExpression="header_news">
                                                                                <ItemTemplate>
                                                                                    <table cellpadding="0" cellspacing="0" border="0" width="100%" id="news_description_start">
                                                                                        <tr height="20px">
                                                                                            <td>
                                                                                                <asp:Label ID="LabelItemDate_news" runat="server" CssClass="textDate" Text='<%# Bind("date_news") %>'></asp:Label><br />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr height="50px">
                                                                                            <td>
                                                                                                <asp:Label ID="Label1" runat="server" CssClass="headerText3" Text='<%# Bind("header_news") %>'></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left" valign="top">
                                                                                                <asp:Label ID="LabelItemItems" runat="server" Visible="false" CssClass="formText" Text='<%# Bind("items") %>'></asp:Label>
                                                                                                <asp:CheckBox ID="CheckBoxItemHave_images" runat="server" Checked='<%# Bind("have_images") %>' Visible="false" Enabled="false" />
                                                                                                <table cellpadding="5px" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td width="100%" align="left" valign="top">
                                                                                                            <%--<cc1:HighslideManager ID="HighslideManager1" runat="server"></cc1:HighslideManager>
                                                                                                            <cc1:HighslideImage ID="ImageItemNews" Width="234" Style="float: left; padding-right: 10px;" runat="server" />--%>
                                                                                                            <img id="ImageItemNewsChild" src='<%#".././photoDB.ashx?item=image_low2&w=234&h=100&id_item="+ Eval("items") %>' border="0" width="234" runat="server" style="float: left; padding: 0px 10px 5px 0px" />
                                                                                                            <asp:Label ID="Label2" runat="server" CssClass="formText5" Text='<%# Bind("text_news") %>'></asp:Label>

                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr id="news_description_end">
                                                                                            <td height="10px"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td height="10px"></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="right"></td>
                                                                                        </tr>
                                                                                        <span></span>
                                                                                    </table>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="have_images" SortExpression="have_images" Visible="False">

                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("have_images") %>'
                                                                                        Enabled="false" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="type_news" SortExpression="type_news"
                                                                                Visible="False">

                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("type_news") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                                <script type="text/javascript">(function () {
    if (window.pluso) if (typeof window.pluso.start == "function") return;
    if (window.ifpluso == undefined) {
        window.ifpluso = 1;
        var d = document, s = d.createElement('script'), g = 'getElementsByTagName';
        s.type = 'text/javascript'; s.charset = 'UTF-8'; s.async = true;
        s.src = ('https:' == window.location.protocol ? 'https' : 'http') + '://share.pluso.ru/pluso-like.js';
        var h = d[g]('body')[0];
        h.appendChild(s);
    }
})();</script>
                                                                <div class="pluso" data-background="transparent" data-options="small,round,line,horizontal,nocounter,theme=04" data-services="vkontakte,odnoklassniki,facebook,twitter,google,moimir,yazakladki,livejournal,evernote,print"></div>
                                                            </div>
                                                            <div id="overlay" class="overlay" runat="server"></div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
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
                        <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("have_images") %>'
                            Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="type_news" HeaderText="type_news" SortExpression="type_news"
                    Visible="False" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" SelectCommand="NewsSelectItems" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="01.01.2013" Name="begin_date" Type="String" />
            <asp:Parameter DefaultValue="01.12.2015" Name="end_date" Type="String" />
            <asp:Parameter DefaultValue="1" Name="items" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceId_news" runat="server"
        ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
        SelectCommand="NewsSelectForId" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="" Name="id_news" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
<div id="updown"></div>
<%--<script>
    var updownElem = document.getElementById('updown');
    var pageYLabel = 0;
    updownElem.onclick = function () {
        var pageY = window.pageYOffset || document.documentElement.scrollTop;
        switch (this.className) {
            case 'up':
                pageYLabel = pageY;
                window.scrollTo(0, 0);
                this.className = 'down';
                break;
            case 'down':
                window.scrollTo(0, pageYLabel);
                this.className = 'up';
        }
    }
    window.onscroll = function () {
        var pageY = window.pageYOffset || document.documentElement.scrollTop;
        var innerHeight = document.documentElement.clientHeight;
        switch (updownElem.className) {
            case '':
                if (pageY > innerHeight) {
                    updownElem.className = 'up';
                }
                break;

            case 'up':
                if (pageY < innerHeight) {
                    updownElem.className = '';
                }
                break;

            case 'down':
                if (pageY > innerHeight) {
                    updownElem.className = 'up';
                }
                break;
        }
    }
</script>--%>
