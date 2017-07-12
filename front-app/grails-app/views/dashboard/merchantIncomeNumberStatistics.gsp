<div class="portlet portlet-sortable light bordered" id="dashboardePortletMrchantIncomeNumberStatistics">
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

    <div  class="portlet-body form" >
        <div id="dashboardeMrchantIncomeNumberStatistics" style="height: 350px;">
        </div>
    </div>
</div>
<g:javascript>
$(function(){
    App.blockUI({target:"#dashboardePortletMrchantIncomeNumberStatistics",boxed:!0,message:"读取中..."});
    $.ajax({
        url: "${g.createLink(controller: "Dashboard", action: "getMerchantIncomeNumberStatistics")}",
        data: { },
        cache: false,
    }).done(function(data) {
        $("#dashboardeMrchantIncomeNumberStatistics").html(data);
    }).fail(function (e, data) {
        console.info(e);
    }).always(function() {
        App.unblockUI('#dashboardePortletMrchantIncomeNumberStatistics');
    });
});
</g:javascript>

