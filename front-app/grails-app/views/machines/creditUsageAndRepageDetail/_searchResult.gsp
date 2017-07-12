<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'creditUsageAndRepageDetail.show.label', args: message.domain(domain: 'creditUsageAndRepageDetail'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
            <div class="caption">
                <i class="fa fa-filter"></i>
                <span class="caption-subject bold uppercase"><g:message code="creditUsageAndRepageDetail.RepaymentMessage.label"></g:message> </span>
                <span class="caption-helper"></span>
            </div>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>

                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="repaymentDate"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="repaymentAmount"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="residualAmount"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="modeOfRepayment"/>
                    %{--<th><g:message code="default.actions.label"/></th>--}%
                </tr>
                </thead>
                <tbody><g:each var="creditUsageAndRepageDetailInstance"
                               in="${creditUsageAndRepageDetailInstanceList}">
                    <tr class="text-nowrap">

                        <domainSearchResult:rowData textAlign="center" type="date" domain="creditUsageAndRepageDetail"
                                                    property="repaymentDate"
                                                    domainInstance="${creditUsageAndRepageDetailInstance}"  />
                        <domainSearchResult:rowData type="currency" domain="creditUsageAndRepageDetail"
                                                    property="repaymentAmount"
                                                    domainInstance="${creditUsageAndRepageDetailInstance}"/>
                        <domainSearchResult:rowData type="currency" domain="creditUsageAndRepageDetail"
                                                    property="residualAmount"
                                                    domainInstance="${creditUsageAndRepageDetailInstance}"/>


                       <g:if test="${creditUsageAndRepageDetailInstance.modeOfRepayment}==P">
                                <td>分润抵扣</td>
                        </g:if>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    %{--赊购金额详情--}%
        <div class="caption">
            <i class="fa fa-filter"></i>
            <span class="caption-subject bold uppercase"><g:message code="creditUsageAndRepageDetail.RepageDetail.label"></g:message> </span>
            <span class="caption-helper"></span>
        </div>
        <div class="table-scrollable">

            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>

                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="orderNumber"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="orderAmountReceivable"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="orderRealAmount"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="numberOfGood"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="modeOfPayment"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="creditAmount" popoverMessage="${message(code:"creditInfo.remainAmount.show-pop.label")}"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="orderStatus"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="createOrderDate"/>
                    <domainSearchResult:header domain="creditUsageAndRepageDetail" property="payCompletionDate"/>

                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="creditUsedListInstance"
                               in="${creditUsedList}">
                    <tr class="text-nowrap">
                        <domainSearchResult:rowData textAlign="center" type="text" domain="creditUsageAndRepageDetail"
                                                    property="orderNumber"
                                                    domainInstance="${creditUsedListInstance}"/>

                        <domainSearchResult:rowData textAlign="right" type="text" domain="creditUsageAndRepageDetail"
                                                    property="orderAmountReceivable"
                                                    domainInstance="${creditUsedListInstance}"/>

                        <domainSearchResult:rowData textAlign="right" type="text" domain="creditUsageAndRepageDetail"
                                                    property="orderRealAmount"
                                                    domainInstance="${creditUsedListInstance}"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="creditUsageAndRepageDetail"
                                                    property="numberOfGood"
                                                    domainInstance="${creditUsedListInstance}"/>
                        <domainSearchResult:rowData type="inList" domain="creditUsageAndRepageDetail"
                                                    property="modeOfPayment"
                                                    domainInstance="${creditUsedListInstance}"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="creditUsageAndRepageDetail"
                                                    property="creditAmount"
                                                    domainInstance="${creditUsedListInstance}"/>
                        <domainSearchResult:rowData type="inList" domain="creditUsageAndRepageDetail"
                                                    property="orderStatus"
                                                    domainInstance="${creditUsedListInstance}"/>
                        <domainSearchResult:rowData type="date" domain="creditUsageAndRepageDetail"
                                                    property="createOrderDate"
                                                    domainInstance="${creditUsedListInstance}"/>
                        <domainSearchResult:rowData type="date" domain="creditUsageAndRepageDetail"
                                                    property="payCompletionDate"
                                                    domainInstance="${creditUsedListInstance}"/>
                        <td class="tk-actions" align="center">

                        <g:if test="${creditUsedListInstance?.orderStatus == '41' || creditUsedListInstance?.orderStatus == '42'}">
                            <g:link controller="ordersQuery" action="transferDetailView" id="${creditUsedListInstance?.orderNumber}"><g:message
                                    code="default.button.show.label" params="[type:'creditInfo',creditId:credit]"/></g:link>
                        </g:if>
                        <g:else>
                            <g:link controller="ordersQuery" action="detailView" id="${creditUsedListInstance?.orderNumber}" params="[type:'creditInfo',creditId:credit]"><g:message
                                    code="default.button.show.label"/></g:link>
                        </g:else>
                        </td>
                    </tr></g:each>
                </tbody>

            </table>

        </div>
        <div class="text-right form-group">
            <g:link class="btn btn-return" controller="creditInfo"  action="index"><g:message
                    code="deviceOrder.return.label"></g:message></g:link>
        </div>
    </portlet:body>
</component:portlet>
