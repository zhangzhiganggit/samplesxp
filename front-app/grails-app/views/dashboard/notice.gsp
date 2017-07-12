<div class="portlet portlet-sortable light bordered" id="dashboardPortletNotice">
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
        <div id="dashboardNotice" style="height: 350px;">
        </div>
    </div>
</div>
<g:javascript>
$(function(){
    App.blockUI({target:"#dashboardPortletNotice",boxed:!0,message:"读取中..."});
    $.ajax({
        url: "${g.createLink(controller: "Dashboard", action: "getNotice")}",
        data: { },
        cache: false,
    }).done(function(data) {
        $("#dashboardNotice").html(data);
        $(".content").each(function () {
            var theId = $(this).attr("id");
            var keyPoint = $("#"+theId).text().trim();
            var content
            if(keyPoint.length>46){
            content = $("#"+theId).text().trim().substring(0,46)+"......"
            }
            $("#"+theId).text(content)
        })
        $('.matl').click(function (e) {
        e.preventDefault();
        var id = "systemAnnouncement_index";
        var href = this.href;
        parent.$("#ANewWindow").trigger('ANewWindowchanged', [id, "系统公告", href]);
        })
    }).fail(function (e, data) {
        console.info(e);
    }).always(function() {
        App.unblockUI('#dashboardPortletNotice');
    });
});
</g:javascript>