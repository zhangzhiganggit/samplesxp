<%@ page import="com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="customerServiceWorkOrder"
                   action="${formAction}"
                   name="scaffold-${formAction}-customerServiceWorkOrder">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${customerServiceWorkOrderInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${customerServiceWorkOrderInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderType"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderLevel"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="recipientRole"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="noticePerson"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="customerType"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="belongToOrg"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="belongToOrgName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="busempno"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="customerName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="customerPhone"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="dataSources"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="detailId"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="dictGroupId"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="dictId"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="dictName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="dictType"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="directAgentName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="directAgentNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="endTime"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="endTimeStart"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="endTimeaEnd"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="exceedLimitDays"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="expandChildAgentName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="expandChildAgentNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="firstAgentName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="firstAgentNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="isLimit"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="isReminders"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="lastUpdateTime"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="lastUpdateTimeEnd"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="lastUpdateTimeStart"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="legalPersonName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="legalPersonTel"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="lockPerson"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="lockTime"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="lockTimeEnd"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="lockTimeStart"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="maintainChildAgentName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="maintainChildAgentNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="managementAdvice"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="managementBranch"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="merchantCode"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="merchantName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="merchantType"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="noticePersonName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="operationDate"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="operationDateAgo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="operationName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="operationNodes"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="operationUserName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="operationUserNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="opinion"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="opperson"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="oppersonRole"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="oppersonRoleName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderCreateDept"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderCreateName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderCreateTime"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderCreateTimeEnd"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderCreateTimeStart"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderCreatorNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderId"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="orderStatus"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="parentDictId"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="posConnect"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="posNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="posType"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="problemDescription"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="questionChildType"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="questionDetail"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="questionDetailAndSolve"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="questionTitle"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="questionType"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="receiptsName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="receiverPosition"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="reminders"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="rownum"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="serialNumber"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="stepName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="timeLimit"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="timeLimitEnd"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="timeLimitStart"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="treatmentChildAgentName"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="treatmentchildeAgentNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="workFlowLine"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="workOrderNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="customerServiceWorkOrder" property="workRecordNo"
                                      domainInstance="${customerServiceWorkOrderInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
