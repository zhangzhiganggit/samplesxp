/**
 * Created by wangyu on 2017/4/5.
 */
//验证必填图片
function checkImage(handIdcardNum,idcardPositiveNum,idcardOppositeNum){

    if(handIdcardNum == 1){
        var handIdcardPic= $("#handIdcardPicBase64").children('img').attr("src");
        if(!handIdcardPic){
            OKDialog("请上传手持身份证照片!");
            return false;
        }
    }
    if(idcardPositiveNum == 1){
        var idCardPositivePic= $("#idCardPositiveBase64").children('img').attr("src");
        if(!idCardPositivePic){
            OKDialog("请上传身份证正面!");

            return false;
        }
    }

    if(idcardOppositeNum == 1) {
        var idcardOppositePic = $("#idcardOppositeBase64").children('img').attr("src");
        if (!idcardOppositePic) {
            OKDialog("请上传身份证反面!");
            return false;
        }

    }
    return true;
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

    //add by wangyu 秒到-计费接口调用  闪电 等级 打包
    function getPosMdRate() {
        $.ajax({
            url: '/secondsReceived/getPosMdRate',
            async: true,
            cache: true,
            type: "POST",
            success: function (json) {
                console.log("*************计费调用成功*****************")
                //console.log(json)
                var resultJson = json.msg
                resultJson = eval('(' + resultJson + ')');
                if (resultJson.resCode == 'CFS0000') {
                    if (resultJson.data != undefined) {
                        resultJson.data.justView = false;
                        resultJson.data.disabled = false;
                        resultJson.data.preset = false;
                        resultJson.data.updateFlag = false;
                        resultJson.data.effDt = '';
                        var template = $('#template').val();
                        var innerHtml = new EJS({
                            //text : template,
                            url: '/assets/products/ejs/secondsReceived.txt'
                        }).render(resultJson.data);
                        $('#newPosMdInfoDiv').html(innerHtml);
                    }
                } else {
                    OKDialog(resultJson.resMsg);
                }

            },
            error: function (xhr, status) {
                console.log("--------------调用出错!!!--------------------")
                console.log(xhr);
                console.log(status)
            }
        });
    }

function checkfile(sender,num,srcImg) {
    var validExts = new Array(".jpg", ".jpeg",".png",".gif",".JPG",".JPEG",".PNG",".GIF");
    var fileExt = sender.value;
    fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
    if(fileExt == ''){
        return true;
    }
    if (validExts.indexOf(fileExt) < 0) {
        bootbox.alert("文件格式错误！");
        if(num == '1'){
            document.getElementById("firstImg").click();
        }
        if(num == '2'){
            document.getElementById("secondImg").click();
        }
        if(num == '3'){
            document.getElementById("thirdImg").click();
        }
        return false;
    }
    var flag = validateImg(sender.id,srcImg);
    if(flag == false && num == '1'){
        document.getElementById("firstImg").click();
        return false;
    }
    if(flag == false && num == '2'){
        document.getElementById("secondImg").click();
        return false;
    }
    if(flag == false && num == '3'){
        document.getElementById("thirdImg").click();
        return false;
    }
    if(flag == '-1'){
        //bootbox.alert('您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过300k，建议使用IE、火狐、谷歌浏览器。')
        return true;
    }
    if(flag == true){
        return true
    }
}

function validateImg(fileUpLoadId,imgSrcId){
    var maxsize = 300*1024;//300kb
    var errMsg = "请上传300k以内的文件";
    var tipMsg = "您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过300k，建议使用IE、火狐、谷歌浏览器。";
    var  browserCfg = {};
    var ua = window.navigator.userAgent;
    if (ua.indexOf("MSIE")>=1){
        browserCfg.ie = true;
    }
    var obj_file = document.getElementById(fileUpLoadId);
    var filesize = 0;
    filesize = obj_file.files[0].size;
    if(browserCfg.ie){
        var obj_img = document.getElementById(imgSrcId);
        obj_img.dynsrc=obj_file.value;
        filesize = obj_img.fileSize;
    }
    if(filesize==-1){
        bootbox.alert(tipMsg);
        return '-1';
    }else if(filesize>maxsize){
        bootbox.alert(errMsg);
        return false;
    }else{
        return true;
    }
}

//[提交]form前的验证
function checkForm() {
    console.log("checkForm 校验开始");
    //-----------pos秒到费率信息验证-----------
    if(!validatePosMd()){
        OKDialog("秒到费率信息填写不完整!");
        return false
    }
    $('#newPosMdInfoDiv').hide();
    console.log("form校验结果"+$('#scaffold-search-secondsReceived').valid());
    //JQueryValidation校验
    if (!$('#scaffold-search-secondsReceived').valid()) {
        $('#newPosMdInfoDiv').show();
        return false;
    }
    $('#newPosMdInfoDiv').show();
    return true;
}

//判断pos秒到费率是否填写完整
function validatePosMd() {
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
}

/**
 * alert提示信息封装
 * @param msg 要提示的信息内容
 */
function OKDialog(msg) {
    bootbox.dialog({
        message: msg,
        closeButton: true,
        title: "提示",
        buttons: {
            success: {
                label: "确定",
                className: "blue"
            }
        }
    });
}

//add by zhouning 关闭秒到费率
function closeMaintenance(){
    var merchantCode = $("#merchantCode").text();
    var receiptsName =  $("#receiptsName").text();
    if(repeatCommit){
        return false
    }
    repeatCommit = true;
    $.ajax({
        url: '/secondsReceived/closePosMd',
        cache: false,
        type: "POST",
        dataType:"JSON",
        data:{
            merchantCode:merchantCode,
            receiptsName:receiptsName
        },
        success:function(data){
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
                    title: "提示",
                });
        }
    });
}


