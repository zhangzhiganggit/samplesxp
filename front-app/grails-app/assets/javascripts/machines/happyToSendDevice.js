/**
 * Created by wangyu on 2016/12/14.
 * 欢乐送
 */

$(function(){

    $(".closeHappyDevice").click(function(e){
        e.preventDefault();
        var originalSerialNm = $(this).attr("serNm");
        var factoryNo = $(this).attr("fact");
        closeHappyDevice(originalSerialNm,factoryNo);
        return false;
    });


    // toAddHappyDevice();

    // toBatchAddHappyDevice();
});


/**
 * 关闭欢乐送
 * @param originalSerialNm
 *
 */
function closeHappyDevice(originalSerialNm,factoryNo){
    bootbox.setLocale("zh_CN");

    bootbox.confirm({
        buttons: {
            confirm: {
                label: '确认关闭',
                    className: 'btn btn-default'
            },
            cancel: {
                label: '取消',
                    className: 'btn btn-primary'
            }
        },
        message: '是否关闭欢乐送？',
        callback: function(result) {
            if(result) {
                $.ajax({
                    type: "POST",
                    url: "/happyToSendDevice/closeHappyDevice",
                    dataType:"JSON",
                    data:{originalSerialNm:originalSerialNm,factoryNo:factoryNo},
                    success:function(data){
                        if(data.msg == 0){
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
                                message: "关闭失败!",
                                callback: function() {
                                    location.reload();
                                },
                                title: "",
                            });
                        }
                    }
                });
            }
        }
    });

}




function toAddHappyDevice(){
    var flag = beforAddDevice();
    if(flag == '-1') {
        bootbox.alert("暂未开通欢乐送权限！");
        // $("#addHappyDeviceModal").attr("disabled", "disabled");
        return false;
    }else {
        $('#addHappyDeviceModal').modal({
            backdrop: 'static',
            keyboard: false
            // remote: "/merchantIncome/totalShopShow"
        });
        $.ajax({
            type: "POST",
            url: "/happyToSendDevice/queryRootAgentDeviceType",
            success: function (data) {
                if (data.reCode == '-2') {
                    $('#deviceType').empty();
                    var optionList = '<option value="" selected="selected" >--请选择--</option>';
                    optionList += "<option value='" + '3' + "'>" + '类型三' + "</option>";
                    $("#deviceType").append(optionList);
                } else {
                    if (data.joyType != "") {
                        var arr = data.joyType.split(',');
                        $('#deviceType').empty();
                        var optionList = '<option value="" selected="selected" >--请选择--</option>';
                        for (var i = 0; i < arr.length; i++) {
                            var typeValue = '';
                            if (arr[i] == '类型一') {
                                typeValue = '1'
                            } else if (arr[i] == '类型二') {
                                typeValue = '2'
                            } else if (arr[i] == '类型三') {
                                typeValue = '3'
                            }
                            optionList += "<option value='" + typeValue + "'>" + arr[i] + "</option>";
                        }
                        $("#deviceType").append(optionList);
                        // $("#q_salesMan").val($("#hiddenSalesMan").val())
                    }
                }
            }
        });
    }
    $("#addHappyDeviceModal").attr("disabled",false);
}

function toBatchAddHappyDevice(){
    var flag = beforAddDevice();
    if(flag == '-1') {
        bootbox.alert("暂未开通欢乐送权限！");
        // $("#addHappyDeviceModal").attr("disabled", "disabled");
        return false;
    }else {
        $('#batchAddHappyDeviceModal').modal({
            backdrop: 'static',
            keyboard: false
            // remote: "/merchantIncome/totalShopShow"
        });
        $.ajax({
            type: "POST",
            url: "/happyToSendDevice/queryRootAgentDeviceType",
            success: function (data) {
                if (data.reCode == '-2') {
                    $('#batchDeviceType').empty();
                    var optionList = '<option value="" selected="selected" >--请选择--</option>';
                    optionList += "<option value='" + '3' + "'>" + '类型三' + "</option>";
                    $("#batchDeviceType").append(optionList);
                } else {
                    if (data.joyType != "") {
                        var arr = data.joyType.split(',');
                        $('#batchDeviceType').empty();
                        var optionList = '<option value="" selected="selected" >--请选择--</option>';
                        for (var i = 0; i < arr.length; i++) {
                            var typeValue = '';
                            if (arr[i] == '类型一') {
                                typeValue = '1'
                            } else if (arr[i] == '类型二') {
                                typeValue = '2'
                            } else if (arr[i] == '类型三') {
                                typeValue = '3'
                            }
                            optionList += "<option value='" + typeValue + "'>" + arr[i] + "</option>";
                        }
                        $("#batchDeviceType").append(optionList);
                        // $("#q_salesMan").val($("#hiddenSalesMan").val())
                    }
                }
            }
        });
    }
    $("#batchAddHappyDevice").attr("disabled",false);
}

