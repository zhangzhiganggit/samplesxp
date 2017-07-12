<div class="portlet portlet-sortable light bordered" id="dashboardPortletGtasks">
    <div id="${homePanelRow}" data-controller="${controllerName}" data-action="${actionName}"></div>

    <div class="portlet-title">
        <div class="caption font-green-sharp">
            <i class="icon-speech font-green-sharp"></i>
            <span class="caption-subject bold uppercase">${homePanelName}</span>
            <span class="caption-helper"></span>
        </div>

        <div class="tools">
            <a href="javascript:;" class="fullscreen"></a>
        </div>
    </div>

    <div class="portlet-body form">
        <div id="dashboardGtasks" style="height: 350px;">
        </div>
    </div>
</div>
<g:javascript>
$(function(){
    App.blockUI({target:"#dashboardPortletGtasks",boxed:!0,message:"读取中..."});
    $.ajax({
        url: "${g.createLink(controller: "Dashboard", action: "getGtasks")}",
        data: { },
        cache: false,
    }).done(function(data) {
        $("#dashboardGtasks").html(data);
        $('.homeTab').on('click', function (e) {
            e.preventDefault();
            var id = (this.href).replace(new RegExp("^(http|https)\:/\/([^\/]*)\/"), "").replace(/\//g, '_'); //substring(0,(this.href).indexOf("?")>=0 ? (this.href).indexOf("?") : (this.href).length)
            var name =  (this.text).split("(",1);
            // var href =  (this.href)+"?homeIndex=true";
            var href =  (this.href);
            parent.$("#ANewWindow").trigger('ANewWindowchanged', [id, name, href]);
        })
    }).fail(function (e, data) {
        console.info(e);
    }).always(function() {
        App.unblockUI('#dashboardPortletGtasks');
    });
});
</g:javascript>