//add by zhouning 秒到-计费接口调用  闪电 等级 打包
function getCurrentPosMdRate(insideMerchantCode) {
    $.ajax({
        url: '/secondsReceived/getCurrentPosMdRate',
        async: true,
        cache: true,
        type: "POST",
        data:{
            insideMerchantCode: insideMerchantCode
        },
        success: function (json) {
            console.log("*************计费调用成功*****************")
            //console.log(json)
            var resultJson = json.msg
            resultJson = eval('(' + resultJson + ')');
            if (resultJson.resCode == 'CFS0000') {
                if (resultJson.data != undefined) {
                    resultJson.data.justView = false;
                    resultJson.data.disabled = true;
                    resultJson.data.preset = false;
                    resultJson.data.updateFlag = true;
                    resultJson.data.effDt = '';
                    var innerHtml = new EJS({
                        //text : template,
                        url: '/assets/products/ejs/secondsReceived.txt'
                    }).render(resultJson.data);
                    $('#newPosMdInfoDiv').html(innerHtml);
                }
            } else {
                OKDialog(resultJson.resMsg);
            }

        },
        error: function (xhr, status) {
            console.log("--------------调用出错!!!--------------------")
            console.log(xhr);
            console.log(status)
        }
    });
}

var repeatCommit = false;
//add by zhouning 修改费率调用
function updateRate(){

    //拼接posMdStr字符串
    porcPosMdStr();
    var selectedGoods3 = $("#selectedGoods3").val();
    if(selectedGoods3 == '' || selectedGoods3 == null || selectedGoods3 == undefined){
        OKDialog("请选择秒到产品!");
        return false;
    }
    console.log("validatePosMd 校验开始");
    //-----------pos秒到费率信息验证-----------
    if(!validatePosMd()){
        OKDialog("秒到费率信息填写不完整!");
        return false
    }
    var insideMerchantCode = $("#insideMerchantCode").val();
    var posMdStr = $("#posMdStr").val();
    if(repeatCommit){
        return false
    }
    repeatCommit = true;
    $.ajax({
        url: '/secondsReceived/updateRate',
        cache: false,
        type: "POST",
        dataType:"JSON",
        data:{
            insideMerchantCode:insideMerchantCode,
            posMdStr:posMdStr
        },
        success:function(data){
            //OKDialog(data.msg);
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
                title: "提示",
            });
        }
    });
}

$('#pos_rate_open_modal').on('shown.bs.modal', function (e) {
    console.log('set time out ');
    setTimeout(function(){
    var handIdcardNum = $("#handIdcardNum").val();
    var idcardPositiveNum = $("#idcardPositiveNum").val();
    var idcardOppositeNum = $("#idcardOppositeNum").val();
    if(handIdcardNum == 1){
        $("#handIdTitle").css("color","red");
    }
    if(idcardPositiveNum == 1){
        $("#cardPositiveTitle").css("color","red");
    }
    if(idcardOppositeNum == 1){
        $("#cardOppositeTitle").css("color","red");
    }
    //getPosMdRate();

        console.log('get pos md rate');
        getPosMdRate();
    },2000);


});


$('#pos_rate_update_modal').on('shown.bs.modal', function () {
    var insideMerchantCode = $("#insideMerchantCode").val();
    getCurrentPosMdRate(insideMerchantCode);
});
function closebut(){
    $("#commitButton").attr("disabled",true);
    //$("#closebut").disabled=true;
}