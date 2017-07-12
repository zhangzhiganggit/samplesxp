<!doctype html>
<html>
<head>
    <meta name="layout" content="scaffold"/>
    <title>Welcome to home</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
</head>

<body>

%{--<div class="note note-info">--}%
    %{--<h1> 随行付欢迎您！ </h1>--}%
%{--</div>--}%
    %{--推广广告--}%
    <div class="showAdvertising"></div>
    <input type="hidden" id="flag" value="${flag}"/>
<component:modalsL id="advertisingModal" title="随行付"
                  width="full"/>
%{--
<div class="row">
    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <a class="dashboard-stat dashboard-stat-v2 blue" href="index.html#">
            <div class="visual">
                <i class="fa fa-comments"></i>
            </div>

            <div class="details">
                <div class="number">
                    <span data-counter="counterup" data-value="1349">1349</span>
                </div>

                <div class="desc">本月新增POS商户数</div>
            </div>
        </a>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <a class="dashboard-stat dashboard-stat-v2 red" href="index.html#">
            <div class="visual">
                <i class="fa fa-bar-chart-o"></i>
            </div>

            <div class="details">
                <div class="number">
                    ￥ <span data-counter="counterup" data-value="2,1200.00">12,1200.00</span></div>

                <div class="desc">本月分润</div>
            </div>
        </a>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <a class="dashboard-stat dashboard-stat-v2 green" href="index.html#">
            <div class="visual">
                <i class="fa fa-shopping-cart"></i>
            </div>

            <div class="details">
                <div class="number">
                    ￥ <span data-counter="counterup" data-value="549,000.12">549,000.12</span>
                </div>

                <div class="desc">本月交易额</div>
            </div>
        </a>
    </div>

    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <a class="dashboard-stat dashboard-stat-v2 purple" href="index.html#">
            <div class="visual">
                <i class="fa fa-globe"></i>
            </div>

            <div class="details">
                <div class="number">+
                    <span data-counter="counterup" data-value="50">50</span>%</div>

                <div class="desc">交易额增长</div>
            </div>
        </a>
    </div>
</div>
--}%
<div id="sortable_portlets" class="row ui-sortable">

</div>
<div id="LoadingImage" style="display: none;text-align: center;width: 100%;position: fixed;top: 200px;">
    <asset:image src="loading.gif" style="width: 50px;"></asset:image>
</div>
<content tag="takin-footer">

    <asset:javascript src="global/plugins/jquery-ui/jquery-ui.min.js"/>
    <asset:javascript src="global/plugins/amcharts/amcharts/amcharts.js"/>
    <asset:javascript src="global/plugins/amcharts/amcharts/serial.js"/>
    <asset:javascript src="global/plugins/amcharts/amcharts/pie.js"/>
    <asset:javascript src="global/plugins/amcharts/amcharts/radar.js"/>
    <asset:javascript src="global/plugins/amcharts/amcharts/themes/light.js"/>
    <asset:javascript src="global/plugins/amcharts/amcharts/themes/patterns.js"/>
    <asset:javascript src="global/plugins/amcharts/amcharts/themes/chalk.js"/>
    <asset:javascript src="global/plugins/amcharts/amcharts/lang/zh.js"/>
    <asset:javascript src="/jquery.qrcode.min.js"/>

    <g:javascript>
        /**
         * js 写在这里
         * see scaffold.gsp => END JAVASCRIPTS g:pageProperty
         */
        var PortletDraggable=function(){
            return{init:function(){
                jQuery().sortable&&$("#sortable_portlets").sortable({
                    connectWith:".portlet",
                    items:".portlet",
                    opacity:.8,
                    handle:".portlet-title",
                    coneHelperSize:!0,
                    placeholder:"portlet-sortable-placeholder",
                    forcePlaceholderSize:!0,
                    tolerance:"pointer",
                    helper:"clone",
                    cancel:".portlet-sortable-empty, .portlet-fullscreen",
                    revert:250,
                    tolerance:"pointer",
                    forcePlaceholderSize:!0,
                    helper:"clone",
                    update:function(e,t){
                        t.item.prev().hasClass("portlet-sortable-empty")&&t.item.prev().before(t.item);
                         var colunms = []
                         $("div[id^=home-panel-column]").each(function() {
                            var rows = []
                            $(this).find("div[id^=home-panel-row]").each(function() {
                                var data = {};
                                data["controller"] = $(this).attr('data-controller');
                                data["action"] = $(this).attr('data-action');
                                rows.push(data)
                            })
                            colunms.push(rows)
                         })
                        console.log(JSON.stringify(colunms))
                        $.ajax({
                            url: "${g.createLink(controller: "Dashboard", action: "updateUserPanels")}",
                            data: {
                                panels:JSON.stringify(colunms)
                            },
                            type:'POST'
                        }).done(function(data) {
                           console.log("sucessful");
                        }).fail(function (e, data) {
                            console.log("error");
                        }).always(function() {
                            console.log("complete");
                        });
                    }
                })
            }}
        }();
        $(function(){
            //推广广告初始化
            var flag = confirmEffect();//获取广告投放状态是否开启
            console.log("获取广告投放状态是否开启："+flag);
            if(flag){//投放
                console.log("广告投放状态是开启");
                $('#advertisingModal').modal({
                    backdrop: 'static',
                    keyboard: false,
                    remote: "/home/showAdvertising"
                });
            }
            $("#LoadingImage").show();
                $.ajax({
                    url: "${g.createLink(controller: "Dashboard", action: "getUserPanels")}",
                    data: { },
                }).done(function(data) {
                    $("#sortable_portlets").html(data);
                }).fail(function (e, data) {
                    console.log("error");
                }).always(function() {
                    console.log("complete");
                    $("#LoadingImage").hide();
                });
                 PortletDraggable.init()
        });
        //获取广告投放状态
        function confirmEffect(){
            var flag = false;
            $.ajax({
               url:'/home/confirmEffect',
               type:'post',
               async:false,
               success:function(data){
                   console.log("返回值："+data.flag);
                  flag = data.flag;
               }
            });
            return flag;
        }


    </g:javascript>
</content>
</body>
</html>