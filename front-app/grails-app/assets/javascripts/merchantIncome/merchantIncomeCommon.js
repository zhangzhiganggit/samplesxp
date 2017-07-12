//清空结算信息
function clearSettleInfo(startWord){
    var settleInfoInputIds = [startWord+'AccountName',startWord+'SettleAccountNo',startWord+'CnapsCode',startWord+'OpenbankInfomation','accountLegalPersonName'];
    for(var i=0;i<settleInfoInputIds.length;i++){
        $('#'+settleInfoInputIds[i]).val("");
        if(settleInfoInputIds[i].indexOf("OpenbankInfomation")>0){
            setSelect2Value(startWord+'OpenbankInfomation',"","");//清空公开户行信息
        }
        $('#'+settleInfoInputIds[i]).prop('disabled',false);
    }
}

/**
 * 随意通结算、非工作日、即日付、其他消费选中设置
 */
function setFunctionCheckBoxValue() {
    setCheckBoxValue("ifSuiYiTongSettle");
    setCheckBoxValue("ifNonworkdaySettle");
    setCheckBoxValue("ifIntradaySettle");
    setCheckBoxValue("ifOtherConsumption");
    setCheckBoxValue("allowCreditCard");
    setCheckBoxValue("ifNextSettle");
}
function setCheckBoxValue(id) {
    if($("#"+id).prop("checked")||$("#"+id).val()=='on'){
        $("#"+id).val("on");
    }else{
        $("#"+id).val("0");
    }
}

function checkAge(idNumber){
    $.ajax({
        url: '/totalShop/checkAge',
        data: {idNumber: idNumber},
        type: "POST",
        dataType:"json",
        success: function (json) {
            if (json.resultFlag == true) {
                console.log(json.resultMessage)
            } else {
                OKDialog("结算人年龄不符合要求，请重新录入");
            }
        },
        error: function (xhr, status) {
            console.log("--------------结算人年龄限制校验,异常.--------------------")
        }
    });
}

function checkAgeWithResult(idNumber){
    var flag= false;
    $.ajax({
        url: '/totalShop/checkAge',
        data: {idNumber: idNumber},
        type: "POST",
        dataType: "json",
        async: false,
        success: function (json) {
            if (json.resultFlag == true) {
                console.log(json.resultMessage)
                flag = true;
            }
        },
        error: function (xhr, status) {
            console.log("--------------结算人年龄限制校验,异常.--------------------")
        }
    });
    return flag;
}

//根据商户等级调整法人姓名和法人证件号的校验规则
function mecNormalLevelValidate(){
    $("#mecNormalLevel").on("change",function(){
        var mecNormalLevel = $("#mecNormalLevel").val();
        if(mecNormalLevel == '10'){//一类
            // $("#legalPersonName_red").show();
            $("#legalPersonCode_red").show();
            $("#legalPersonidPositivePic_red").show();
            $("#legalPersonidPositivePic_red").parent().css("color","red");
            $("#legalPersonidOppositePic_red").show();
            $("#legalPersonidOppositePic_red").parent().css("color","red");
            // $("#legalPersonName").rules("add",{required: true,byteMaxLength: 30 ,maxlength:30,messages:{required: "法人姓名-不能为空.",byteMaxLength:"最多输入30个字符."}});
            $("#legalPersonCode").rules("add",{required: true,idcard:true,messages:{required:"法人证件号-不能为空."}});
            if($("#legalPersonLicenseType").length > 0) {
                $("#legalPersonidPositivePic_red").show();
                $("#legalPersonidPositivePic_red").parent().css("color","red");
                $("#legalPersonidOppositePic_red").show();
                $("#legalPersonidOppositePic_red").parent().css("color","red");
                $("#legalPersonLicenseType_red").show();
                $("#legalPersonLicenseType").rules("add",{required: true,messages:{required:"法人证件类型-不能为空."}});
            }
        }else{
            // $("#legalPersonName").next().hide();
            $("#legalPersonCode").next().hide();
            // $("#legalPersonName_red").hide();
            $("#legalPersonCode_red").hide();
            $("#legalPersonidPositivePic_red").hide();
            $("#legalPersonidPositivePic_red").parent().removeAttr("style");
            $("#legalPersonidOppositePic_red").hide();
            $("#legalPersonidOppositePic_red").parent().removeAttr("style");
            // $("#legalPersonName").rules("remove");
            $("#legalPersonCode").rules("remove");
            $("#legalPersonCode").rules("add",{idcard:true,messages:{idcard:"请输入正确的15或18位身份证号"}});
            if($("#legalPersonLicenseType").length > 0) {
                $("#legalPersonLicenseType").next().hide();
                $("#legalPersonLicenseType_red").hide();
                $("#legalPersonidPositivePic_red").hide();
                $("#legalPersonidPositivePic_red").parent().removeAttr("style");
                $("#legalPersonidOppositePic_red").hide();
                $("#legalPersonidOppositePic_red").parent().removeAttr("style");
                $("#legalPersonLicenseType").rules("remove");
            }
        }
    })
}

