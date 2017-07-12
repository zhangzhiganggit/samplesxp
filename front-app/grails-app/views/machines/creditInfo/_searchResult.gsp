<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'creditInfo.searchResult.label', args: message.domain(domain: 'creditInfo'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <domainSearchResult:header domain="creditInfo" property="creditMonth" width="90"/>
                    <domainSearchResult:header domain="creditInfo" property="highLimitAmount" width="120" popoverMessage="${message(code:"creditInfo.highLimitAmount.show-pop.label")}"/>
                    <domainSearchResult:header domain="creditInfo" property="usedAmount" width="120"/>
                    <domainSearchResult:header domain="creditInfo" property="shouldRepayAmount" width="90"/>
                    <domainSearchResult:header domain="creditInfo" property="repayAmount" width="90"/>
                    <domainSearchResult:header domain="creditInfo" property="remainAmount" width="90"/>
                    <th width="30"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="creditInfoInstance"
                               in="${creditInfoInstanceList}">
                    <tr class="text-nowrap">
                        <domainSearchResult:rowData textAlign="center" type="text" domain="creditInfo" property="creditMonth"
                                                    domainInstance="${creditInfoInstance}"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="creditInfo"
                                                    property="highLimitAmount"
                                                    domainInstance="${creditInfoInstance}"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="creditInfo"
                                                    property="usedAmount"
                                                    domainInstance="${creditInfoInstance}"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="creditInfo"
                                                    property="usedAmount"
                                                    domainInstance="${creditInfoInstance}"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="creditInfo"
                                                    property="repayAmount"
                                                    domainInstance="${creditInfoInstance}"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="creditInfo"
                                                    property="remainAmount"
                                                    domainInstance="${creditInfoInstance}"/>
                        <td class="tk-actions" align="center">
                            <g:link controller="creditUsageAndRepageDetail" action="index"
                                    id="${creditInfoInstance?.creditId}"><g:message
                                    code="default.button.show.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <component:paginate total="${creditInfoInstanceCount}"/>
    </portlet:body>
</component:portlet>
