$(function () {
    /**
     * 默认加载首页并隐藏侧边栏
     */
    closableTab.addTab({'id': 'dashboard_index', 'name': '首页', 'url': '/dashboard/index'});
    hideSidebar();

    // fix bug : //todo
    $("div.page-content > ul.nav").on("click", "li", function(){
        if ( $(this).attr("id") == "tab_seed_dashboard_index") {
            $("#homeMenu").click();
        } else {
            var tabId = $(this).attr("id");
            if($.inArray(tabId , ["tab_seed_merchantIncome_create","tab_seed_merchantIncomeModify_edit",
                    "tab_seed_merchantManagement_index","tab_seed_handBrushMerchantManagement_index",
                    "tab_seed_otherConsumeMerchantManagement_index","tab_seed_MPosValidMerchantManagement_index",
                    "tab_seed_posTrade_index","tab_seed_MPosTrade_index","tab_seed_otherConsumeTrade_index",
                    "tab_seed_posSettle_index","tab_seed_MPosSettle_index","tab_seed_otherConsumeSettle_index",
                    "tab_seed_merchantAudit_index","tab_seed_merchantTerminalManagement_index","tab_seed_customerServiceWorkOrder_index",
                    "tab_seed_merchantSmallAndMicro_create","tab_seed_merchantSmallTransPos_index"])>-1){
                if($("#merchantSideBar").length<=0){
                    $("#merchantMenu").click();
                }
            }else if($.inArray(tabId , ["tab_seed_merchantRiskControlStatusManagement_index","tab_seed_assistBillQuery_index",
                    "tab_seed_riskClueProvide_index","tab_seed_recoveryQuery_index","tab_seed_complianceRectificationMerchant_index"])>-1){
                if($("#riskcontrolSideBar").length<=0){
                    $("#riskcontrolMenu").click();
                }
            }else if($.inArray(tabId , ["tab_seed_thisMonthProfit_index","tab_seed_historyProfit_index","tab_seed_menthodProfitDetail_index"])>-1){
                if($("#profitshareSideBar").length<=0){
                    $("#profitshareMenu").click();
                }
            }else if($.inArray(tabId , ["tab_seed_deviceOrder_index","tab_seed_ordersQuery_index","tab_seed_inventoryManagement_index","tab_seed_cardManagement_index",
                    "tab_seed_terminalQuery_index","tab_seed_attachedQuery_index","tab_seed_payCostManagement_index","tab_seed_creditInfo_index"])>-1){
                if($("#machinesSideBar").length<=0){
                    $("#machinesMenu").click();
                }
            }else if($.inArray(tabId , ["tab_seed_holidayPay_index","tab_seed_intradayPay_index","tab_seed_suiYiTongMerchant_index",
                    "tab_seed_suiYiTongAgent_index","tab_seed_suiYiTongAuditDataQuery_index","tab_seed_merchantAmountUsed_index",
                    "tab_seed_maintenanceFeeMerchant_index","tab_seed_maintenanceCostOrder_index","tab_seed_secondsReceived_index"])>-1){
                if($("#productsSideBar").length<=0){
                    $("#productsMenu").click();
                }
            }else if($.inArray(tabId , ["tab_seed_organization_index","tab_seed_salesmanManagement_index","tab_seed_staffManagement_index","tab_seed_bondOrder_index",
                    "tab_seed_checkCard_index","tab_seed_checkCard_tradeList","tab_seed_systemUserProfile_show","tab_seed_systemUserProfile_index",
                    "tab_seed_systemUserPhone_index","tab_seed_salesmanAuthentication_index","tab_seed_systemReceiptAddress_index","tab_seed_systemUserPassword_index",
                    "tab_seed_file_index","tab_seed_systemAppraisal_create","tab_seed_systemSuggestion_create","tab_seed_systemAnnouncement_index",
                    "tab_seed_systemNotice_index","tab_seed_systemFileNotice_index","tab_seed_homeUserPanels_index"])>-1){
                if($("#systemSideBar").length<=0){
                    $("#systemMenu").click();
                }
            }else if($.inArray(tabId , ["tab_seed_shortcutMenuConfigure_index"])>-1){
                if($("#shortcutSideBar").length<=0){
                    $.ajax({
                        url: '/dashboard/showShortcutMenu',
                        data: {
                            sidebar:true
                        },
                    }).done(function (data) {
                        // 清除旧菜单
                        $("#rootMenu").nextAll().remove();
                        // 将新菜单添加进来
                        $("#rootMenu").after(data)
                        // 给菜单绑定tab事件
                        $("div.page-sidebar ul li a").on("click", function (e) {
                            // TODO 需要菜单选中回显
                            e.preventDefault();
                            addToTab(this);
                        });
                    }).fail(function (e, data) {
                    }).always(function () {
                    });
                }
            }
            showSidebar();
        }
    });


    /**
     * 初始化快捷菜单
     */
    if($("#dropdown-shortcutMenu").length>0){

        $.ajax({
            url: '/dashboard/showShortcutMenu',
            data: {},
        }).done(function (data) {
            $("#dropdown-shortcutMenu").html(data);
            bindDropdownMenuEven();
        }).fail(function (e, data) {

        }).always(function () {

        });

    }



    /**
     * 注册快捷菜单修改监听器
     */
    $("#dropdown-shortcutMenu").bind("shortcutMenuchanged", function () {
        // 快捷菜单重新配置后重新绑定事件
        bindDropdownMenuEven();
    });

    /**
     * A标签新窗口
     * */
    $("#ANewWindow").bind("ANewWindowchanged", function (e, id, name, url) {
        addAToTab(id, name, url);
    });
    $("#ANewWindow").bind("openNewWindowchanged", function (e, id, name, url) {
            window.open(url,"_blank");
    });
    /**
     * 滑动触发
     */
    $('.dropdown').hover(function () {
        $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeIn();
    }, function () {
        $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut();
    });

    /**
     * 初始化下拉
     */
    bindDropdownMenuEven();

    /**
     * 菜单
     */
    $('button[name="firstMenu"]').click(function () {
        var firstMenuId = this.id;
        // 首页
        if (firstMenuId == "homeMenu") {
            hideSidebar();
            closableTab.addTab({'id': 'dashboard_index', 'name': '首页', 'url': '/dashboard/index'});
        } else {
            // 左侧菜单
            $.ajax({
                url: '/dashboard/showFirstMenu',
                data: {
                    firstMenuId: this.id
                },
            }).done(function (data) {
                if (data.length > 0) showSidebar();// 显示侧边栏
                // 清除旧菜单
                $("#rootMenu").nextAll().remove();
                // 将新菜单添加进来
                $("#rootMenu").after(data)
                // 给菜单绑定tab事件
                $("div.page-sidebar ul li a").on("click", function (e) {
                    // TODO 需要菜单选中回显
                    e.preventDefault();
                    addToTab(this);
                });
            }).fail(function (e, data) {
                //
            }).always(function () {
                //
            });
        }
    });
    /**
     * 注册首页内容修改监听器
     */
    $("#tab_framedashboard_index").bind("dashboardChange", function () {
       // document.getElementById("tab_framedashboard_index").contentDocument.location.reload(true);
        $('#tab_framedashboard_index').attr("src", $('#tab_framedashboard_index').attr("src"));
    });


//右上角三个通知绑定期  实时用
//文件通知绑定器
    $("#header_inbox_barFile").bind("headerinboxbar", function () {
        // summary();
    });
//消息通知绑定器
    $("#header_inbox_barNotice").bind("headerinboxbarNotice", function () {
        // summaryNotice();
    });
//待办通知绑定器
    $("#header_inbox_barInHand").bind("headerinboxbarInHand", function () {

        // summaryInHand();
    });

});

