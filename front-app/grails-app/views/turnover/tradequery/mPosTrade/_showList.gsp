<%@ page import="com.suixingpay.ssp.front.turnover.tradequery.MPosTrade" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title">${message(code: 'MPosTrade.showListTotal.label', args: message.domain(domain: 'MPosTrade'))}</h4>
</div>
<div class="modal-body">

    <div class="text-nowrap well">

        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${MPosTradeInstance?.id}"/>

          %{--      <domainShow:displayString domain="MPosTrade" property="message"
                                          domainInstance="${MPosTradeInstance}"/>--}%
                ${MPosTradeInstance?.message}
            </form:body>
        </form:form>
        <g:if test="${MPosTradeInstance.success=='1'}">
            <g:set var="electronicAutographPath" value="${signatureImageStr}"></g:set>
            <img src="<g:createLink controller="MPosTrade" action="showEImage" params="[signatureImageStr:electronicAutographPath]"/>"/>
        </g:if>

    </div>



</div>
<div class="modal-footer">
    <button type="button" class="btn btn-ok  center-block" data-dismiss="modal">关闭</button>

</div>