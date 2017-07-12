<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'assistBillQuery.singleQueryResultList.label', args: message.domain(domain: 'assistBillQuery'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="pictureUploadShow"></div>

        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap table-layout-fixed">
                <thead>
                <tr>
                    %{--<domainSearchResult:header domain="assistBillQuery" property="flowNo"/>--}%
                    %{--<domainSearchResult:header domain="assistBillQuery" property="version"/>--}%
                    <domainSearchResult:header domain="assistBillQuery" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="assistBillQuery" property="receiptsName" width="120"/>
                    <domainSearchResult:header domain="assistBillQuery" property="belongtoOrg" width="120" popoverMessage="${message(code:"assistBillQuery.belongtoOrg.show-pop.label")}"/>
                    <domainSearchResult:header domain="assistBillQuery" property="directlyOrg" width="120" popoverMessage="${message(code:"assistBillQuery.directlyOrg.show-pop.label")}"/>
                    <domainSearchResult:header domain="assistBillQuery" property="salesman" width="80"/>
                    <domainSearchResult:header domain="assistBillQuery" property="launchTime" width="120"/>
                    <domainSearchResult:header domain="assistBillQuery" property="type" width="60"/>
                    <domainSearchResult:header domain="assistBillQuery" property="recoveryTime" width="60"/>
                    <domainSearchResult:header domain="assistBillQuery" property="status" width="60"/>
                    <th width="90"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="assistBillQueryInstance"
                               in="${assistBillQueryInstanceList}">
                    <tr>

                        %{--<domainSearchResult:rowData type="text" domain="assistBillQuery" property="flowNo"--}%
                        %{--domainInstance="${assistBillQueryInstance}"/>--}%
                        %{--<domainSearchResult:rowData type="text" domain="assistBillQuery" property="version"--}%
                        %{--domainInstance="${assistBillQueryInstance}"/>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="merchantCode"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="assistBillQuery" property="receiptsName"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="assistBillQuery" property="belongtoOrg"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="assistBillQuery" property="directlyOrg"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="assistBillQuery" property="salesman"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="launchTime"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <td align="center"><g:message
                                code="assistBillQuery.type.${assistBillQueryInstance.type}"/></td>
                        %{--<domainSearchResult:rowData type="text" domain="assistBillQuery" property="type"--}%
                        %{--domainInstance="${assistBillQueryInstance}"/>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="recoveryTime"
                                                    domainInstance="${assistBillQueryInstance}"/>
                        <td align="center"><g:message
                                code="assistBillQuery.status.${assistBillQueryInstance.status}"/></td>
                        %{--<domainSearchResult:rowData type="text" domain="assistBillQuery" property="status"--}%
                        %{--domainInstance="${assistBillQueryInstance}"/>--}%


                        <td align="left" class="tk-actions">
                            <g:if test="${assistBillQueryInstance.type == 'DISPATCH_ORDER' || assistBillQueryInstance.type == 'BACK_ORDER'}">
                                <g:if test="${assistBillQueryInstance.status == '1'}">
                                    <g:link controller="assistBillQuery" action="handleRetreat" class="handleOrder"
                                            params="[flowNo: assistBillQueryInstance?.flowNo, version: assistBillQueryInstance?.version, type: assistBillQueryInstance?.type,launchTime:assistBillQueryInstance?.launchTime,status:assistBillQueryInstance.status]"><g:message
                                            code="assistBillQuery.sign.label"/></g:link>
                                </g:if>
                                <g:if test="${assistBillQueryInstance.status == '2' && assistBillQueryInstance.orderLockMan == assistBillQueryInstance.userCode}">
                                    <g:link controller="assistBillQuery" action="handleRetreat" class="handleOrder"
                                            params="[flowNo: assistBillQueryInstance?.flowNo, version: assistBillQueryInstance?.version, type: assistBillQueryInstance?.type,launchTime:assistBillQueryInstance?.launchTime,status:assistBillQueryInstance.status]"><g:message
                                            code="assistBillQuery.handle.label"/></g:link>
                                </g:if>
                                <g:link controller="assistBillQuery" action="dispatchOrderShow" data-toggle="modal"
                                        data-target="#dispatchOrdershow"
                                        params="[flowNo: assistBillQueryInstance?.flowNo, type: assistBillQueryInstance?.type,launchTime:assistBillQueryInstance?.launchTime,status:assistBillQueryInstance.status]"><g:message
                                        code="assistBillQuery.viewDetails.label"/></g:link>
                            </g:if>
                            <g:if test="${assistBillQueryInstance.type == 'RISK_CHECK'}">
                                <g:if test="${assistBillQueryInstance.status == '1' }">
                                    <g:link controller="assistBillQuery" action="handleRisk" class="handleOrder"
                                            params="[flowNo: assistBillQueryInstance?.flowNo, version: assistBillQueryInstance?.version, type: assistBillQueryInstance?.type,launchTime:assistBillQueryInstance?.launchTime,status:assistBillQueryInstance.status]"><g:message
                                            code="assistBillQuery.sign.label"/></g:link>
                                </g:if>
                                <g:if test="${assistBillQueryInstance.status == '2' && assistBillQueryInstance.orderLockMan == assistBillQueryInstance.userCode }">
                                    <g:link controller="assistBillQuery" action="handleRisk" class="handleOrder"
                                            params="[flowNo: assistBillQueryInstance?.flowNo, version: assistBillQueryInstance?.version, type: assistBillQueryInstance?.type,launchTime:assistBillQueryInstance?.launchTime,status:assistBillQueryInstance.status]"><g:message
                                            code="assistBillQuery.handle.label"/></g:link>
                                </g:if>
                                <g:link controller="assistBillQuery" action="riskCheckShow" data-toggle="modal"
                                        data-target="#riskCheckShow"
                                        params="[flowNo: assistBillQueryInstance?.flowNo, type: assistBillQueryInstance?.type,launchTime:assistBillQueryInstance?.launchTime,status:assistBillQueryInstance.status]"><g:message
                                        code="assistBillQuery.viewDetails.label"/></g:link>
                            </g:if>
                            <g:if test="${assistBillQueryInstance.type == 'DISPATCH_TICKET'}">
                                <g:if test="${assistBillQueryInstance.status == '1' }">
                                    <g:link controller="assistBillQuery" action="handleVoucher" class="handleOrder"
                                            params="[flowNo: assistBillQueryInstance?.flowNo, version: assistBillQueryInstance?.version, type: assistBillQueryInstance?.type,launchTime:assistBillQueryInstance?.launchTime,status:assistBillQueryInstance.status]"><g:message
                                            code="assistBillQuery.sign.label"/></g:link>
                                </g:if>
                                <g:if test="${assistBillQueryInstance.status == '2' && assistBillQueryInstance.orderLockMan == assistBillQueryInstance.userCode}">
                                    <g:link controller="assistBillQuery" action="handleVoucher" class="handleOrder"
                                            params="[flowNo: assistBillQueryInstance?.flowNo, version: assistBillQueryInstance?.version, type: assistBillQueryInstance?.type,launchTime:assistBillQueryInstance?.launchTime,status:assistBillQueryInstance.status]"><g:message
                                            code="assistBillQuery.handle.label"/></g:link>
                                </g:if>
                                <g:link controller="assistBillQuery" action="dispatchTicketShow" data-toggle="modal"
                                        data-target="#dispatchTicketShow"
                                        params="[flowNo: assistBillQueryInstance?.flowNo, type: assistBillQueryInstance?.type,launchTime:assistBillQueryInstance?.launchTime,status:assistBillQueryInstance.status]"><g:message
                                        code="assistBillQuery.viewDetails.label"/></g:link>
                            </g:if>

                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${assistBillQueryInstanceCount != -1}">
            <component:paginate total="${assistBillQueryInstanceCount}"/>
        </g:if>

    </portlet:body>
</component:portlet>
<component:modals id="dispatchOrdershow" title="${message(code: 'assistBillQuery.dispatchOrderDetails.label')}"
                  width="full"/>
<component:modals id="dispatchTicketShow" title="${message(code: 'assistBillQuery.dispatchTicketDetails.label')}"
                  width="full"/>
<component:modals id="riskCheckShow" title="${message(code: 'assistBillQuery.riskCheckDetails.label')}"
                  width="full"/>
%{--<content tag="takin-footer">--}%
%{--<g:javascript>--}%
    %{--$(function () {--}%

    %{--});--}%
%{--</g:javascript>--}%
%{--</content>--}%