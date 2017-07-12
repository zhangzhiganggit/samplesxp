<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantAudit" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantAudit"
                   action="${formAction}"
                   name="scaffold-${formAction}-merchantAudit">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${merchantAuditInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${merchantAuditInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="merchantAudit" property="taskCode"
                                      domainInstance="${merchantAuditInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="taskStatus"
                                      domainInstance="${merchantAuditInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="taskType"
                                      domainInstance="${merchantAuditInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="merchantCode"
                                      domainInstance="${merchantAuditInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="startFlowTime"
                                      domainInstance="${merchantAuditInstance}" required="false"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="createTime"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="createUser"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="createUserId"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="currentStatus"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="registName"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="salesmanId"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="starLevel"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="startPerson"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="startPersonOrg"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="updateFlowTime"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="updateTime"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="updateUser"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="merchantAudit" property="updateUserId"
                                      domainInstance="${merchantAuditInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
