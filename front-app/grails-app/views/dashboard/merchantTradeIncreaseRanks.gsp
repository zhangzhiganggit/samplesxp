<div class="portlet portlet-sortable light bordered" id="dashboardPortletMerchantTradeIncreaseRanks">
    <div id="${homePanelRow}" data-controller="${controllerName}" data-action="${actionName}"></div>

    <div class="portlet-title">
        <div class="caption font-green-sharp">
            <i class="icon-speech font-green-sharp"></i>
            <span class="caption-subject bold uppercase">${homePanelName} (${start}~${end})</span>
            <span class="caption-helper"></span>
        </div>

        <div class="tools">
            <a href="javascript:void(0)" id="fullscreenId11" class="fullscreen" onclick="hidenIncrease()"></a>
        </div>
    </div>

    <div id="dashboardMerchantTradeIncreaseRanks" style="height: 350px;">

    </div>
</div>
<g:javascript>
    $(function(){
        App.blockUI({target:"#dashboardPortletMerchantTradeIncreaseRanks",boxed:!0,message:"读取中..."});
        $.ajax({
            url: "${g.createLink(controller: "Dashboard", action: "getMerchantTradeIncreaseRanks")}",
            data: { },
            cache: false,
        }).done(function(data) {
            $("#dashboardMerchantTradeIncreaseRanks").html(data);
        }).fail(function (e, data) {
            console.info(e);
        }).always(function() {
            App.unblockUI('#dashboardPortletMerchantTradeIncreaseRanks');
        });
    });
    function hidenIncrease() {
        var cls = $('#fullscreenId11').attr('class');
        //fullscreen on 全屏
        if (cls == "fullscreen") {
            $("#typediv25").hide();
            $("#typediv15").show();
        } else {
            $("#typediv15").hide();
            $("#typediv25").show();
        }
    }
</g:javascript>


