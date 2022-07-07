<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin_div.master" AutoEventWireup="true" CodeFile="admin_doctypeQuery_power.aspx.cs" Theme="gridview_small" Inherits="Admin_admin_doctype" %>

<%@ Register src="../UC/banner_div.ascx" tagname="banner_div" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
        
            <uc1:banner_div ID="banner_div1" runat="server" header="Межведомственное взаимодействие" />

        <div id="page">
            <div style=" margin-left:20px; padding-left:50px; padding-top:20px; padding-bottom:20px; width: 990px; border: 1px solid #cccccc">

               

                <div style="float:left; width:169px; display:table-cell; height: 13px;">Наименование документа</div>
                <div style="float:left;display:table-cell;">
                    <asp:TextBox ID="TextBox2" Width=800px runat=server Height="50px" 
                        TextMode="MultiLine"></asp:TextBox>
                </div>

                <div style="clear:both;"></div>

               

                <div style="float: left; width: 300px; display: table-cell;">
                <asp:Button ID="ButtonAdd" Text="Добавить" runat=server onclick="ButtonAdd_Click" />
                    </div>
                 


            </div>
            <div id="GridView" style=" width: 100%; padding-left:50px; padding-bottom:20px; padding-right:20px; padding-top:20px">


                <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  SkinID=Grid_small20
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_doctype" 
                    DataSourceID="SqlDataSourceDocType" Width=500px OnRowUpdating="GridView1_RowUpdating">
                    <Columns>

                     <%--   <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Обновить"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Правка"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Удалить"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="70px" />
                        </asp:TemplateField>--%>

                         <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <div style="width: 55px">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                            Text="Правка"></asp:LinkButton><br />
                                        <asp:LinkButton ID="LinkButtonItemDelete" runat="server"  OnClientClick="return confirm('Удалить запись?');"
                                            CausesValidation="False" CommandName="Delete" Text="Удалить"></asp:LinkButton>
                                    </div>

                                </ItemTemplate>

                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Update"
                                        Text="Обновить"></asp:LinkButton><br />
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Отмена"></asp:LinkButton>
                                </EditItemTemplate>

                                <ItemStyle Width="50px" />
                            </asp:TemplateField>


                        <asp:BoundField DataField="id_doctype" HeaderText="id_doctype" 
                            InsertVisible="False" ReadOnly="True" SortExpression="id_doctype" 
                            Visible="False" />
                        <asp:TemplateField HeaderText="Наименование документа" SortExpression="doctype_name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("doctype_name") %>' Width="100%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("doctype_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>


            </div>
        </div>
            <asp:SqlDataSource ID="SqlDataSourceDocType" runat="server" 
                ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>" 
                DeleteCommand="DocTypeDelete" DeleteCommandType="StoredProcedure" 
                InsertCommand="DocTypeInsert" InsertCommandType="StoredProcedure" 
                SelectCommand="DocTypeSelect" SelectCommandType="StoredProcedure" 
                UpdateCommand="DocTypeUpdate" UpdateCommandType="StoredProcedure" 
                oninserting="SqlDataSourceDocType_Inserting">
                <DeleteParameters>
                    <asp:Parameter Name="id_doctype" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="doctype_name" Type="String" />
                    <asp:Parameter Name="type_info" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="2" Name="type_info" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_doctype" Type="Int32" />
                    <asp:Parameter Name="doctype_name" Type="String" />
                    <asp:Parameter Name="type_info" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </asp:Content>


