<%@ page import="com.suixingpay.ssp.front.system.SystemAnnouncement" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'systemAnnouncement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>

                <table class="table table-striped table-bordered dataTable no-footer">

                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <label class="col-md-2 control-label">
                                        公告标题
                                    </label>

                                    <div class="col-md-8">
                                        <p class="form-control-static">${systemAnnouncementInstance.name}</p>
                                    </div>
                                </div>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <label class="col-md-2 control-label">
                                        公告类型
                                    </label>

                                    <div class="col-md-8">
                                        <p class="form-control-static">${systemAnnouncementInstance.type}</p>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <label class="col-md-2 control-label">
                                        公告内容
                                    </label>

                                    <div class="col-md-8">
                                        <input type="hidden" id="contentVal" value="${systemAnnouncementInstance.content}">
                                        <p class="form-control-static col-md-12"
                                           id="content">
                                            %{--${systemAnnouncementInstance.content}--}%
                                    </p>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <label class="col-md-2 control-label">
                                        要点总结
                                    </label>

                                    <div class="col-md-8">
                                        <p class="form-control-static">${systemAnnouncementInstance.keyPoints}</p>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <div class="col-md-4">
                                        <label class="col-md-5 control-label">阅读次数</label>

                                        <div class="clo-md-7 text-center">
                                            <p class="form-control-static">${systemAnnouncementInstance.readingTimes}</p>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="col-md-5 control-label">发布日期</label>

                                        <div class="clo-md-7 text-center"><p
                                                class="form-control-static">${systemAnnouncementInstance.publishDate.format("yyyy-MM-dd")}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>

                </div>

            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>
<div class="text-center">
    <button id="btn" class="btn btn-close" value="${message(code: 'merchantTerminalManagement.back.label')}">${message(code: 'merchantTerminalManagement.back.label')}
    </button>
</div>
<content tag="takin-footer">
    <g:javascript>

        $(function () {
            $("#content").html($("#contentVal").val());
            $("#btn").on('click', function () {
                window.location.href="/systemAnnouncement/index";
            })
        });

    </g:javascript>
</content>