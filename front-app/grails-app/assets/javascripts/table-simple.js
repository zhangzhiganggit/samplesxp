$(function () {

// 判断是本地设置
    var isSimple = localStorage['takin-simpleTable']
// 简洁模式
    if (isSimple == undefined || isSimple == "false") {
        localStorage['takin-simpleTable'] = "false"
        if ($('.takin-simpleTable').get(0) != undefined) $('.takin-simpleTable').get(0).selectedIndex = 1;
    } else {
        localStorage['takin-simpleTable'] = "true"
        if ($('.takin-simpleTable').get(0) != undefined) $('.takin-simpleTable').get(0).selectedIndex = 0;
    }
// 默认简洁模式
    $("th[data-sample-column]", $('.takin-simpleTable').closest(".portlet-body").find(".table")).each(function () {
        var $this = $(this);
        var $td = $("td:nth-child(" + ($this.prevAll("th").length + 1) + ")", $this.closest("table"));
        if (isSimple == undefined || isSimple == "false") {
            $td.show();
            $this.show();
        } else {
            $td.hide();
            $this.hide();
        }
    })
// 简洁模式按钮
    $('.takin-simpleTable').on('change', function (e) {
        var table = $(this).closest(".portlet-body").find(".table");
        //可以隐藏的列
        $("th[data-sample-column]", table).each(function () {
            var $this = $(this);
            //获取列号
            var col_idx = $this.prevAll("th").length;
            //获取td
            var $td = $("td:nth-child(" + (col_idx + 1) + ")", $this.closest("table"));
            //隐藏td
            $td.toggle();
            //隐藏th
            $this.toggle();
        })
        localStorage['takin-simpleTable'] = localStorage['takin-simpleTable'] == "true" ? false : true;
    });
});
