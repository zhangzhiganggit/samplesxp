/**
 * Created by hss on 2016/9/27.
 */
//厂商简称change
$("#q_factShortName").on('change',function () {
    var goodsNameCode=$('#q_goodsName').val();
    var factShortNameCode=$('#q_factShortName').val();
    $('#hiddenFactShortNameCode').val(factShortNameCode);
    getModName(goodsNameCode,factShortNameCode)
});
//型号change
$("#q_model").on('change',function () {
    var model=$('#q_model').val();
    $('#hiddenModelCode').val(model);
});

//获取物品名称
function getGoodsName(q_goodsType){
    $.ajax({
        url: '/inventoryManagement/getGoodsName',
        data:{
            goodsType:q_goodsType
        }
    }).done(function(data) {
        if (data != "") {
            $('#q_goodsName').empty();
            var optionList='<option value="" selected="selected" >--请选择--</option>';
            for (var i = 0; i < data.length; i++) {
                optionList += "<option  value='" + data[i].goodsNameCode + "'>" + data[i].goodsName + "</option>";

            }
            $("#q_goodsName").append(optionList);
            $("#q_goodsName").val($("#hiddenGoodsNameCode").val());
        }
    });
};
//获取厂商简称
function getFactShortName(goodsNameCode){
    $.ajax({
        url: '/inventoryManagement/getFactShortName',
        data:{
            goodsNameCode:goodsNameCode
        }
    }).done(function(data){
        if (data != "") {
            $('#q_factShortName').empty();
            var optionList='<option value="" selected="selected" >--请选择--</option>';
            for (var i = 0; i < data.length; i++) {
                optionList += "<option  value='" + data[i].factShortNameCode + "'>" + data[i].factShortName + "</option>";
            }
            $("#q_factShortName").append(optionList);
            $("#q_factShortName").val($("#hiddenFactShortNameCode").val());
        }
    });
}
//获取型号名称
function getModName(goodsNameCode,factShortNameCode){
    $.ajax({
        url: '/inventoryManagement/getModName',
        data:{
            goodsNameCode:goodsNameCode,
            factShortNameCode:factShortNameCode
        }
    }).done(function(data) {
        if (data != "") {
            $("#q_model").empty();
            var optionList='<option value="" selected="selected" >--请选择--</option>';
            for (var i = 0; i < data.length; i++) {
                optionList += "<option  value='" + data[i].modelCode + "'>" + data[i].model + "</option>";
            }
            $("#q_model").append(optionList);
            $("#q_model").val($("#hiddenModelCode").val());
        }
    });
}
function checkCallBack() {
    if ($("#hiddenGoodsNameCode").val() != "" && $("#hiddenGoodsNameCode").val() != null) {
        //物品名称
        getFactShortName($("#hiddenGoodsNameCode").val());

        if ($("#hiddenFactShortNameCode").val() != "" && $("#hiddenFactShortNameCode").val() != null) {
            getModName($("#hiddenGoodsNameCode").val(), $("#hiddenFactShortNameCode").val());
            if ($("#hiddenModelCode").val() != "" && $("#hiddenModelCode").val() != null) {
                $("#q_model").val($("#hiddenModelCode").val());
            }
        }
    }
}
//==================划拨相关校验================================
function transfer(){
    //获取机构或者用户
    var user=$("input[name='optionsRadios']").val();
    //获取划拨目标
    var toOrgOrUser=$("#q_transferAim").val();
    if(''==toOrgOrUser){
        bootbox.alert("请选择机构或者业务员后在划拨!");
        //$(".btn btn-transferbtn btn-transfer").attr('disabled',false);
        return;
    }
}
function transferButton() {
    var dataArray = [];
    $(":checkbox:checked").each(function(){
        var eqnum = $(this).parents(".text-nowrap").index();
        var parent=$(this).parents(".text-nowrap");
        if(checkVal($(this).val())!=""){
            var modId=parent.find(".modId").eq(eqnum).text();
            var factId=parent.find(".factId").eq(eqnum).text();
            var goodsId=parent.find(".goodsId").eq(eqnum).text();
            dataArray.push(new trObject($(this).val(),modId, factId,"",goodsId));
        }
    });

    if(dataArray.length == 0){
        bootbox.alert("请选择要划拨的机具!");
        //$(".saveBtn").attr('disabled',false);
        return false;
    }
    var num=dataArray.length;
    var transferData = JSON.stringify(dataArray);
    //用户提交前检查
    //获取机构或者用户
    var user=$("input[name='optionsRadios']:checked").val();
    //获取划拨目标
    var toOrgOrUser="";
    var toOrgOrUserName="";
    if(user=="org"){
        toOrgOrUser=$("#transferOrgInputId").val();
        toOrgOrUserName=$("#transferOrgInput").val();
        if(toOrgOrUserName==undefined){
            toOrgOrUserName="本级机构";
        }
    }if(user=="emp"){
        toOrgOrUser=$("#q_transferAims").val();
        toOrgOrUserName=$("#q_transferAims option:selected").text();
    }
    if (toOrgOrUser ==""||toOrgOrUserName=="") {
        bootbox.alert("请选择划拨目标")
        return;
    }
    return   ajaxCreatOrder(num,transferData,toOrgOrUser,toOrgOrUserName);
}

