<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_bootstrap.master" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" Theme="gridview" AutoEventWireup="true" CodeFile="Archive_scan.aspx.cs" Inherits="Admin_Archive_scan" %>

<%@ MasterType VirtualPath="~/Admin/admin_bootstrap.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style>



</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
<!-- Модальном окно -->



    <script type="text/javascript" src="../js/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".datepick").datetimepicker({ language: 'ru' });
        });
    </script>


    <script type="text/javascript">
        $(function () {
            $(".datepicktime").datetimepicker({ format: 'HH:mm', pickDate: false, language: 'ru' });
        });</script>


    <script type="text/javascript">
        function openModal(href) {

            $("#iframeXML").attr('src', href);
        }
    </script>

    <section id="form_input_data">
        <div class="container-fluid well well-sm">

            <div class="row">


                <div class="col-lg-2">
                    <div class="form-group">
                        <label>Номер реестрового дела</label><br />
                        <div class="input-group">
                            <asp:TextBox ID="TextBoxKad_number" runat="server" CssClass="form-control" Width="100%" /> 
                            <asp:RequiredFieldValidator ErrorMessage="требуется заполнить" ControlToValidate="TextBoxKad_number" runat="server" Display="Dynamic"  />
                        </div>
                    </div>
                </div>
                 
                  <div class="col-lg-1">
                    <div class="form-group">
                        <label>Переведено томов</label><br />
                        <div class="input-group">
                            <asp:TextBox ID="TextBoxV_volume" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="требуется заполнить" ControlToValidate="TextBoxV_volume" runat="server" Display="Dynamic"  />
                        </div>
                    </div>
                </div>
                <div class="col-lg-1">
                    <div class="form-group">
                        <label>Переведено листов</label><br />
                        <div class="input-group">
                            <asp:TextBox ID="TextBoxV_sheets" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="требуется заполнить" ControlToValidate="TextBoxV_sheets" runat="server" Display="Dynamic"  />
                        </div>
                    </div>
                </div>

                  <div class="col-lg-1">
                    <div class="form-group">
                        <label>Переведено страниц</label><br />
                        <div class="input-group">
                            <asp:TextBox ID="TextBoxV_pages" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ErrorMessage="требуется заполнить" ControlToValidate="TextBoxV_pages" runat="server" Display="Dynamic" />
                        </div>
                    </div>
                </div>


                 <div class="col-lg-4">
                    <div class="form-group">
                        <label>Примечание</label><br />
                        <div class="input-group">
                            <asp:TextBox ID="TextBoxComments" runat="server" CssClass="form-control" Width="300px"  TextMode="MultiLine" Height="50px" />  
                        </div>
                    </div>
                </div>


                <div class="col-md-3">
                    <div class="btn btn-group">
                        <asp:LinkButton ID="LinkButtonInsert" Text="Добавить" CssClass="btn btn-success" runat="server" OnClick="LinkButtonInsert_Click"><i class="glyphicon glyphicon-paste"></i>&nbsp;Добавить</asp:LinkButton>
