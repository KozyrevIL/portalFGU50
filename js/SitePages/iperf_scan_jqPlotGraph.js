//функция отрисовки графика jqPlot

function fillGraph(rawData, name) {
    var line1 = new Array();
    var line2 = new Array();
    var parsedData = JSON.parse(rawData);
    $.each(parsedData, function (i, obj) {
        var re = /-?\d+/;
        var m = re.exec(obj.date);
        var d = new Date(parseInt(m[0]));
        line1.push([d, obj.speed]);
        if (i == 0 || i == parsedData.length-1) {
            line2.push([d, obj.tariffSpeed])
        }
    });

    //вывод графика с данными
    $.jqplot.config.enablePlugins = true;
    $('#chartFilialIperfStats').empty();
    plot1 = $.jqplot('chartFilialIperfStats', [line1, line2],{
        title: name,
        seriesDefaults: {
            showMarker: false,
            pointLabels: { show: true },
            neighborThreshold: -1,
        },
        series: [
            { label: 'Фактическая скорость' },
            { label: 'Скорость по тарифу' },
        ],
        axes: {
            xaxis: {
                renderer: $.jqplot.DateAxisRenderer,
                tickOptions: {
                    angle: -30,
                    formatString: "%d %b %y\n%H:%M"
                },
                rendererOptions: {
                    tickRenderer: $.jqplot.CanvasAxisTickRenderer
                }
            },
            yaxis: {
                //min: -2,
                //numberTicks: 2,
            }
        },
        legend: {
            show: true,
            placement:"outsideGrid",
        },
        cursor: {
            show: true,
            zoom: true,
            showTooltip: false,
            constrainZoomTo: 'x'
        },
        highlighter: {
            showMarker: true,
            tooltipAxes: 'xy',
            formatString: '<table class="jqplot-highlighter"> \
                            <tr><td>Дата:</td><td>%s</td></tr> \
                            <tr><td>Сокрость:</td><td>%d</td></tr>\
                        </table>'
        }
    });
}
//ajax запрос данных для jqPlot и вызов фкнуции отрисовки
function graphAjaxRequest(SelectedFilialID, begin_date, end_date) {
    var dropdownList = document.getElementById("DropDownListFilials");
    var name = dropdownList.options[dropdownList.selectedIndex].text;
    $.ajax({
        type: 'POST',
        dataType: 'json',
        contentType: 'application/json',
        url: 'iperf_scan.aspx/getIperfStats',
        data: '{selectedFilialID:\'' + SelectedFilialID + '\', begin_date: \'' + begin_date + '\', end_date:\'' + end_date + '\' }',
        success:
            function (response) {
                fillGraph(response.d, name);
            }
    });
}
