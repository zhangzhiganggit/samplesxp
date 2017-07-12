<%@ page import="com.suixingpay.ssp.front.system.SystemNotice" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'systemNotice'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${systemNoticeInstance?.id}"/>
                <domainShow:displayString domain="systemNotice" property="name"
                                          domainInstance="${systemNoticeInstance}"/>

                <g:set var="content" value="${systemNoticeInstance.content}"/>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">内容：</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                            <p class="form-control-static"> ${raw(content)}&nbsp;</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">接收时间：</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                            <p class="form-control-static">${systemNoticeInstance?.publishDate?systemNoticeInstance.publishDate.format("yyyy-MM-dd HH:mm:ss"):""}</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">已读时间：</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                            <p class="form-control-static">${systemNoticeInstance?.receiveDate ?systemNoticeInstance?.receiveDate.format("yyyy-MM-dd HH:mm:ss"):""}</p>
                        </div>
                    </div>
                </div>
        %{--        <domainShow:displayDate domain="systemNotice" property="publishDate"
                                        domainInstance="${systemNoticeInstance}"/>--}%
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
