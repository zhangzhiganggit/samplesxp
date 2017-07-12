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
            <span class="caption-subject font-dark bold uppercase">导出文件下载</span>
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
                    <g:link class="btn btn-set green btn-sm delete">删除</g:link>
                    <g:link controller="systemFileNotice" action="index" class="btn btn-set red btn-sm">刷新</g:link>
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
                    <domainSearchResult:header value="导出文件名称"/>
                    <domainSearchResult:header value="导出时间"/>
                    <domainSearchResult:header value="备注"/>

                </tr>
                </thead>
                <tbody><g:each var="systemNoticeInstance"
                               in="${systemNoticeInstanceList}">
                    <tr>
                        <td class="center">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes" name="id" value="${systemNoticeInstance.id}">
                                <span></span>
                            </label>
                        </td>

                            <td>${raw(systemNoticeInstance.name)}</td>


                        <td align="center">${systemNoticeInstance.publishDate.format("yyyy-MM-dd HH:mm:ss")}</td>
                        <g:set var="name" value="${systemNoticeInstance.content.substring(0, 19)}"/>
                        <td>${raw(systemNoticeInstance.content)}</td>

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
                $("input[name='id']").prop("checked", this.checked);
            });
            /**
             * 标记已读
             */
            $(".delete").on('click', function (e) {
                e.preventDefault();

                if($("input[type='checkbox']:checked").length==0)
                {
                    bootbox.alert("至少勾选一个！")
                    return
                }
                else {
                    bootbox.dialog({
                        message: "确定删除文件？",
                        title: '删除文件',
                        buttons: {
                        success: {
                        label: '${message(code: 'default.button.cancel.label')}',
                        className: "green",
                            callback: function () {
                            }
                        },
                        danger: {
                            label:  '${message(code: 'default.button.enter.label')}',
                            className: "red",
                            callback: function () {
                                $.ajax({
                                        type: 'POST',
                                        url: "/systemFileNotice/delete",
                                        data: $('input[type="checkbox"]').serialize()
                                    }).done(function (data) {
                                        if (data.status == 1) {
                                            bootbox.alert("删除成功!", function () {
                                               $.ajax({
                                                    type: 'POST',
                                                    url: "/systemFileNotice/systemFileNotice",
                                                    data: $('input[type="checkbox"]').serialize()
                                                    }).done(function (data) {
                                                        //更新右上角的aaaa
                                                        parent.$("#header_inbox_barFile").remove()
                                                        parent.$(".pull-right").prepend(data)
                                                        parent.$("#dropdown-shortcutMenu").trigger('shortcutMenuchanged');
                                                        // $("#header_inbox_bar").html(data.children)
                                                        location.reload();
                                                    });

                                            });
                                        }
                                        else {
                                            bootbox.alert("此条信息已被删除!", function () {
                                                // href:"/systemNotice/index"
                                                location.reload();
                                            });
                                        }
                                    });
                            }
                        }
                        }
                    });
                 }
             })

         })
    </g:javascript>

</content>
