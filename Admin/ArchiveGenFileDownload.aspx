<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_bootstrap_no_banner.master" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" EnableViewState="true" Theme="gridview" AutoEventWireup="true" CodeFile="ArchiveGenFileDownload.aspx.cs" Inherits="Admin_ArchiveGenFileDownload" %>

<%@ MasterType VirtualPath="~/Admin/admin_bootstrap_no_banner.master" %>

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

      <script type="text/javascript">
          $(function () {
              $(".datepickdate").datetimepicker({ format: 'DD.MM.YYYY', pickDate: true, language: 'ru' });
          });</script>

    <section id="form_input_data">
        <div class="container-fluid well well-sm">
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Номер дела</label><br />
                            <asp:TextBox ID="TextBoxKad_number" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label>Дата дела</label><br />
                            <asp:TextBox ID="TextBoxDelo_date" runat="server" CssClass="form-control datepickdate" Width="100px"/>
<%--                           <asp:RegularExpressionValidator ErrorMessage="не корректная дата" ControlToValidate="TextBoxDelo_date" ValidationExpression="^[1-31]{1,2}\.[1-12]{1,2}\.[2000-2050,1900-1999]{4}$" runat="server"  />--%>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label>Кол-во томов</label><br />
                            <asp:TextBox ID="TextBoxCountRow" runat="server" CssClass="form-control" Width="50px" />
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label>&nbsp;</label><br />
                            <asp:LinkButton ID="LinkButtonGen" runat="server" CssClass="btn btn-info" OnClick="LinkButtonGen_Click">Сформировать</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <section id="form_output_data">
        <div class="container-fluid">
            <div class="row">
                <div>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-condensed table-hover table-responsive"  AutoGenerateColumns="false" Width="250px">
                        <Columns>
                            <asp:TemplateField HeaderText="Номер тома">
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBoxNumberVolume" runat="server" Text='<%# Bind("numberVolume") %>' CssClass="form-control"></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="100" />
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Дата тома">
                                <ItemTemplate>
                                    <asp:TextBox ID="TextBoxVolumeDate" runat="server" Text='<%# Bind("volumeDate","{0:dd.MM.yyyy}") %>' CssClass="form-control datepickdate" Width="150px"></asp:TextBox>
<%--                                    <asp:RegularExpressionValidator ErrorMessage="не корректная дата" ControlToValidate="TextBoxVolumeDate" ValidationExpression="^[1-31]{2}.[1-12]{2}.[2000-2050,1900-1999]{4}$" runat="server"  />--%>
                                </ItemTemplate>
                              
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Наличие ППФ">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckPPF" runat="server" CssClass="form-control" Checked='<%# Eval("ppf").ToString()=="1"?true:false %>' />
                                </ItemTemplate>
                                <ItemStyle Width="100" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div>
             <asp:LinkButton ID="LinkButtonGenFile" runat="server" CssClass="btn btn-success" OnClick="LinkButtonGenFile_Click">Генерировать файл</asp:LinkButton>
        </div>
    </section>
    <section id="data">



    </section>


    <div role="alert" id="StatusAlert" style="position: absolute; bottom: 10px; right: 10px;" runat="server">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true" >&times;</span></button>

        <asp:Label ID="LabelStatus" runat="server"  EnableViewState="false"></asp:Label>
    </div>



</asp:Content>

