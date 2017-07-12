<div class="portlet portlet-sortable light bordered" id="dashboardPortletMerchantTradeAmountRanks">
    <div id="${homePanelRow}" data-controller="${controllerName}" data-action="${actionName}"></div>

    <div class="portlet-title">
        <div class="caption font-green-sharp">
            <i class="icon-speech font-green-sharp"></i>
            <span class="caption-subject bold uppercase">${homePanelName}</span>
            <span class="caption-helper"></span>
        </div>

        <div class="tools">
            <a href="javascript:void(0)" id="fullscreenId5" class="fullscreen" onclick="hidenAmount()"></a>
        </div>
    </div>

    <div id="dashboardMerchantTradeAmountRanks" style="height: 350px;">

    </div>
</div>
<g:javascript>
    $(function(){
        App.blockUI({target:"#dashboardPortletMerchantTradeAmountRanks",boxed:!0,message:"读取中..."});
        $.ajax({
            url: "${g.createLink(controller: "Dashboard", action: "getMerchantTradeAmountRanks")}",
            data: { },
            cache: false,
        }).done(function(data) {
            $("#dashboardMerchantTradeAmountRanks").html(data);
        }).fail(function (e, data) {
            console.info(e);
        }).always(function() {
            App.unblockUI('#dashboardPortletMerchantTradeAmountRanks');
        });
    });

    function hidenAmount() {
        var cls = $('#fullscreenId5').attr('class');
        //fullscreen on 全屏
        if (cls == "fullscreen") {
            $("#typediv6").hide();
            $("#typediv5").show();
        } else {
            $("#typediv5").hide();
            $("#typediv6").show();
        }

    }
</g:javascript>