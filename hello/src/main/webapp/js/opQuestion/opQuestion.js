/**
 * @author WangLei
 * @version 2016年3月24日20:29:25
 *
 */
var DEFAULT_OPTIONS = "<option value=''>全部</option>";
var $questionStatus = $("[name='questionStatus']");

var $searchForm = $('#searchForm');
var $questionForm = $('#questionForm');
var $questionType = $("[name='questionType']");
var $questionSummary = $("[name='questionSummary']");
var $branchCompany = $("[name='branchCompany']");

var $questionCheckBox = $("input[name='checkQuestion']");

var $id = $('#id');
var $majorOrSub = $('#majorOrSub');
var $majorId = $('#majorId');

//var UPLOAD_SIZE_MAX = 10 * 1024;
//允许上传最大附件修改为50M 2016.4.21 lvchunfeng SXF3350
var UPLOAD_SIZE_MAX = 50 * 1024;


// 允许上传的附件类型
var allowExt = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'ico',// 图片
    'mp4', 'avi', '3gp', 'rmvb', 'wav', 'flv', 'swf',// 视频
    'txt', 'doc', 'docx', 'xls', 'xlsx', 'pdf','zip','rar'// 文档 2016.4.21 lvchunfeng SXF3350 允许上传类型增加 zip，rar格式
];

var allowMime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp",
    '视频/mp4'
]

var UPLOAD_EXT_NOT_ALLOWED = '请上传允许的附件类型。\n允许的类型:\n' + allowExt.toString();

var URL_SURFIX = '.do?';
var URLS = {
    add: MODULE_CTX + 'add' + URL_SURFIX,
    detail: MODULE_CTX + 'detail' + URL_SURFIX,
    edit: MODULE_CTX + 'edit' + URL_SURFIX,
    modify: MODULE_CTX + 'modify' + URL_SURFIX,
    save: MODULE_CTX + 'doSave' + URL_SURFIX,
    close: MODULE_CTX + 'doClose' + URL_SURFIX,
    queryBranchCompany: MODULE_CTX + 'queryBranchCompany' + URL_SURFIX,
    download: MODULE_CTX + 'download' + URL_SURFIX,
    exportExcel: MODULE_CTX + 'exportExcel' + URL_SURFIX,
    opQuesionHome: MODULE_CTX + 'opQuestionHome' + URL_SURFIX,
    queryQuestionSummary: MODULE_CTX + '/queryQuestionSummary?',
    queryQuestionStatus: MODULE_CTX + '/queryQuestionStatus?',
    queryQuestionType: MODULE_CTX + '/queryQuestionType?'
};
var TAB_CONFIG = {
    type: 'iframe',
    padding: 5,
    scrolling: 'no',
    fitToView: true,
    autoSize: false,
    width: 800,
    height: 800,
    closeClick: false,
    afterClose: function () {
    }
}

function queryQuestionStatus(questionStatus) {
    var dataConfig = {
        url: URLS.queryQuestionStatus,
        cache: true,
        value: 'value',
        text: 'description',
        success: function (list) {
            if (list) {
                var options = DEFAULT_OPTIONS;
                for (var i = 0; i < list.length; i++) {
                    var selected = questionStatus
                        && questionStatus == list[i].value;
                    var selectedSt = selected ? "selected='selected'" : '';
                    options += "<option " + selectedSt + " value='"
                        + list[i][dataConfig.value] + "''>"
                        + list[i][dataConfig.text] + "</option>";
                }
                $questionStatus.html(options).trigger("chosen:updated");
            }
        }
    };
    $.ajax({
        url: dataConfig.url,
        cache: dataConfig.cache,
        success: dataConfig.success
    });

}

function initMajorOrSub(value) {
    $majorOrSub.val(value).trigger(
        "chosen:updated");
    if ('0' == value) {
        $majorId.attr('disabled', 'disabled');
    } else if ('1' == 'value') {
        $majorId.removeAttr('disabled');
    }
}

