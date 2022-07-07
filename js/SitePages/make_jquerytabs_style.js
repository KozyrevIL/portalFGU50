function makeCustomTabs() {
    $("#horizontalTabs").tabs()
    $("#horizontalTabs").tabs().addClass("custom-tabs");
    $("#horizontalTabs").tabs("option", "active");
    $("#horizontalTabs").removeClass("ui-widget ui-widget-content ui-corner-all "); //ui-tabs-nav
    $("#horizontalTabs ul").removeClass("ui-helper-reset ui-widget-header ui-corner-all "); // ui-helper-clearfix
    $("#horizontalTabs li").removeClass("ui-state-default ui-corner-top  "); //ui-state-active ui-tabs-active
    $("#horizontalTabs div").removeClass(" ui-widget-content ui-corner-bottom"); // ui-tabs 
    $("#horizontalTabs li a").removeClass("ui-tabs-anchor "); //ui-tabs-panel
}