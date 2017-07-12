
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'historyProfit'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <domainSearchResult:header domain="historyProfit" property="code" width="30"/>
                    <domainSearchResult:header domain="historyProfit" property="month" width="60"/>
                    <domainSearchResult:header domain="historyProfit" property="bigAcquiringProfit" width="120"/>
                    <domainSearchResult:header domain="historyProfit" property="highSignProfit" width="90"/>
                    <domainSearchResult:header domain="historyProfit" property="productProfit" width="90"/>
                    <domainSearchResult:header domain="historyProfit" property="marketingCampaignBounty" width="120"/>
                    <domainSearchResult:header domain="historyProfit" property="carryOver" width="90"/>
                    <domainSearchResult:header domain="historyProfit" property="headquartersAdjustment" width="90"/>
                    <domainSearchResult:header domain="historyProfit" property="lossDeduction" width="90"/>
                    <domainSearchResult:header domain="historyProfit" property="profitTotle" width="90"/>
                    <domainSearchResult:header domain="historyProfit" property="depositReturnList" width="90"/>
                    <domainSearchResult:header domain="historyProfit" property="invoiceAmount" width="90"/>

                    <th width="30"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="historyProfitInstance"
                               in="${historyProfitInstanceList}">
                    <tr>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="historyProfit" property="code"
                                                    domainInstance="${historyProfitInstance }"/>
                        <domainSearchResult:rowData type="text" textAlign="center" domain="historyProfit" property="month"
                                                    domainInstance="${historyProfitInstance }" />
                        <td align="right">  <g:link class="matl" controller="MenthodProfitDetail" action="index" params="[q_month_from:historyProfitInstance?.month,flag:'true']" >
                            ${historyProfitInstance.bigAcquiringProfit}</g:link></td>
                   %{--     <domainSearchResult:rowData type="text" domain="historyProfit" property="bigAcquiringProfit"
                                                    domainInstance="${historyProfitInstance }"/>--}%
                         <domainSearchResult:rowData type="text" textAlign="right" domain="historyProfit" property="highSignProfit"
                                                    domainInstance="${historyProfitInstance }"/>
                        <domainSearchResult:rowData type="text" textAlign="right" domain="historyProfit" property="productProfit"
                                                    domainInstance="${historyProfitInstance }"/>
                        <domainSearchResult:rowData type="text" textAlign="right" domain="historyProfit" property="marketingCampaignBounty"
                                                    domainInstance="${historyProfitInstance }"/>
                        <domainSearchResult:rowData type="text" textAlign="right" domain="historyProfit" property="carryover"
                                                    domainInstance="${historyProfitInstance }"/>

                        <domainSearchResult:rowData type="text" textAlign="right" domain="historyProfit" property="headquartersAdjustment"
                                                    domainInstance="${historyProfitInstance }"/>
                        <domainSearchResult:rowData type="text" textAlign="right" domain="historyProfit" property="lossDeduction"
                                                    domainInstance="${historyProfitInstance }"/>
                        <domainSearchResult:rowData type="text" textAlign="right" domain="historyProfit" property="profitTotle"
                                                    domainInstance="${historyProfitInstance }"/>
                        <domainSearchResult:rowData type="text" textAlign="right" domain="historyProfit" property="depositReturnList"
                                                    domainInstance="${historyProfitInstance }"/>
                        <domainSearchResult:rowData type="text" textAlign="right"    domain="historyProfit" property="invoiceAmount"
                                                    domainInstance="${historyProfitInstance }"/>

                        <td class="tk-actions" align="center">
                        <g:link data-toggle="modal" data-target="#sample_modal1"
                                id="${historyProfitInstance.month}" controller="historyProfit" action="show"><g:message
                                code="default.button.show.label"/></g:link>

                        </td>
                    </tr></g:each>
                </tbody>
            </table>

            <component:modals id="sample_modal1" title="" width="lg"/>
        </div>
    </portlet:body>
</component:portlet>
