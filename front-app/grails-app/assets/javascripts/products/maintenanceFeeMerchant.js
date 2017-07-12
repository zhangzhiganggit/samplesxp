/**
 * Created by krupp on 16/9/19.
 */
/**
 *
 *商户维护费管理
 *
 *
 */

$(function () {
    $(".closeMaintenanceFeeMerchant").click(function(e){
        e.preventDefault();
        var merchantCode = $(this).attr("mc");
        var insideMerchantCode = $(this).attr("imc");
        var collectPattern = $(this).attr("cp");
        closeMaintenanceFeeMerchant('00',merchantCode,insideMerchantCode,collectPattern);
        return false;
    })
})

/**
 * 关闭商户维护费
 * @param status
 * @param merchantCode
 * @param insideMerchantCode
 */
 function closeMaintenanceFeeMerchant(operationType,merchantCode,insideMerchantCode,collectPattern){
     bootbox.setLocale("zh_CN");
     bootbox.confirm("确定关闭维护费产品吗？",function(result){
        if(result){
           $.ajax({
             type: "POST",
             url: "/maintenanceFeeMerchant/close",
             dataType:"JSON",
             data:{operationType:operationType,insideMerchantCode:insideMerchantCode,merchantCode: merchantCode,collectPattern:collectPattern},
             success:function(data){
             if(data.code == 0){
                 bootbox.alert({
                     buttons: {
                         ok: {
                             label: '确定',
                         }
                     },
                     message: '关闭成功！',
                     callback: function() {
                         location.reload();
                     },
                     title: "",
                 });
             }else if(data.code == 'YGB'){
                 bootbox.alert({
                     buttons: {
                         ok: {
                             label: '确定',
                         }
                     },
                     message: "关闭失败:"+data.msg,
                     callback: function() {
                         location.reload();
                     },
                     title: "",
                 });
             }else{
                 bootbox.alert({
                     buttons: {
                         ok: {
                             label: '确定',
                         }
                     },
                     message: "关闭失败:"+data.msg,
                     callback: function() {
                         location.reload();
                     },
                     title: "",
                 });
             }
           }
           });
        }
     });
}

/**
 * 开通商户维护费
 */
function openMaintenance(){
    var collectAmount = $("input[name='collectAmountOpen']").val();
    var operationType = $("#operationTypeOpen").val();
    var merchantCode = $("#merchantCode").val();
    var insideMerchantCode = $("#insideMerchantCode").val();
    var str
    if(operationType == ''){
        bootbox.alert("请选择开通类型！")
        return false;
    }
    if(collectAmount.trim() == null || collectAmount.trim() == ""){
        bootbox.alert("请输入收取金额！")
        return false;
    }
    if(isNaN(collectAmount)){
        bootbox.alert("收取金额请输入数字！")
        return false;
    }
    if(operationType == '00'){
        var num = 0;
        var r= /^[+-]?[1-9]?[0-9]*\.[0-9]*$/;
        if(r.test(collectAmount)){
            num = collectAmount.toString().split(".")[1].length;
        }
        if(num > 2){
            bootbox.alert("格式错误，最多两位小数！请重新输入！")
            return false;
        }
        // collectAmount = parseFloat(collectAmount);
        if(parseFloat(collectAmount) < 1 || parseFloat(collectAmount) > 500){
            // alert(collectAmount);
            bootbox.alert("收取金额超出范围！维护通范围为1至500")
            return false;
        }
        str = '确定要开通维护通吗？';
    }else if(operationType == '01'){
        var num = 0;
        var r= /^[+-]?[1-9]?[0-9]*\.[0-9]*$/;
        if(r.test(collectAmount)){
            num = collectAmount.toString().split(".")[1].length;
        }
        if(num > 2){
            bootbox.alert("格式错误，最多两位小数！请重新输入！")
            return false;
        }
        // collectAmount = parseFloat(collectAmount);
        if(parseFloat(collectAmount) < 0.01 || parseFloat(collectAmount) > 15){
            // alert(collectAmount);
            bootbox.alert("收取金额超出范围！POS维护费-按日累计收费范围为0.01至15")
            return false;
        }
        str = "确定要开通POS维护费-按日累计收费吗？";
    }else {
        var num = 0;
        var r= /^[+-]?[1-9]?[0-9]*\.[0-9]*$/;
        if(r.test(collectAmount)){
            num = collectAmount.toString().split(".")[1].length;
        }
        if(num > 2){
            bootbox.alert("格式错误，最多两位小数！请重新输入！")
            return false;
        }
        // collectAmount = parseFloat(collectAmount);
        if(parseFloat(collectAmount) < 0.01 || parseFloat(collectAmount) > 15){
            // alert(collectAmount);
            bootbox.alert("收取金额超出范围！POS维护费-按日非累计收费范围为0.01至15")
            return false;
        }
        str = "确定要开通POS维护费-按日非累计扣费？";
    }


        bootbox.setLocale("zh_CN");
        bootbox.confirm(str,function(result){
            if(result){

                $.ajax({
                    type: "POST",
                    url:"/maintenanceFeeMerchant/open",
                    data:{collectAmount:collectAmount,operationType:operationType,merchantCode:merchantCode,insideMerchantCode:insideMerchantCode},
                    async: false,
                    success: function(data) {
                        if(data.code == 0){
                            bootbox.alert({
                                buttons: {
                                    ok: {
                                        label: '确定',
                                    }
                                },
                                message: "开通成功！",
                                callback: function() {
                                    location.reload();
                                },
                                title: "",
                            });
                        }else if(data.code == 'SHYC'){
                            bootbox.alert({
                                buttons: {
                                    ok: {
                                        label: '确定',
                                    }
                                },
                                message: data.msg,
                                callback: function() {
                                    location.reload();
                                },
                                title: "",
                            });
                        }else{
                            bootbox.alert({
                                buttons: {
                                    ok: {
                                        label: '确定',
                                    }
                                },
                                message: "开通失败:"+data.msg,
                                callback: function() {
                                    location.reload();
                                },
                                title: "",
                            });
                        }
                    }
                });
            }
        })

}