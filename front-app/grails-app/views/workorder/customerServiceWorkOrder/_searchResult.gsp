<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'customerServiceWorkOrder.workRecordQueryReasult.label', args: message.domain(domain: 'customerServiceWorkOrder'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap table-layout-fixed">
                <thead>
                <tr>
                    %{--<domainSearchResult:header domain="customerServiceWorkOrder" property="id" hidden="true"/>--}%
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="belongToOrg" width="120"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="workOrderNo" width="200"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="orderStatus" width="60"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="lastUpdateTime" width="120"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="recipientRole" width="80"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="Launchime" width="120"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="timeLimit" width="80"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="closeTime" width="120"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="exceedLimitDays" width="60"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="reminders" width="60"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="orderType" width="60"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="orderLevel" width="60"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="receiptsName" width="120"/>
                    <th width="50"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="customerServiceWorkOrderInstance"
                               in="${customerServiceWorkOrderInstanceList}">
                    <tr>
                        <div>

                        </div>
                        %{--<domainSearchResult:rowData type="text" domain="customerServiceWorkOrder" property="id" hidden="true"--}%
                        %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%

                        <domainSearchResult:rowData textAlign="left" type="text" domain="customerServiceWorkOrder" property="belongToOrg"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="customerServiceWorkOrder" property="directlyOrg"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder" property="workOrderNo"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <td align="center"><g:message
                                code="customerServiceWorkOrder.orderStatus.${params['q_orderStatus']}"/></td>
                        %{--<domainSearchResult:rowData type="text" domain="customerServiceWorkOrder" property="orderStatus"--}%
                                                    %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder"
                                                    property="lastUpdateTime"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="customerServiceWorkOrder"
                                                    property="recipientRole"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder" property="Launchime"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        %{--<td>${formatDate(fomat:'yyyy-mm-dd',date:customerServiceWorkOrderInstance.Launchime)}</td>--}%
                        %{--<g:formatDate format="yyyy-MM-dd" date="${date}"/>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder" property="timeLimit"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder" property="closeTime"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="customerServiceWorkOrder"
                                                    property="exceedLimitDays"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="customerServiceWorkOrder" property="reminders"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="customerServiceWorkOrder" property="orderType"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder" property="orderLevel"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder"
                                                    property="merchantCode"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="customerServiceWorkOrder"
                                                    property="receiptsName"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>

                        <td class="tk-actions" align="left">
                            <g:link controller="customerServiceWorkOrder" action="show" data-toggle="modal"
                                    data-target="#workOrderShow"
                                    id="${customerServiceWorkOrderInstance?.id}" params="[status:params['q_orderStatus']]"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:if test="${params['q_orderStatus']=='1' || params['q_orderStatus']=='2'}">
                            <g:link class="handleOrder" controller="customerServiceWorkOrder" action="handle"
                                    id="${customerServiceWorkOrderInstance?.id}"
                                    params="[id     : customerServiceWorkOrderInstance?.id,
                                             version: customerServiceWorkOrderInstance?.version,
                                    ]"><g:message
                                    code="customerServiceWorkOrder.handle.label"/></g:link></g:if>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${customerServiceWorkOrderInstanceCount != -1}">
            <component:paginate total="${customerServiceWorkOrderInstanceCount}"/>
        </g:if>

    </portlet:body>
</component:portlet>
<component:modals id="workOrderShow" title="${message(code: 'customerServiceWorkOrder.orderDetail.label')}"
                  width="full"/>