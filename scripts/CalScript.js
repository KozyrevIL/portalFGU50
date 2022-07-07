var popUp; 

function OpenCalendar(idname, postBack)
{
	popUp = window.open('..Calendar.aspx?formname=' + document.forms[0].name + 
		'&id=' + idname + '&selected=' + document.forms[0].elements[idname].value + '&postBack=' + postBack, 
		'popupcal', 
		'width=165,height=208,left=200,top=250');
}



function ReturnData(selfname)
{
    var num=selfname+2;
    var itemid="ItemsDataGrid__ctl"+num+"_ItemIdLabel";
    var itemname="ItemsDataGrid__ctl"+num+"_ItemNameLabel";
    var itemdesc="ItemsDataGrid__ctl"+num+"_ItemDescriptionLabel";
    var itemweight="ItemsDataGrid__ctl"+num+"_ItemWeightLabel";
    var itemcost="ItemsDataGrid__ctl"+num+"_ItemCostLabel";
	window.opener.document.getElementById('ItemName').value = document.getElementById(itemname).innerText;
	window.opener.document.getElementById('ItemDescription').value = document.getElementById(itemdesc).innerText;
	window.opener.document.getElementById('ItemWeight').value = document.getElementById(itemweight).innerText;
	window.opener.document.getElementById('ItemRate').value = document.getElementById(itemcost).innerText;
	window.opener.document.getElementById('ItemIDHidden').value = document.getElementById(itemid).innerText;
	
	window.opener.document.getElementById('ItemQuantity').value = 1;
	window.opener.document.getElementById('ItemAmount').value = document.getElementById(itemcost).innerText;	
		
	window.close();
}

function OpenCalendar2(idname, postBack)
{

	popUp = window.open('./../Calendar.aspx?formname=' + document.forms[0].name + 
		'&id=' + idname + '&selected=' + document.forms[0].elements[idname].value + '&postBack=' + postBack, 
		'popupcal', 
		'width=165,height=208,left=200,top=250');
}
function OpenCalendar3(idname, postBack)
{

	popUp = window.open('Calendar.aspx?formname=' + document.forms[0].name + 
		'&id=' + idname + '&selected=' + document.forms[0].elements[idname].value + '&postBack=' + postBack, 
		'popupcal', 
		'width=165,height=208,left=200,top=250');
}

function OpenWindows(id_image)
{
	popUp = window.open('PopWindows.aspx?id=' + 
		+ id_image,
		'width=800,height=600,left=200,top=250');
}

function SetDate(formName, id, newDate, postBack)
{
	eval('var theform = document.' + formName + ';');
	popUp.close();
	theform.elements[id].value = newDate;
	if (postBack)
		__doPostBack(id,'');
}

/*
Author: Robert Hashemian
http://scripts.hashemian.com/js/countdown.js
You can use this code in any manner so long as the author's
name, Web address and this disclaimer is kept intact.
********************************************************
Пример кода на странице:
<script language="JavaScript">
TargetDate = "12/31/2020 5:00 AM";
BackColor = "palegreen";
ForeColor = "navy";
CountActive = true;
CountStepper = -1;
LeadingZero = true;
DisplayFormat = "%%D%% Days, %%H%% Hours, %%M%% Minutes, %%S%% Seconds.";
FinishMessage = "<a href=\"http://discoteka/\" target=\"_blank\">ДИСКОТЕКА НАЧАЛАСЬ!</a>";
</script>
<script language="JavaScript" src="countdown.js"></script>
    * TargetDate - дата, до которой отсчитывается время.
    * BackColor - цвет фона для текста со временем.
    * ForeColor - цвет текста.
    * CountActive - включение счетчика.
    * CountStepper - шаг отсчета (в секундах).
    * LeadingZero - ноль перед цифрами, например числа 09, 08, 07 и т.д.
    * DisplayFormat - формат отображения текста счетчика.
    * FinishMessage - сообщения, когда счетчик досчитает до нужной даты.
время берется из показаний на вашем локальном компьютере - если оно у вас идет неправильно, то и новый год под данному счетчику можете встретить не вместе со всеми :)

function calcage(secs, num1, num2) {
  s = ((Math.floor(secs/num1))%num2).toString();
  if (LeadingZero && s.length < 2)
    s = "0" + s;
  return "<b>" + s + "</b>";
}
function CountBack(secs) {
  if (secs < 0) {
    document.getElementById("cntdwn").innerHTML = FinishMessage;
    return;
  }
  DisplayStr = DisplayFormat.replace(/%%D%%/g, calcage(secs,86400,100000));
  DisplayStr = DisplayStr.replace(/%%H%%/g, calcage(secs,3600,24));
  DisplayStr = DisplayStr.replace(/%%M%%/g, calcage(secs,60,60));
  DisplayStr = DisplayStr.replace(/%%S%%/g, calcage(secs,1,60));
  document.getElementById("cntdwn").innerHTML = DisplayStr;
  if (CountActive)
    setTimeout("CountBack(" + (secs+CountStepper) + ")", SetTimeOutPeriod);}
function putspan(backcolor, forecolor) {
 document.write("<span id='cntdwn' style='background-color:" + backcolor + 
                "; color:" + forecolor + "'></span>");}
if (typeof(BackColor)=="undefined")
  BackColor = "white";
if (typeof(ForeColor)=="undefined")
  ForeColor= "black";
if (typeof(TargetDate)=="undefined")
  TargetDate = "12/31/2020 5:00 AM";
if (typeof(DisplayFormat)=="undefined")
  DisplayFormat = "%%D%% Days, %%H%% Hours, %%M%% Minutes, %%S%% Seconds.";
if (typeof(CountActive)=="undefined")
  CountActive = true;
if (typeof(FinishMessage)=="undefined")
  FinishMessage = "";
if (typeof(CountStepper)!="number")
  CountStepper = -1;
if (typeof(LeadingZero)=="undefined")
  LeadingZero = true;
CountStepper = Math.ceil(CountStepper);
if (CountStepper == 0)
  CountActive = false;
var SetTimeOutPeriod = (Math.abs(CountStepper)-1)*1000 + 990;
putspan(BackColor, ForeColor);
var dthen = new Date(TargetDate);
var dnow = new Date();
if(CountStepper>0)
  ddiff = new Date(dnow-dthen);
else
  ddiff = new Date(dthen-dnow);
gsecs = Math.floor(ddiff.valueOf()/1000);
CountBack(gsecs);*/