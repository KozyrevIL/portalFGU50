<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uc_organiser.ascx.cs" Inherits="UC_uc_organiser" %>

<div style=" margin-bottom:15px">
    <asp:Label ID="Label8" runat="server" Text="ПЛАНИРОВЩИК" CssClass="headerRazdel"></asp:Label>
</div>
<div style=" margin-bottom:10px">
<asp:ListView ID="ListView1" runat="server" DataKeyNames="id_organiser" DataSourceID="SqlDataSourceOrganiser">
    <alternatingitemtemplate>
            <div class="formTextTest"><b>Дата:</b>
                <asp:Label ID="date_eventsLabel" runat="server" ForeColor="#990000"  Text='<%# Eval("date_events") %>' />
                <br />
                <b>Наименование:</b></br>
                <asp:Label ID="name_eventsLabel" runat="server" ForeColor="#990000" Text='<%# Eval("name_events") %>' />
                <br />
                <b>Описание:</b></br>
                <asp:Label ID="description_eventsLabel" runat="server" Text='<%# Eval("description_events") %>' />
               
            </div>
        </alternatingitemtemplate>
    <itemseparatortemplate>
            <br />
        </itemseparatortemplate>
    <itemtemplate>
            <div class="formTextTest"><b>Дата:</b>
                <asp:Label ID="date_eventsLabel" runat="server" ForeColor="#990000"  Text='<%# Eval("date_events") %>' />
                <br />
                <b>Наименование:</b></br>
                <asp:Label ID="name_eventsLabel" runat="server" ForeColor="#990000"  Text='<%# Eval("name_events") %>' />
                <br />
                <b>Описание:</b></br>
                <asp:Label ID="description_eventsLabel" runat="server" Text='<%# Eval("description_events") %>' />
               
            </div>
        </itemtemplate>
</asp:ListView>
</div>
<div class="formText4"><a href="./../portalfgu59/organizer.aspx">Подробнее ..</a></div>
<asp:SqlDataSource ID="SqlDataSourceOrganiser" runat="server" ConnectionString="<%$ ConnectionStrings:portalFGU59ConnectionString %>"
    SelectCommand="OrganiserSelectCurrent" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
