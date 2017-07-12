/**
 * Created by wangyu on 16/9/22.
 */

$(function () {
    var investmentAmountNow = $("input[name='investmentAmountNow']");
    var businessScale = $("#businessScale");
    var investmentProportion = $("#investmentProportion");
    var investmentAmount = $("input[name='investmentAmount']");
    var yield = $("input[name='yield']");
    var increaseAmount = $("input[name='increaseAmount']");
    var decreaseAmount = $("input[name='decreaseAmount']");
    $("#businessScale").change(function(){
        // console.log("=========BEGIN========");
        var businessScaleValue = businessScale.val();
        var investmentProportionValue = investmentProportion.val();
        var investmentAmountValue = investmentAmount.val();
        var investmentAmountNowValue = investmentAmountNow.val();
        // console.log("修改后业务规模："+ businessScaleValue +"修改后出资比例："+ investmentProportionValue + "修改后需出资金额:"+investmentAmountValue+"当前需出资金额："+investmentAmountNowValue);
        if(businessScaleValue != "" && investmentProportionValue != ""){
            investmentAmountValue = businessScaleValue * investmentProportionValue;
            // console.log("转换后需出资金额："+investmentAmountValue);
            investmentAmountNowValue = investmentAmountNowValue.replace(/,/g,'');
            // console.log("转换后当前需出资金额："+investmentAmountNowValue);
            investmentAmount.val(investmentAmountValue);
            $("input[name='yield']").val((investmentProportionValue * 0.9 + (1-investmentProportionValue)*0.3).toFixed(2)*100+"%");
            // console.log("转换后收益比例："+yield.val((investmentProportionValue * 0.9 + (1-investmentProportionValue)*0.3).toFixed(2)*100+"%"));
            if(investmentAmountValue-investmentAmountNowValue > 0){//需要增资
                console.log("增资");
                increaseAmount.val(investmentAmountValue-investmentAmountNowValue);
                // console.log("需增资："+investmentAmountValue-investmentAmountNowValue);
                decreaseAmount.val(0);
            }else if(investmentAmountValue-investmentAmountNowValue < 0){
                console.log("减资");
                decreaseAmount.val(investmentAmountNowValue - investmentAmountValue);
                // console.log("需减资："+investmentAmountNowValue - investmentAmountValue);
                increaseAmount.val(0)
            }else{
                console.log("不增不减");
                decreaseAmount.val(0);
                increaseAmount.val(0);
            }
        }
        console.log("=======END=======");
        return false;
    });

    $("#investmentProportion").change(function(){
        console.log("=========BEGIN========");
        var businessScaleValue = businessScale.val();
        var investmentProportionValue = investmentProportion.val();
        var investmentAmountValue = investmentAmount.val();
        var investmentAmountNowValue = investmentAmountNow.val();
        // console.log("修改后业务规模："+ businessScaleValue +"修改后出资比例："+ investmentProportionValue + "修改后需出资金额:"+investmentAmountValue+"当前需出资金额："+investmentAmountNowValue);
        if(businessScaleValue != "" && investmentProportionValue != ""){
            investmentAmountValue = businessScaleValue * investmentProportionValue;
            // console.log("转换后需出资金额："+investmentAmountValue);
            investmentAmountNowValue = investmentAmountNowValue.replace(/,/g,'');
            // console.log("转换后当前需出资金额："+investmentAmountNowValue);
            investmentAmount.val(investmentAmountValue);
            $("input[name='yield']").val((investmentProportionValue * 0.9 + (1-investmentProportionValue)*0.3).toFixed(2)*100+"%");
            // console.log("转换后收益比例："+yield.val((investmentProportionValue * 0.9 + (1-investmentProportionValue)*0.3).toFixed(2)*100+"%"));
            // console.log((investmentProportionValue * 0.9 + (1-investmentProportionValue)*0.3).toFixed(2)*100+"%");
            if(investmentAmountValue-investmentAmountNowValue > 0){//需要增资
                console.log("增资");
                increaseAmount.val(investmentAmountValue-investmentAmountNowValue);
                // console.log("需增资："+investmentAmountValue-investmentAmountNowValue);
                decreaseAmount.val(0);
            }else if(investmentAmountValue-investmentAmountNowValue < 0){
                console.log("减资");
                decreaseAmount.val(investmentAmountNowValue - investmentAmountValue);
                // console.log("需减资："+investmentAmountNowValue - investmentAmountValue);
                increaseAmount.val(0);
            }else{
                console.log("不增不减");
                decreaseAmount.val(0);
                increaseAmount.val(0);
            }
        }
        console.log("=======END=======");
        return false;
    });


    $("#suiYiTongAgentReset").click(function(){
        $("#businessScale").val("");
        $("#investmentProportion").val("");
    })

    $("#suiYiTongAgentSubMit").click(function(){
        var businessScaleNow = $("#businessScaleNow").val().replace(/[^0-9]/ig,"");
        var businessScale = $("#businessScale").val();
        var investmentProportionNow = $("#investmentProportionNow").val().replace("%","")/100;
        var investmentProportion = $("#investmentProportion").val();
        console.log(businessScale);
        console.log(businessScaleNow);
        console.log(investmentProportionNow);
        console.log(investmentProportion);
        if(businessScaleNow == businessScale && investmentProportion == investmentProportionNow){
            console.log("=== same as ==");
            bootbox.alert("业务未做修改，不允许提交！");
            return false;
        }
        if($("#businessScale").val() == null || $("#businessScale").val() == ''){
            bootbox.alert("请选择业务规模！");
            return false;
        }
        if($("#investmentProportion").val() == null || $("#investmentProportion").val() == ''){
            bootbox.alert("请选择出资比例！");
            return false;
        }
    })

});