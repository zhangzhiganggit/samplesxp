/**
 * Created by lvchunfeng on 2016/10/12.
 */

$(function(){
    $(".btn-modify").click(function (e) {
        e.preventDefault();
        $("input:text").not("[readonly]").val("");
        $("select").prop('selectedIndex', 0);
        $(".select2-hidden-accessible").val("").trigger("change");

    });
    $("#orgInput").bind('change',function () {
        var orgNo = $("#orgInputId").val();
        var currentEmpNo= $("#selectedEmp").val();
        getOrgUserNameList(orgNo,currentEmpNo);

    })
    $('#orgInput').trigger("change");
    $(".group-checkable").on('click',function(){
        $("input[name='cardId']").prop("checked", this.checked);
    });
    $(".checkboxes").on('click',function(){
        var $subs = $(".checkboxes");
        $(".group-checkable").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
    });

    $(".batchTransfer").on('click', function (e) {
        e.preventDefault();
        var flag = false;
        var selectItems = $("input[name='cardId']:checkbox:checked");
        var cardIds = [];
        selectItems.each(function() {
            cardIds.push($(this).val());
            flag = true;
        });
        if (flag) {
            var url = $(this).attr('href');
            var target = $(this).attr('data-modal-target');
            $.ajax({
                url: url,
                data: {
                    cardIds: cardIds
                },
            }).success(function (data) {
                $('.modal-body').empty();
                $('.modal-footer').remove();
                $('.modal-header').remove();
                $('.modal-content').html(data);
                $('#' + target).modal('show')
            })
            // updateEmp(id.substr(1))
        } else {
           bootbox.alert("至少勾选一条记录")
        }
    });


});


//==================划拨相关校验================================
function transfer(){
    //获取机构或者用户
    var user=$("input[name='optionsRadios']").val();
    //获取划拨目标
    var toOrgOrUser=$("#q_transferAim").val();
    if(''==toOrgOrUser){
        bootbox.alert("请选择机构或者业务员后再划拨!");
        //$(".btn btn-transferbtn btn-transfer").attr('disabled',false);
        return;
    }
}
//
function transferButton() {
    var selectItems = $("input[name='cardId']:checkbox:checked");
    var cardIds = [];
    var flag = false;
    selectItems.each(function() {
        cardIds.push($(this).val());
        flag = true;
    });

    if(cardIds.length == 0){
        bootbox.alert("请选择要划拨的机具!");
        return false;
    }
    var num=cardIds.length;
    var transferData = cardIds.join(",");
    //用户提交前检查
    //获取机构或者用户
    var radioValue=$("input[name='optionsRadios']:checked").val();
    //获取划拨目标
    var toOrgOrUser=null;
    var toOrgOrUserName=null;
    if(radioValue=="org"){
        toOrgOrUser=$("#transferOrgInputId").val();
        toOrgOrUserName=$("#transferOrgInput").val();
    }else if(radioValue=="emp"){
        toOrgOrUser=$("#subordinateOrg").val();
        toOrgOrUserName=$("#subordinateOrg").find("option:selected").text();
    }else{
        toOrgOrUser="本机构";
        toOrgOrUserName="本机构";
    }
    return   ajaxCreatOrder(num,transferData,toOrgOrUser,toOrgOrUserName);
}

//划拨按钮
function ajaxCreatOrder(num, transferData, toOrgOrUser,toOrgOrUserName) {
    var radioValue=$("input[name='optionsRadios']:checked").val();
    //此情况为业务员划拨到本机构
    if (undefined==toOrgOrUser||toOrgOrUser ==''||toOrgOrUserName.trim()=='') {
        bootbox.alert("请选择划拨目标")
        return;
    }
    var returnVal=false;
    bootbox.dialog({
        message: "请确认将选中"+num+"条数据划拨给"+toOrgOrUserName+"?",
        title: 'IC卡划拨操作确认',
        buttons: {
            success: {
                label: '确认',
                className: "green",
                callback: function () {
                    returnVal=true;
                    if (returnVal) {
                        $(".transferButton").attr("disabled","disabled")
                        $(".transferOrgInput").attr("disabled","disabled")
                        $.ajax({
                            url: '/cardManagement/updateInfo',
                            data: {
                                transferData: transferData,
                                toOrgOrUser: toOrgOrUser,
                                radioValue:radioValue
                            },
                            type: 'POST'
                        }).done(function (data) {
                            var message='';
                            if ('0'!= data.resultCode) {
                                message="划拨成功！";
                            } else {
                                message="划拨失败,请联系管理员!";
                            }

                            bootbox.dialog({
                                message: "提示信息："+message,
                                //title: '确认是否划拨',
                                buttons: {
                                    success: {
                                        label: 'OK',
                                        className: "green",
                                        callback: function () {
                                                window.location.reload()
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
    $.ajax({
        url: '/cardManagement/getChildOrgInfoList'
    }).done(function(data) {
        if (data != "") {
            $('.q_transferAims').empty();
            var optionList='<option value="" selected="selected" >--请选择--</option>';
            for (var i = 0; i < data.length; i++) {
                optionList += "<option  value='" + data[i].id + "'>" + data[i].orgName + "</option>";

            }
            $(".q_transferAims").append(optionList);
        }
    });
}
//获取当前机构下实名认证业务员
function getUserNameList(){
    $.ajax({
        url: '/cardManagement/getUserNameList'
    }).done(function(data) {
        if (data != "") {
            $('.q_transferAims').empty();
            var optionList='<option value="" selected="selected" >--请选择--</option>';
            for (var i = 0; i < data.length; i++) {
                optionList += "<option  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";

            }
            $(".q_transferAims").append(optionList);
        }
    });
}

//获取当前机构下业务员
function getOrgUserNameList(orgNo,currentEmp){
    $.ajax({
        url: '/cardManagement/getOrgUserNameList',
        data:{
            orgNo:orgNo
        }
    }).done(function(data) {
        if (data != "") {
            $('#q_belongPerson').empty();
            var optionList = "";
            if(currentEmp == ""){
                optionList='<option value="" selected="selected" >--请选择--</option>';
            }else{
                optionList='<option value="" >--请选择--</option>';
            }
            for (var i = 0; i < data.length; i++) {
                if(currentEmp != "" && currentEmp== data[i].userCode){
                    optionList += "<option selected='selected'  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";
                }else{
                    optionList += "<option  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";
                }
            }
            $("#q_belongPerson").append(optionList);
        }else{
            $("#q_belongPerson").empty();
        }
    });
}
$(".transferButton").on('click', function () {
    return transferButton();
});
$("#toOrgSalesman").on('click',function () {
    $("#transferOrg").hide();
    $("#transferEmp").show();
    getUserNameList();
});
//单选框-机构
$("#toOrg").on('click',function () {
    $("#transferEmp").hide();
    $("#transferOrg").show();
}).click();