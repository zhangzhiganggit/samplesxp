/**
 * Tab Controller
 *
 * @author xujingbao@suixingpay.com
 */
sspFrontApp.config(function (localStorageServiceProvider) {
    localStorageServiceProvider.setStorageType('localStorage');
});

sspFrontApp.controller('tabCtrl', function ($scope, $sce, localStorageService) {

    $scope.tabs = []

    var Const = ({
        TAB_ACTIVE: "tab-active",
        TABS: "tabs"
    });

    /**
     * 新开Tab
     * @param id
     * @param name
     * @param url
     */
    $scope.addTab = function (id, name, url, recovery) {
        //
        addTab(id, name, url);
        //
        if (recovery) recoveryRecentTabs();
    }

    /**
     * 关闭Tab
     * @param index
     */
    $scope.deleteTab = function (index) {
        $scope.tabs.splice(index, 1);
        //TODO 从本地存储
        if (!localStorageService.get(Const.TABS)) return;
        //
        var tabs = JSON.parse(localStorageService.get(Const.TABS));
        tabs.splice(index, 1);
        //
        localStorageService.set(Const.TABS, JSON.stringify(tabs));
    }

    /**
     * 默认选中Tab
     * @type {number}
     */
    $scope.selectedTab = 0;

    /**
     * 选择Tab
     * @param index
     */
    $scope.selectTab = function (index) {
        $scope.selectedTab = index;
        localStorageService.set(Const.TAB_ACTIVE, $scope.selectedTab);
    }

    function addTab(id, name, url) {

        for (var i = 0; i < $scope.tabs.length; i++) {
            // 如果存在 直接选中
            if ($scope.tabs[i].id == id) {
                $scope.$apply(function () {
                    $scope.selectedTab = i;
                });
                return;
            }
        }
        // 请求body
        $.get(url, function (data, s, j) {

            if (canPushTab(id)) {
                //刷新数据
                $scope.$apply(function () {
                    $scope.tabs.push({id: id, name: name.trim(), url: url, content: $sce.trustAsHtml(data)})
                    localStorageService.set(Const.TABS, JSON.stringify($scope.tabs));
                });
                $scope.selectedTab = $scope.tabs.length;
                localStorageService.set(Const.TAB_ACTIVE, $scope.selectedTab);
            }
        });
    }

    function canPushTab(id) {

        for (var i = 0; i < $scope.tabs.length; i++) {
            if ($scope.tabs[i].id == id) return false;
        }
        return true;
    }

    function addTabs(tabs) {
        for (var i = 0; i < tabs.length; i++) {
            addTab(tabs[i].id, tabs[i].name, tabs[i].url)
        }
    }

    function recoveryRecentTabs() {
        // 从本地存储中恢复Tabs
        if (!localStorageService.get(Const.TABS)) return;
        var tabs = JSON.parse(localStorageService.get(Const.TABS));
        if (tabs && tabs.length > 0) {
            addTabs(tabs);
        }
        // 恢复上一次选中的Tab
        $scope.selectedTab = localStorageService.get(Const.TAB_ACTIVE);
    }
})

/**
 * Tab init
 */
// $(function () {
//     //get $scope
//     var $scope = angular.element(document.querySelector('[ng-controller=tabCtrl]')).scope();
//     $("div.page-sidebar ul li a").on("click", function () {
//         event.preventDefault();
//         $scope.addTab(this.href.replace(new RegExp("http:/\/([^\/]*)\/"), "").replace(/\//g, '_'), $(this).find("span").text(), this.href, false);
//     });
// })
