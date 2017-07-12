<div class="portlet portlet-sortable light bordered" id="dashboardPortletMerchantTradeAmountStatistics">
    <div id="${homePanelRow}" data-controller="${controllerName}" data-action="${actionName}"></div>
    <div class="portlet-title">
        <div class="caption font-green-sharp">
            <i class="icon-speech font-green-sharp"></i>
            <span class="caption-subject bold uppercase">${homePanelName}</span>
            <span class="caption-helper"></span>
        </div>
        <div class="tools">
            <a href="javascript:;" class="fullscreen"> </a>
        </div>
    </div>

    <div class="portlet-body form">
        <div id="dashboardMerchantTradeAmountStatistics" style="height: 350px;">
        </div>
    </div>
</div>
<g:javascript>
$(function(){
    App.blockUI({target:"#dashboardPortletMerchantTradeAmountStatistics",boxed:!0,message:"读取中..."});
    $.ajax({
        url: "${g.createLink(controller: "Dashboard", action: "getMerchantTradeAmountStatistics")}",
        data: { },
        cache: false,
    }).done(function(data) {
        $("#dashboardMerchantTradeAmountStatistics").html(data);
        var chart = AmCharts.makeChart("chart_3", {
            "type": "serial",
            "theme": "light",
            "language": "zh",
            "fontFamily": 'Open Sans',
            "color":    '#888888',
            "pathToImages": App.getGlobalPluginsPath() + "amcharts/amcharts/images/",
            "dataProvider":eval($("#jsonString").val()),
            "balloon": {
                "cornerRadius": 6
            },
            "valueAxes": [{
                "axisAlpha": 0,
                "position": "left",
                "title": "交易额（万元）"
            }],
            "graphs": [{
                "bullet": "square",
                "bulletBorderAlpha": 1,
                "bulletBorderThickness": 1,
                "fillAlphas": 0.3,
                "fillColorsField": "lineColor",
                "legendValueText": "[[value]]",
                "lineColorField": "lineColor",
                "title": "tradingVolume",
                "valueField": "ranking"
            }],
            //"chartScrollbar": {},
            "chartCursor": {
                "categoryBalloonDateFormat": "YYYY年MM月DD日",
                "cursorAlpha": 0,
                "zoomable": false
            },
            "dataDateFormat": "YYYYMMDD",
            "categoryField": "tradingVolume",
            "categoryAxis": {
                "parseDates": false,
                "autoGridCount": true,
                "axisColor": "#555555",
                "gridAlpha": 0,
                "gridCount": 10
            }
        });

        $('#chart_3').closest('.portlet').find('.fullscreen').click(function() {
            chart.invalidateSize();
        });

    }).fail(function (e, data) {
        console.info(e);
    }).always(function() {
        App.unblockUI('#dashboardPortletMerchantTradeAmountStatistics');
    });
});
</g:javascript>