<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_bootstrap.master" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" Theme="gridview" AutoEventWireup="true" CodeFile="ScanDPD.aspx.cs" Inherits="Admin_ScanDPD" %>

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
    </script>


    <script type="text/javascript">
        $(function () {
            $(".datepicktime").datetimepicker({ format: 'HH:mm', pickDate: false, language: 'ru' });
        });</script>


    <section id="form_input_data">
        <div class="container-fluid well well-sm">

            <div class="row">


                <div class="col-lg-2">
                    <div class="form-group">
                        <label>Кадастровый номер</label><br />
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


                


            </div>

        </div>

    </section>
    <section id="search_data">
        <div class="container-fluid well well-sm">
            <div class="row">
                <div class="col-md-3">
                    <div class="btn btn-group">
                        <asp:LinkButton ID="LinkButtonInsert" Text="Добавить" CssClass="btn btn-success" runat="server" OnClick="LinkButtonInsert_Click"><i class="glyphicon glyphicon-paste"></i>&nbsp;Добавить
                            <asp:LinkButton ID="ImageButtonExcel" runat="server" CssClass="btn btn-default" CausesValidation="false" OnClick="ImageButtonExcel_Click1"> <span aria-hidden="true" class="fa fa-file-excel-o"></span>Excel </asp:LinkButton><asp:LinkButton ID="ImageButtonWord" runat="server" CssClass="btn btn-default" CausesValidation="false" OnClick="ImageButtonWord_Click1"> <span aria-hidden="true" class="fa fa-file-word-o"></span>Word </asp:LinkButton></asp:LinkButton>
                    </div>
                </div>

               
                <div class="col-md-2">
                    <label>Начало</label><br />
                    <div class="input-group">

                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                        <asp:TextBox ID="TextBoxDate1_Filtr" Enabled="true" runat="server" CssClass="form-control datepick" Width="100px" data-toggle="tooltip" data-placement="bottom" title="Фильтр по полю Дата правки. Начало диапазона." placeholder="Начало"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2">
                    <label>Конец</label><br />
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                        <asp:TextBox ID="TextBoxDate2_Filtr" Enabled="true" runat="server" CssClass="form-control datepick" Width="100px" data-toggle="tooltip" data-placement="bottom" title="Фильтр по полю Дата правки. Конец диапазона." placeholder="Конец"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 ">
                    <label>Поиск по маске</label><br />
                    <div class="input-group pull-right">

                        <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="form-control" placeholder="Поиск по полям: ФИО заявителя, вопрос заявителя"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:LinkButton ID="LinkButtonSearch" runat="server" CssClass="btn btn-info" CausesValidation="false" OnClick="LinkButtonSearch_Click"> <i class="glyphicon glyphicon-search"></i></asp:LinkButton>
                            <asp:LinkButton ID="LinkButtonReset" runat="server" CssClass="btn btn-danger" CausesValidation="false" data-toggle="tooltip" data-placement="bottom" title="Сброс фильтра" OnClick="LinkButtonReset_Click"> <i class="glyphicon glyphicon-remove" ></i></asp:LinkButton>
                        </span>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2">
                    <div class="input-group">
                        <asp:DropDownList ID="DropDownListReport" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Отчеты" Value=""></asp:ListItem>
                            <asp:ListItem Text="Отчет по пользователям" Value="1" />
                            <asp:ListItem Text="Отчет по отделам" Value="2" />
                            <asp:ListItem Text="Отчет по листажу(>XX)" Value="3" />
                            <asp:ListItem Text="Отчет по загруженным" Value="4" />
                            <asp:ListItem Text="Отчет по загруженным. ИТОГО" Value="5" />
                            <asp:ListItem Text="Статусы загрузки в периоде" Value="6" />
                            <asp:ListItem Text="Статусы загрузки в ПОБРОБНО" Value="7" />
                            <asp:ListItem Text="ДУБЛИ" Value="8" />
                        </asp:DropDownList>
                        <asp:LinkButton ID="LinkButtonReport" runat="server" CssClass="input-group-addon btn btn-info" OnClick="LinkButtonReport_Click" CausesValidation="false"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </div>

                </div>
            </div>
        </div>

    </section>
    <section id="form_output_data">
        <div class="container-fluid">
            <div class="row">
                <div>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" ShowFooter="True" PageSize="100" DataKeyNames="id" AutoGenerateColumns="False" DataSourceID="SqlDataSourceScanDPD" CssClass="table table-bordered table-striped table-condensed table-hover" HeaderStyle-CssClass="table info" PagerStyle-BackColor="Info" PagerStyle-Font-Size="Large" PagerStyle-BorderWidth="1" PagerStyle-BorderColor="Blue" PagerStyle-BorderStyle="Dashed" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" AllowSorting="True">

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




                            <asp:TemplateField HeaderText="Кадастровый номер" SortExpression="kad_number">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxEditKad_number" runat="server" CssClass="form-control" Text='<%# Bind("kad_number") %>' />  
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelItemKad_number" runat="server" Text='<%# Bind("kad_number") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200" />
                            </asp:TemplateField>

                          

                             <asp:BoundField DataField="v_volume" HeaderText="Переведено томов" SortExpression="v_volume" ControlStyle-CssClass="form-control" ControlStyle-Width="80px" ItemStyle-CssClass="warning" ItemStyle-Width="80px" >

