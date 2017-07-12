<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantDraft" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'merchantDraft'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${merchantDraftInstance?.id}"/>
                

                
                <domainShow:displayString domain="merchantDraft" property="taskCode"
                                          domainInstance="${merchantDraftInstance}"/>
                

                
                <domainShow:displayString domain="merchantDraft" property="receiptsName"
                                          domainInstance="${merchantDraftInstance}"/>
                

                
                <domainShow:displayString domain="merchantDraft" property="registName"
                                          domainInstance="${merchantDraftInstance}"/>
                

                
                <domainShow:displayString domain="merchantDraft" property="mainManageBusiness"
                                          domainInstance="${merchantDraftInstance}"/>
                

                
                <domainShow:displayString domain="merchantDraft" property="legalPersonName"
                                          domainInstance="${merchantDraftInstance}"/>
                

                
                <domainShow:displayString domain="merchantDraft" property="linkmanMobileNo"
                                          domainInstance="${merchantDraftInstance}"/>
                

                
                <domainShow:displayString domain="merchantDraft" property="salesmanName"
                                          domainInstance="${merchantDraftInstance}"/>
                

                
                <domainShow:displayString domain="merchantDraft" property="salesmanCode"
                                          domainInstance="${merchantDraftInstance}"/>
                

                
                <domainShow:displayString domain="merchantDraft" property="inputPerson"
                                          domainInstance="${merchantDraftInstance}"/>
                

                
                <domainShow:displayString domain="merchantDraft" property="customClassify"
                                          domainInstance="${merchantDraftInstance}"/>
                

                
                <domainShow:displayDate domain="merchantDraft" property="lastOptionTime"
                                        domainInstance="${merchantDraftInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
