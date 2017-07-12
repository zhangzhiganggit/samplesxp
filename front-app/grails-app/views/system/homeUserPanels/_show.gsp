<%@ page import="com.suixingpay.ssp.front.system.HomeUserPanels" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'homeUserPanels'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${homeUserPanelsInstance?.id}"/>
                <g:if test="${allPanels}">
                    <g:set var="panelList" value="${new groovy.json.JsonSlurper().parseText("${allPanels}")}"/>
                    <g:each status="i" var="panel" in="${panelList}">
                        <g:if test="${panel}">

                            <component:bswitch title="${panel['name']}"  checked="${panel['switch']?"checked":''}"  dataOnColor="success" dataOffColor="danger" disabled="disabled"/>

                        </g:if>
                    </g:each>
                </g:if>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
