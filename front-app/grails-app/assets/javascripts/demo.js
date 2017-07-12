/**
 * Created by xujingbao on 9/12/16.
 */

var SspFrontDemo = function () {

    /**
     * 弹出提示
     */
    var toastrDemo = function () {

        $('#showtoast').click(function () {

            //配置选项
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-top-right",
                "onclick": null,
                "showDuration": "1000",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            // 内容
            var msg = "<a target='_blank' download='' href='https://www.vbill.cn/mss/newIndex/images/logo.png'>点击下载</a>";
            // 标题
            var title = "文件导出完毕";
            // 提示类型 info error warning success
            var shortCutFunction = "info";

            //$("#toastrOptions").text("Command: toastr[" + shortCutFunction + "](\"" + msg + (title ? "\", \"" + title : '') + "\")\n\ntoastr.options = " + JSON.stringify(toastr.options, null, 2));

            toastr[shortCutFunction](msg, title); // Wire up an event handler to a button in the toast, if it exists

        });
    }

    /**
     *
     */
    var select2InputGroup = function () {

        $("#select2-input-group-append").on('change', function () {
            //bootbox.alert("你选了" + $(this).val().join());
        });
    };

    /**
     * Tag Input TODO 暂时不用
     */
    var tagsInput = function () {

        var elt = $('#demo_tagsinput');

        elt.tagsinput({
            itemValue: 'value',
            itemText: 'text',
        });

        $('#demo_tagsinput_select').on('change', function () {
            elt.tagsinput('add', {
                "value": $('#demo_tagsinput_select').val(),
                "text": $('#demo_tagsinput_select').val()
            });
        });

        elt.tagsinput('add', {"value": 1, "text": "A角色"});
        elt.tagsinput('add', {"value": 4, "text": "B角色"});
        elt.tagsinput('add', {"value": 7, "text": "C角色"});
        elt.tagsinput('add', {"value": 10, "text": "D角色"});
        elt.tagsinput('add', {"value": 13, "text": "E角色"});
    };

    /**
     *
     */
    var demoFileUpload = function () {
        /**
         * 文件上传
         */
        $('#fileupload').fileupload({
            dataType: 'json',
            url: $(this).attr('data-url'),
            add: function (e, data) {
                data.submit();
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css(
                    'width',
                    progress + '%'
                );
            },
            done: function (e, data) {
                if (data.result.err_code == 0) {
                    $.each(data.result.files, function (index, files) {
                        //$('<p/>').text(files.file.name).appendTo('#fileuploader');
                        var img = $('<img />', {
                            id: 'ssp-upload-img',
                            src: files.file.path + files.file.name,
                            alt: 'ssp-upload-img',
                            width: 50,
                            height: 50
                        });
                        img.appendTo($('#files'));
                    });
                } else {
                    bootbox.dialog({
                        message: data.result.err_msg,
                        title: "提示",
                        buttons: {
                            danger: {
                                label: "确定",
                                className: "red",
                                callback: function () {
                                }
                            }
                        }
                    });
                }
            }
        }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
    };

    /**
     *
     */
    var demoProvinceSelect = function () {

        /**
         * 省市级联
         */
        $('#province').on('change', function () {
            //
            $.ajax({
                url: "${g.createLink(controller: 'demo', action: 'provinceChanged')}",
                data: {
                    provinceId: $('#province').val()
                },
            }).done(function (data) {
                $("#cityContainer").html(data)
            }).fail(function (e, data) {
                console.log("error");
            }).always(function () {
                console.log("complete");
            });
        });
    };


    return {
        init: function () {
            toastrDemo();
            demoFileUpload();
            demoProvinceSelect();
            tagsInput();
            select2InputGroup();
        }
    };
}();
