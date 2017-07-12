/**
 *
 */
var loadTime = new Date().getTime()-5000;
$(function () {
    /**
     *
     */
    $("th.sortColumn").click(function () {
        if ($("#scaffoldSearchForm")) {
            $("#scaffold_sort").val($(this).attr("data-sort"));
            $("#scaffold_order").val($(this).attr("data-order"));
            $("#scaffold_offset").val(0);
            // $("#scaffoldSearchForm").submit();
            $("div.scaffold-search form").submit();
        }
    });
    $("button.btn-reset").click(function (e) {
        e.preventDefault();
        $("input[type!='hidden']").val("");
        $("select").prop('selectedIndex', 0);
        //$("span.select2-selection__clear").html = '';
    });
    $("button.btn-search").click(function (e) {
        //e.preventDefault();
        var currentTime = new Date().getTime();
        if ( currentTime - loadTime < 5000 ) {
            return false;
        }
        loadTime = currentTime;
    });


    $("ul.pagination a").click(function () {
        $("#scaffold_offset").val($(this).attr("data-offset"));
        // $("#scaffoldSearchForm").submit();
        $("div.scaffold-search form").submit();
    });
    $("div.scaffold-search form div.form-actions button[type='submit']").click(function () {
        $("#scaffold_offset").val(0);
    });
    $("div[data-scaffold='show'] table.dataTable").dataTable({
        "paging": false,
        "info": false,
        "searching": false,
        "language": {
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "过滤内容：",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        }
    });
    $("div[data-scaffold='edit'] table.dataTable").dataTable({
        "paging": false,
        "info": false,
        "searching": false,
        "language": {
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "过滤内容：",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        }
    });

    $(".tk-select .portlet .portlet-body").css({
        "width": $(".tk-select .portlet .portlet-title").width()
    });
    $(".takin-pageSizeChoose").on('change', function () {

        if ($("#scaffoldSearchForm")) {
            var max = $(this).val();
        //    localStorage['ssp-table-max'] = max;
            $("#scaffold_max").val(max);
            $("div.scaffold-search form").submit();
        }

    });
    $(".takin-pageSizeChoose").val($("#scaffold_max").val() ? $("#scaffold_max").val() : 10)

    /**
     * for takin-select
     */
    $(".takin-select").select2({
        allowClear: true,
    });

    /**
     *
     * @param repo
     * @returns {*}
     */
    function formatRepo(repo) {
        if (repo.loading) return repo.text;
        var markup = "<div class='clearfix'>" +
            "<div>" + repo.text + "</div></div>";

        return markup;
    }

    /**
     *
     * @param repo
     * @returns {*}
     */
    function formatRepoSelection(repo) {

        //显示value
        return repo.text;
    }

    /**
     * for takin-autoComplete
     */
    $(".takin-autoComplete").select2({
        ajax: {
            url: function () {
                return $(this).attr("data-url");
            },
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    q: params.term, // search term
                    page: params.page
                };
            },
            processResults: function (data, params) {
                params.page = params.page || 1;
                return {

                    results: data.items,
                    pagination: {
                        more: (params.page * 10) < data.total
                    }
                };
            },
            cache: true
        },
        escapeMarkup: function (markup) {
            return markup;
        }, // let our custom formatter work
        minimumInputLength: 2,
        language: "zh-CN", // select2 4.0 中文显示
        templateResult: formatRepo, // omitted for brevity, see the source of this page
        templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
    });

    /**
     * for takin-multiple-autoComplete
     */
    $(".takin-multiple-autoComplete").select2({
        allowClear: true,
        multiple: true,
        closeOnSelect: false,
        ajax: {
            url: function () {
                return $(this).attr("data-url");
            },
            dataType: 'json',
            delay: 300,
            data: function (term, page) {
                return {
                    q: term,
                    page: page
                };
            },
            results: function (data, page) {
                var more = (page * 10) < data.total;
                return {results: data.items, more: more};
            },
            cache: true
        },
        escapeMarkup: function (markup) {
            return markup;
        },
        initSelection: function (element, callback) {
            var id = $(element).val();
            var url = $(element).attr("data-url");
            if (id !== "") {
                $.ajax(url, {
                    data: {
                        ids: id
                    },
                    dataType: "json"
                }).done(function (data) {
                    if (data.items.length == 1) {
                        callback(data.items[0]);
                    } else {
                        callback(data.items);
                    }
                });
            }
        },
    });

    /**
     * for oneToMany modify in create/update.
     */
    $("a[data-tab-id]").click(function () {
        $("#" + $(this).attr('data-tab-id')).click();
    });

    /**
     *
     */
    $(".tk-oneToMany-table tbody").on("click", ".tk-actions a", function (e) {
        e.preventDefault();
        var siblings = $(this).siblings("input:hidden[name*='__']");
        if (siblings.length == 2) {
            var type = $(siblings[1]);
            if (type.val() == "add") type.val("temp");
            else type.val("remove");
            $(this).parent().parent().hide();
        }
    });

    /**
     * ajax modal
     */
    $('.ssp-ajaxmodal').click(function (event) {
        var targetId = $(this).attr('data-modal-target');
        $.ajax({
            url: $(this).attr('href'),
            //data:
            success: function (newHTML, textStatus, jqXHR) {
                $("#" + targetId).modal('show');
                $('.modal-body').empty().append(newHTML);
            },
            error: function (jqXHR, textStatus, errorThrown) {
            }
        });
        return false;
    });

    /**
     * 本周
     */
    $('.ssp-datepicker-thisweek').on('click', function () {
        pickDate(1, 7, $(this).parent().attr('data-datepicker-target'), $(this).parent().attr('data-datepicker-format'));
    });

    /**
     * 上周
     */
    $('.ssp-datepicker-lastweek').on('click', function () {
        pickDate(-6, 0, $(this).parent().attr('data-datepicker-target'), $(this).parent().attr('data-datepicker-format'));
    });

    /**
     * 今日
     */
    $('.ssp-datepicker-today').on('click', function () {
        pickDate(new Date().getDay(), new Date().getDay(), $(this).parent().attr('data-datepicker-target'), $(this).parent().attr('data-datepicker-format'));
    });

    /**
     * 昨日
     */
    $('.ssp-datepicker-yesterday').on('click', function () {
        pickDate(new Date().getDay() - 1, new Date().getDay() - 1, $(this).parent().attr('data-datepicker-target'), $(this).parent().attr('data-datepicker-format'));
    });

    /**
     * 本月
     */
    $('.ssp-datepicker-thismonth').on('click', function () {
        //
        var target = $(this).parent().attr('data-datepicker-target');
        var format = $(this).parent().attr('data-datepicker-format');
        //
        var currenMonth = getCurrentMonth();
        var startDay = currenMonth[0];
        var endDay = currenMonth[1];
        //
        $("input[name=" + 'q_' + target + '_from' + "]").val($.format.date(startDay, format));
        $("input[name=" + 'q_' + target + '_to' + "]").val($.format.date(endDay, format));
    });

    /**
     * 上月
     */
    $('.ssp-datepicker-lastmonth').on('click', function () {
        //
        var target = $(this).parent().attr('data-datepicker-target');
        var format = $(this).parent().attr('data-datepicker-format');
        //
        var previousMonth = getPreviousMonth();
        var startDay = previousMonth[0];
        var endDay = previousMonth[1];
        //
        $("input[name=" + 'q_' + target + '_from' + "]").val($.format.date(startDay, format));
        $("input[name=" + 'q_' + target + '_to' + "]").val($.format.date(endDay, format));
    });

    /**
     * 近一个月 30天
     */
    $('.ssp-datepicker-last1month').on('click', function () {
        //
        var target = $(this).parent().attr('data-datepicker-target');
        var format = $(this).parent().attr('data-datepicker-format');
        //
        var today = new Date();
        var last30Day = today.setTime(today.getTime() - 1000 * 3600 * 24 * 30);
        //
        $("input[name=" + 'q_' + target + '_from' + "]").val($.format.date(last30Day, format));
        $("input[name=" + 'q_' + target + '_to' + "]").val($.format.date(new Date(), format));
    });

    /**
     * 近三个月 90天
     */
    $('.ssp-datepicker-last3month').on('click', function () {
        //
        var target = $(this).parent().attr('data-datepicker-target');
        var format = $(this).parent().attr('data-datepicker-format');
        //
        var today = new Date();
        var last90Day = today.setTime(today.getTime() - 1000 * 3600 * 24 * 90);
        //
        $("input[name=" + 'q_' + target + '_from' + "]").val($.format.date(last90Day, format));
        $("input[name=" + 'q_' + target + '_to' + "]").val($.format.date(new Date(), format));
    });

    /**
     * 设置日期
     * @param snum
     * @param lnum
     * @param target
     * @param format
     */
    pickDate = function (snum, lnum, target, format) {

        //
        var date = new Date();
        var startDay = date.setTime(date.getTime() + 1000 * 60 * 60 * 24 * (-date.getDay() + snum));
        date = new Date();
        var endDay = date.setTime(date.getTime() + 1000 * 60 * 60 * 24 * (-date.getDay() + lnum));
        //
        $("input[name=" + 'q_' + target + '_from' + "]").val($.format.date(startDay, format));
        $("input[name=" + 'q_' + target + '_to' + "]").val($.format.date(endDay, format));
    }

    /**
     * 获得上一月的起止日期
     * @returns {Array}
     */
    getPreviousMonth = function () {

        var startStop = [];
        var currentDate = new Date();
        //获得上一个月的第一天和最后一天
        var priorMonthFirstDay = this.getPriorMonthFirstDay(currentDate.getFullYear(), currentDate.getMonth());
        var priorMonthLastDay = new Date(priorMonthFirstDay.getFullYear(), priorMonthFirstDay.getMonth(), this.getMonthDays(priorMonthFirstDay.getFullYear(), priorMonthFirstDay.getMonth()));
        //
        startStop.push(priorMonthFirstDay);
        startStop.push(priorMonthLastDay);
        return startStop;
    };

    /**
     * 返回上一个月的第一天Date类型
     * @param year 年
     * @param month 月
     **/
    getPriorMonthFirstDay = function (year, month) {
        //年份为0代表,是本年的第一月,所以不能减
        if (month == 0) {
            month = 11; //月份为上年的最后月份
            year--; //年份减1
            return new Date(year, month, 1);
        }
        //否则,只减去月份
        month--;
        return new Date(year, month, 1);
        ;
    };

    /**
     * 获得该月的天数
     * @param year年份
     * @param month月份
     * */
    getMonthDays = function (year, month) {
        //本月第一天 1-31
        var relativeDate = new Date(year, month, 1);
        //获得当前月份0-11
        var relativeMonth = relativeDate.getMonth();
        //获得当前年份4位年
        var relativeYear = relativeDate.getFullYear();

        //当为12月的时候年份需要加1
        //月份需要更新为0 也就是下一年的第一个月
        if (relativeMonth == 11) {
            relativeYear++;
            relativeMonth = 0;
        } else {
            //否则只是月份增加,以便求的下一月的第一天
            relativeMonth++;
        }
        //一天的毫秒数
        var millisecond = 1000 * 60 * 60 * 24;
        //下月的第一天
        var nextMonthDayOne = new Date(relativeYear, relativeMonth, 1);
        //返回得到上月的最后一天,也就是本月总天数
        return new Date(nextMonthDayOne.getTime() - millisecond).getDate();
    };

    /**
     * 获取当前月起止日期
     * @returns {Array}
     */
    getCurrentMonth = function () {
        //起止日期数组
        var startStop = new Array();
        //获取当前时间
        var currentDate = new Date();
        //获得当前月份0-11
        var currentMonth = currentDate.getMonth();
        //获得当前年份4位年
        var currentYear = currentDate.getFullYear();
        //求出本月第一天
        var firstDay = new Date(currentYear, currentMonth, 1);

        //当为12月的时候年份需要加1
        //月份需要更新为0 也就是下一年的第一个月
        if (currentMonth == 11) {
            currentYear++;
            currentMonth = 0; //就为
        } else {
            //否则只是月份增加,以便求的下一月的第一天
            currentMonth++;
        }

        //一天的毫秒数
        var millisecond = 1000 * 60 * 60 * 24;
        //下月的第一天
        var nextMonthDayOne = new Date(currentYear, currentMonth, 1);
        //求出上月的最后一天
        var lastDay = new Date(nextMonthDayOne.getTime() - millisecond);

        //添加至数组中返回
        startStop.push(firstDay);
        startStop.push(lastDay);
        //返回
        return startStop;
    };

    bootboxAlert = function (message) {
        bootbox.alert({
            buttons: {
                ok: {
                    label: '确定'
                }
            },
            message: message,
            // callback: function() {
            //     alert('关闭了alert');
            // },
            title: "提示",
        });
    };

    $(".fileDownloadTag").on('click', function (e) {
        e.preventDefault();
        var downloadUrl = $(this).attr('href');
        var checkUrl = $(this).attr('href').replace(/index/, 'check');
        $.ajax({
            url: checkUrl,
            dataType: 'json',
            async: false,
            success: function (data) {
                if (data.errorCode == 404) {
                    bootboxAlert(data.errorMessage);
                } else {
                    window.location = downloadUrl
                }
            }
        });
    });

    
    var settings = {
        trigger:'hover',
        content:'',
        width:300,
        multi:true,
        closeable:false,
        style:'default',
        padding:true
    };
    
    //
    //
    $('.show-pop').webuiPopover('destroy').webuiPopover($.extend({},settings,{
        content: function (data) {
            return $(this).attr('data-popover-message');
        }
    }));

    $('.show-riskclue-pop').webuiPopover('destroy').webuiPopover($.extend({},settings,{
        content: function (data) {
            return $(this).attr('data-popover-message');
        }
    }));
});

$.fn.select2.defaults.set('allowClear', true);
$.fn.bootstrapSwitch.defaults.onText = '开';
$.fn.bootstrapSwitch.defaults.offText = '关';
bootbox.setLocale("zh_CN");