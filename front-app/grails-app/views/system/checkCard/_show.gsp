<%@ page import="com.suixingpay.ssp.front.system.CheckCard" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'checkCard'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${checkCardInstance?.cardId}"/>
                

                <domainShow:displayString domain="checkCard" property="bankCardNum"
                                          domainInstance="${checkCardInstance}"/>

                <domainShow:displayString domain="checkCard" property="salesManCode"
                                          domainInstance="${checkCardInstance}"/>

                %{--<domainShow:displayString domain="checkCard" property="salesMan"--}%
                                          %{--domainInstance="${checkCardInstance}"/>--}%
                %{----}%
                %{--<domainShow:displayString domain="checkCard" property="merchantCode"--}%
                                          %{--domainInstance="${checkCardInstance}"/>--}%
                %{----}%

                %{----}%
                %{--<domainShow:displayString domain="checkCard" property="registName"--}%
                                          %{--domainInstance="${checkCardInstance}"/>--}%
                %{----}%

                %{----}%
                %{--<domainShow:displayNumber domain="checkCard" property="amount"--}%
                                          %{--domainInstance="${checkCardInstance}"/>--}%

                %{----}%
                %{--<domainShow:displayString domain="checkCard" property="receiptsName"--}%
                                          %{--domainInstance="${checkCardInstance}"/>--}%


                
                %{--<domainShow:displayString domain="checkCard" property="terminalNumber"--}%
                                          %{--domainInstance="${checkCardInstance}"/>--}%
                %{----}%

                %{----}%
                %{--<domainShow:displayDate domain="checkCard" property="tradeTime"--}%
                                        %{--domainInstance="${checkCardInstance}"/>--}%
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
