<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_otdel.aspx.cs" MaintainScrollPositionOnPostback="true" StylesheetTheme="global" Inherits="Admin_admin_otdel" MasterPageFile="~/Admin/admin_bootstrap.master" %>

<%@ MasterType VirtualPath="~/Admin/admin_bootstrap.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <script type="text/javascript" src="../js/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".datepick").datetimepicker({ language: 'ru' });
        });
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    <div class="container-fluid">
        <section class="row well well well-sm">
            <div class="col-md-2">
                <div class="form-group">
                    <label>Наименование отдела</label>
                    <asp:TextBox ID="tbOtdel" runat="server" TextMode="MultiLine" Height="96px" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Сокращенное наименование отдела</label>
                    <asp:TextBox ID="tbOtdelAbr" runat="server" CssClass="form-control"></asp:TextBox>
<label>Филиал</label>
                    <asp:DropDownList ID="ddlFilial" runat="server" DataSourceID="sdsFilials"
                        DataTextField="NAME_FILIAL" DataValueField="ID_FILIAL" Width="100%" CssClass="form-control">
                    </asp:DropDownList>
                </div>
            </div>
            
            <div class="col-md-1">
                <div class="form-group">
                    <label>Факт.численность</label>
                    <asp:TextBox ID="tbOtdelFakt" runat="server" CssClass="form-control"></asp:TextBox>
                    <label>Штат.численность</label>
                    <asp:TextBox ID="tbOtdelReal" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>Куратор</label>
                     <asp:DropDownList ID="DropDownListСurator" runat="server" DataSourceID="SqlDataSourceSotrudnik"
                        DataTextField="full_name" DataValueField="id_sotrudnik" Width="100%" CssClass="form-control">
                    </asp:DropDownList>
                    <label>Нач. отдела</label>
                     <asp:DropDownList ID="DropDownListBoss" runat="server" DataSourceID="SqlDataSourceSotrudnik"
                        DataTextField="full_name" DataValueField="id_sotrudnik" Width="100%" CssClass="form-control">
                    </asp:DropDownList>
                </div>
            </div>

            <div class="col-md-2">
                <div class="form-group">
                    <label>Принадлежность</label>
                    <asp:DropDownList ID="DropDownListType_otdel" runat="server" CssClass="form-control">
                        <asp:ListItem Value="ТО">Филиал</asp:ListItem>
                        <asp:ListItem Value="ЦА">Центральный</asp:ListItem>
                    </asp:DropDownList>
                    <label>Тип подразд. для распред. фонда ЗП</label>
                    <asp:DropDownList ID="DropDownListType_finance" runat="server" CssClass="form-control">
                         <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="ТО">Филиал</asp:ListItem>
                                    <asp:ListItem Value="ЦА">Центральный</asp:ListItem>
                                    <asp:ListItem Value="ПО">Производственный</asp:ListItem>
                    </asp:DropDownList>

                </div>
            </div>
          
            <div class="col-md-1">
                <div class="form-group">
                     <label>Отдел активен&nbsp;</label><br /> 
                    <asp:CheckBox ID="cbActive" runat="server" Checked="true" /><br /> 
                    <label>Отчёт о работе отдела&nbsp;</label><br /> 
                    <asp:CheckBox ID="cbShiftCountReport" runat="server" Checked="true" />
                </div>
            </div>
            <div class="col-md-1">
                <div class="form-group">
                    <label></label>
                </div>
            </div>
            </section>
          <%--  <ul class="list-group">


                <li class="list-group-item">
                    <div class="col-sm-1">
                        <asp:Button ID="ButtonInsertOtdel" runat="server" CssClass="btn-success btn" Text="Добавить отдел" OnClick="ButtonInsertOtdel_Click" />
                    </div>
                    <div class="clearfix"></div>
                </li>
            </ul>--%>
            <section id="search_data">
                <div class="container-fluid well well-sm">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="btn btn-group">
                                <asp:LinkButton ID="LinkButtonInsert" CssClass="btn btn-success btn-lg" runat="server" OnClick="LinkButtonInsert_Click"> <i  class="glyphicon glyphicon-paste"></i></asp:LinkButton>
                                <asp:LinkButton ID="ImageButtonExcel" runat="server" CssClass="btn btn-warning btn-lg" CausesValidation="false" OnClick="ImageButtonExcel_Click"> <span aria-hidden="true" class="fa fa-file-excel-o"></span></asp:LinkButton>
                                <asp:LinkButton ID="ImageButtonWord" runat="server" CssClass="btn btn-warning btn-lg" CausesValidation="false" OnClick="ImageButtonWord_Click"> <span aria-hidden="true" class="fa fa-file-word-o"></span></asp:LinkButton>
                         
                            </div>
                        </div>
                        <div class="col-md-2">
                           

                        </div>
                        <div class="col-md-1">
                           
                        </div>
                        <div class="col-md-2">
                          
                        </div>
                        <div class="col-md-2">
                           
                        </div>
                        <div class="col-md-2 ">
                            <div class="form-group">
                                <label>Фильтр. Поиск по маске</label>
                                <div class="input-group">

                                    <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="LinkButtonSearch" runat="server" CssClass="btn btn-info" CausesValidation="false" > <i class="glyphicon glyphicon-search"></i></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonReset" runat="server" CssClass="btn btn-danger" CausesValidation="false" data-toggle="tooltip" data-placement="bottom" title="Сброс фильтра" OnClick="LinkButtonReset_Click"> <i class="glyphicon glyphicon-remove" ></i></asp:LinkButton>
                                    </span>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-1 col-md-1 col-sm-1">
                           

                        </div>
                    </div>
                </div>
            </section>
            <div id="grid">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="id_otdel" DataSourceID="SqlDataSourceOtdel"
                    AllowSorting="True" CssClass="table table-bordered table-striped">

                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Обновить"><span class="glyphicon glyphicon-refresh" data-toggle="tooltip" data-placement="top" title="Обновить"></span></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена"><span class="glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="top" title="Отмена"></span></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка"><span class="glyphicon glyphicon-pencil" data-toggle="tooltip" data-placement="top" title="Редактировать"></span></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Удалить" OnClientClick="return confirm('Удалить запись?');"><span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="top" title="Удаление - ВНИМАНИЕ необратимая операция!"></span></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_otdel" HeaderText="id_otdel" InsertVisible="False"
                            ReadOnly="True" SortExpression="id_otdel" ApplyFormatInEditMode="True" Visible="False" />
                        <asp:TemplateField HeaderText="Наименование отдела" SortExpression="name_otdel">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name_otdel") %>' Width="300px" CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name_otdel") %>' Width="300px"></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Сокращение" SortExpression="name_otdel_abr">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("name_otdel_abr") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("name_otdel_abr") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Филиал" SortExpression="id_filial">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsFilials"
                                    DataTextField="NAME_FILIAL" DataValueField="ID_FILIAL"
                                    SelectedValue='<%# Bind("id_filial") %>' CssClass="form-control">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("name_filial") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Факт. численность"
                            SortExpression="count_otdel_fakt">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"
                                    Text='<%# Bind("count_otdel_fakt") %>' Width="50px" CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("count_otdel_fakt") %>' Width="50px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Реальная численность"
                            SortExpression="count_otdel_real">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server"
                                    Text='<%# Bind("count_otdel_real") %>' Width="50px" CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("count_otdel_real") %>' Width="50px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Активный" SortExpression="active">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("active") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("active") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Отчёт о работе"
                            SortExpression="shift_count_report">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox3" runat="server"
                                    Checked='<%# Bind("shift_count_report") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox4" runat="server"
                                    Checked='<%# Bind("shift_count_report") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Тип" SortExpression="type_otdel">
                            <EditItemTemplate>

                                <asp:DropDownList ID="DropDownListType_otdel" runat="server" SelectedValue='<%# Bind("type_otdel") %>' CssClass="form-control">
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="ТО">Филиал</asp:ListItem>
                                    <asp:ListItem Value="ЦА">Центральный</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("type_otdel") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Тип подразд. для распред. фонда ЗП" SortExpression="type_finance">
                            <EditItemTemplate>
                               


                                <asp:DropDownList ID="DropDownListType_finance" runat="server" CssClass="form-control" SelectedValue='<%# Bind("type_finance") %>'>
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="ТО">Филиал</asp:ListItem>
                                    <asp:ListItem Value="ЦА">Центральный</asp:ListItem>
                                    <asp:ListItem Value="ПО">Производственный</asp:ListItem>
                                </asp:DropDownList>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("type_finance") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Изм. отдел IT. Путь OU" SortExpression="AD_ou_path">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("AD_ou_path") %>' CssClass="form-control" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("AD_ou_path") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Изм. отдел IT. File prof." SortExpression="AD_bat_file">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("AD_bat_file") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("AD_bat_file") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Изм. отдел IT. Group" SortExpression="AD_group">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("AD_group") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("AD_group") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Начальник" SortExpression="full_name_boss">
                            <EditItemTemplate>
                           <%--     <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("full_name_boss") %>'></asp:TextBox>--%>

                                <asp:DropDownList ID="DropDownLisEditBoss" runat="server" DataSourceID="SqlDataSourceSotrudnik" SelectedValue='<%# Bind("id_boss") %>'
                        DataTextField="full_name" DataValueField="id_sotrudnik" Width="100%" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>


                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("full_name_boss") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_boss" HeaderText="id_boss" ReadOnly="True" SortExpression="id_boss" Visible="False" />
                        <asp:TemplateField HeaderText="Куратор" SortExpression="full_name_curator">
                            <EditItemTemplate>
                                <%--<asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("full_name_curator") %>'></asp:TextBox>--%>

                                <asp:DropDownList ID="DropDownListEditCurator" runat="server" DataSourceID="SqlDataSourceSotrudnik" SelectedValue='<%# Bind("id_curator") %>'
                        DataTextField="full_name" DataValueField="id_sotrudnik" Width="100%" CssClass="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("full_name_curator") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_curator" HeaderText="id_curator" SortExpression="id_curator" Visible="False" />
                    </Columns>

                </asp:GridView>
            </div>
            <div id="datasource">
                <asp:SqlDataSource ID="sdsFilials" runat="server"
                    ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    SelectCommand="FilialActiveList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceOtdel" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                    InsertCommand="OtdelInsert" InsertCommandType="StoredProcedure" SelectCommand="OtdelSelect"
                    SelectCommandType="StoredProcedure" DeleteCommand="OtdelDelete"
                    DeleteCommandType="StoredProcedure" UpdateCommand="OtdelUpdate"
                    UpdateCommandType="StoredProcedure" OnInserting="SqlDataSourceOtdel_Inserting">
                    <InsertParameters>
                        <asp:Parameter Name="id_filial" Type="Int32" />
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="name_otdel_abr" Type="String" />
                        <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                        <asp:Parameter Name="count_otdel_real" Type="Int32" />
                        <asp:Parameter Name="active" Type="Boolean" />
                        <asp:Parameter Name="shift_count_report" Type="Boolean" />
                        <asp:Parameter Name="type_otdel" Type="String" />
                        <asp:Parameter Name="pos_dom_gen" Type="Int32" />
                        <asp:Parameter Name="id_boss" Type="Int32" />
                        <asp:Parameter Name="id_curator" Type="Int32" />
                        <asp:Parameter Name="type_finance" Type="String" />
                    </InsertParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="id_otdel" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="id_otdel" Type="Int32" />
                        <asp:Parameter Name="id_filial" Type="Int32" />
                        <asp:Parameter Name="name_otdel" Type="String" />
                        <asp:Parameter Name="name_otdel_abr" Type="String" />
                        <asp:Parameter Name="count_otdel_fakt" Type="Int32" />
                        <asp:Parameter Name="count_otdel_real" Type="Int32" />
                        <asp:Parameter Name="active" Type="Boolean" />
                        <asp:Parameter Name="shift_count_report" Type="Boolean" />
                        <asp:Parameter Name="type_otdel" Type="String" />
                        <asp:Parameter Name="AD_ou_path" Type="String" />
                        <asp:Parameter Name="AD_bat_file" Type="String" />
                        <asp:Parameter Name="AD_group" Type="String" />
                        <asp:Parameter Name="pos_dom_gen" Type="Int32" />
                        <asp:Parameter Name="id_boss" Type="Int32" />
                        <asp:Parameter Name="id_curator" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
    </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceSotrudnik" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" SelectCommand="SELECT id_sotrudnik, last_name + ' ' + first_name + ' ' + middle_name AS full_name FROM Sotrudnik WHERE (active = 1) AND (id_otdel &lt;&gt; 126) ORDER BY full_name"></asp:SqlDataSource>

</asp:Content>



