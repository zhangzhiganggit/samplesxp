/**
 * Created by lv09 on 2016/9/19.
 */
var flag = false

$(function () {
    var amount = parseFloat($("#amount").text()).toFixed(2)
    var actualAmount = parseFloat($(".actualAmount").text()).toFixed(2)
    console.log(actualAmount-amount)
    if(amount-actualAmount<0){
        $("#credit").append("<span class='col-md-6 text-nowrap' style='color:red;padding-top:1%'>（当前赊购金额不足）</span>")
        flag = true;
    }

})

function checkCreditPay(){
    if(flag){
        $(".creditAmount").prop('checked',false);
        $('.creditAmount').trigger('change');
        return
    }

    if ($(".creditAmount").prop('checked')&& !$(".remittance").prop('checked') && !$(".onlinePay").prop('checked')) {
        $("#creditAmount").show();
        $("#remittanceInfo").hide();
        $("#checkstand").hide();
    } else if (!$(".creditAmount").prop('checked')) {
        $("#creditAmount").hide();
    }


    else if ($(".onlinePay").prop('checked') && $(".creditAmount").prop('checked')) {
        bootbox.alert({
            buttons: {
                ok: {
                    label: '确定',
                }
            },
            message: '赊购和在线支付不能同时选中',
            title: "",
        });
        $(".onlinePay").prop('checked',false);
        $('.onlinePay').trigger('change');
        $("#checkstand").hide();
        $("#creditAmount").show();
        $("#remittanceInfo").hide();
    }
    else if ($(".remittance").prop('checked') && $(".creditAmount").prop('checked')) {
        bootbox.alert({
            buttons: {
                ok: {
                    label: '确定',
                }
            },
            message: '赊购和汇款不能同时选中',
            title: "",
        });
        $(".remittance").prop('checked',false);
        $('.remittance').trigger('change');
        $("#checkstand").hide();
        $("#creditAmount").show();
        $("#remittanceInfo").hide();
        $("#remittance").show();
    }


    /*if ($(".onlinePay").is(':checked')) {
     $("#checkstand").show();
     $("#creditAmount").hide();
     $("#remittanceInfo").hide();
     } else if (!$(".onlinePay").is(':checked')) {
     $("#checkstand").hide();
     }
     if ($(".remittance").prop('checked')) {
     $("#checkstand").hide();
     $("#creditAmount").hide();
     $("#remittanceInfo").show();
     $("#remittance").show();
     } else if (!$(".remittance").prop('checked')) {
     $("#remittanceInfo").hide();
     }*/
}

function nextStep(){
    var goodsOrderId = $(".goodsOrderId").text();
    //本次使用赊购金额
    var usedAmount ;
    //实收金额
    var actualAmount;
    //可用赊购金额
    var creditAmount;
    var isCredit;
    var payMod = 1;
    var result =false;
    if($(".creditAmount").prop('checked')){
        usedAmount = parseFloat($("#usedAmount").val().trim());
        actualAmount = parseFloat($(".actualAmount").text().trim());
        creditAmount = parseFloat($(".creditAmount").val().trim());
        var currentCredit = parseFloat(getCreditAmount());
        isCredit=1;
        if($("#usedAmount").val().trim() == "" ){
            bootbox.alert("请填写赊购使用金额！");
            return result;
        }else if(isNaN($("#usedAmount").val().trim())){
            bootbox.alert("本次使用的赊购金额与实际信息不符，请确认后重新填写");
            return result;
        }else if(usedAmount > creditAmount || usedAmount > currentCredit){
            bootbox.alert("赊购使用金额不能超出当前可用赊购额度！");
            if(creditAmount > currentCredit){
                $("#amount").html(currentCredit);
            }
            return result;
        }else if(usedAmount >= actualAmount){
            bootbox.alert("赊购-在线支付时，赊购使用金额必须小于实收金额！");
            return result;
        }
    }
    result = true;
    var url = '/ordersPay/confirmPayment?goodsOrderId='+goodsOrderId+'&payMod='+payMod+'&usedAmount='+usedAmount+'&isCredit='+isCredit;
    window.open(url);
    return result;
}

