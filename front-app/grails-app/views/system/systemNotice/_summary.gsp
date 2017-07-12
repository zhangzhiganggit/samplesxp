<li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_barNotice">
    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
        <i class="icon-envelope-open"></i>
        <g:if test="${badgeCount}"><span class="badge badge-default">${badgeCount}</span></g:if>
    </a>
    <ul class="dropdown-menu">
        <li class="external">
            <h3>你有 <span class="bold">${badgeCount}</span> 条未读消息</h3>
            <a href="/systemNotice/index"><span>查看系统消息</span></a>
        </li>
        <li>
            <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283">
                <g:each in="${systemNoticeInstanceList}" var="systemNoticeInstance">
                    <li>
                        <a href="/systemNotice/index">
                            <span style="display: none">查看系统消息</span>
                            <div class="subject">
                                <div class="from">${systemNoticeInstance?.name}</div>
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

    function summaryNotice() {
        $.ajax({
            type: 'POST',
            url: "/systemNotice/systemNotice",
            data: $('input[type="checkbox"]').serialize()
        }).done(function (data) {
            //更新右上角的角标
            $("#header_inbox_barNotice").remove()
            $('#header_inbox_barFile').after(data)
            // $("#header_inbox_bar").html(data.children)
        });
    }
</g:javascript>