function queryQuestionType(type, summary) {
    console.info('queryQuestionType')
    var dataConfig = {
        url: URLS.queryQuestionType,
        value: 'value',
        text: 'description',
        success: function (list) {
            if (list) {
                var options = DEFAULT_OPTIONS;
                for (var i = 0; i < list.length; i++) {
                    var selected = type && type == list[i].value;
                    var selectedSt = selected ? "selected='selected'" : '';
                    options += "<option " + selectedSt + " value='"
                        + list[i][dataConfig.value] + "''>"
                        + list[i][dataConfig.text] + "</option>";
                }
                $questionType.html(options).trigger("chosen:updated");
                queryQuestionSummary(type, summary);
            }
        }
    };
    $.ajax({
        url: dataConfig.url,
        cache: dataConfig.cache,
        success: dataConfig.success
    });
}

function queryQuestionSummary(questionType, summary) {
    if (!questionType) {
        $questionSummary.html(DEFAULT_OPTIONS).trigger("chosen:updated");
        return;
    }
    $.ajax({
        url: URLS.queryQuestionSummary,
        data: {
            questionType: questionType
        },
        cache: true,
        success: function (list) {
            if (list) {
                var options = DEFAULT_OPTIONS;
                for (var i = 0; i < list.length; i++) {
                    var selected = summary && summary == list[i].value;
                    var selectedSt = selected ? "selected='selected'" : '';
                    options += "<option " + selectedSt + " value='"
                        + list[i].value + "''>" + list[i].description
                        + "</option>";
                }
                $questionSummary.html(options).trigger("chosen:updated");
            }
        }
    });
}

function queryBranchCompany(branchCompany) {
    console.info('queryBranchCompany' + branchCompany)
    $.ajax({
        url: URLS.queryBranchCompany,
        data: {},
        cache: true,
        success: function (list) {
            if (list) {
                var options = DEFAULT_OPTIONS;
                for (var i = 0; i < list.length; i++) {
                    var selected = branchCompany
                        && branchCompany == list[i].ORG_UUID;
                    var selectedSt = selected ? "selected='selected'" : '';
                    options += "<option " + selectedSt + " value='"
                        + list[i].ORG_UUID + "''>" + list[i].ORG_NM
                        + "</option>";
                }
                $branchCompany.html(options).trigger("chosen:updated");
            }
        }
    });
}

function download(id,type) {
    window.open(URLS.download + 'id=' + id + '&type=' + type, "_blank");
}
function query() {
    $searchForm.attr("action", URLS.opQuestionHome);
    $searchForm.submit();
}
function exportToExcel() {
    window.open(URLS.exportExcel + $searchForm.serialize(), "_blank");
    return;
    $searchForm.attr("action", URLS.exportExcel);
    $searchForm.submit();
    return;
    $.ajax({
        url: URLS.exportExcel,
        data: $('#searchForm').serialize()
    });
    return
}

function myResetForm() {
// $('#onlyShow').val('true');
// $('#searchFormSubmit').trigger('click');
// return;
// $(':input','#searchForm')
// .not(':button, :submit, :reset, :hidden')
// .val('')
// .removeAttr('checked')
// .removeAttr('selected');
    var selects = $('#searchForm').find('select');
    $.each(selects, function (i, v) {
        $(v).val('').trigger("chosen:updated");
    });
    var $createDateFrom = $("#createDateFrom");
    $createDateFrom.val(genMonthFirstDay()).trigger("chosen:updated");

}

function genMonthFirstDay() {
    var date = new Date();
    var month = date.getMonth() + 1;
    if (month < 10) {
        month = '0' + month;
    }
    return date.getFullYear() + '-' + month + '-' + '01';
}

