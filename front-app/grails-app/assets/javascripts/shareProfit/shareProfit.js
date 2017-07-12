$(function () {

    var optionsize = $("#levelID").val()
    for (var i = 2; i <= optionsize; i++) {
        $("#q_showLevel1").append("<option value=" + i + ">第" + i + "代</option>")
    }
})

var optionVal;
$("#q_showLevel1").change(function () {
    optionVal = $("#q_showLevel1  option:selected").val()
})

function selectCheck() {

    $.ajax({
        url: '/MenthodProfitDetail/result?optionVal ',
        data: {optionVal: optionVal},
    }).done(function (data) {
        debugger
        bootbox.alert("<div style='text-align: center'><b>数据正在导出！</b></div><div style='text-align: center'><img style='width: 50px;height: 50px' class='lazy' data-original='/deviceOrder/viewImage?title=%2Fnfs%2F2016%2F11%2F16%2Fbig%2F388%2F' src='/assets/profit.jpg'/>【机构分润明细】数据正在导出,导出完毕后请进入导出数据下载中下载您的数据</div>");
        setTimeout(function () {
            bootbox.hideAll()
        },3000)
    })
}
/**
 *
 * 重置历史分润日期
 */
function resetHistoryDate() {

    var myDate = new Date();
    myDate.setMonth(myDate.getMonth() - 1);
    var beforeOneMonth = myDate.getFullYear() + "-" + doubleDate(myDate.getMonth() + 1)
    $("input[name='q_month_to']").val(beforeOneMonth);
    myDate.setMonth(myDate.getMonth() - 3);
    var beforeThreeMonth = myDate.getFullYear() + "-" + doubleDate(myDate.getMonth() + 1)
    $("input[name='q_month_from']").val(beforeThreeMonth);
}

/**
 * 将1-9月转换成01-09月
 */
function doubleDate(date) {
    if (parseInt(date) < 10) {
        return "0" + date
    } else
        return "" + date
}
/**
 * 重置明细中的日期
 */
function resetDetailDate() {
    var myDate = new Date();
    myDate.setMonth(myDate.getMonth() - 1);
    var beforeOneMonth = myDate.getFullYear() + "-" + doubleDate(myDate.getMonth() + 1)
    $("input[name='q_month_from']").val(beforeOneMonth);
}
$.fn.datetimepicker.dates['zh'] = {
    days:       ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六","星期日"],
    daysShort:  ["日", "一", "二", "三", "四", "五", "六","日"],
    daysMin:    ["日", "一", "二", "三", "四", "五", "六","日"],
    months:     ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月","十二月"],
    monthsShort:  ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月","12月"],
    meridiem:    ["上午", "下午"],
    //suffix:      ["st", "nd", "rd", "th"],
    today:       "本月"
};
$(".q_month_from").datetimepicker({
    language:  'zh',
    format: 'yyyy-mm',
    autoclose: true,
    todayBtn: true,
    startView: 'year',
    minView:'year',
    maxView:'decade',
    endDate:new Date()
});



