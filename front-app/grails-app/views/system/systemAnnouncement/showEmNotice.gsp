<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.show.label" args="[message.domain(domain: 'systemAnnouncement')]"/></title>
</head>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'systemAnnouncement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>

                <table class="table table-striped table-bordered dataTable no-footer text-nowrap">

                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="col-md-7">
                                    <label class="col-md-4 control-label">
                                        公告标题
                                    </label>

                                    <div class="col-md-8">
                                        <input type="text" readonly="readonly"
                                               value="${systemAnnouncementInstance.name}" class="form-control">
                                    </div>
                                </div>

                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="form-group">
                                <div class="col-md-7">
                                    <label class="col-md-4 control-label">
                                        公告内容
                                    </label>

                                    <div class="col-md-8">
                                        <textarea type="text" readonly="readonly"
                                                  class="form-control">${systemAnnouncementInstance.content}</textarea>
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
</html>