function validteQuestionForm(type) {
    var $questionForm = $('#questionForm');
    if ('add' == type || 'modify' == type) {
        var majorOrSub = $majorOrSub.val();
        if ('0' == majorOrSub) {
            $majorId.val($id.val());
        } else {
            if ($majorId.val().trim().length == 0) {
                $majorId.val('');
                alert('子问题必须填写主问题编号');
                return false;
            }
        }

        if ($questionType.val().trim().length == 0) {
            alert('必须选择问题类型');
            return false;
        }
        if ($questionSummary.val().trim().length == 0) {
            alert('必须选择问题概述');
            return false;
        }
        $questionContent = $('#questionContent');
        var value = $.trim($questionContent.val());
        $questionContent.val(value);
        var length = getByteNum(value);
        if (length == 0) {
            alert('问题内容为必填且不大于1024个字符，请检查');
            return false;
        } else if (length > 1024) {
            alert('问题内容为必填且不大于1024个字符，请检查');
            return false;
        }
    } else if ('followUp' == type) {
        var $lastFollowUpComment = $questionForm.find('#lastFlolowUpComment');
        var value = $.trim($lastFollowUpComment.val());
        $lastFollowUpComment.val(value);
        var length = getByteNum(value);
        if (length == 0) {
            alert('进展情况为必填且不大于1024个字符，请检查');
            return false;
        } else if (length > 1024) {
            alert('进展情况为必填且不大于1024个字符，请检查');
            return false;
        }
    } else if ('reply' == type) {
        var $reply = $questionForm.find('#reply');
        var value = $.trim($reply.val());
        $reply.val(value);
        var length = getByteNum(value);
        console.info(length)
        if (length == 0) {
            alert('回复内容为必填且不大于256个字符，请检查');
            return false;
        } else if (length > 256) {
            alert('回复内容为必填且不大于256个字符，请检查');
            return false;
        }
    }
    return true;
}

function initQuestionCheckBox() {
    $("#ckAll").click(function () {
        $questionCheckBox.prop("checked", this.checked);
    });

    $questionCheckBox
        .click(function () {
            var $subs = $questionCheckBox;
            $("#ckAll").prop(
                "checked",
                $subs.length == $subs.filter(":checked").length ? true
                    : false);
        });
}

function getQuestions(max) {
    var id = "";
    var flag = false;
    var count = 0;
    var $questionCheckBoxChecked = $("input[name='checkQuestion']:checkbox:checked");
    $questionCheckBoxChecked.each(function () {
        id = id + "," + $(this).val();
        flag = true;
        count++;
    })
    if (count > max) {
        alert('最多只能操作[' + max + ']条记录');
        return null;
    }
    if (flag) {
        return id.substr(1);
    } else {
        alert("至少勾选一条记录")
    }

}

function datePickerInit() {
    $('.date-picker').datepicker({
        autoclose: true,
        language: 'zh-CN',
        todayHighlight: true
    }).next().on(ace.click_event, function () {
        $(this).prev().focus();
    });
    $('.input-daterange').datepicker({
        autoclose: true,
        language: 'zh-CN'
    });
}

function save() {
    $.ajax({
        type: "post",
        url: URLS.save, // 这里是提交到什么地方的url
        data: $questionForm.serialize(), // 这里把表单里面的数据放在这里传到后台
        dataType: "json",
        success: function (data) {
            console.info(data)
            if (data.success) {
                alert(dta.msg + ',id:' + data.entityId);
            } else {
                alert('新建问题失败');
            }
            // 调用回调函数
        }
    });
    $questionForm.attr("action", 'http://baidu.com').submit(function () {
        alert($questionForm);
        return false;
    });

}

function add() {
    var config = $.extend({
        href: URLS.add + 'type=view&id=' + id
    }, TAB_CONFIG);
    $.fancybox.open(config);
}

function detail(id) {
    if ('-1' === id) {
        id = getQuestions(1);
    }
    if (!id) {
        return;
    }
    var config = $.extend({
        href: URLS.detail + 'type=view&id=' + id
    }, TAB_CONFIG);
    $.fancybox.open(config);
}

function reply(id) {
    if ('-1' === id) {
        id = getQuestions(1);
    }
    if (!id) {
        return;
    }
    var config = $.extend({
        href: URLS.edit + 'type=reply&id=' + id
    }, TAB_CONFIG);
    $.fancybox.open(config);
}

function modifyQuestion(id) {
    if (!id) {
        return;
    }
    var config = $.extend({
        href: URLS.modify + 'type=modify&id=' + id
    }, TAB_CONFIG);
    $.fancybox.open(config);
}