/**
 * 添加欢乐送设备
 */
function addHappyToSendDevice(){
    // 厂商
    var factoryNo = $("#factoryNo").val();
    // 序列号
    var originalSerialNm = $("#originalSerialNm").val();
    // 欢乐送类型
    var deviceType = $("#deviceType").val();

    if(factoryNo == null || factoryNo == '' || factoryNo == undefined){
        bootbox.alert("请选择厂商");
        return false;
    }
    var reg = /^[A-Za-z0-9]+$/;
    if(originalSerialNm == null || originalSerialNm == '' || originalSerialNm == undefined){
        bootbox.alert("设备序列号不可为空");
        return false;
    }
    if(reg.test(originalSerialNm) == false){
        bootbox.alert("序列号仅支持输入数字或字母");
        return false;
    }
    if(deviceType == null || deviceType == '' || deviceType == undefined){
        bootbox.alert("请选择欢乐送类型");
        return false;
    }

    $.ajax({
        type: "POST",
        url: "/happyToSendDevice/addHappyDevice",
        dataType:"JSON",
        data:{factoryNo:factoryNo,originalSerialNm:originalSerialNm,deviceType:deviceType},
        success:function(data){
            if(data.reStatus == 0){
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: '添加成功！',
                    callback: function() {
                        location.reload();
                    },
                    title: "",
                });
            }else if(data.reStatus == -1){
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: "新增失败:"+data.msg,
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


var SspHappyToDevice = function () {

    /**
     * 批量开通即日付
     */
    var batchAddDevicePay = function () {
        $('#form').submit(function (event) {
            event.preventDefault();
            var batchDeviceType = $("#batchDeviceType").val();
            if(batchDeviceType == "" || batchDeviceType == null || batchDeviceType == undefined){
                bootbox.alert("请选择欢乐送类型!");
                return false;
            }
            var fileVal = $("#addFile").val();
            if(fileVal == "" || fileVal == null || fileVal == undefined){
                bootbox.alert("请选择上传文件！");
                return false;
            }
            $("#importExcel").attr("disabled",true);
            var formData = new FormData($(this)[0]);
            var url = $(this).attr('action');
            $.ajax({
                url: url,
                type: 'POST',
                cache: false,
                data: formData,
                processData: false,
                contentType: false
            }).done(function (res) {
                $('#batchAddHappyDeviceModal').modal('hide');
                $("#importExcel").attr("disabled",false);
                $('.batchAddDeviceResult').append(res).children().first().modal('show');
            }).fail(function (res) {
                $("#importExcel").attr("disabled",false);
                alert("模板错误或系统内部错误！")
            });
        });
    };

    return {

        init: function () {
            batchAddDevicePay();
        }
    };

}();


function checkfile(sender) {
    var validExts = new Array(".xlsx", ".xls");
    var fileExt = sender.value;
    fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
    if(fileExt == ''){
        return true;
    }
    if (validExts.indexOf(fileExt) < 0) {
        bootbox.alert("文件格式错误！");
        $("#addFile").val("");
        $("#addFileName").html("");
        return false;
    }
    else return true;
}

function beforAddDevice(){
    var flag = '0';
    $.ajax({
        type: "POST",
        url: "/happyToSendDevice/queryRootAgentDeviceType",
        async:false,
        success:function(data){
            if(data.reCode == '-1'){
                flag = '-1';
            }
        }
    });
    return flag;
}