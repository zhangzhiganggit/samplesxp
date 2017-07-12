<%@ page import="com.suixingpay.ssp.front.products.SuiYiTongAuditDataQuery" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="suiYiTongAuditDataQuery"
                   action="${formAction}"
                   name="scaffold-${formAction}-suiYiTongAuditDataQuery">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${suiYiTongAuditDataQueryInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${suiYiTongAuditDataQueryInstance?.version}"/>
            </g:if>
            <form:body>
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="merchantCode"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="businessScale"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                 <!-- yieldNow with type(float) has no template. -->
                
                 <!-- yield with type(float) has no template. -->
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="taskType"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="investmentProportionNow"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="accountNo"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="agentName"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="agentOrgNo"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="applyQuota"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="arriveStatus"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="auditResult"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="bankType"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="businessScaleNow"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="city"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="currentAmount"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="currentStep"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="decreaseAmount"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="drawbackAmount"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="increaseAmount"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="investmentAmount"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="investmentAmountNow"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="investmentProportion"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="launchDate"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="launchTime"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="lossSituation"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="ownerName"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="opinion"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="processTime"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="promoter"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="receiptsName"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="salesMan"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="taskCode"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="taskStatus"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="transactor"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="updateDate"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="suiYiTongAuditDataQuery" property="updateTime"
                                      domainInstance="${suiYiTongAuditDataQueryInstance}" required="true"/>
                
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
