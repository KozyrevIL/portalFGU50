<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Events_timer.ascx.cs" Inherits="UC_Events_timer" %>
<div style="border-width: 1px; border-color: #FFCC66; border-style: solid; background-color: #FFFFCC;
    text-align: center; width: 212px; padding-left: 3px; padding-right: 3px; margin-bottom: 10px;">
    <span id="newyear">Отсчет времени</span>
    <style>
        span#newyear
        {
            font-family: Tahoma;
            font-size: 14px;
            font-weight: normal;
            color: #990000;
        }
    </style>
    <span>
        <script type="text/javascript"> 
<!--
            function newYearIn() {
                var days = " дней "
                var now = new Date();
                var newYear = new Date("jan 01 <%= currentYear %>,00:00:00"); 
                var totalRemains = (newYear.getTime() - now.getTime());
                //alert(totalRemains);
                if (totalRemains > 1) {
                    var RemainsSec = (parseInt(totalRemains / 1000));
                    var RemainsFullDays = (parseInt(RemainsSec / (24 * 60 * 60)));
                    if (
            RemainsFullDays == 2 ||
            RemainsFullDays == 3 ||
            RemainsFullDays == 4 ||
            RemainsFullDays == 22 ||
            RemainsFullDays == 23 ||
            RemainsFullDays == 24 ||
            RemainsFullDays == 32 ||
            RemainsFullDays == 33 ||
            RemainsFullDays == 34
            ) {
                        days = " дня "
                    }
                    if (
            RemainsFullDays == 1 ||
            RemainsFullDays == 21 ||
            RemainsFullDays == 31
            ) {
                        days = " день "
                    }
                    var secInLastDay = RemainsSec - RemainsFullDays * 24 * 3600;
                    var RemainsFullHours = (parseInt(secInLastDay / 3600));
                    if (RemainsFullHours < 10) { RemainsFullHours = "0" + RemainsFullHours };
                    var secInLastHour = secInLastDay - RemainsFullHours * 3600;
                    var RemainsMinutes = (parseInt(secInLastHour / 60));
                    if (RemainsMinutes < 10) { RemainsMinutes = "0" + RemainsMinutes };
                    var lastSec = secInLastHour - RemainsMinutes * 60;
                    if (lastSec < 10) { lastSec = "0" + lastSec };
                    document.getElementById('newyear').innerHTML = "До Нового <%= currentYear %> Года:<br/><b style='font-size:14px; font-weight:bold; color:#990000;'>" + RemainsFullDays + days + RemainsFullHours + ":" + RemainsMinutes + ":" + lastSec + "</b>";
                    setTimeout("newYearIn()", 10);
                }
                else { document.getElementById("newyear").innerHTML = ""; }
            }
            newYearIn();

        </script>
    </span>
</div>