<ControlStyle CssClass="form-control" Width="80px"></ControlStyle>

<ItemStyle CssClass="warning" Width="80px"></ItemStyle>
                            </asp:BoundField>

  <asp:TemplateField HeaderText="Переведено листов" SortExpression="v_sheets">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxEditV_sheets" runat="server" CssClass="form-control" Text='<%# Bind("v_sheets") %>' />  
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelItemV_sheets" runat="server" Text='<%# Bind("v_sheets") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="50" CssClass="warning" />
                            </asp:TemplateField>


                            <asp:BoundField DataField="v_pages" HeaderText="Переведено страниц" SortExpression="v_pages" ControlStyle-CssClass="form-control" ControlStyle-Width="80px" ItemStyle-CssClass="warning" ItemStyle-Width="80px" >

<ControlStyle CssClass="form-control" Width="80px"></ControlStyle>

<ItemStyle CssClass="warning" Width="80px"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Статус загрузки" SortExpression="status_load_archive">
                                <EditItemTemplate>
                                    <asp:DropDownList id="DropDownListEditstatus_load_archive" runat="server" CssClass="form-control" SelectedValue='<%# Bind("status_load_archive") %>'>
                                        <asp:ListItem Text="" Value="" />
                                        <asp:ListItem Text="не загружено" Value="не загружено" />
                                        <asp:ListItem Text="загружено" Value="загружено" />
                                        <asp:ListItem Text="ошибка загрузки" Value="ошибка загрузки" />
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                     
                                    <asp:Label ID="LabelItemstatus_load_archive" runat="server" Text='<%# Bind("status_load_archive") %>'></asp:Label>
                                
                                </ItemTemplate>
                                <ItemStyle Width="100" CssClass="success"  />
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
                                <ItemStyle Width="100" CssClass="success"  />
                            </asp:TemplateField>


                             <asp:TemplateField HeaderText="Примечание" SortExpression="comments">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxEditComments" runat="server" CssClass="form-control" Text='<%# Bind("comments") %>' TextMode="MultiLine" Height="50px"  />  
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelItemComments" runat="server" Text='<%# Bind("comments") %>'></asp:Label>
                                </ItemTemplate>
                                 
                            </asp:TemplateField>

                           

                            <asp:BoundField DataField="date_insert" HeaderText="Дата добавления" SortExpression="date_insert" ReadOnly="True" ItemStyle-Width="100">

                                <ControlStyle CssClass="form-control" />

                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="operator" HeaderText="Добавил" SortExpression="Operator" ControlStyle-CssClass="form-control" ReadOnly="true"  ItemStyle-Width="300">
                                <ControlStyle CssClass="form-control"></ControlStyle>

