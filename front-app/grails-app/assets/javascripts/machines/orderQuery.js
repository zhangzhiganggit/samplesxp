/**
 * Created by lv09 on 2016/9/19.
 */
function cancelOrder(goodsOrderId) {
    bootbox.setLocale("zh_CN");
    bootbox.confirm("真的确定取消该订单么?", function (result) {
        if(result){
            $.ajax({
                url: '/ordersQuery/cancelOrder',
                data : {
                    goodsOrderId : goodsOrderId
                },
                async:false,
                cache: true,
                success : function() {
                    location.reload();
                }
            });
        }
    })
}
function resetDate() {
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
    $("input[name='q_orderDate_from']").val(currentdate);
    $("input[name='q_orderDate_to']").val(currentdate);

}
function checkDiscount(orderId1) {
    debugger
    var flag = true
    var orderId = orderId1
    $.ajax({
        url: '/ordersQuery/orderDetaile',
        data:{"goodsOrderId":orderId},
        async:false,
        success : function(data) {
            console.log(data)
            flag = checkInformation(data)
        }
    });
    return flag;
}
/**
 * 用于判断点击支付方式时校验该代理商是否有权限去购买此小型号，并且判断限购
 * */
function checkInformation(data) {
    var flag1 = true
    var jsonArr = [];
    var submodelId=''
    for(var i =0 ;i < data.length;i++){
        jsonArr[i] = data[i];
    }
    for(var i =0;i<jsonArr.length;i++){
        subModelId = jsonArr[i].subModelId
        number = jsonArr[i].orderQuantity
        submodelId +=subModelId+","

    }
    if(orgCanBuyModel(subModelId)==false){
        flag1 = false;
        return false;
    }else if(transfinite(subModelId,number)==false){
        flag1 = false;
        return false;
    }else if(checkPayWay(submodelId)==false){
        flag1 = false;
        return false;
    }


    return flag1 ;
}

/**
 * 订单管理去支付
 */
$("#detailViewToPay").click(function(){
    var orderId1 = $("#goodsOrderId").val();
    return checkDiscount(orderId1);
})