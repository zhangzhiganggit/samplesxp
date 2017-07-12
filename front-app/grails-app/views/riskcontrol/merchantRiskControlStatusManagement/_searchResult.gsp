<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'merchantRiskControlStatusManagement.searchRiskResult.label', args: message.domain(domain: 'merchantRiskControlStatusManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>

                    <domainSearchResult:header domain="merchantRiskControlStatusManagement" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="merchantRiskControlStatusManagement"
                                               property="merchantSalesSlipName" width="120"/>
                    <domainSearchResult:header domain="merchantRiskControlStatusManagement" property="belongtoOrg" width="120"/>
                    <domainSearchResult:header domain="merchantRiskControlStatusManagement" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="merchantRiskControlStatusManagement" property="salesman" width="80"/>
                    <domainSearchResult:header domain="merchantRiskControlStatusManagement" property="merchantStatus" width="60"/>
                    <domainSearchResult:header domain="merchantRiskControlStatusManagement" property="payStatus" width="60"/>
                    <domainSearchResult:header domain="merchantRiskControlStatusManagement" property="tradeStatus" width="60"/>
                    %{--<domainSearchResult:header domain="merchantRiskControlStatusManagement" property="pausePayReason"/>--}%
                    %{--<domainSearchResult:header domain="merchantRiskControlStatusManagement" property="pauseTradeReason"/>--}%
                    <th width="100"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody>
                <g:each var="merchantRiskControlStatusManagementInstance"
                        in="${merchantRiskControlStatusManagementInstanceList}">
                    <tr class="text-nowrap">
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantRiskControlStatusManagement"
                                                    property="merchantCode"
                                                    domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantRiskControlStatusManagement"
                                                    property="merchantSalesSlipName"
                                                    domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantRiskControlStatusManagement"
                                                    property="belongtoOrg"
                                                    domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantRiskControlStatusManagement"
                                                    property="directlyOrg"
                                                    domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantRiskControlStatusManagement"
                                                    property="salesman"
                                                    domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="merchantRiskControlStatusManagement"
                                                    property="merchantStatus"
                                                    textAlign="center"
                                                    domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="merchantRiskControlStatusManagement"
                                                    property="payStatus" textAlign="center"
                                                    domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="merchantRiskControlStatusManagement"
                                                    property="tradeStatus" textAlign="center"
                                                    domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                        <td class="tk-actions" align="left">
                        <g:if test="${merchantRiskControlStatusManagementInstance.merchantStatus == '正常'}">
                            <g:if test="${merchantRiskControlStatusManagementInstance.payStatus == '正常'}">
                                <g:link controller="merchantRiskControlStatusManagement" action="pausePay"
                                        data-toggle="modal" data-target="#pausePay"
                                        params="[merchantCode      : merchantRiskControlStatusManagementInstance?.merchantCode,
                                                 insideMerchantCode: merchantRiskControlStatusManagementInstance?.insideMerchantCode,
                                                 operationType     : '1'
                                        ]"><g:message
                                        code="merchantRiskControlStatusManagement.pausePay.label"/></g:link>
                            </g:if>
                            <g:else>
                                <g:link controller="merchantRiskControlStatusManagement" action="recoveryPay"
                                        data-toggle="modal" data-target="#recoveryPay"
                                        params="[merchantCode      : merchantRiskControlStatusManagementInstance?.merchantCode,
                                                 insideMerchantCode: merchantRiskControlStatusManagementInstance?.insideMerchantCode,
                                                 operationType     : '1'
                                        ]"><g:message
                                        code="merchantRiskControlStatusManagement.recoveryPay.label"/></g:link>
                            </g:else>

                            <g:if test="${merchantRiskControlStatusManagementInstance.tradeStatus == '正常'}">
                                <g:link controller="merchantRiskControlStatusManagement" action="pauseTrade"
                                        data-toggle="modal" data-target="#pauseTrade"
                                        params="[merchantCode      : merchantRiskControlStatusManagementInstance?.merchantCode,
                                                 insideMerchantCode: merchantRiskControlStatusManagementInstance?.insideMerchantCode,
                                                 operationType     : '2'
                                        ]"><g:message
                                        code="merchantRiskControlStatusManagement.pauseTrade.label"/></g:link>
                            </g:if>
                            <g:else>
                                <g:link controller="merchantRiskControlStatusManagement" action="recoveryTrade"
                                        data-toggle="modal" data-target="#recoveryTrade"
                                        params="[merchantCode      : merchantRiskControlStatusManagementInstance?.merchantCode,
                                                 insideMerchantCode: merchantRiskControlStatusManagementInstance?.insideMerchantCode,
                                                 operationType     : '2'
                                        ]"><g:message
                                        code="merchantRiskControlStatusManagement.recoveryTrade.label"/></g:link>
                            </g:else>

                        </g:if>

                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${merchantRiskControlStatusManagementInstanceCount != -1}">
            <component:paginate total="${merchantRiskControlStatusManagementInstanceCount}"/>
        </g:if>
        <component:modals id="pausePay"
                          title="${message(code: 'merchantRiskControlStatusManagement.merchantManagementRiskStatusPausePay.label')}"/>
        <component:modals id="pauseTrade"
                          title="${message(code: 'merchantRiskControlStatusManagement.merchantManagementRiskStatusPauseTrade.label')}"/>
        <component:modals id="recoveryPay"
                          title="${message(code: 'merchantRiskControlStatusManagement.merchantManagementRiskStatusRecoveryPay.label')}"/>
        <component:modals id="recoveryTrade"
                          title="${message(code: 'merchantRiskControlStatusManagement.merchantManagementRiskStatusRecoveryTrade.label')}"/>
    </portlet:body>
</component:portlet>