<ItemStyle Width="300px"></ItemStyle>
                            </asp:BoundField>


                            <asp:BoundField DataField="id_sotrudnik" HeaderText="id_sotrudnik" SortExpression="id_sotrudnik" ControlStyle-CssClass="form-control" Visible="False">
                                <ControlStyle CssClass="form-control" Width="100px"></ControlStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="id_otdel" HeaderText="id_otdel" SortExpression="id_otdel" ControlStyle-CssClass="form-control" Visible="False">
                                <ControlStyle CssClass="form-control"></ControlStyle>
                            </asp:BoundField>


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

        <asp:SqlDataSource ID="SqlDataSourceScanDPD" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            SelectCommand="
      SELECT id
      ,kad_number
      ,v_sheets
      ,v_volume
      ,v_pages
      ,comments
      ,operator
     ,id_sotrudnik
     ,id_otdel
     ,date_insert
            ,status_load_archive
            ,download_type
  FROM dbo.ScanDPD

  where
	
        (
            (id LIKE '%' + @mask) OR (@mask = '-1') OR
            (kad_number LIKE '%' + @mask) OR (@mask = '-1') OR
            (operator LIKE '%' + @mask + '%') OR (@mask = '-1')
            ) 
      
     
	and

(CONVERT(datetime,CAST(date_insert AS VarChar(11)) ,104) BETWEEN CONVERT(datetime,CAST (@begin_date AS VarChar(11)) ,104) AND CONVERT(datetime,CAST(@end_date AS VarChar(11)) ,104) or
                  (@begin_date='01.01.1901' and @end_date='01.01.1901'))

  order by id desc
            "
            DeleteCommand="DELETE FROM portalFGU59.dbo.ScanDPD WHERE (id = @id)"
            InsertCommand="INSERT INTO ScanDPD(kad_number, v_sheets, comments, operator, id_sotrudnik, id_otdel, date_insert, v_volume, v_pages, status_load_archive) VALUES (@kad_number, @v_sheets, @comments, @operator, @id_sotrudnik, @id_otdel, @date_insert, @v_volume, @v_pages, @status_load_archive)" OnInserting="SqlDataSourceEnergoControl_Inserting" UpdateCommand="UPDATE ScanDPD SET kad_number = @kad_number, v_sheets = @v_sheets, comments = @comments, v_volume = @v_volume, v_pages = @v_pages, status_load_archive = @status_load_archive, download_type=@download_type WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="kad_number" />
                <asp:Parameter Name="v_sheets" />
                <asp:Parameter Name="comments" />
                <asp:Parameter Name="operator" />
                <asp:Parameter Name="id_sotrudnik" />
                <asp:Parameter Name="id_otdel" />
                <asp:Parameter Name="date_insert" />
                <asp:Parameter Name="v_volume" />
                <asp:Parameter Name="v_pages" />
                <asp:Parameter Name="status_load_archive" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxSearch" DefaultValue="-1" Name="mask" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBoxDate1_Filtr" DefaultValue="01.01.1901" Name="begin_date" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBoxDate2_Filtr" DefaultValue="01.01.1901" Name="end_date" PropertyName="Text" />

            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="kad_number" />
                <asp:Parameter Name="v_sheets" />
                <asp:Parameter Name="comments" />
                <asp:Parameter Name="v_volume" />
                <asp:Parameter Name="v_pages" />
                <asp:Parameter Name="status_load_archive" />
                <asp:Parameter Name="download_type" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:XmlDataSource ID="XmlDataSourceRemoteSoftware" runat="server" DataFile="~/App_Data/Type_PO_remote.xml" XPath="/namesPO/namePO"></asp:XmlDataSource>
    </section>

    <asp:SqlDataSource ID="SqlDataSourceSotrudnikAll" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" SelectCommand="SELECT id_sotrudnik, id_otdel, last_name + ' ' + first_name + ' ' + middle_name AS fio FROM Sotrudnik WHERE (active = 1) ORDER BY fio"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceSotrudnik" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" SelectCommand="SELECT id_sotrudnik, id_otdel, last_name + ' ' + first_name + ' ' + middle_name AS fio FROM Sotrudnik WHERE id_sotrudnik=@id_sotrudnik and (active = 1) ORDER BY fio"></asp:SqlDataSource>


     <div role="alert" id="StatusAlert" style="position: absolute; top: 10px; right: 10px;" runat="server">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true" >&times;</span></button>

        <asp:Label ID="LabelStatus" runat="server"  EnableViewState="false"></asp:Label>
    </div>

</asp:Content>

