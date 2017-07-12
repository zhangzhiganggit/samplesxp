<%@ page import="com.suixingpay.ssp.front.system.SystemAnnouncement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="systemAnnouncement"
                   action="${formAction}"
                   name="scaffold-${formAction}-systemAnnouncement"
                   id="scaffoldSearchForm">
            <form:scaffoldSearchProperties/>
            <g:if test="${formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${systemAnnouncementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${systemAnnouncementInstance?.version}"/>
            </g:if>
            <form:body>

                <div class="col-md-8 col-sm-8 col-xs-8">
                    <div class="form-group">
                        <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                            <message:property domain="systemAnnouncement" property="receiveUserId"/>
                            <span class="required">*</span>
                        </label>

                        <div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: systemAnnouncementInstance, field: 'receiveUserId', ' takin-input-errors')}">
                            <g:textField class="form-control" name="receiveUserId" value="${systemAnnouncementInstance?.receiveUserId}"/>
                            <span class="help-block"><g:fieldError bean="${systemAnnouncementInstance}" field="receiveUserId"/></span>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="form-group">
                        <label class="col-md-3 control-label"><g:message code="systemAnnouncement.type.label"/></label>

                        <div class="col-md-9${hasErrors(bean: systemAnnouncementInstance, field: 'priority', ' takin-input-errors')}">
                            <g:select name="type"
                                      from="${com.suixingpay.ssp.front.system.SystemAnnouncement.constrainedProperties['type'].inList}"
                                      valueMessagePrefix="systemAnnouncement.priority"
                                      value="${systemAnnouncementInstance?.type}"
                                      optionKey="${priority}"
                                      optionValue="${priority}"
                                      noSelection="['': '请选择...']"
                                      class="form-control"/>

                            <span class="help-block"><g:fieldError bean="${systemAnnouncementInstance}" field="priority"/></span>
                        </div>
                    </div>
                </div>


                <div class="col-md-8 col-sm-8 col-xs-8">
                    <div class="form-group">
                        <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                            <message:property domain="systemAnnouncement" property="name"/>
                            <span class="required">*</span>
                        </label>

                        <div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: systemAnnouncementInstance, field: 'name', ' takin-input-errors')}">
                            <g:textField class="form-control" name="name" value="${systemAnnouncementInstance?.name}"/>
                            <span class="help-block"><g:fieldError bean="${systemAnnouncementInstance}" field="name"/></span>
                        </div>
                    </div>
                </div>


                <div class="col-md-8 col-sm-8 col-xs-8">
                    <div class="form-group">
                        <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                            <message:property domain="systemAnnouncement" property="content"/>
                            <span class="required">*</span>
                        </label>

                        <div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: systemAnnouncementInstance, field: 'content', ' takin-input-errors')}">
                            <textarea class="form-control" name="content" rows="3" cols="110"
                                      placeholder="${message(code: 'systemAnnouncement.content.label')}"></textarea>
                            <span class="help-block"><g:fieldError bean="${systemAnnouncementInstance}" field="name"/></span>
                        </div>
                    </div>
                </div>

                <div class="col-md-8 col-sm-8 col-xs-8">
                    <div class="form-group">
                        <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                            <message:property domain="systemAnnouncement" property="keyPoints"/>
                            <span class="required">*</span>
                        </label>

                        <div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: systemAnnouncementInstance, field: 'keyPoints', ' takin-input-errors')}">
                            <g:textField class="form-control" name="keyPoints" value="${systemAnnouncementInstance?.keyPoints}"/>
                            <span class="help-block"><g:fieldError bean="${systemAnnouncementInstance}" field="keyPoints"/></span>
                        </div>
                    </div>
                </div>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.' + formAction + '.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
