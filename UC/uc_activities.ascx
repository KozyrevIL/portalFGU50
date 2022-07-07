<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uc_activities.ascx.cs" Inherits="UC_uc_activities" %>

<%--<style type="text/css">
*{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}*,:after,:before{color:#000!important;text-shadow:none!important;background:0 0!important;-webkit-box-shadow:none!important;box-shadow:none!important}</style>--%>

<div style=" margin-bottom:15px">
    <asp:Label ID="Label8" runat="server" Text="МЕРОПРИЯТИЯ ФИЛИАЛА" CssClass="headerRazdel"></asp:Label>
</div>
<div style=" margin-bottom:10px">
<asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSourceActivitiesZa">
    <alternatingitemtemplate>
            <div class="formTextTest"><b>Дата:</b>
                <asp:Label ID="date_eventsLabel" runat="server" ForeColor="#990000"  Text='<%# Eval("param1_date") %>' />
                <br />
                <b>Наименование:</b><br></br>
                <asp:Label ID="name_eventsLabel" runat="server" ForeColor="#990000" Text='<%# Eval("param4_str1000") %>' />
                <br />
                <b>Описание:</b><br></br>
                <asp:Label ID="description_eventsLabel" runat="server" Text='<%# Eval("param1_str255") %>' />
               
            </div>
        </alternatingitemtemplate>
    <itemseparatortemplate>
            <br />
        </itemseparatortemplate>
    <itemtemplate>
            <div class="formTextTest"><b>Дата:</b>
                <asp:Label ID="date_eventsLabel" runat="server" ForeColor="#990000"  Text='<%# Eval("param1_date") %>' />
                <br />
                <b>Наименование:</b><br></br>
                <asp:Label ID="name_eventsLabel" runat="server" ForeColor="#990000"  Text='<%# Eval("param4_str1000") %>' />
                <br />
                <b>Описание:</b><br></br>
                <asp:Label ID="description_eventsLabel" runat="server" Text='<%# Eval("param1_str255") %>' />
               
            </div>
        </itemtemplate>
</asp:ListView>
</div>
<div class="formText4"><a href="../portalfgu59/Admin/admin_activities_view_ZA.aspx">Подробнее ..</a></div>
        <asp:SqlDataSource ID="SqlDataSourceActivitiesZa" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
            DeleteCommand="DELETE FROM JornalItems2 WHERE (id = @id)"
            InsertCommand="INSERT INTO JornalItems2(type_items, param1_str255, param1_date, param0_str50, param4_str1000, param2_str255, param1_int, param2_int, param2_date, param4_int, param3_int, items_1_str50) VALUES (@type_items, @param1_str255, @param1_date, @param0_str50, @param4_str1000, @param2_str255, @param1_int, @param2_int, @param2_date, @param4_int, @param3_int, @items_1_str50)"
            SelectCommand="SELECT ji.id, ji.type_items, ji.param0_str50, ji.param1_str255, ji.param2_str255, ji.param4_str1000, ji.param1_date, ji.param1_int, ji.param2_int, ji.param2_date, ji.param4_int, ji.param3_int, ji.items_1_str50, oo.id_otdel, oo.name_otdel_abr FROM JornalItems2 AS ji LEFT OUTER JOIN Otdel AS oo ON ji.items_1_str50 = oo.id_otdel WHERE (ji.type_items = @type_items) AND (ji.items_1_str50 = @id_otdel) OR (ji.type_items = @type_items) AND (@id_otdel = - 1) ORDER BY ji.id DESC" UpdateCommand="UPDATE JornalItems2 SET param0_str50 = @param0_str50, param1_date = @param1_date, param4_str1000 = @param4_str1000, param1_str255 = @param1_str255, param2_str255 = @param2_str255, param1_int = @param1_int, param2_int = @param2_int, param2_date = @param2_date, param3_int = @param3_int, param4_int = @param4_int, items_1_str50 = @items_1_str50 WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="type_items" />
                <asp:Parameter Name="param1_str255" />
                <asp:Parameter Name="param1_date" />
                <asp:Parameter Name="param0_str50" />
                <asp:Parameter Name="param4_str1000" />
                <asp:Parameter Name="param2_str255" />
                <asp:Parameter Name="param1_int" />
                <asp:Parameter Name="param2_int" />
                <asp:Parameter Name="param2_date" />
                <asp:Parameter Name="param4_int" />
                <asp:Parameter Name="param3_int" />
                <asp:Parameter Name="items_1_str50" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="type_items" Type="Int32" />
                <asp:Parameter DefaultValue="-1" Name="id_otdel" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="param0_str50" />
                <asp:Parameter Name="param1_date" />
                <asp:Parameter Name="param4_str1000" />
                <asp:Parameter Name="param1_str255" />
                <asp:Parameter Name="param2_str255" />
                <asp:Parameter Name="param1_int" />
                <asp:Parameter Name="param2_int" />
                <asp:Parameter Name="param2_date" />
                <asp:Parameter Name="param3_int" />
                <asp:Parameter Name="param4_int" />
                <asp:Parameter Name="items_1_str50" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
