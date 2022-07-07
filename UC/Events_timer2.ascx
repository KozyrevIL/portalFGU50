<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Events_timer2.ascx.cs" Inherits="UC_Events_timer" %>
<div style="border-width: 1px; border-color: #FFCC66; border-style: solid; background-color: #FFFFCC;
    text-align: center; width: 212px; padding-left: 3px; padding-right: 3px; margin-bottom: 10px;">
    <span id="newyear">Кол-во дней до <%=currentYear%> года:</span>
    <style>
        span#newyear,#Events_timer2_LabelCountDayForNewYear
        {
            font-family: Tahoma;
            font-size: 14px;
            font-weight: normal;
            color: #990000;
        }
    </style>
    <span>
        <asp:Label ID="LabelCountDayForNewYear" runat="server" ForeColor="Red"></asp:Label>
    </span>
</div>

