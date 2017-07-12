/**
 * 假日付管理
 *
 * @type {{init}}
 *
 */

$(function(){
    toBatchBu();
})


function toBatchBu(){
    $("#importExcel").attr("disabled",false);
    $("#inFile").val("");
    $("#exFileName").html("");
}

var SspHolidayPay = function () {

    /**
     * 批量开通假日付
     */

    var batchOpenHolidayPay = function () {
        $('#form').submit(function (event) {
            event.preventDefault();
            var fileVal = $("#inFile").val();
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
                $('#batchOpenholidayPayModal').modal('hide');
                $('.batchOpenResult').append(res).children().first().modal('show');
            }).fail(function (res) {
                alert(res)
            });
        });
    };
   /* var fun1 = function () {

        $(".group-checkable").on('click', function () {
            $("input[name='merchantCode']").prop("checked", this.checked);
        });


        $(".checkboxes").on('click', function () {
            var $subs = $(".checkboxes");
            $(".group-checkable").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
            //alert($("input[name='stringValue']:checkbox:checked").val());
        });

        $(".batchEditor").on('click', function (e) {
            e.preventDefault();
            var id = "";
            var flag = false;
            $("input[name='merchantCode']:checkbox:checked").each(function () {
                id = id + "," + $(this).val();
                flag = true;
            })

            if (flag) {
                var url = $(this).attr('href');
                var target = $(this).attr('data-modal-target');
                bootbox.setLocale("zh_CN");
                bootbox.confirm("确定批量开通假日付吗?", function (result) {
                    if(result){
                $.ajax({
                    url: url,
                    data: {
                        merchantCodes: id.substr(1)
                    },
                }).success(function (data) {
                    $('#' + target).modal('show')
                    $('.modal-body').empty();
                    $('.modal-footer').empty();
                    $('.modal-body').append(data);
                })
                    }
                });
                // updateEmp(id.substr(1))
            } else {
                alert("至少勾选一条记录")
            }
        });
    };*/

    return {

        init: function () {
           batchOpenHolidayPay();
            // fun1();
        }
    };

}();


$(function(){
    $(".openHolidayPay").click(function(e){
        e.preventDefault();
        var merchantCode = $(this).attr("mc");
        console.log(merchantCode);
        toOpenHolidayPay(merchantCode);
        return false;
    })
})

/**
 * 开通单个假日付
 * @param merchantCode
 */
function toOpenHolidayPay(merchantCode){
    bootbox.setLocale("zh_CN");
    bootbox.confirm("确定给商户开通假日付吗?", function (result) {
        if(result){
            $.ajax({
                url: "/holidayPay/openHolidayPayForOne",
                dataType:"JSON",
                data:{merchantCode:merchantCode},
                success:function(resultMap){
                    bootbox.alert({
                        buttons: {
                            ok: {
                                label: '确定',
                            }
                        },
                        message: resultMap.msg,
                        callback: function() {
                            location.reload();
                        },
                        title: "",
                    });
                }
            })
        }
    });
}


/**
 * 批量开通假日付
 */
//     function batchOpen(){
//     $("#tth :checked").each(function(i){
//         alert(i)
//     })
// }


function checkfile(sender) {
    var validExts = new Array(".xlsx", ".xls");
    var fileExt = sender.value;
    fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
    if(fileExt == ''){
        return true;
    }
    if (validExts.indexOf(fileExt) < 0) {
        bootbox.alert("文件格式错误！");
        $("#inFile").val("");
        $("#exFileName").html("");
        return false;
    }
    else return true;
}
