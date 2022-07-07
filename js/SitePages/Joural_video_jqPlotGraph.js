//функция отрисовки графика jqPlot
function fillGraph(rawData, name) {
    var line1 = new Array();
    var parsedData = JSON.parse(rawData);
    $.each(parsedData, function (i, obj) {
        var re = /-?\d+/;
        var m = re.exec(obj.X);
        var d = new Date(parseInt(m[0]));
        line1.push([d, 1])
    });

    //вывод графика с данными
    $.jqplot.config.enablePlugins = true;
    $('#chart1').empty();
    plot1 = $.jqplot('chart1', [line1], {
        title: name,
        series: [{
            pointLabels: { show: false },
            neighborThreshold: -1,
        }],
        axes: {
            xaxis: {
                renderer: $.jqplot.DateAxisRenderer,
                tickOptions: {
                    angle: -30,
                    formatString: "%d %b %y\n%H:%M"
                },
                rendererOptions:{
                    tickRenderer:$.jqplot.CanvasAxisTickRenderer
                }
            },
            yaxis: {
                min: 0,
                max: 2,
                numberTicks: 2,
            }
        },
        cursor: {
            show: true,
            zoom: true,
            showTooltip: false,
            constrainZoomTo: 'x'
        },
        highlighter: {
            showMarker: true,
            tooltipAxes: 'x',
            formatString: '<table class="jqplot-highlighter"> \
                            <tr><td>Дата:</td><td>%s</td></tr> \
                        </table>'
        }
    });
}
//ajax запрос данных для jqPlot и вызов фкнуции отрисовки
function graphAjaxRequest() {
    var dropdownList = document.getElementById("DropDownList_depts");
    var value = dropdownList.options[dropdownList.selectedIndex].value;
    var name = dropdownList.options[dropdownList.selectedIndex].text;
    $.ajax({
        type: 'POST',
        dataType: 'json',
        contentType: 'application/json',
        url: 'journal_video.aspx/getPingMissingDates',
        data: '{deptIp:\'' + value + '\'}',
        success:
            function (response) {
                fillGraph(response.d,name);
            }
    });
}
