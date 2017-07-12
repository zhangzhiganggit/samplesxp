<%@ page import="com.suixingpay.ssp.front.turnover.tradequery.PosTrade" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'posTrade'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${posTradeInstance?.id}"/>

                <domainShow:displayString domain="posTrade" property="message"
                                          domainInstance="${posTradeInstance}"/>
                <g:if test="${posTradeInstance.success=='1'}">
                    <render> <domainShow:displayString domain="posTrade" property="image" domainInstance="${posTradeInstance}"/></render>
                </g:if>
                %{--<domainShow:displayString domain="posTrade" property="success"--}%
                                          %{--domainInstance="${posTradeInstance}"/>--}%
                %{----}%

                %{----}%
                %{--<domainShow:displayString domain="posTrade" property="image"--}%
                                          %{--domainInstance="${posTradeInstance}"/>--}%
                


                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
