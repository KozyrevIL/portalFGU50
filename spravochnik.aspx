<%@ Page Title="" Language="C#" MasterPageFile="~/bootstrap_base.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="spravochnik.aspx.cs" Inherits="spravochnik"  %>




<%@ Register src="UC/banner_work_bootstrap.ascx" tagname="banner_work_bootstrap" tagprefix="uc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        html, body {
            padding: 0;
            margin: 0;
            background-color: #ffffff;
            background: #ffffff url(images/bg/bg1.jpg) top center;
            background-size: 100% auto;
            background-repeat: no-repeat;
            font-family: 'Tahoma', sans-serif;
            background-attachment: fixed;
        }
    </style>
    


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div class="container-fluid" id="Div1" runat="server">

         <div class="row">

             
           
             <uc1:banner_work_bootstrap ID="banner_work_bootstrap1" runat="server" header="Телефонный справочник Филиала" showReturnDefault="true" />

             
           
        </div>
</div>
    <div class="container" id="Div2" runat="server">
            <div class="row">
                <ul class="list-group">
                    <li class="list-group-item clearfix list-group-item-success">

                        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                            <asp:DropDownList ID="DropDownListDolgnost" runat="server" CssClass="form-control"   AppendDataBoundItems="True" DataSourceID="SqlDataSourceDolgnost" DataTextField="name_dolgnost" DataValueField="id_dolgnost">
                                <asp:ListItem Text="По должности" Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceDolgnost" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" SelectCommand="SELECT name_dolgnost, id_dolgnost FROM Dolgnost ORDER BY name_dolgnost"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" SelectCommand="SELECT name_otdel_abr, id_otdel FROM Otdel WHERE (active = 1) AND (name_otdel_abr NOT LIKE '%' + 'Test' + '%') AND (name_otdel_abr NOT LIKE '%' + 'Тест' + '%') AND (name_otdel_abr NOT LIKE '%' + 'ЗАКРЫТ' + '%') AND (name_otdel_abr NOT LIKE '%' + 'ЗАКРЫТ' + '%') AND (name_otdel_abr NOT LIKE '%' + 'НЕТ' + '%') AND (name_otdel_abr NOT LIKE '%' + 'СТАРЫЙ' + '%') AND (name_otdel_abr IS NOT NULL) AND (name_otdel_abr &lt;&gt; '') ORDER BY name_otdel_abr"></asp:SqlDataSource>
                        </div>
                        
                        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                            <asp:DropDownList ID="DropDownListOtdelSearch" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceOtdel" DataTextField="name_otdel_abr" DataValueField="id_otdel" AppendDataBoundItems="true">
                                <asp:ListItem Text="По отделу" Value=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" SelectCommand="SELECT name_otdel_abr, id_otdel FROM Otdel WHERE (active = 1) AND (name_otdel_abr NOT LIKE '%' + 'Test' + '%') AND (name_otdel_abr NOT LIKE '%' + 'Тест' + '%') AND (name_otdel_abr NOT LIKE '%' + 'ЗАКРЫТ' + '%') AND (name_otdel_abr NOT LIKE '%' + 'ЗАКРЫТ' + '%') AND (name_otdel_abr NOT LIKE '%' + 'НЕТ' + '%') AND (name_otdel_abr NOT LIKE '%' + 'СТАРЫЙ' + '%') AND (name_otdel_abr IS NOT NULL) AND (name_otdel_abr &lt;&gt; '') ORDER BY name_otdel_abr"></asp:SqlDataSource>
                        </div>


                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                            <div class="input-group">
                                <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control" data-toggle="tooltip" data-placement="bottom" title="Фильтр по маске. При пустом значении выдает все строки"></asp:TextBox>
                                <span class="input-group-btn">
                                    <asp:LinkButton ID="LinkButtonSearch" runat="server" CssClass="btn btn-info" CausesValidation="false" TabIndex="1" OnClick="LinkButtonSearch_Click"> <span aria-hidden="true" class="glyphicon glyphicon-search"></span>Поиск </asp:LinkButton>
                                </span>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                            <div class="btn-group">
                                <asp:LinkButton ID="ImageButtonExcel" runat="server" CssClass="btn btn-default" CausesValidation="false" OnClick="ImageButtonExcel_Click1"> <span aria-hidden="true" class="fa fa-file-excel-o"></span>Excel </asp:LinkButton>
                                <asp:LinkButton ID="ImageButtonWord" runat="server" CssClass="btn btn-default" CausesValidation="false" OnClick="ImageButtonWord_Click1"> <span aria-hidden="true" class="fa fa-file-word-o"></span>Word </asp:LinkButton>

                            </div>
                        </div>
                        <div style="clear: both"></div>
                    </li>

                </ul>

                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CssClass="table table-bordered table-striped  table-hover"
                    AllowSorting="True" PagerStyle-BackColor="Info" PagerStyle-Font-Size="Small" PagerStyle-BorderWidth="1" PagerStyle-BorderColor="Blue" PagerStyle-BorderStyle="Dashed"
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_spravochnik" DataSourceID="SqlDataSourceSpravochnikForMask"
                    PageSize="40" Width="100%"
                    OnRowDataBound="GridView1_RowDataBound" RowStyle-CssClass="warning">

                    <Columns>
                        <%--<asp:CommandField ShowSelectButton="True" ItemStyle-Width="50px">
                            <ItemStyle Width="50px"></ItemStyle>
                        </asp:CommandField>--%>
                        <asp:BoundField DataField="id_spravochnik" HeaderText="id сотр." InsertVisible="False"
                            ReadOnly="True" SortExpression="id_spravochnik" Visible="false" />
                        <asp:BoundField DataField="id_sotrudnik" HeaderText="id сотр." SortExpression="id_sotrudnik"
                            Visible="true" />
                        <asp:BoundField DataField="last_name" HeaderText="Фамилия"
                            SortExpression="last_name" ItemStyle-Width="70px"  >
                            <ItemStyle Width="70px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="first_name" HeaderText="Имя"
                            SortExpression="first_name" ItemStyle-Width="70px" >
                            <ItemStyle Width="70px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="middle_name" HeaderText="Отчество"
                            SortExpression="middle_name" ItemStyle-Width="70px" >
                            <ItemStyle Width="70px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="full_name" HeaderText="Полное имя" ReadOnly="True" SortExpression="full_name"
                            Visible="False" />
                        <asp:BoundField DataField="id_filial" HeaderText="id_filial" SortExpression="id_filial"
                            Visible="False" />
                        <asp:BoundField DataField="name_filial" HeaderText="Филиал" SortExpression="name_filial" Visible="False" />
                        <asp:BoundField DataField="id_otdel" HeaderText="id_otdel" SortExpression="id_otdel"
                            Visible="False" />
                        <asp:BoundField DataField="id_otdel" HeaderText="ID отдела" SortExpression="id_otdel" />
                        <asp:TemplateField HeaderText="Отдел" SortExpression="name_otdel">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("name_otdel") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("name_otdel") %>' ToolTip='<%# Bind("name_otdel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_dolgnost" HeaderText="id_dolgnost" SortExpression="id_dolgnost"
                            Visible="False" />
                        <asp:BoundField DataField="name_dolgnost" HeaderText="Должность"
                            SortExpression="name_dolgnost" ItemStyle-Width="250px">
                            <ItemStyle Width="250px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="number_cab" HeaderText="№ каб."
                            SortExpression="number_cab" ItemStyle-Width="50px">
                            <ItemStyle Width="50px"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="телефон" SortExpression="number_phone">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("number_phone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelItemNumber_phone" Width="100px" runat="server" Text='<%# Bind("number_phone") %>'></asp:Label>
                                <asp:HyperLink ID="HyperLinkItemNumber_phone" ToolTip="Для набора номера нажмите на ссылку. Требуется авторизация." Target="_blank" CssClass="text_links2" runat="server"></asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IP тел." SortExpression="number_ip_phone">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("number_ip_phone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelItemNumber_ip_phone" runat="server" Text='<%# Bind("number_ip_phone") %>'></asp:Label>
                                <asp:HyperLink ID="HyperLinkItemNumber_ip_phone" ToolTip="Для набора номера нажмите на ссылку. Требуется авторизация." Target="_blank" CssClass="text_links2" runat="server"></asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="70px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Моб.тел" SortExpression="number_mob">
                            <ItemTemplate>
                                <%--<div style="float: left; margin-right: 6px">
                                    <asp:Image ID="ImageMob" ImageUrl="images/16х16/beeline.png" runat="server" />
                                </div>--%>
                                <div>
                                    <asp:Label ID="LabelItemNumber_mob" runat="server" Text='<%# Bind("number_mob") %>'></asp:Label>
                                </div>
                                <asp:Label ID="LabelId_otdel" runat="server" Text='<%# Bind("id_otdel") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("number_mob") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Эл.почта" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("email2") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="70px" />
                        </asp:TemplateField>
                        
                    </Columns>

                    <EditRowStyle CssClass="danger"></EditRowStyle>
                    <HeaderStyle CssClass="info "></HeaderStyle>
                    <AlternatingRowStyle CssClass="active" />
                    <PagerSettings Position="Bottom" Mode="Numeric"></PagerSettings>
                    <PagerStyle CssClass="pagination-ys"></PagerStyle>
                    <FooterStyle CssClass="info" />

<RowStyle CssClass="warning"></RowStyle>
                </asp:GridView>
            </div>
        </div>
        
        <asp:SqlDataSource ID="SqlDataSourceSpravochnikForMask" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="SpravochnikDelete" DeleteCommandType="StoredProcedure" InsertCommand="SpravochnikInsert"
            InsertCommandType="StoredProcedure" SelectCommand="SpravochnikSelectForMask" SelectCommandType="StoredProcedure"
            UpdateCommand="SpravochnikUpdate" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id_spravochnik" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_spravochnik" Type="Int32" />
                <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                <asp:Parameter Name="id_filial" Type="Int32" />
                <asp:Parameter Name="id_otdel" Type="Int32" />
                <asp:Parameter Name="id_dolgnost" Type="Int32" />
                <asp:Parameter Name="number_cab" Type="String" />
                <asp:Parameter Name="number_phone" Type="String" />
                <asp:Parameter Name="number_ip_phone" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="id_sotrudnik" Type="Int32" />
                <asp:Parameter Name="id_filial" Type="Int32" />
                <asp:Parameter Name="id_otdel" Type="Int32" />
                <asp:Parameter Name="id_dolgnost" Type="Int32" />
                <asp:Parameter Name="number_cab" Type="String" />
                <asp:Parameter Name="number_phone" Type="String" />
                <asp:Parameter Name="number_ip_phone" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue=" " Name="mask" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="DropDownListOtdelSearch" DefaultValue="-1" Name="id_otdel" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListDolgnost" DefaultValue="-1" Name="id_dolgnost" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>

