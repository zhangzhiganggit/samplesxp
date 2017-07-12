<%@ page import="com.suixingpay.ssp.front.turnover.tradequery.PosTrade" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"> ${message(code: 'posTrade.showListTotal.label', args: message.domain(domain: 'posTrade'))}</h4>
</div>
<div class="modal-body">

    <div class="text-nowrap well">

                <form:form action="index">
                    <form:body>
                        <formCommon:hiddenField name="id" value="${posTradeInstance?.id}"/>

                        %{--<domainShow:displayString domain="posTrade" property="message"--}%
                                                  %{--domainInstance="${posTradeInstance}"/>--}%
                        ${posTradeInstance?.message}
                    </form:body>
                </form:form>
        <g:if test="${posTradeInstance.success=='1'}">
            <g:set var="electronicAutographPath" value="${signatureImageStr}"></g:set>
            %{--${message(code: 'posTrade.electronicAutograph.label', args: message.domain(domain: 'posTrade'))}:--}%
            <img src="<g:createLink controller="posTrade" action="showEImage" params="[signatureImageStr:electronicAutographPath]"/>"/>
            %{--<img src="<g:createLink controller="assistBillQuery" action="viewImage" params='[title: "${file.path}"]'/>"/>--}%
        </g:if>


    </div>



</div>
<div class="modal-footer">
    <button type="button" class="btn btn-ok center-block" data-dismiss="modal">关闭</button>

</div>