//当商户等级为二类的时候:当商户填写“对公结算账户名”时，校验“对公结算账户名”是否等于“注册名称”，如相等，则允许下一步操作，如不相等，则提示“对公结算账户名与“注册名称”不一致！”
// function toPublicAccountNameValidate(){
//     $("#toPublicAccountName").on("blur",function(){
//         //获取商户等级
//         var mecNormalLevel = $("#mecNormalLevel").val();
//         if(mecNormalLevel == "20") {//二类
//             var registName = $("#registName").val();
//             var toPublicAccountName = $("#toPublicAccountName").val();
//             if($.trim(registName) != $.trim(toPublicAccountName)){
//                 OKDialog("对公结算账户名与“注册名称”不一致！");
//             }
//         }
//     });
// }

//区分一类中的授权和非授权
//一类商户：填写注册登记号和法人身份证，法人身份证和结算人身份证必须相等，对私结算户名为法人或对公结算户名为注册名称，且审核通过的商户
//二类商户：填写注册登记号和法人身份证，法人身份证和结算人身份证不允许相等，且审核通过的商户
function judgeLevelOne(mecNormalLevel) {
    if(mecNormalLevel == '10'){//一类
        //获取法人身份证
        var legalPersonCode = $("#legalPersonCode").val();
        //获取结算人省份证
        var settleManidNumber = $("#settleManidNumber").val();

        if(legalPersonCode != settleManidNumber){//法人身份证和结算人身份证必须相等
            mecNormalLevel = '11';
        }
    }
    return mecNormalLevel;
}
//重复次数校验
function judgeLevelForValidate(mecNormalLevel) {
    if(mecNormalLevel == '10'){//一类
        //获取法人身份证
        var legalPersonCode = $("#legalPersonCode").val();
        //获取结算人省份证
        var settleManidNumber = $("#settleManidNumber").val();
        if((legalPersonCode == null || legalPersonCode == '' || legalPersonCode == undefined) || (settleManidNumber == null || settleManidNumber == '' || settleManidNumber == undefined)){
            mecNormalLevel = '';
        }else{
            if(legalPersonCode != settleManidNumber){//法人身份证和结算人身份证必须相等
                mecNormalLevel = '11';
            }
        }
    }
    return mecNormalLevel;
}

//add by wangyu 进件pos秒到手持身份证判断
function validateIfPosMd(){
    $("#ifPosMd").click(function(){
        var isChecked = $(this).is(':checked');
        if(isChecked){
            $("#handIdcardPic_red").show();
            $("#handIdcardPic_red").parent().css("color","red");
        }else{
            $("#handIdcardPic_red").hide();
            $("#handIdcardPic_red").parent().removeAttr("style");
        }
    })
}


// 拼接posMdStr字符串 在提交表单和保存草稿时使用
function porcPosMdStr() {
    var selectedGoods3 = $("#selectedGoods3").val();
    if(null != selectedGoods3 && "" != selectedGoods3 && selectedGoods3 != undefined){
        var rate = $("#mDRate").val();//0
        //获取posMd费率信息
        var unchangeFree = $.trim($("#unchangeFree").val()) == "" ? 0 : $("#unchangeFree").val();//1
        var monthFree = $.trim($("#monthFree").val()) == "" ? 0 : $("#monthFree").val();//2
        var foreignCard = $("#foreignCard").val();//3
        if(selectedGoods3 == "GOODS-INF-MD-PACK-BL-B"){
            $("#posMdStr").val(rate+','+unchangeFree+',0,'+foreignCard+','+selectedGoods3);
        } else if(selectedGoods3 == "GOODS-INF-MD-PACK-MON-B"){
            $("#posMdStr").val(rate+',0,'+monthFree+','+foreignCard+','+selectedGoods3);
        } else {
            $("#posMdStr").val('');
        }
    }
}

//判断pos秒到费率是否填写完整
function validatePosMd() {
    var isChecked = $("#ifPosMd").is(':checked');
    if (isChecked) {
        var selectedGoods3 = $("#selectedGoods3").val();
        var mDRate = $("#mDRate").val();
        if (selectedGoods3 == "GOODS-INF-MD-PACK-BL-B") {
            if($.trim(mDRate) == "" || mDRate == null || mDRate == undefined){
                return false;
            }
            var unchangeFree = $("#unchangeFree").val();
            if($("#valierr").length > 0){
                var mDRateText = $("#mDRate").next().text();
                var unchangeFreeText = $("#unchangeFree").next().text();
                if($.trim(mDRateText) != "" || $.trim(unchangeFreeText) != ""){
                    return false;
                }
            }
            return true;
        } else if (selectedGoods3 == "GOODS-INF-MD-PACK-MON-B") {
            if($.trim(mDRate) == "" || mDRate == null || mDRate == undefined){
                return false;
            }
            var monthFree = $("#monthFree").val();
            if($("#valierr").length > 0){
                var mDRateText = $("#mDRate").next().text();
                var monthFreeText = $("#monthFree").next().text();
                if($.trim(mDRateText) != "" || $.trim(monthFreeText) != ""){
                    return false;
                }
            }
            return true;
        }
        return false;
    }
    return true;
}