<%--                            <asp:LinkButton ID="ImageButtonExcel" runat="server" CssClass="btn btn-default" CausesValidation="false" OnClick="ImageButtonExcel_Click1"> <span aria-hidden="true" class="fa fa-file-excel-o"></span>Excel </asp:LinkButton><asp:LinkButton ID="ImageButtonWord" runat="server" CssClass="btn btn-default" CausesValidation="false" OnClick="ImageButtonWord_Click1"> <span aria-hidden="true" class="fa fa-file-word-o"></span>Word </asp:LinkButton>--%>
                    </div>
                </div>
                


            </div>

        </div>

    </section>


    <section id="search_data" style="margin-top: 15px;">
        <div class="container-fluid well well-sm">
            <div class="row">
                <div class="col-md-2 success">
                    <label>Сотрудник</label><br />
                    <asp:DropDownList ID="DropDownListOperator" runat="server" CssClass="form-control" AppendDataBoundItems="True" AutoPostBack="true" EnableViewState="False" DataSourceID="SqlDataSourceSotrudnikAll" DataTextField="fio" DataValueField="id_sotrudnik">
                        <asp:ListItem Text="Выбор сотрудника" Value=" "></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-2">
                    <label>Фильтр по статусу</label><br />
                    <div class="input-group">
                        <asp:DropDownList ID="DropDownListStatus" runat="server" CssClass="form-control">
                            <asp:ListItem Value="all">Все</asp:ListItem>
                            <asp:ListItem Value="notLoaded" Selected="True">Не загружено в ИС Архив</asp:ListItem>
                            <asp:ListItem Value="Loaded">Загружено в ИС Архив</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-md-3 ">
                    <label>Поиск по маске</label><br />
                    <div class="input-group">
                        <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control" placeholder="Поиск по полям: реестровое дело"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:LinkButton ID="LinkButtonSearch" runat="server" CssClass="btn btn-info" CausesValidation="false" OnClick="LinkButtonSearch_Click"> <i class="glyphicon glyphicon-search"></i></asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonReset" runat="server" CssClass="btn btn-danger" CausesValidation="false" data-toggle="tooltip" data-placement="bottom" title="Сброс фильтра" OnClick="LinkButtonReset_Click"> <i class="glyphicon glyphicon-remove" ></i></asp:LinkButton>
                        </span>
                    </div>
                </div>

                 <div class="col-lg-2 col-md-2 col-sm-2 col-lg-offset-3">
                    <div class="input-group">
                        <asp:DropDownList ID="DropDownListReport" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Отчеты" Value=""></asp:ListItem>
                            <asp:ListItem Text="Отчет по листажу(>XX)" Value="1" />
                            <asp:ListItem Text="Пользователи подробно" Value="2" />
                            <asp:ListItem Text="Отчет по пользователям" Value="5" />
                            <asp:ListItem Text="Отчет по загруженным" Value="3" />
                            <asp:ListItem Text="Отчет по загруженным. ИТОГО" Value="4" />
                            <asp:ListItem Text="Отчет по отделам" Value="6" />
                            <asp:ListItem Text="Для нагрузки" Value="7" />
                        </asp:DropDownList>
                        <asp:LinkButton ID="LinkButtonReport" runat="server" CssClass="input-group-addon btn btn-info" OnClick="LinkButtonReport_Click" CausesValidation="false"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </div>

                </div>



