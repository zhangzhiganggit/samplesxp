<%@ page import="com.suixingpay.ssp.front.system.HomeUserPanels" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form id="homeUserPanels"
                   controller="homeUserPanels"
                   action="${formAction}"
                   name="scaffold-${formAction}-homeUserPanels">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${homeUserPanelsInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${homeUserPanelsInstance?.version}"/>
                <formCommon:hiddenField name="panels" value="${homeUserPanelsInstance?.panels}"/>
            </g:if>
            <form:body>
                <g:if test="${allPanels}">
                    <g:set var="panelList" value="${new groovy.json.JsonSlurper().parseText("${allPanels}")}"/>
                    <g:each status="i" var="panel" in="${panelList}">
                            <g:if test="${panel}">
                                <component:bswitch title="${panel['name']}" name="panelsAfter-${panel['controller']}-${panel['action']}" checked="${panel['switch']?"checked":''}"  readonly="${panel['showStatus']=="configureNo"?"readonly":''}" dataOnColor="success" dataOffColor="danger"/>
                            </g:if>
                    </g:each>
                </g:if>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <g:javascript>
        $(function(){
            $('#homeUserPanels').submit(function (event) {
                event.preventDefault();
                var formData = new FormData($(this)[0]);
                var url = $(this).attr('action');
                $.ajax({
                    url: url,
                    type: "post",
                    cache: false,
                    data: formData,
                    processData: false,
                    contentType: false
                }).done(function (res) {
                    parent.$("#tab_framedashboard_index").trigger('dashboardChange');
                    bootbox.alert("更新成功!", function () {
                        location.reload();
                    });
                }).fail(function (res) {
                    bootbox.alert("更新失败!", function () {
                        location.reload();
                    });
                });
            });
        });
    </g:javascript>
</content>

