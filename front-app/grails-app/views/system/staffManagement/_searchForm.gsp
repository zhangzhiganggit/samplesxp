<%@ page import="com.suixingpay.ssp.front.system.SystemUser" %>

<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'bondOrder.search.label', args: message.domain(domain: 'systemUser'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"systemUser.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form  id="staffManagementForm"
                    controller="staffManagement" action="index"
                   name="scaffold-search-staffManagement">
            <form:scaffoldSearchProperties/>
            <form:body>

                <domainSearch:textField id="searchLoginName" domain="systemUser" property="loginName"/>
                <domainSearch:textField id="searchRemarkName" domain="systemUser" property="remarkName" popoverMessage="${message(code:"systemUser.remarkName.show-pop.label")}"/>
                <domainSearch:textField id="searchIdCardName" domain="systemUser" property="idCardName"/>

                %{--<domainSearch:textField domain="systemUser" property="status"/>--}%
                <g:if test="${com.suixingpay.ssp.front.system.SystemUser.constrainedProperties['status'].inList.get(1)==2}">
                    <input type="hidden" value="${com.suixingpay.ssp.front.system.SystemUser.constrainedProperties['status'].inList.remove(1)}">
                </g:if>
                <domainSearch:select domain="systemUser" property="status" class="form-control" name="q_status"
                                     from="${com.suixingpay.ssp.front.system.SystemUser.constrainedProperties['status'].inList}" valueMessagePrefix="SystemUser.status" value="${params ? params['q_status'] : ''}" noSelection="['-1':'--请选择--']"/>
                <domainSearch:textField id="searchPhone" domain="systemUser" property="phone"/>

            </form:body>
            <form:actions>

                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-reset"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