<%--                <div class="col-md-1">
                    <label>Начало</label><br />
                    <div class="input-group">

                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                        <asp:TextBox ID="TextBoxDate1_Filtr" Enabled="true" runat="server" CssClass="form-control datepick" Width="94px" data-toggle="tooltip" data-placement="bottom" title="Фильтр по полю Дата правки. Начало диапазона." placeholder="Начало"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-1">
                    <label>Конец</label><br />
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                        <asp:TextBox ID="TextBoxDate2_Filtr" Enabled="true" runat="server" CssClass="form-control datepick" Width="94px" data-toggle="tooltip" data-placement="bottom" title="Фильтр по полю Дата правки. Конец диапазона." placeholder="Конец"></asp:TextBox>
                    </div>
                </div>--%>


            </div>
        </div>

    </section>
    <section id="form_output_data">
        <div class="container-fluid">
            <div class="row">
                <div>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" ShowFooter="True" PageSize="100" DataKeyNames="id" AutoGenerateColumns="False" DataSourceID="SqlDataSourceArchive_scan" CssClass="table table-bordered table-striped table-condensed table-hover" HeaderStyle-CssClass="table info" PagerStyle-BackColor="Info" PagerStyle-Font-Size="Large" PagerStyle-BorderWidth="1" PagerStyle-BorderColor="Blue" PagerStyle-BorderStyle="Dashed" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" AllowSorting="True">

                        <HeaderStyle CssClass="table info"></HeaderStyle>

                        <PagerSettings Position="TopAndBottom" Mode="Numeric"></PagerSettings>
                        <Columns>




                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Обновить"><span class="glyphicon glyphicon-refresh" data-toggle="tooltip" data-placement="top" title="Обновить"></span></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена"><span class="glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="top" title="Отмена"></span></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButtonEdit" Visible="true" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка"><span class="glyphicon glyphicon-pencil" data-toggle="tooltip" data-placement="top" title="Редактировать"></span></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonDelete" Visible="true" runat="server" CausesValidation="False" CommandName="Delete" Text="Удалить" OnClientClick="return confirm('Удалить запись?');"><span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="top" title="Удаление - ВНИМАНИЕ необратимая операция!"></span></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="№ п.п">

                                <ItemTemplate>
                                    <asp:Label ID="LabelItemRow" runat="server"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="25" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" ItemStyle-Width="60px" Visible="false">
                                <ItemStyle Width="60px"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="id_act" HeaderText="id_act" SortExpression="id_act" Visible="false" />
                           <asp:TemplateField HeaderText="Номер дела" SortExpression="num_delo">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("num_delo") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="success" />
                            </asp:TemplateField>
                        <%--     <asp:TemplateField HeaderText="Номер тома" SortExpression="nums_toma">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("nums_toma") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Получено листов" SortExpression="qty_pages_item">
                                <ItemTemplate>
                                    <asp:Label ID="LabelInPages" runat="server" Text='<%# Bind("qty_pages_item") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Получено на сканирование" SortExpression="date_to_work">
                                <ItemTemplate>
                                    <asp:Label ID="LabelDateWork" runat="server" Text='<%# Bind("date_to_work","{0:dd.MM.yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="LabelDScan" runat="server" Text='<%# Eval("date_scan","{0:dd.MM.yyyy}") %>'></asp:Label>
                                    <asp:Label ID="LabelDARCHIVE" runat="server" Text='<%# Eval("date_to_AIS_ARCHIVE","{0:dd.MM.yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Отсканировано" SortExpression="date_scan">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckScan" runat="server" Checked='<%# Eval("date_scan").ToString()!="" %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelDateScan" runat="server" Text='<%# Bind("date_scan","{0:dd.MM.yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="warning" />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Тип загрузки" SortExpression="download_type">
                                <EditItemTemplate>
                                    <asp:DropDownList id="DropDownListEditdownload_type" runat="server" CssClass="form-control" SelectedValue='<%# Bind("download_type") %>'>
                                        <asp:ListItem Text="" Value="" />
                                        <asp:ListItem Text="ручной" Value="ручной" />
                                        <asp:ListItem Text="автоматический" Value="автоматический" />
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelItemdownload_type" runat="server" Text='<%# Bind("download_type") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="100" CssClass="warning"  />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Внесено в АИС Архив" SortExpression="date_to_AIS_ARCHIVE">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="InputAIS" runat="server" Checked='<%# Eval("date_to_AIS_ARCHIVE").ToString()!="" %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("date_to_AIS_ARCHIVE","{0:dd.MM.yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="warning" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Расшивка дела" SortExpression="isDeFibre">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownFible" runat="server" CssClass="form-control" SelectedValue='<%# Bind("isDeFibre") %>'>
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Да"></asp:ListItem>
                                        <asp:ListItem Text="Нет"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("isDeFibre") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="warning" />
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Отсканировано томов" SortExpression="qty_toms">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("qty_toms") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("qty_toms") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="warning" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Отсканировано листов" SortExpression="qty_sheets">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("qty_sheets") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("qty_sheets") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="warning" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Отсканировано страниц" SortExpression="qty_pages">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("qty_pages") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("qty_pages") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="warning" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="XML для загрузки">
                                <ItemTemplate>
                                  <%--  <asp:Button ID="ddd" runat="server" OnClientClick='<%# "openModal(\"../admin/ArchiveGenFileDownload.aspx?id="+Eval("id").ToString()+"&rd="+Eval("num_delo").ToString()+"&toms="+Eval("qty_toms").ToString()+"\"); return false" %>' Text="MODAL"/>--%>

                              <%--      <asp:Button ID="ddd" Text="Modal" runat="server" CssClass="btn btn-primary" data-toggle="modal" data-target="#exampleModal" OnClientClick='<%# "openModal(\"../admin/ArchiveGenFileDownload.aspx?id="+Eval("id").ToString()+"&rd="+Eval("num_delo").ToString()+"&toms="+Eval("qty_toms").ToString()+"\"); return false" %>'>
                                    </asp:Button>--%>

                                    <button type="button" id="Button1"  class="btn btn-info" data-toggle="modal" data-target="#genericFileModal" OnClick='<%# "openModal(\"../admin/ArchiveGenFileDownload.aspx?id="+Eval("id").ToString()+"&rd="+Eval("num_delo").ToString()+"&toms="+Eval("qty_toms").ToString()+"\"); return false" %>'>
                                        Заполнить
                                    </button>

                                   

                                </ItemTemplate>
                                <ItemStyle CssClass="warning" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Примечание" SortExpression="comments">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("comments") %>' CssClass="form-control" TextMode="MultiLine" Height="50px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("comments") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Инфо" SortExpression="comments">
                                <ItemTemplate>
                                    <asp:Label ID="LabelIsInfo" runat="server" Text='<%# Eval("info_txt").ToString()!=""?"Заполнено":"" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>





                            <asp:BoundField DataField="id_sotrudnik" HeaderText="id_sotrudnik" SortExpression="id_sotrudnik" Visible="False">
                                <ControlStyle CssClass="form-control" Width="100px" />
                            </asp:BoundField>


                            <asp:BoundField DataField="id_otdel" HeaderText="id_otdel" SortExpression="id_otdel" ItemStyle-Width="100" Visible="False">

                                <ControlStyle CssClass="form-control" />

                                <ItemStyle Width="100px"></ItemStyle>

                            </asp:BoundField>


                            <asp:BoundField DataField="id_item" HeaderText="id_item" SortExpression="id_item" Visible="false" />


                        </Columns>
                        <EditRowStyle CssClass="warning" />
                        <PagerStyle CssClass="pagination-ys"></PagerStyle>
                        <FooterStyle CssClass="success" />
                    </asp:GridView>
                </div>
            </div>

        </div>

    </section>
    <section id="data">

        <asp:SqlDataSource ID="SqlDataSourceArchive_scan" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            SelectCommand=" SELECT s.id,s.id_act,id_item,id_otdel,id_sotrudnik,operator,date_to_work,date_scan,i.qty_pages qty_pages_item, s.qty_pages,comments,date_to_AIS_ARCHIVE,qty_sheets,qty_toms
            ,i.num_delo,i.nums_toma,s.isDeFibre, s.info_txt, s.download_type 
  FROM ARCHIVE_SCAN s right join ARCHIVE_ITEMS i on s.id_item=i.id
  where (i.num_delo like @mask+'%' OR (@mask = '-1')) and (id_sotrudnik=@id_sotrudnik or @id_sotrudnik=' ') and
            ((@status='all') or
             (@status='notLoaded' and date_to_AIS_ARCHIVE is null) or
             (@status='Loaded' and date_to_AIS_ARCHIVE is not null) 
            )
  order by s.id desc
            "
            DeleteCommand="DELETE FROM ARCHIVE_SCAN WHERE (id = @id)"
            UpdateCommand="Update ARCHIVE_SCAN set qty_pages=@qty_pages, comments=@comments, date_scan=@date_scan, date_to_AIS_ARCHIVE=@date_to_AIS_ARCHIVE,
            qty_sheets=@qty_sheets, qty_toms=@qty_toms, isDeFibre=@isDeFibre, download_type=@download_type where id=@id"
            >
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>

            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="-1" Name="mask" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownListOperator" DefaultValue=" " Name="id_sotrudnik" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownListStatus" DefaultValue="notLoaded" Name="status" PropertyName="SelectedValue" />