function creditPay(){
    var goodsOrderId = $(".goodsOrderId").text();
    //本次使用赊购金额
    var usedAmount = parseFloat($("#usedAmount").val().trim());
    //实收金额
    var actualAmount = parseFloat($(".actualAmount").text());
    //可用赊购金额
    var creditAmount = parseFloat($(".creditAmount").val());
    var currentCredit = parseFloat(getCreditAmount());
    if($("#usedAmount").val().trim() == ""){
       bootbox.alert("请填写赊购使用金额！");
       return false;
   }else if(isNaN($("#usedAmount").val().trim())){
        bootbox.alert("本次使用的赊购金额与实际信息不符，请确认后重新填写");
        return false;
    }else if(usedAmount > creditAmount || usedAmount > currentCredit){
        bootbox.alert("赊购使用金额不能超出当前可用赊购额度！");
        if(creditAmount > currentCredit){
            $("#amount").html(currentCredit);
        }
        return false;
    }else if(usedAmount != actualAmount){
        bootbox.alert("单独使用赊购金额支付时，赊购使用金额必须等于实收金额！");
        return false;
    }
    window.location = '/ordersPay/creditPay?goodsOrderId='+goodsOrderId+'&usedAmount='+usedAmount;

}
function remitPay(){
      //本次使用赊购金额
    var usedAmount;
    //实收金额
    var actualAmount;
    //可用赊购金额
    var creditAmount;
    if($(".creditAmount").prop('checked')) {
        usedAmount = parseFloat($("#usedAmount").val().trim());
        actualAmount = parseFloat($(".actualAmount").text().trim());
        creditAmount = parseFloat($(".creditAmount").val().trim());
        var currentCredit = parseFloat(getCreditAmount());
        if ($("#usedAmount").val().trim() == "") {
            bootbox.alert("请填写赊购使用金额！");
            return false;
        } else if (isNaN($("#usedAmount").val().trim())) {
            bootbox.alert("本次使用的赊购金额与实际信息不符，请确认后重新填写");
            return false;
        } else if (usedAmount > creditAmount || usedAmount > currentCredit) {
            bootbox.alert("赊购使用金额不能超出当前可用赊购额度！");
            if(creditAmount > currentCredit){
                $("#amount").html(currentCredit);
            }
            return false;
        } else if (usedAmount >= actualAmount) {
            bootbox.alert("赊购-汇款时，赊购使用金额必须小于实收金额！");
            return false;
        }
    }
}
function radio2() {
    var radioValue = $("input[name='radio']:checked").val();
    if (radioValue == '2') {
        $("#remittanceInfo").show();
        $("#checkstand").hide();
        $("#remittance").show();
    }
    if (radioValue == '1') {
        $("#remittanceInfo").hide();
        $("#checkstand").show();
        $("#remittance").hide();
    }

}

function getCreditAmount(){
    var result =0;
    $.ajax({
        url: '/ordersPay/getCreditAmount',
        async:false,
        cache: true,
        dataType : 'json',
        success : function(data) {
            result = data.result;
        }
    });
    return result;
}
/**
 * 用于判断点击支付方式时校验该代理商是否有权限去购买此小型号，并且判断限购
 * */
function checkInformation(data,url) {
    var flag1 = true
    var jsonArr = [];
    for(var i =0 ;i < data.length;i++){
        jsonArr[i] = data[i];
    }
    for(var i =0;i<jsonArr.length;i++){
        subModelId = jsonArr[i].subModelId
        number = jsonArr[i].orderQuantity
        if(orgCanBuyModel(subModelId,url)==false){
            flag1 = false;
            return false;
        }else if(transfinite(subModelId,number,url)==false){
            flag1 = false;
            return false;
        }
    }
    return flag1 ;
}