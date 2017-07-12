<div class="portlet portlet-sortable light bordered" id="dashboardPortletMerchantTradeDecreaseRanks">
    <div id="${homePanelRow}" data-controller="${controllerName}" data-action="${actionName}"></div>

    <div class="portlet-title">
        <div class="caption font-green-sharp">
            <i class="icon-speech font-green-sharp"></i>
            <span class="caption-subject bold uppercase">${homePanelName} (${start}~${end})</span>
            <span class="caption-helper"></span>
        </div>

        <div class="tools">
            <a href="javascript:void(0)" id="fullscreenId1" class="fullscreen" onclick="hidenDecrease()"></a>
        </div>
    </div>

    <div id="dashboardMerchantTradeDecreaseRanks" style="height: 350px;">

    </div>
</div>
<g:javascript>
    $(function(){
        App.blockUI({target:"#dashboardPortletMerchantTradeDecreaseRanks",boxed:!0,message:"读取中..."});
        $.ajax({
            url: "${g.createLink(controller: "Dashboard", action: "getMerchantTradeDecreaseRanks")}",
            data: { },
            cache: false,
        }).done(function(data) {
            $("#dashboardMerchantTradeDecreaseRanks").html(data);
        }).fail(function (e, data) {
            console.info(e);
        }).always(function() {
            App.unblockUI('#dashboardPortletMerchantTradeDecreaseRanks');
        });
    });

    function hidenDecrease() {
        var cls = $('#fullscreenId1').attr('class');
        //fullscreen on 全屏
        if (cls == "fullscreen") {
            $("#typediv21").hide();
            $("#typediv11").show();
        } else {
            $("#typediv11").hide();
            $("#typediv21").show();
        }
    }
</g:javascript>
