<%@ page import="com.suixingpay.ssp.front.system.SystemNotice" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="systemNotice"
                   action="${formAction}"
                   name="scaffold-${formAction}-systemNotice"
                   id="scaffoldSearchForm">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${systemNoticeInstance?.id}"/>
            </g:if>
            <form:body>

                <div class="col-md-8 col-sm-8 col-xs-8">
                    <div class="form-group">
                        <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                            <message:property domain="systemNotice" property="receiveUserId"/>
                            <span class="required">*</span>
                        </label>

                        <div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: systemNoticeInstance, field: 'receiveUserId', ' takin-input-errors')}">
                            <g:textField class="form-control" name="receiveUserId" value="${systemNoticeInstance?.receiveUserId}"/>
                            <span class="help-block"><g:fieldError bean="${systemNoticeInstance}" field="receiveUserId"/></span>
                        </div>
                    </div>
                </div>

                <div class="col-md-8 col-sm-8 col-xs-8">
                    <div class="form-group">
                        <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                            <message:property domain="systemNotice" property="name"/>
                            <span class="required">*</span>
                        </label>

                        <div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: systemNoticeInstance, field: 'name', ' takin-input-errors')}">
                            <g:textField class="form-control" name="name" value="${systemNoticeInstance?.name}"/>
                            <span class="help-block"><g:fieldError bean="${systemNoticeInstance}" field="name"/></span>
                        </div>
                    </div>
                </div>

                <div class="col-md-8 col-sm-8 col-xs-8">
                    <div class="form-group">
                        <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                            <message:property domain="systemNotice" property="content"/>
                            <span class="required">*</span>
                        </label>

                        <div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: systemNoticeInstance, field: 'content', ' takin-input-errors')}">
                            <textarea class="form-control" name="content" rows="3" cols="110"
                                      placeholder="${message(code: 'systemAnnouncement.content.label')}"></textarea>
                            <span class="help-block"><g:fieldError bean="${systemNoticeInstance}" field="name"/></span>
                        </div>
                    </div>
                </div>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
