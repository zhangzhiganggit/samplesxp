<%@ page import="com.suixingpay.ssp.front.system.Dashboard" %>
<div class="portlet portlet-sortable light bordered" id="dashboardPortletMerchantIncomeSalesmanRanks">
    <div id="${homePanelRow}" data-controller="${controllerName}" data-action="${actionName}"></div>

    <div class="portlet-title">
        <div class="caption font-green-sharp">
            <i class="icon-speech font-green-sharp"></i>
            <span class="caption-subject bold uppercase">${homePanelName}</span>
            <span class="caption-helper"></span>
        </div>
        <div class="tools">
          <a href="javascript:void(0)" id="fullscreenId" class="fullscreen" onclick="hiden()"> </a>
        </div>
    </div>
    <div id="dashboardMerchantIncomeSalesmanRanks" style="height: 350px;">

    </div>

</div>
<g:javascript>
$(function(){
    App.blockUI({target:"#dashboardPortletMerchantIncomeSalesmanRanks",boxed:!0,message:"读取中..."});
    $.ajax({
        url: "${g.createLink(controller: "Dashboard", action: "getMerchantIncomeSalesmanRanks")}",
        data: { },
        cache: false,
    }).done(function(data) {
        $("#dashboardMerchantIncomeSalesmanRanks").html(data);
    }).fail(function (e, data) {
        console.info(e);
    }).always(function() {
        App.unblockUI('#dashboardPortletMerchantIncomeSalesmanRanks');
    });
});
function hiden() {
       var  cls= $('#fullscreenId').attr('class');
       //fullscreen on 全屏
       if(cls =="fullscreen"){
           $("#typediv2").hide();
           $("#typediv1").show();
       }else{
           $("#typediv1").hide();
           $("#typediv2").show();
       }
}
</g:javascript>