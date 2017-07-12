<%@ page import="com.suixingpay.ssp.front.system.SystemSuggestion" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'suggestion'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${suggestionInstance?.id}"/>
                

                
                <domainShow:displayString domain="suggestion" property="theme"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="feedbackType"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="problemModule"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="announcementTheme"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="suggestionType"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="valueAddedProducts"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="suggestion"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="contactPeople"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="contactTel"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="contactEmail"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="emailRecipient"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="emailRecipientName"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayDate domain="suggestion" property="emailArrivalTime"
                                        domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="imageAddr"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayDate domain="suggestion" property="proposeTime"
                                        domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="proposePeople"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="isAdministrator"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="agentOrgNo"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="topAgentOrgNo"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="branchOrgNo"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="branchOrgNm"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="operStatus"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="operResult"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="operNo"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="operNm"
                                          domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayDate domain="suggestion" property="operTime"
                                        domainInstance="${suggestionInstance}"/>
                

                
                <domainShow:displayString domain="suggestion" property="remarks"
                                          domainInstance="${suggestionInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
