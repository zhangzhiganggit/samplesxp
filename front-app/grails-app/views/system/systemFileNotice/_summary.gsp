
<li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_barFile">
    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
        <i class="icon-share-alt"></i>
        <g:if test="${badgeCount}"><span class="badge badge-default">${badgeCount}</span></g:if>
    </a>
    <ul class="dropdown-menu">
        <li class="external">
            <h3>你有 <span class="bold">${badgeCount}</span> 条未读消息</h3>
            <a href="/systemFileNotice/index"><span>查看导出文件</span></a>
        </li>
        <li>
            <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283">
                <g:each in="${systemNoticeInstanceList}" var="systemNoticeInstance">
                    <li>
                        <a href="/systemFileNotice/index" style="padding-top:10px;padding-bottom: 10px">
                            <span style="display: none">查看导出文件</span>
                            <div class="subject" style="margin-left:5px">
                                <div class="from"> ${raw(systemNoticeInstance.name)}</div>
                                <div class="time">${systemNoticeInstance?.publishDate.format("yyyy-MM-dd HH:mm:ss")}</div>
                            </div>
                            %{--<div class="message">${systemNoticeInstance?.content}</div>--}%
                        </a>
                    </li>
                </g:each>
            </ul>
        </li>
    </ul>
</li>

<g:javascript>

    function summary() {
        $.ajax({
            type: 'POST',
            url: "/systemFileNotice/systemFileNotice",
            data: $('input[type="checkbox"]').serialize()
        }).done(function (data) {
          //更新右上角的aaaa
            $("#header_inbox_barFile").remove()
            $(".pull-right").prepend(data)

            // $("#header_inbox_bar").html(data.children)

        });
    }
</g:javascript>
