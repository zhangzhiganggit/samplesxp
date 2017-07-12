/**
 * Created by lv09 on 2016/9/19.
 */
function addToShoppingCart(orderQuantityId,priceId,subModelId,obj){
    flag = true;

    /**
     * add by qiudong 增加代理商是否有权限购买该小型号
     * */
    if(!orgCanBuyModel(subModelId)){
        $(obj).attr("disabled","disabled")
        flag =false;
        return false;
    }
    if(flag==true){
        if(checkSaleStopGoods(priceId)){
            var orderQuantity = $("#"+orderQuantityId).val();
            $.ajax({
                url: '/deviceOrder/addToShoppingCart',
                data : {
                    orderQuantity : orderQuantity,
                    priceId:priceId,
                    subModelId:subModelId
                },
                async:false,
                cache: true,
                success : function() {
                    checkNumber(priceId)
                }
            });
        }else{
            bootbox.alert({
                buttons: {
                    ok: {
                        label: '确定',
                    }
                },
                message: '该商品已停售，加入购物车失败！',
                callback: function() {
                    location.reload();
                },
                title: "",
            });
        }

    }



}

function checkSaleStopGoods(priceId){
    var result =false;
    $.ajax({
        url: '/deviceOrder/checkSaleStopGoods',
        data : {
            priceIds:priceId
        },
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
 * 检查购物车中物品是否存在
 * @param priceId
 * @returns {boolean}
 */
function checkDeleteGoods(priceId){
    var result = false;
    $.ajax({
        url: '/deviceOrder/checkDeleteGoods',
        data : {
            priceIds:priceId
        },
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
 * 检查结算价格信息是否有变化
 * @param priceId
 * @returns {boolean}
 */
function checkPriceChange(){
    var inputItems = $("input[name='priceString']");
    var priceString="";
    $("input[name='priceString']").each(function(i){
        if(i<(inputItems.length-1)){
            priceString+= $(this).val()+',';
        }else if(i==inputItems.length-1){
            priceString+= $(this).val();
        }
    });
    var result = false;
    $.ajax({
        url: '/deviceOrder/checkPriceChange',
        data : {
            priceString:priceString
        },
        async:false,
        cache: true,
        dataType : 'json',
        success : function(data) {
            result = data.result;
        }
    });
    return result;
}
function showCart(){
    $.ajax({
        url: '/deviceOrder/showCart',
        success : function(data) {
            $("#ul").html(data)
        }
    });
}
function checkNumber(priceId) {
    var goodNumber = $("#goodsNumber").text();
    var value = $("#minmumOfAmount_"+priceId).val();
    var a = parseInt(goodNumber)+parseInt(value)
    $("#goodsNumber").text(a)
}

function check(minmumOfAmount,minimumOfPack,priceId) {
    var minimumValue = document.getElementById("minmumOfAmount_"+priceId).value;
    if ((minimumValue - minmumOfAmount) % minimumOfPack != 0 || minimumValue < minmumOfAmount) {
        alert("您输入的数量有误！！！")
        document.getElementById("minmumOfAmount_"+priceId).value=minmumOfAmount;
    }
}
function plus(minmumOfAmount,minimumOfPack,priceId) {
    var minimumValue = document.getElementById("minmumOfAmount_"+priceId).value;
    if ((minimumValue - minmumOfAmount) % minimumOfPack != 0 || minimumValue < minmumOfAmount) {
        alert("您输入的数量有误！！！")
        document.getElementById("minmumOfAmount_"+priceId).value=minmumOfAmount;
    } else {
        document.getElementById("minmumOfAmount_"+priceId).value = parseInt(minimumValue) + parseInt(minimumOfPack);
    }
    $("#minmumOfAmount_"+priceId).change();
}
function fub(minmumOfAmount,minimumOfPack,priceId) {
    var minimumValue = document.getElementById("minmumOfAmount_"+priceId).value;
    if ((minimumValue - minmumOfAmount) % minimumOfPack != 0 || minimumValue < minmumOfAmount) {
        alert("您输入的数量有误！！！")
        document.getElementById("minmumOfAmount_"+priceId).value=minmumOfAmount;
    }
    else if (minimumValue - minimumOfPack >= minmumOfAmount) {
        document.getElementById("minmumOfAmount_"+priceId).value = minimumValue - minimumOfPack;
    }
    $("#minmumOfAmount_"+priceId).change();
}
function deleteFromSmallCart(subModelId,orderQuantity){
    $.ajax({
        url: '/deviceOrder/deleteFromSmallCart',
        data : {
            subModelId:subModelId
        },
        async:false,
        cache: true,
        success : function(data) {
            if(date ="success"){
                var goodNumber = $("#goodsNumber").text();
                var a = parseInt(goodNumber)-parseInt(orderQuantity)
                $("#goodsNumber").text(a)
            }
            $("#ul").html(data)
        }
    });

}
function updateOrderQuantity(priceId,subModelId){
    var orderQuantity=$("#minmumOfAmount_"+priceId).val();
    $.ajax({
        url: '/deviceOrder/updateOrderQuantity',
        data : {
            orderQuantity : orderQuantity,
            priceId:priceId,
            subModelId:subModelId
        },
        async:false,
        cache: true,
        success : function() {
            this.window.reload()
        }
    });
}
function toConfirmOrder() {
    var flag = false;
    var modelflag = true;
    var selectItems = $("input[name='checkItem']:checkbox:checked");
    var priceIdArray = [];
    var submodelId ='';
    selectItems.each(function() {
        priceIdArray.push($(this).val());

        submodelId +=$(this).attr("data-subModelId")+","
        flag = true;
        console.log("+++++++++++++++++")
        modelId = $(this).attr("data-subModelId");
        if(orgCanBuyModel(modelId,1)==false) {
            //$(".btn-pay").eq(0).attr("disabled", "disabled")

            modelflag = false;
            return false;
        }
    });
    //判断支付方式
    if(modelflag ==true){

        if(checkPayWay(submodelId)==false){
            modelflag = false;
            return false;
        }
    }

    if(modelflag ==true){
        if(!flag){
            bootbox.alert("请至少选择一件商品");
        }else{
            var isDelete = checkDeleteGoods(priceIdArray.join(','));
            if(!isDelete){
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: '所选商品已结算或移除购物车，请确认后重新提交！',
                    callback: function() {
                        location.reload();
                    },
                    title: "",
                });
                return;
            }
            var checkResult =checkSaleStopGoods(priceIdArray.join(','));
            if(!checkResult){
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: '所选商品已停售，请重新选择！',
                    callback: function() {
                        location.reload();
                    },
                    title: "",
                });
                return;
            }
            window.location.href='/deviceOrder/show?priceIds='+priceIdArray;
    }

    }
}



function confirmDeviceOrder() {
    var inputItems = $("input[name='priceId']");
    var priceIds="";
    var flag = true
    var submodelId=''
    $("input[name=priceId]").each(function(i){
        submodelId +=$(this).attr("data-modelId")+","
        if(i<(inputItems.length-1)){
            priceIds+= $(this).val()+',';
        }else if(i==inputItems.length-1){
            priceIds+= $(this).val();
        }
        var modelId = $(this).attr("data-modelId")
        var quantity = $(this).attr("data-quantity")
        if(orgCanBuyModel(modelId,'/deviceOrder/index')==false) {
            $(".btn-submit").eq(0).attr("disabled","disabled");
            flag = false;
            return false;
        }else if(transfinite(modelId,quantity,'/deviceOrder/index')==false){
            flag =false
            return false;
        }
    });
    //判断支付方式
    if(flag ==true){
        if(checkPayWay(submodelId)==false){
            flag = false;
            return false;
        }
    }
    if(flag == true){
        var addressId = $("input[name='addressId']:checked").val();
        if(addressId==undefined){
            bootbox.alert("收货地址不能为空");
            return;
        }
        if(priceIds == ""){
            bootbox.alert("无可结算物品，请重新选购！");
            return;
        }
        if($("#remarkText").val().length>200){
            bootbox.alert("备注最多可输入200个汉字");
            return;
        }
        var isDelete = checkDeleteGoods(priceIds);
        if(!isDelete){
            bootbox.alert({
                buttons: {
                    ok: {
                        label: '确定',
                    }
                },
                message: '所选商品已结算或移除购物车，请确认后重新提交！',
                callback: function() {
                    location.reload();
                },
                title: "",
            });
            return;
        }
        var checkResult =checkSaleStopGoods(priceIds);
        if(!checkResult){
            bootbox.alert({
                buttons: {
                    ok: {
                        label: '确定',
                    }
                },
                message: '所选商品停售或有价格变化，请确认！',
                callback: function() {
                    location.reload();
                },
                title: "",
            });
            return;
        }
        var checkChangeResult =checkPriceChange();
        if(!checkChangeResult){
            bootbox.confirm({
                buttons: {
                    confirm: {
                        label: '确认',
                        className: 'btn-submit'
                    },
                    cancel: {
                        label: '取消',
                        className: 'btn-return'
                    }
                },
                message: '购买的物品价格方案（价格、优惠、起定量等）发生变化，请确认是否按变更后的价格方案提交？',
                callback: function(result) {
                    if(result){
                        $("#priceIds").val(priceIds);
                        $("#remark").val($("#remarkText").val());
                        document.getElementById("confirmForm").submit();
                    }else{
                        location.reload();
                        return;
                    }
                },
            });
            return;
        }
        $("#priceIds").val(priceIds);
        $("#remark").val($("#remarkText").val());
        document.getElementById("confirmForm").submit();
    }

}

function goToCart() {
    window.location.href='/deviceOrder/cart';
}
function orgCanBuyModel(subModelId,url) {
    flag = true
    $.ajax({
        url: '/deviceOrder/orgCanBuyModel',
        data : {
            subModelId:subModelId
        },
        async:false,
        cache: true,
        dataType : 'json',
        success : function(data) {
            result = data.result;
            if(result==false){
                var subModelName = data.subModelName
                message = subModelName+"只限定部分代理商购买"
                okAlert(message,url)
                flag =  false;

            }
        }
    });
    return flag;
}

function transfinite(subModelId,number,url) {
    flag = true
    $.ajax({
        url: '/deviceOrder/transfinite',
        data : {
            subModelId:subModelId,
            number:number
        },
        async:false,
        cache: true,
        dataType : 'json',
        success : function(data) {
            result = data.result;
            if(result==false){
                subModelName =  data.subModelName
                if(url != null && url !=''){

                    okAlert(subModelName+"机具已超出可购买额度，请联系相关人员",url)
                }else{

                    bootbox.alert(subModelName+"机具已超出可购买额度，请联系相关人员")
                }
                flag =  false;
                return false
            }
        }
    });
    return flag;
}

/**
 * 判断支付方式
 * @param subModelId
 */
function checkPayWay(subModelId) {
    flag = true
    $.ajax({
        url: '/deviceOrder/checkPayWay',
        data : {
            subModelId:subModelId
        },
        async:false,
        cache: true,
        dataType : 'json',
        success : function(data) {
            result = data.result;
            information = data.information
            if(result==false){
                bootbox.alert(information)
                flag =  false;

            }else{
                if(data.payWay==0){
                    $("#remintpay").val("1")
                }else if(data.payWay==1){
                    $("#onlinepay").val("1")
                }else{
                    $("#onlinepay").val("1")
                    $("#remintpay").val("1")
                }
            }

        }
    });
    return flag;

}

function okAlert(message,url) {
    bootbox.alert({
        buttons: {
            ok: {
                label: '确定',
            }
        },
        message: message,
        callback: function() {
            if(url!=null&&url!=''){
                if(url==1){
                    location.reload();
                }else{

                    window.location.href=url;
                }
            }

        },
        title: "",
    });

}
