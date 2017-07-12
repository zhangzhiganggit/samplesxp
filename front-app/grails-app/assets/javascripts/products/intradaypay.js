/**
 * 即日付管理
 *
 * @type {{init}}
 */


$(function(){
    toOpenModal();
    toRateModal();
    toAmountModal();
})

function toOpenModal(){
    $("#importExcel").attr("disabled",false);
    $("#openFile").val("");
    $("#openFileName").html("");
}

function toRateModal(){
    $("#batchAlterRate").attr("disabled",false);
    $("#rateFile").val("");
    $("#rateFileName").html("");
}

function toAmountModal(){
    $("#batchAlterAmount").attr("disabled",false);
    $("#amountFile").val("");
    $("#amountFileName").html("");
}


var SspIntradayPay = function () {

    /**
     * 批量开通即日付
     */
    var batchOpenIntradayPay = function () {
        $('#form').submit(function (event) {
            event.preventDefault();
            var fileVal = $("#openFile").val();
            if(fileVal == "" || fileVal == null || fileVal == undefined){
                bootbox.alert("请选择上传文件！")
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
                $('#batchOpenIntradayPayModal').modal('hide');
                $("#importExcel").attr("disabled",false);
                $('.batchOpenIntradayPayResult').append(res).children().first().modal('show');
            }).fail(function (res) {
                $("#importExcel").attr("disabled",false);
                alert(res)
            });
        });
    };

    /**
     * 批量修改费率
     * */
    var batchAlterRate = function () {
        $('#form2').submit(function (event) {
            event.preventDefault();
            var fileVal = $("#rateFile").val();
            if(fileVal == "" || fileVal == null || fileVal == undefined){
                bootbox.alert("请选择上传文件！")
                return false;
            }
            $("#batchAlterRate").attr("disabled",true);
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
                $('#batchAlterRateModal').modal('hide');
                $("#batchAlterRate").attr("disabled",false);
                $('.batchOpenRateResult').append(res).children().first().modal('show');
            }).fail(function (res) {
                alert(res)
            });
        });
    };

    /**
     * 批量修改额度
     * */
    var batchAlterAmount = function () {
        $('#form3').submit(function (event) {
            event.preventDefault();
            var fileVal = $("#amountFile").val();
            if(fileVal == "" || fileVal == null || fileVal == undefined){
                bootbox.alert("请选择上传文件！")
                return false;
            }
            $("#batchAlterAmount").attr("disabled",true);
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
                $('#batchAlterAmountModal').modal('hide');
                $("#batchAlterAmount").attr("disabled",false);
                $('.batchAlterAmountResult').append(res).children().first().modal('show');
            }).fail(function (res) {
                alert(res)
            });
        });
    };



    return {

        init: function () {
            batchOpenIntradayPay();
            batchAlterRate();
            batchAlterAmount();
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
        $("#openFile").val("");
        $("#openFileName").html("");
        $("#rateFile").val("");
        $("#rateFileName").html("");
        $("#amountFile").val("");
        $("#amountFileName").html("");
        return false;
    }
    else return true;
}

