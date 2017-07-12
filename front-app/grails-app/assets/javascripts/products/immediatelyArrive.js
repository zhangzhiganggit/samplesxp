/**
 * Created by krupp on 16/9/20.
 */


/**
 * 关闭即刷即到
 * @param merchantCode
 */
function closeImmediatelyOne(merchantCode){
    var remark = $("#remark").val();
    bootbox.setLocale("zh_CN");
    $.ajax({
        type: "POST",
        async: false,
        url: "/immediatelyArrive/closeImmediatelyArrive",
        dataType: "JSON",
        data: {merchantCode: merchantCode, remark: remark},
        success: function (resultMap) {
            if (resultMap.returnCode == '3') {
                bootbox.alert("关闭成功，商户交易费率变更为0.65%！");
            } else {
                bootbox.alert("关闭失败！" + resultMap.returnMessage);
            }
        }
    })
}

/**
 * 开通即刷即到
 * @param merchantCode
 * @param merchantLevel
 */
function openImmediatelyArrive(merchantCode,merchantLevel){
    var remark = $("#remark").val();
    bootbox.setLocale("zh_CN");
    $.ajax({
        type: "POST",
        async:false,
        url: "/immediatelyArrive/openImmediatelyArrive",
        dataType:"JSON",
        data:{merchantCode:merchantCode,merchantLevel:merchantLevel,remark:remark},
        success:function(resultMap){
            if(resultMap.returnCode == '3'){
                bootbox.alert("开通成功！");
            }else{
                bootbox.alert("开通失败！"+resultMap.returnMessage);
            }
        }
    })
}