function closeQuestion(id) {
    if ('-1' === id) {
        id = getQuestions(50);
    }
    if (!id) {
        return;
    }
    if (!window.confirm('是否关闭选择的问题?')) {
        return;
    }
    $.ajax({
        url: URLS.close + '$_=' + new Date().getTime(),
        data: {
            ids: id
        },
        success: function (data) {
            console.info(data)
            debugger
            if (data.success) {
                window.location.reload();
            } else {
                if (!data.hasSubQuestion) {
                    alert(data.message);
                    return;
                }
                if (window.confirm(data.message)) {
                    $.ajax({
                        url: URLS.close + '&force=true&$_=' + new Date().getTime(),
                        data: {
                            ids: id
                        },
                        success: function (data) {
                            if (data.success) {
                                window.location.reload();
                            } else {
                                alert(data.message);
                            }
                        }
                    });
                    return true;
                }
            }
        }
    });
}

function followUp(id) {
    if ('-1' === id) {
        id = getQuestions(1);
    }
    if (!id) {
        return;
    }
    var config = $.extend({
        href: URLS.edit + 'type=followUp&id=' + id
    }, TAB_CONFIG);
    $.fancybox.open(config);
}
function initFileComponent(selector) {
    selector.ace_file_input({
        style: 'well',
        btn_choose: '请选择',
        btn_change: null,
        // allowMime :allowMime,
        no_icon: 'ace-icon fa fa-cloud-upload',
        droppable: true,
        height: 30,
        thumbnail: 'small',// large | fit |small
        before_change: function (files, dropped) {
            var fileName = files[0].name;
            var fileSize = files[0].size;
            var pointIndex = fileName.lastIndexOf('.');
            if (pointIndex == -1) {
                alert(UPLOAD_EXT_NOT_ALLOWED);
                return false;
            }
            var fileType = fileName.substr(pointIndex + 1).toLowerCase();
            var flag = false;
            for (var i = 0; i < allowExt.length; i++) {
                if (allowExt[i] == fileType)
                    flag = true;
            }
            if (!flag) {
                alert(UPLOAD_EXT_NOT_ALLOWED);
            }
            if (flag && parseInt(fileSize / 1024) > UPLOAD_SIZE_MAX) {
                alert('所上传的附件大小不可超过50M');
                flag = false;
            }
            return flag;
        },
        preview_error: function (filename, error_code) {
            // do nothing
        }
    }).on('change', function () {

    });
}
function majorOrSubChange() {
    var majorOrSub = $majorOrSub.val();
    if ('0' == majorOrSub) {
        $majorId.attr('disabled', 'disabled');
        $majorId.val($id.val());
    } else {
        $majorId.val('');
        $majorId.removeAttr('disabled');
    }
}
function changeDateStart(from, to) {
    var creStartTm = Number($("#" + from).val().replace(/-/g, ''));
    var creEndTm = Number($("#" + to).val().replace(/-/g, ''));
    if (creEndTm != 0) {
        if (creStartTm > creEndTm) {
            $("#" + from).val($("#" + to).val());
        }
    }
}
function changeDateEnd(from, to) {
    var creStartTm = Number($("#" + from).val().replace(/-/g, ''));
    var creEndTm = Number($("#" + to).val().replace(/-/g, ''));
    if (creStartTm != 0) {
        if (creStartTm > creEndTm) {
            $("#" + from).val($("#" + to).val());
        }
    }
}
function getByteNum(str) {
    return str.replace(/[^\x00-\xff]/g, 'xx').length;
};
function formatValue(obj) {
    var value = Number(obj.value.replace(/[^+\d]/g, ''));
    if (value == 0) {
        obj.value = '';
        return;
    }
    obj.value = value;
}
/** * */
// 扩展jQuery对象，添加showTagInfo()方法
// 用于将jQuery对象所有匹配元素的标识信息追加到body元素内
// 每个元素的标识信息形如："tagName"或"tagName#id"
jQuery.fn.showTagInfo = function () {
    var tags = this.map(function () {
        return this.tagName + ( this.id ? "#" + this.id : "" );
    }).get();
    $("body").append("<br>" + tags.join("<br>") + "<br>");
};


function closewin() {
    parent.$.fancybox.close();
}
/** * */
