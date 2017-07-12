var closableTab = {

    /**
     * 添加Tab
     * @param tabItem
     */
    addTab: function (tabItem) {

        //
        // if ($('.nav-tabs').children().length > parseInt($(window).width() / 130 - 2)) {
        //     bootbox.alert("您打开的窗口太多了!");
        //     return;
        // }

        //
        var id = "tab_seed_" + tabItem.id;
        var container = "tab_container_" + tabItem.id;
        //
        $("li[id^=tab_seed_]").removeClass("active");
        $("div[id^=tab_container_]").removeClass("active");
        //
        if (!$('#' + id)[0]) {
            //
            var li_tab = '<li role="presentation" class="" id="' + id + '"><a href="#' + container + '"  role="tab" data-toggle="tab" style="position: relative;">' + tabItem.name;

            if (tabItem.id == 'dashboard_index') {
                li_tab = li_tab + '</a></li> ';
            } else {
                li_tab = li_tab + '<button tabclose="' + id + '" class="close" style="position: absolute;right:4px;top: 4px;" onclick="closableTab.closeTab(this)"></button></a></li> ';
            }

            var tab_frame_id = "tab_frame" + tabItem.id;
            var tabpanel = '<div role="tabpanel" class="tab-pane row" id="' + container + '" style="width: 100%;">' +
                '<iframe src="' + tabItem.url + '" id="' + tab_frame_id + '"  frameborder="0" style="overflow-x: hidden; overflow-y: hidden;width:100%;" onload="changeFrameHeight()"></iframe>' +
                '</div>';
            //
            $('.nav-tabs').append(li_tab);
            $('.tab-content').append(tabpanel);

            // $('#' + tab_frame_id).iframeAutoHeight({
            //     animate: true,
            //     minHeight: 800,//$('#' + tab_frame_id).contents().find("body").height()+20
            //     heightOffset: 20,
            //     heightCalculationOverrides: [{
            //         browser: 'mozilla',
            //         calculation: function (iframe, $iframeBody, options, browser) {
            //             // since the jquery browser is passed in you can also check specific versions if desired
            //             return 2000;
            //         }
            //     }],
            //     callback: function (callbackObject) {
            //     }
            // });

        }

        $("#" + id).addClass("active");
        $("#" + container).addClass("active");
    },


    /**
     * 关闭tab
     * @param item
     */
    closeTab: function (item) {
        //
        var val = $(item).attr('tabclose');
        var containerId = "tab_container_" + val.substring(9);
        //
        if ($('#' + containerId).hasClass('active')) {
            $('#' + val).prev().addClass('active');
            $('#' + containerId).prev().addClass('active');
        }
        //
        $("#" + val).remove();
        $("#" + containerId).remove();
    }
}