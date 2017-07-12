<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantAudit" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'merchantAudit'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${merchantAuditInstance?.id}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="taskCode"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="taskStatus"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="taskType"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="merchantCode"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="startFlowTime"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="createTime"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="createUser"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="createUserId"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="currentStatus"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="registName"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="salesmanId"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="starLevel"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="startPerson"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="startPersonOrg"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="updateFlowTime"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="updateTime"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="updateUser"
                                          domainInstance="${merchantAuditInstance}"/>
                

                
                <domainShow:displayString domain="merchantAudit" property="updateUserId"
                                          domainInstance="${merchantAuditInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
