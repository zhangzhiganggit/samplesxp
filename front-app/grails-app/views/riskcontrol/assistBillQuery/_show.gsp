<%@ page import="com.suixingpay.ssp.front.riskcontrol.AssistBillQuery" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'assistBillQuery'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${assistBillQueryInstance?.id}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="belongtoOrg"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="completionDate"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="directlyOrg"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="launchDate"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="launchTime"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="merchantCode"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="operation"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="promoter"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="receiptsName"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="salesman"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="status"
                                          domainInstance="${assistBillQueryInstance}"/>
                

                
                <domainShow:displayString domain="assistBillQuery" property="type"
                                          domainInstance="${assistBillQueryInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