//划拨按钮
$("#transferButton").on('click',function () {
    return transferButton();

});

//参数合法性校验
function checkVal(val) {
    if (val == undefined || val == null || val == '' || val == ""||val=='on') {
        return "";
    } else {
        return val;
    }
}
function ajaxCreatOrder(num, transferData, toOrgOrUser,toOrgOrUserName) {
    var radioValue;
    $(":radio:checked").each(function(){
        radioValue=$(this).val();
    });

    //此情况为业务员划拨到本机构
    if (undefined==toOrgOrUser||toOrgOrUser =='') {
        toOrgOrUser = "empToOrg";
    }
    var returnVal=false;
    // var returnVal = window.confirm("确认划拨" + num + "台设备到" + toOrgOrUser + "?");
    bootbox.dialog({
        message: "确认划拨"+num+"台设备到"+toOrgOrUserName+"?",
        title: '确认是否划拨',
        buttons: {
            success: {
                label: '确认',
                className: "green",
                callback: function () {
                    returnVal=true;
                    if (returnVal) {
                        $.ajax({
                            url: '/inventoryManagement/edit',
                            data: {
                                transferData: transferData,
                                toOrgOrUser: toOrgOrUser,
                                toOrgOrUserName:toOrgOrUserName,
                                radioValue:radioValue
                            },
                            type: 'POST'
                        }).done(function (data) {
                            //console.info(data);
                            var message='';
                            if ('-1'!= data) {
                                message="划拨成功！";
                            } else {
                                message="划拨失败,请联系管理员!";
                            }
                            bootbox.dialog({
                                message: "提示信息："+message,
                                //title: '确认是否划拨',
                                id:"divDialog",
                                onEscape: function() {
                                    $("#closed").on('click',function () {
                                        $("#acTransferForm").submit();
                                    }).click();
                                },
                                buttons: {
                                    success: {
                                        label: '库存管理',
                                        className: "green",
                                        callback: function () {
                                            $("#closed").on('click',function () {
                                                $("div.scaffold-search form").submit();
                                            }).click();
                                        }
                                    },
                                    danger: {
                                        label: "继续划拨",
                                        className: "green",
                                        callback: function() {
                                            $("#closed").on('click',function () {
                                                $("#acTransferForm").submit();
                                            }).click();
                                        }
                                    }
                                }
                            });
                        });

                    }else{
                        return returnVal;
                    }
                }
            },
            danger: {
                label:  '取消',
                className: "red",
                callback: function () {
                    returnVal=false;
                }
            }
        }
    });

}

//构造对象
function trObject(deviceId,modId,factId,factSn,goodsId){
    this.deviceId = deviceId;
    this.modId = modId;
    this.factId = factId;
    this.factSn = factSn;
    this.goodsId= goodsId;
    return this;
}



//全选框
$(".group-checkable").on('click', function () {
    $("input[name='sn']").prop("checked", this.checked);
})
$(".checkboxes").on('click', function () {
    var $subs = $(".checkboxes");
    $(".group-checkable").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
});
//获取机构树
function getOrgIdList(){
    $('#q_transferAims').empty();
    var optionList='<option value="" selected="selected" >--请选择--</option>';
    optionList += "<option  value='5138497260'>红豆一代gdl</option>";
    $("#q_transferAims").append(optionList);
}
//获取当前机构下业务员
function getUserNameList(){
    $.ajax({
        url: '/inventoryManagement/getUserNameList'
    }).done(function(data) {
        if (data != "") {
            $('#q_transferAims').empty();
            var optionList='<option value="" selected="selected" >--请选择--</option>';
            for (var i = 0; i < data.length; i++) {
                optionList += "<option  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";

            }
            $("#q_transferAims").append(optionList);
        }
    });
}
//单选框-业务员
$("#optionsRadios5").on('click',function () {
    //$("#transferOrgInput").val("");
    $("#transferOrgInput").hide();
    getUserNameList();
    $("#q_transferAims").show();
});
//单选框-机构
$("#optionsRadios4").on('click',function () {
    $("#transferOrgInput").show();
    $("#q_transferAims").hide();

}).click();
var sspInventoryManagement = function () {
    var fun1 = function () {
        $(".transfer").on('click', function (e) {
            e.preventDefault();
            var id = "";
            var flag = true;
            var installFlag=false;
            $("input[name='sn']:checkbox:checked").each(function () {
                id = id + "," + $(this).val();
                var eqnum = $(this).parents(".text-nowrap").index();
                var parent=$(this).parents(".text-nowrap");
                var status=parent.find(".status").eq(eqnum).text();
                if(status=="安装"){
                    flag=false;
                    installFlag=true;
                }

            })
            if (flag&&id.length>0) {
                var url = $(this).attr('href');
                var target = $(this).attr('data-modal-target');
                $.ajax({
                    url: url
                }).success(function (data) {
                    $('#' + target).modal('show')
                    $('.modal-body').empty();
                    $('.modal-body').append(data);
                })
            } else {
                if(installFlag){
                    bootbox.alert("有已安装数据，不能划拨！");
                }else{
                    bootbox.alert("至少勾选一条记录");
                }

            }
        });
    }
    return {
        init: function () {
            fun1();
        }
    };
}();



