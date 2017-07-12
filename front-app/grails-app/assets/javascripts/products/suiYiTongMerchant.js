/**
 * Created by wangyu on 16/10/23.
 */

$(function(){

})

/**
 * 关闭商户随意通业务
 */
function closeMerchantSuiYiTong(insideMerchantCode){
    bootbox.setLocale("zh_CN");
    bootbox.confirm("确定关闭该商户的随意通业务吗？关闭后需重新申请开通，请谨慎操作",function (result) {
        if(result){
            $.ajax({
                type: "POST",
                url: "/suiYiTongMerchant/closeMerchantSuiYiTong",
                dataType:"JSON",
                data:{insideMerchantCode:insideMerchantCode},
                success:function(resultMessage){
                    if(resultMessage == '-1'){
                        bootbox.alert("该商户已关闭随意停业务！")
                        return;
                    }
                    if(resultMessage.resCode == 'TZ20200'){
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
                    }else{
                        bootbox.alert({
                            buttons: {
                                ok: {
                                    label: '确定',
                                }
                            },
                            message: "关闭失败！"+resultMessage.resMsg,
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

/**
 * 暂停商户随意通业务
 */
function pauseMerchantSuiYiTong(insideMerchantCode){
    bootbox.setLocale("zh_CN");
    bootbox.confirm("确定暂停该商户随意通业务吗？",function (result) {
        if(result){
            $.ajax({
                type: "POST",
                url: "/suiYiTongMerchant/pauseMerchantSuiYiTong",
                dataType:"JSON",
                data:{insideMerchantCode:insideMerchantCode},
                success:function(resultMessage){
                    if(resultMessage == '-1'){
                        bootbox.alert("该商户已暂停随意停业务！")
                        return;
                    }
                    if(resultMessage.resCode == 'TZ20200'){
                        bootbox.alert({
                            buttons: {
                                ok: {
                                    label: '确定',
                                }
                            },
                            message: "暂停成功！",
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
                            message: "暂停失败！"+resultMessage.resMsg,
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

/**
 * 恢复商户随意通业务
 */
function recoverMerchantSuiYiTong(insideMerchantCode){
    bootbox.setLocale("zh_CN");
    bootbox.confirm("确定恢复该商户随意通业务吗？",function (result) {
        if(result){
            $.ajax({
                type: "POST",
                url: "/suiYiTongMerchant/recoverMerchantSuiYiTong",
                dataType:"JSON",
                data:{insideMerchantCode:insideMerchantCode},
                success:function(resultMessage){
                    if(resultMessage == '-1'){
                        bootbox.alert("该商户已开通随意停业务！");
                        return;
                    }
                    if(resultMessage.resCode == 'TZ20200'){
                        bootbox.alert({
                            buttons: {
                                ok: {
                                    label: '确定',
                                }
                            },
                            message: "恢复成功！",
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
                            message: "恢复失败！"+resultMessage.resMsg,
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

/**
 * 修改即日付商户额度
 */
function amountChange(){
    $('#remarkDiv').hide();
    var updateAmount = $("#updateAmount").val();
    if(updateAmount == '200000' || updateAmount == '300000'){
        $('#remarkDiv').show();
    }
}

function sub(a){
    var updateAmount = $("#updateAmount").val();
    var insideMerchantCode = $("#insideMerchantCode").val();
    var merchantCode = $("#merchantCode").val();
    var receiptsName = $("#receiptsName").val();
    var suiYiTongAmount = $("#suiYiTongAmount").val();
    var remark = $("#remark").val();
    var salesManName = $("#salesManName").val();
    var salesManNo = $("#salesManNo").val();
    console.log("======================"+salesManNo);
    $(a).attr("disabled",true);
    if(updateAmount == ''){
        bootbox.alert("修改额度不能为空！");
        $(a).attr("disabled",false);
        return;
    }
    if(updateAmount == '200000' || updateAmount == '300000'){
        if(remark == null || remark == ""){
            bootbox.alert("备注不能为空！");
            $(a).attr("disabled",false);
            return false;
        }else{
            bootbox.setLocale("zh_CN");
            bootbox.confirm("确定修改商户随意通限额为"+updateAmount+"元吗？",function (result) {
                if(result) {
                    $.ajax({
                        type: "POST",
                        async:true,
                        url: "/suiYiTongMerchant/updateMerchantSuiYiTongAmount",
                        dataType: "JSON",
                        data: {
                            insideMerchantCode: insideMerchantCode,
                            updateAmount: updateAmount,
                            merchantCode: merchantCode,
                            receiptsName: receiptsName,
                            suiYiTongAmount: suiYiTongAmount,
                            salesManName: salesManName,
                            salesManNo:salesManNo
                        },
                        success: function (resultMessage) {
                            bootbox.alert({
                                buttons: {
                                    ok: {
                                        label: '确定',
                                    }
                                },
                                message: resultMessage.resMsg,
                                callback: function() {
                                    location.reload();
                                },
                                title: "",
                            });
                            $(a).attr("disabled",false);
                        }
                    })
                }
                $(a).attr("disabled",false);
            })
        }
    }else{
        bootbox.setLocale("zh_CN");
        bootbox.confirm("确定修改商户随意通限额为"+updateAmount+"元吗？",function (result) {
            if(result){
                $.ajax({
                    type: "POST",
                    url: "/suiYiTongMerchant/updateMerchantSuiYiTongAmount",
                    dataType:"JSON",
                    data:{insideMerchantCode:insideMerchantCode,updateAmount:updateAmount,merchantCode: merchantCode, receiptsName: receiptsName,
                        suiYiTongAmount: suiYiTongAmount,salesManName:salesManName},
                    success:function(resultMessage){
                        bootbox.alert({
                            buttons: {
                                ok: {
                                    label: '确定',
                                }
                            },
                            message: resultMessage.resMsg,
                            callback: function() {
                                location.reload();
                            },
                            title: "",
                        });
                        $(a).attr("disabled",false);

                    }
                });

            }
            $(a).attr("disabled",false);
        })
    }
}