/**
 * 绑定事件，点击菜单添加页面到Tab iframe中
 */
function bindDropdownMenuEven() {
    //绑定快捷菜单
    $("ul.dropdown-menu li a").on("click", function (e) {
        e.preventDefault();
        addToTab(this);
    });
}

/**
 *  a 是一个 <a href="">。。。
 * @param a
 */
function addToTab(a) {
    if (a.href != "javascript:;")
        addAToTab(
            // http://localhost/system/notice = > system_noticenew RegExp("http:/\/([^\/]*)\/")
            a.href.replace(new RegExp("^(http|https)\:/\/([^\/]*)\/"), "").replace(/\//g, '_'),
            $(a).find("span").text(),
            a.href
         );
}

/**
 *
 * @param id
 * @param name
 * @param url
 */
function addAToTab(id, name, url) {
    if(id.indexOf("?")>=0){
        id=id.substring(0,id.indexOf("?"));
    }
    closableTab.addTab({
        'id': id,
        'name': name,
        'url': url
    });
}

function changeFrameHeight(){
    var tab = $("div.tab-content > .tab-pane.row.active");
    var ifmId = "tab_frame"+tab.attr("id").substring(14,tab.attr("id").length);
    document.getElementById(ifmId).height=$(window).height() - 170;
    document.getElementById(ifmId).width = "100%";
}

window.onresize=function(){
    changeFrameHeight();
}
