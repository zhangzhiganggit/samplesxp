<%@ page import="com.suixingpay.ssp.front.products.SuiYiTongAuditDataQuery" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${suiYiTongAuditDataQueryInstance?.id}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="merchantCode"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="businessScale"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayNumber domain="suiYiTongAuditDataQuery" property="yieldNow"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayNumber domain="suiYiTongAuditDataQuery" property="yield"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="taskType"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="investmentProportionNow"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="accountNo"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="agentName"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="agentOrgNo"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="applyQuota"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="arriveStatus"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="auditResult"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="bankType"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="businessScaleNow"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="city"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="currentAmount"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="currentStep"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="decreaseAmount"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="drawbackAmount"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="increaseAmount"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="investmentAmount"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="investmentAmountNow"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="investmentProportion"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="launchDate"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="launchTime"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="lossSituation"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="ownerName"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="opinion"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="processTime"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="promoter"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="receiptsName"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="salesMan"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="taskCode"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="taskStatus"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="transactor"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="updateDate"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                

                
                <domainShow:displayString domain="suiYiTongAuditDataQuery" property="updateTime"
                                          domainInstance="${suiYiTongAuditDataQueryInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
