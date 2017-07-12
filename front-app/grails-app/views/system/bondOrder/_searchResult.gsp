
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'bondOrder.searchResult.label')}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <g:message code="bondOrder.depositReceivable.label"></g:message>${depositReceivable}<g:message code="bondOrder.yuan.label"></g:message>
            <g:message code="bondOrder.paidDeposit.label"></g:message>${paidDeposit}<g:message code="bondOrder.yuan.label"></g:message>
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="bondOrder" property="adjustmentType" width="90"/>
                    <domainSearchResult:header domain="bondOrder" property="receivedMoney" width="90"/>
                    <domainSearchResult:header domain="bondOrder" property="confirmTime" width="60"/>
                </tr>
                </thead>
                <tbody>
                <g:each var="bondOrderInstance"
                               in="${bondOrderInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="bondOrder" property="adjustmentType"
                                                domainInstance="${bondOrderInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" textAlign="right" domain="bondOrder" property="receivedMoney"
                                                domainInstance="${bondOrderInstance }"/>
                    <domainSearchResult:rowData type="text" textAlign="center"  domain="bondOrder" property="confirmTime"
                                                domainInstance="${bondOrderInstance }"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
