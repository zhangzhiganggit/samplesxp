<%@ page import="com.suixingpay.ssp.front.machines.AttachedQuery" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'attachedQuery'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${attachedQueryInstance?.id}"/>
                

                
                <domainShow:displayNumber domain="attachedQuery" property="status"
                                          domainInstance="${attachedQueryInstance}"/>
                

                
                <domainShow:displayString domain="attachedQuery" property="code"
                                          domainInstance="${attachedQueryInstance}"/>
                

                
                <domainShow:displayString domain="attachedQuery" property="factShortName"
                                          domainInstance="${attachedQueryInstance}"/>
                

                
                <domainShow:displayString domain="attachedQuery" property="goodsName"
                                          domainInstance="${attachedQueryInstance}"/>
                

                
                <domainShow:displayDate domain="attachedQuery" property="installDate"
                                        domainInstance="${attachedQueryInstance}"/>
                

                
                <domainShow:displayNumber domain="attachedQuery" property="merchantCode"
                                          domainInstance="${attachedQueryInstance}"/>
                

                
                <domainShow:displayString domain="attachedQuery" property="model"
                                          domainInstance="${attachedQueryInstance}"/>
                

                
                <domainShow:displayNumber domain="attachedQuery" property="operator"
                                          domainInstance="${attachedQueryInstance}"/>
                

                
                <domainShow:displayDate domain="attachedQuery" property="putInStorageDate"
                                        domainInstance="${attachedQueryInstance}"/>
                

                
                <domainShow:displayNumber domain="attachedQuery" property="sn"
                                          domainInstance="${attachedQueryInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<asset:javascript src="/machines/inventoryManagement.js"/>
