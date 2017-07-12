<g:if test="${lastMonthAmount}"><h3
        style="color:#711080">${message(code: 'recoveryQuery.lastMonthUnionPayAmountCompensation.label')}${lastMonthAmount}${message(code: 'recoveryQuery.rMB.label')}</h3></g:if>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'riskClueProvide.unionPaFromHistoricalData.message')}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="recoveryQuery" property="month"/>
                    <domainSearchResult:header domain="recoveryQuery" property="unionPayRecoveryAmount"/>
                </tr>
                </thead>
                <tbody><g:each var="recoveryQueryInstance"
                               in="${recoveryQueryInstanceList}">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="recoveryQuery" property="month"
                                                    domainInstance="${recoveryQueryInstance}" textAlign="center"/>
                        <domainSearchResult:rowData type="text" domain="recoveryQuery" property="unionPayRecoveryAmount"
                                                    domainInstance="${recoveryQueryInstance}" textAlign="right"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>