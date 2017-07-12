%{--<component:portlet cssClass="scaffold-search">
    <portlet:body withForm="true">
        <form:form controller="systemNotice" action="index"
                   name="scaffold-search-systemNotice">
            <form:scaffoldSearchProperties/>
            <form:body>
            </form:body>
            <form:actions>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>--}%
<component:portlet cssClass="scaffold-search">
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-bar-chart font-dark hide"></i>
            <span class="caption-subject font-dark bold uppercase">系统通知</span>
        </div>
    </div>

    <portlet:body>
        <form:form action="index"
        >
            <form:scaffoldSearchProperties/>
        </form:form>
        <div class="table-toolbar">
            <div class="btn-group pull-right">
                <g:if test="${systemNoticeInstanceCount > 0}">
                    <g:link class="btn btn-set green btn-sm maekeRead">已读</g:link>
                    <g:link class="btn btn-set yellow btn-sm makeAllRead">全部已读</g:link>
                </g:if>
            </div>
        </div>

        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap">
                <thead>
                <tr>
                    <th class="sorting_disabled" rowspan="1" colspan="1" aria-label=" " style="width: 66px;">
                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                            <input type="checkbox" class="group-checkable" name="noticeId">
                            <span></span>
                        </label>
                    </th>
                    <domainSearchResult:header domain="systemNotice" property="name"/>
                    <domainSearchResult:header domain="systemNotice" property="content"/>
                    <domainSearchResult:header domain="systemNotice" property="publishDate"/>
                    <domainSearchResult:header domain="systemNotice" property="receiveDate"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="systemNoticeInstance"
                               in="${systemNoticeInstanceList}">
                    <tr>
                        <td class="center">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes" name="noticeId" value="${systemNoticeInstance.id}">
                                <span></span>
                            </label>
                        </td>
                        <domainSearchResult:rowData type="text" domain="systemNotice" property="name"
                                                    domainInstance="${systemNoticeInstance}"/>

                        <g:if test="${systemNoticeInstance.content.length() > 20}">
                            <g:set var="content" value="${systemNoticeInstance.content.substring(0, 19)}"/>
                            <td>${raw(content)}......<span class="tdtip">${raw(systemNoticeInstance.content)}</span></td>
                        </g:if>
                        <g:else>
                            <domainSearchResult:rowData type="text" domain="systemNotice" property="content"
                                                        domainInstance="${systemNoticeInstance}"/>
                        </g:else>
                        <domainSearchResult:rowData type="date" domain="systemNotice" property="publishDate"
                                                    domainInstance="${systemNoticeInstance}"/>
                        <domainSearchResult:rowData type="date" domain="systemNotice" property="receiveDate"
                                                    domainInstance="${systemNoticeInstance}"/>
                        <td class="tk-actions center">
                         <g:link controller="systemNotice" action="show" id="${systemNoticeInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <component:paginate total="${systemNoticeInstanceCount}"/>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <g:javascript>
        $(function () {



            /**
             * 全选和反选择
             */
            $(".group-checkable").on('click', function () {
                $("input[name='noticeId']").prop("checked", this.checked);
            });
            /*
                    全部已读
             */
            $(".makeAllRead").on('click', function (e) {
                e.preventDefault();
                $.ajax({
                    type: 'POST',
                    url: "/systemNotice/makeAllRead",
                }).done(function (data) {
                    // href:"/systemNotice/index"
                    $.ajax({
                        type: 'POST',
                        url: "/systemNotice/systemNotice",
                        data: $('input[type="checkbox"]').serialize()
                    }).done(function (data) {
                        //更新右上角的角标
                        parent.$("#header_inbox_barNotice").remove()
                        parent.$('#header_inbox_barFile').after(data)
                        //从新加载addtotable事件
                        parent.$("#dropdown-shortcutMenu").trigger('shortcutMenuchanged');

                        location.reload();
                        // $("#header_inbox_bar").html(data.children)
                    });
                });

            })
            /**
             * 标记已读
             */
            $(".maekeRead").on('click', function (e) {
                e.preventDefault();
                if($("input[type='checkbox']:checked").length==0)
                {
                    bootbox.alert("至少勾选一个！")
                    return
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: "/systemNotice/makeRead",
                        data: $('input[type="checkbox"]').serialize()
                    }).done(function (data) {
                        if (data.status == 1) {
                            bootbox.alert("更新成功!", function () {

                                // href:"/systemNotice/index"
                                $.ajax({
                                    type: 'POST',
                                    url: "/systemNotice/systemNotice",
                                    data: $('input[type="checkbox"]').serialize()
                                }).done(function (data) {
                                    //更新右上角的角标
                                    parent.$("#header_inbox_barNotice").remove()
                                    parent.$('#header_inbox_barFile').after(data)
                                    //从新加载addtotable事件
                                    parent.$("#dropdown-shortcutMenu").trigger('shortcutMenuchanged');

                                    location.reload();
                                    // $("#header_inbox_bar").html(data.children)
                                });

                            });

                        }
                        else {
                            bootbox.alert("此条信息已被查看!", function () {
                                // href:"/systemNotice/index"
                                location.reload();
                            });
                        }
                    });
                }
            })


        })
    </g:javascript>
</content>
