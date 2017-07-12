var FormValidation = function() {
    //ssp-datepicker-thisweek
    $(".btn-search").on('click',function () {


        var beginDate = $("#beginDate").val();
        var endDate=$("#endDate").val();
        //交易相关校验 参数可配置化
        var paramTradeStatus=$("#paramTradeStatus").val();
        var paramTradeMonth=$("#paramTradeMonth").val();
        var paramTradeDays=$("#paramTradeDays").val();
        console.log("------paramTradeMonth------------"+paramTradeMonth);
        //三个月校验
        if(paramTradeStatus=='0'){
            var tempMonth=endDate;
            for( var i=1;i<=paramTradeMonth;i++){
                tempMonth=getPreMonth(tempMonth);
            }
            if(beginDate<tempMonth){
                bootbox.alert("时间间隔不能大于"+paramTradeMonth+"个月，请修改输入时间！");
                return false;
            }
        }
        if(paramTradeStatus=='1'){
            var days=getDays(beginDate,endDate);
            console.log("------days----------------"+days);
            if(days>=paramTradeDays){
                bootbox.alert("时间间隔不能大于"+paramTradeDays+"天，请修改输入时间！");
                return false;
            }
        }if(paramTradeStatus!='0'&&paramTradeStatus!='1'){
            bootbox.alert("交易配置化参数出现问题，请联系管理员！");
            return false;
        }

        //获取当前时间一年以前日期
        var lastYearDay=getLastYearDay(getNowFormatDate());

        if(lastYearDay>beginDate){
            bootbox.alert("不能查询一年以前的数据，请修改输入时间！");
            return false;
        }
        // var days=getDays(beginDate,endDate);
        // console.log("------days----------------"+days);
        // if(days!=0){
        //     bootbox.alert("时间间隔不能大于一天，请修改输入时间！");
        //     return false;
        // }
        /*       if(beginDate<oneMonth){
         bootbox.alert("时间间隔不能大于一个月，请修输入时间！");
         return false;
         }*/

    })
}();
/*jQuery(document).ready(function() {
 FormValidation.init();
 });*/

/**
 * 获取上一个月
 *
 * @date 格式为yyyy-mm-dd的日期，如：2014-01-25
 */
function getPreMonth(date) {
    var arr = date.split('-');
    var year = arr[0]; //获取当前日期的年份
    var month = arr[1]; //获取当前日期的月份
    var day = arr[2]; //获取当前日期的日
    var days = new Date(year, month, 0);
    days = days.getDate(); //获取当前日期中月的天数
    var year2 = year;
    var month2 = parseInt(month) - 1;
    if (month2 == 0) {
        year2 = parseInt(year2) - 1;
        month2 = 12;
    }
    var day2 = day;
    var days2 = new Date(year2, month2, 0);
    days2 = days2.getDate();
    if (day2 > days2) {
        day2 = days2;
    }
    if (month2 < 10) {
        month2 = '0' + month2;
    }
    var t2 = year2 + '-' + month2 + '-' + day2;
    return t2;
}
//获取当前时间，格式YYYY-MM-DD
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

/**
 * 获取下一个月
 *
 * @date 格式为yyyy-mm-dd的日期，如：2014-01-25
 */
function getNextMonth(date) {
    var arr = date.split('-');
    var year = arr[0]; //获取当前日期的年份
    var month = arr[1]; //获取当前日期的月份
    var day = arr[2]; //获取当前日期的日
    var days = new Date(year, month, 0);
    days = days.getDate(); //获取当前日期中的月的天数
    var year2 = year;
    var month2 = parseInt(month) + 1;
    if (month2 == 13) {
        year2 = parseInt(year2) + 1;
        month2 = 1;
    }
    var day2 = day;
    var days2 = new Date(year2, month2, 0);
    days2 = days2.getDate();
    if (day2 > days2) {
        day2 = days2;
    }
    if (month2 < 10) {
        month2 = '0' + month2;
    }

    var t2 = year2 + '-' + month2 + '-' + day2;
    return t2;
}

//获得上一年在昨天这一天的日期
function getLastYearDay(date){
    var arr = date.split('-');
    var year = arr[0]; //获取当前日期的年份
    var month = arr[1]; //获取当前日期的月份
    var day = arr[2]; //获取当前日期的日
    var year2 = year;
    year2 = parseInt(year2) - 1;

    var t2 = year2 + '-' + month + '-' + day;
    return t2;
}
//获取一天间隔日期判断
function getDays(strDateStart,strDateEnd){
    var strSeparator = "-"; //日期分隔符
    var oDate1;
    var oDate2;
    var iDays;
    oDate1= strDateStart.split(strSeparator);
    oDate2= strDateEnd.split(strSeparator);
    var strDateS = new Date(oDate1[0], oDate1[1]-1, oDate1[2]);
    var strDateE = new Date(oDate2[0], oDate2[1]-1, oDate2[2]);
    iDays = parseInt(Math.abs(strDateS - strDateE ) / 1000 / 60 / 60 /24)//把相差的毫秒数转换为天数
    return iDays ;
}