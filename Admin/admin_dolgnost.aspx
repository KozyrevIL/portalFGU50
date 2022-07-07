<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_dolgnost.aspx.cs" Inherits="Admin_admin_dolgnost" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin/admin_bootstrap.master" %>
<%@ MasterType VirtualPath="~/Admin/admin_bootstrap.master" %>


<%@ Register Src="../UC/menu_admin_vert.ascx" TagName="menu_admin_vert" TagPrefix="uc1" %>

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

            $("#ctl00_ContentPlaceHolder_CheckBoxParam1_bit").click(function () {
                if ($("#content_hide").is(":hidden")) {

                    $("#content_hide").show("slow");
                    $("#ctl00_ContentPlaceHolder_CheckBoxParam1_bit").prop('checked', value == 1);
                } else {

                    $("#content_hide").hide("slow");
                    $("#ctl00_ContentPlaceHolder_CheckBoxParam1_bit").prop('checked', value == 0);
                }
                return false;
            });
        });

        $(function () {

            $("#ctl00_ContentPlaceHolder_DropDownListParam1_str50").on("change", function (e) {
                if ($("#ctl00_ContentPlaceHolder_DropDownListParam1_str50 option[value='Юридическое лицо']").is(":selected")) {

                    $("#ctl00_ContentPlaceHolder_content_hideParam7_str255").show("slow");
                   
                } else {

                    $("#ctl00_ContentPlaceHolder_content_hideParam7_str255").hide("slow");
                  
                }
                return false;
            });
        });

       

        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        //$(document).ready(function () {
        //    $("#ctl00_ContentPlaceHolder_DropDownListParam0_str50").on("show.bs.dropdown", function (e) {
        //        // Присвоить переменной textMenuItem текст ссылки
        //        var textMenuItem = $(e.relatedTarget).text();
        //        alert("Нажмите на OK для просмотра выпадающего меню для пункта: " + textMenuItem);
        //    });
        //});
        
    </script>
    <div class="container-fluid">
        <div class="row">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">

                <tr>
                    <td height="594px" align="left" valign="top" bgcolor="white">
                        <table cellpadding="0" cellspacing="0" border="1" width="100%">
                            <tr>
                                <td width="20%" align="left" valign="top">
                                    <uc1:menu_admin_vert ID="Menu_admin_vert1" runat="server" />
                                </td>
                                <td width="80%" valign="top" align="left">
                                    <div class="posForm">
                                        <table cellpadding="0" cellspacing="0" width="800" class="formText">

                                            <tr>
                                                <td height="36">Наименование должности</td>
                                                <td style="width: 500px">
                                                    <asp:TextBox ID="TextBoxName_dolgnost" runat="server" Width="500px" CssClass="form-control"></asp:TextBox></td>
                                            </tr>
                                             <tr>
                                                <td height="36">Должность для документов (род. падеж)</td>
                                                <td style="width: 500px">
                                                    <asp:TextBox ID="TextBoxName_dolgnost_for_doc" runat="server" Width="500px" CssClass="form-control"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td height="36"></td>
                                                <td style="width: 500px" align="right">
                                                    <asp:Button ID="ButtonInsertDolgnost" runat="server" CssClass="btn btn-primary" Text="Добавить должность" OnClick="ButtonInsertDolgnost_Click" /></td>
                                            </tr>
                                            <tr>
                                                <td height="10"></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td height="36" colspan="2" align="left" valign="top">
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                                                        DataKeyNames="id_dolgnost" DataSourceID="SqlDataSourceDolgnost"
                                                        GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="100" CssClass="table table-bordered table-striped table-condensed table-hover" HeaderStyle-CssClass="table info" PagerStyle-BackColor="Info" PagerStyle-Font-Size="Large" PagerStyle-BorderWidth="1" PagerStyle-BorderColor="Blue" PagerStyle-BorderStyle="Dashed">
                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="Black" />
                                                       
                                                        <Columns>
                                                            <asp:TemplateField ShowHeader="False">
                                                                <EditItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Обновить"><span class="glyphicon glyphicon-refresh" data-toggle="tooltip" data-placement="top" title="Обновить"></span></asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена"><span class="glyphicon glyphicon-remove" data-toggle="tooltip" data-placement="top" title="Отмена"></span></asp:LinkButton>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка"><span class="glyphicon glyphicon-pencil" data-toggle="tooltip" data-placement="top" title="Редактировать"></span></asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButtonDelete" Visible="true" runat="server" CausesValidation="False" CommandName="Delete" Text="Удалить" OnClientClick="return confirm('Удалить запись?');"><span class="glyphicon glyphicon-trash" data-toggle="tooltip" data-placement="top" title="Удаление - ВНИМАНИЕ необратимая операция!"></span></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="50px" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="id_dolgnost" HeaderText="id_dolgnost" InsertVisible="False"
                                                                ReadOnly="True" SortExpression="id_dolgnost" Visible="False" />
                                                            <asp:TemplateField HeaderText="Наименование должности" SortExpression="name_dolgnost">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name_dolgnost") %>' CssClass="form-control"></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name_dolgnost") %>' Width="400px"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Должность для документов (род. падеж)" SortExpression="name_dolgnost_for_doc">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name_dolgnost_for_doc") %>' CssClass="form-control"></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name_dolgnost_for_doc") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>

                                                         <HeaderStyle CssClass="table info"></HeaderStyle>
                                                         <PagerSettings Position="TopAndBottom" Mode="Numeric" ></PagerSettings>
                                                         <PagerStyle  CssClass="pagination-ys" ></PagerStyle>
                                                         <EditRowStyle CssClass="table success"></EditRowStyle>
                                                       


                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSourceDolgnost" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
                            InsertCommand="DolgnostInsert" InsertCommandType="StoredProcedure" SelectCommand="DolgnostSelect"
                            SelectCommandType="StoredProcedure" DeleteCommand="DolgnostDelete" DeleteCommandType="StoredProcedure" UpdateCommand="DolgnostUpdate" UpdateCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:Parameter Name="name_dolgnost" Type="String" />
                                <asp:Parameter Name="name_dolgnost_for_doc" Type="String" />
                            </InsertParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="id_dolgnost" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="id_dolgnost" Type="Int32" />
                                <asp:Parameter Name="name_dolgnost" Type="String" />
                                <asp:Parameter Name="name_dolgnost_for_doc" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        &nbsp;
                    </td>
                </tr>

                <tr>
                    <td height="28px" bgcolor="#85A4C3"></td>
                </tr>
                <tr>
                    <td height="6px" background="../images/background2.gif"></td>
                </tr>
                <tr>
                    <td height="32px" bgcolor="#1E5A92"></td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>
    
 