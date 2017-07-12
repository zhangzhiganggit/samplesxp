/**
 * Created by wangyu on 2016/12/22.
 */

$(function(){
    toBatchOpenOrCloseModal();
});

function toBatchOpenOrCloseModal(){
    $("#importExcel").attr("disabled",false);
    $("#openOrCloseFile").val("");
    $("#openOrCloseFileName").html("");
};


var SspOtherConsumeRate = function () {

    /**
     * 批量开通即日付
     */
    var batchOpenOrClose = function () {
        $('#form').submit(function (event) {
            event.preventDefault();
            var scanPayStatus = $("#scanPayStatus").val();
            if(scanPayStatus == '' || scanPayStatus == null || scanPayStatus == undefined){
                bootbox.alert("请选择操作类型！");
                return false;
            }
            var fileVal = $("#openOrCloseFile").val();
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
                $('#toBatchOpenOrCloseModal').modal('hide');
                $("#importExcel").attr("disabled",false);
                $('.batchOpenOrCloseResult').append(res).children().first().modal('show');
            }).fail(function (res) {
                $("#importExcel").attr("disabled",false);
                alert(res)
            });
        });
    };

    return {

        init: function () {
            batchOpenOrClose();
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
        $("#openOrCloseFile").val("");
        $("#openOrCloseFileName").html("");
        return false;
    }
    else return true;
}


var sumbitMerchantCode = function () {
    $(".group-checkable").on('click', function () {
        $("input[name='insideMerchantCode']").prop("checked", this.checked);
    });


    $(".checkboxes").on('click', function () {
        var $subs = $(".checkboxes");
        $(".group-checkable").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
    });

    $("#otherClose").on('click', function (e) {
        e.preventDefault();
        var insideMerchantCode = "";
        var merchantCode = "";
        var flag = false;
        $("input[name='insideMerchantCode']:checkbox:checked").each(function () {
            insideMerchantCode = insideMerchantCode + "," + $(this).val();
            if($(this).val() == 'on'){
                insideMerchantCode = "";
            }else{
                merchantCode = merchantCode +","+$(this).attr("mc");
            }
            flag = true;
        });
        if (flag) {
            $.ajax({
                url: '/otherConsumeRate/otherClose',
                type:"post",
                data: {
                    insideMerchantCode: insideMerchantCode.substr(1),merchantCode:merchantCode.substr(1)
                },
            }).success(function (data) {
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: data,
                    callback: function() {
                        location.reload();
                    },
                    title: "",
                });
            })
        } else {
            bootbox.alert("至少勾选一条记录")
        }
    });

    $("#otherOpen").on('click', function (e) {
        e.preventDefault();
        var insideMerchantCode = "";
        var merchantCode = "";
        var flag = false;
        $("input[name='insideMerchantCode']:checkbox:checked").each(function () {
            insideMerchantCode = insideMerchantCode + "," + $(this).val();
            if($(this).val() == 'on'){
                insideMerchantCode = "";
            }else{
                merchantCode = merchantCode +","+$(this).attr("mc");
            }
            flag = true;
        });
        if (flag) {
            $.ajax({
                url: '/otherConsumeRate/otherOpen',
                type:"post",
                data: {
                    insideMerchantCode: insideMerchantCode.substr(1),merchantCode:merchantCode.substr(1)
                },
            }).success(function (data) {
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: data,
                    callback: function() {
                        location.reload();
                    },
                    title: "",
                });
            })
        } else {
            bootbox.alert("至少勾选一条记录")
        }
    });
};