<%--                <asp:Parameter Name="status" DefaultValue="all"/>--%>
            </SelectParameters>

            <UpdateParameters>
                <asp:Parameter Name="qty_pages" />
                <asp:Parameter Name="comments" />
                <asp:Parameter Name="date_scan" />
                <asp:Parameter Name="date_to_AIS_ARCHIVE" />
                <asp:Parameter Name="qty_sheets" />
                <asp:Parameter Name="qty_toms" />
                <asp:Parameter Name="isDeFibre" /> 
                <asp:Parameter Name="id" />
                <asp:Parameter Name="download_type" />
            </UpdateParameters>
        </asp:SqlDataSource>


    </section>




    <asp:SqlDataSource ID="SqlDataSourceSotrudnikAll" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" SelectCommand="SELECT id_sotrudnik, id_otdel, last_name + ' ' + first_name + ' ' + middle_name AS fio FROM Sotrudnik WHERE (active = 1) ORDER BY fio"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceSotrudnik" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" SelectCommand="SELECT id_sotrudnik, id_otdel, last_name + ' ' + first_name + ' ' + middle_name AS fio FROM Sotrudnik WHERE id_sotrudnik=@id_sotrudnik and (active = 1) ORDER BY fio"></asp:SqlDataSource>


    <div role="alert" id="StatusAlert" style="position: absolute; top: 0px; right: 0px;" runat="server">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>

        <asp:Label ID="LabelStatus" runat="server" Visible="true" EnableViewState="false"></asp:Label>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="genericFileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" style="" role="document">
            <div class="modal-content">
                <div class="modal-header bg-info">
                    <div class="row ">
                        <div class="col-md-10">
                            <h3 class="modal-title" id="exampleModalLabel">Формирование файлов для загрузки в ИС Архив</h3>
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" class="h1">&times;</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <iframe src="ArchiveGenFileDownload.aspx" id="iframeXML" width="100%" height="500px" style="border:0px;" ></iframe>
                </div>
            </div>
        </div>
    </div>



</asp:Content>

