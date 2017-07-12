<%@ page import="com.suixingpay.ssp.front.system.HomePanel" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'homePanel'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${homePanelInstance?.id}"/>

                <domainShow:displayString domain="homePanel" property="panelName"
                                          domainInstance="${homePanelInstance}"/>

                <domainShow:displayString domain="homePanel" property="identity"
                                          domainInstance="${homePanelInstance}"/>

                <domainShow:displayString domain="homePanel" property="panelController"
                                          domainInstance="${homePanelInstance}"/>

                <domainShow:displayString domain="homePanel" property="panelAction"
                                          domainInstance="${homePanelInstance}"/>

                <domainShow:displayInList domain="homePanel" property="panelShowStatus"
                                          domainInstance="${homePanelInstance}"/>

                <domainShow:displayString domain="homePanel" property="remark"
                                          domainInstance="${homePanelInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
