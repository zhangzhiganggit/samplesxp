/**
 * Created by xujingbao on 11/1/16.
 */
$(function () {

    // marquee
    $('.anyClass').liMarquee();
    //这是 toastr config
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "positionClass": "toast-top-center",
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



   // 定时轮询系统公告
    setTimeout(function () {
        $('body').everyTime('300s','fetchEmergencyAnnouncementTimer', function () {
            //
            $.ajax({
                url: "/systemAnnouncement/fetchEmergencyAnnouncement",
                success: function (data, textStatus, jqXHR) {
                    if (!data || data.length == 0) return;
                    // console.log(data[0].content);
                    // 公告的详细地址
                    var content = data[0].content
                    // var detailsUrl = '/systemAnnouncement/showEmNotice/' + data[0].id;
                    // alert(content)
                    $(".mItem").html(content);
                    // 如果查看详情，跳到tab里边去
                    /* $("#announcement").on('click', function (e) {
                     e.preventDefault();
                     closableTab.addTab({
                     'id': 'systemAnnouncement_index',
                     'name': '查看公告',
                     'url': detailsUrl,
                     'closable': false
                     });
                     })
                     console.log("ffff");
                     clearInterval(fetchEmergencyAnnouncementTimer);*/
                },
                error: function (jqXHR, textStatus, errorThrown) {
                }
            });
        });
    },5000)

    //
    //定时轮询系统通知
    setTimeout(function () {
        $('body').everyTime('600s','fetchMyNoticeTimer', function () {
            $.ajax({
                url: "/systemNotice/fetchMyNotice",
                success: function (data, textStatus, jqXHR) {
                    if (!data || data.length == 0){

                        return;
                    }
                    var noticeList = data;
                    // 显示所有通知
                    for (var index in noticeList) {
                        var aNotice = noticeList[index];
                        if(null==aNotice.content||null==aNotice.name){
                            continue;
                        }
                        var msg = aNotice.content// 内容
                        var title = aNotice.name;  // 标题
                        toastr["info"](msg, title);
                    }
                    //有变化才执行下列请求
                    //右上角文件通知有变化实时刷新。。。
                    $.ajax({
                        type: 'POST',
                        url: "/systemFileNotice/systemFileNotice",
                        data: $('input[type="checkbox"]').serialize()
                    }).done(function (data) {
                        //更新右上角的aaaa
                        $("#header_inbox_barFile").remove()
                        $(".pull-right").prepend(data)
                        $("ul.dropdown-menu li a").on("click", function (e) {
                            e.preventDefault();
                            addToTab(this);
                        });
                        // $("#header_inbox_bar").html(data.children)

                    });
                    //右上角系统消息有变化实时刷新。。。
                    $.ajax({
                        type: 'POST',
                        url: "/systemNotice/systemNotice",
                        data: $('input[type="checkbox"]').serialize()
                    }).done(function (data) {
                        //更新右上角的角标
                        $("#header_inbox_barNotice").remove()
                        $('#header_inbox_barFile').after(data)
                        // $("#header_inbox_bar").html(data.children)
                        $("ul.dropdown-menu li a").on("click", function (e) {
                            e.preventDefault();
                            addToTab(this);
                        });
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {

                }
            });
        });
    },60000)

    //定时轮询待办通知
    $('body').everyTime('300s','flowInHandTimer', function () {
        $.ajax({
            type: 'POST',
            url: "/dashboard/showGtasksCount",
            data: $('input[type="checkbox"]').serialize()
        }).done(function (data) {
            //更新右上角的角标
            $("#header_inbox_barInHand").remove()
            $('#header_inbox_barNotice').after(data)
            // $("#header_inbox_bar").html(data.children)
            $("ul.dropdown-menu li a").on("click", function (e) {
                e.preventDefault();
                addToTab(this);
            });
        });

    });
});