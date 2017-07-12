<%@ page import="com.suixingpay.ssp.front.system.HomePanel" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="homePanel"
                   action="${formAction}"
                   name="scaffold-${formAction}-homePanel">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${homePanelInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${homePanelInstance?.version}"/>
            </g:if>
            <form:body>

                <domainEdit:textField domain="homePanel" property="panelName"
                                      domainInstance="${homePanelInstance}" required="true" />

                <g:if test="${ formAction == 'update'}">
                    <domainEdit:domainSelect domain="homePanel" property="identity" from="${com.suixingpay.ssp.front.system.HomePanel.constrainedProperties['identity'].inList}"
                                             domainInstance="${homePanelInstance}" noSelection="['':'']" required="true" readonly="true" />

                    <domainEdit:textField domain="homePanel" property="panelController"
                                          domainInstance="${homePanelInstance}" required="true" readonly="readonly"/>

                    <domainEdit:textField domain="homePanel" property="panelAction"
                                          domainInstance="${homePanelInstance}" required="true" readonly="readonly"/>

                    <domainEdit:domainSelect domain="homePanel" property="panelShowStatus" from="${com.suixingpay.ssp.front.system.HomePanel.constrainedProperties['panelShowStatus'].inList}"
                                             domainInstance="${homePanelInstance}" noSelection="['':'']" required="true" readonly="true" />
                </g:if>
                <g:else>
                    <domainEdit:domainSelect domain="homePanel" property="identity" from="${com.suixingpay.ssp.front.system.HomePanel.constrainedProperties['identity'].inList}"
                                             domainInstance="${homePanelInstance}" noSelection="['':'']" required="true" />

                    <domainEdit:textField domain="homePanel" property="panelController"
                                          domainInstance="${homePanelInstance}" required="true" />

                    <domainEdit:textField domain="homePanel" property="panelAction"
                                          domainInstance="${homePanelInstance}" required="true" />

                    <domainEdit:domainSelect domain="homePanel" property="panelShowStatus" from="${com.suixingpay.ssp.front.system.HomePanel.constrainedProperties['panelShowStatus'].inList}"
                                             domainInstance="${homePanelInstance}" noSelection="['':'']" required="true" />
                </g:else>
                <domainEdit:textField domain="homePanel" property="remark"
                                      domainInstance="${homePanelInstance}" required="" />

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
                <g:link class="btn btn-primary" controller="homePanel" action="index">
                    <i class="fa fa-leaf"></i>
                    <g:message code="default.button.back.label"/>
                </g:link>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
