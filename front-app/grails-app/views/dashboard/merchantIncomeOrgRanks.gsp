<div class="portlet portlet-sortable light bordered" id="dashboardPortletMerchantIncomeOrgRanks">
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

    <div  class="portlet-body form">
        <div id="dashboardMerchantIncomeOrgRanks" style="height: 350px;">
        </div>
    </div>
</div>
<g:javascript>
$(function(){
    App.blockUI({target:"#dashboardPortletMerchantIncomeOrgRanks",boxed:!0,message:"读取中..."});
    $.ajax({
        url: "${g.createLink(controller: "Dashboard", action: "getMerchantIncomeOrgRanks")}",
        data: { },
        cache: false,
    }).done(function(data) {
        $("#dashboardMerchantIncomeOrgRanks").html(data);
        var chart = AmCharts.makeChart("chart_1", {
            "type": "serial",
            "theme": "light",
            "language": "zh",
            "pathToImages": App.getGlobalPluginsPath() + "amcharts/amcharts/images/",
            "autoMargins": false,
            "marginLeft": 40,
            "marginRight": 8,
            "marginTop": 10,
            "marginBottom": 60,

            "fontFamily": 'Open Sans',
            "color":    '#888',

            "dataProvider": eval($("#json").val()),
            "valueAxes": [{
                "axisAlpha": 0,
                "position": "left"
            }],
            "startDuration": 1,
            "graphs": [{
                "alphaField": "alpha",
                "balloonText": "<span style='font-size:11px;'> [[category]] [[title]] :<b>[[value]]</b> [[additional]]</span>",
                "dashLengthField": "dashLengthColumn",
                "fillAlphas": 1,
                "title": "进件数量",
                "type": "column",
                "valueField": "numberSuccess"
            }],
            "categoryField": "businessSeries",
            "categoryAxis": {
                "gridPosition": "start",
                "axisAlpha": 0,
                "tickLength": 0,
                "labelRotation": 45
            }
        });
        $('#chart_1').closest('.portlet').find('.fullscreen').click(function() {
            chart.invalidateSize();
        });

    }).fail(function (e, data) {
        console.info(e);
    }).always(function() {
        App.unblockUI('#dashboardPortletMerchantIncomeOrgRanks');
    });
});
</g:javascript>


