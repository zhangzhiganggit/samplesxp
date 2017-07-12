    <g:if test="${dashBoardInstanceList.size()==0}">
        <div class="row">
            <a class="dashboard-stat dashboard-stat-v2 blue" href="javascript:void(0)">
                <div class="visual">
                    <i class="fa fa-comments"></i>
                </div>
                <div class="details">
                    <div class="number">无数据
                    </div>
                </div>
            </a>
        </div>
    </g:if>
    <table class="table table-striped table-bordered table-hover">
        <tbody>
            <g:each var="dashBoardInstance"
                       in="${dashBoardInstanceList}">
            %{--商户录入流程--}%
                <g:if test="${dashBoardInstance.dealtName == 'MERCHANT_INCOME'}">
                    <sec:access expression="hasRole('ROLE_AUTH_MERCHANT_AUDIT')">
                        <tr>
                            <td align="center"><g:message
                                        code="dashBoard.dealtName.${dashBoardInstance.dealtName}"/></td>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="dealtStatus"
                                                                domainInstance="${dashBoardInstance}" textAlign="center"/>
                            <td class="tk-actions" align="center">
                                <g:link class="homeTab" controller="merchantAudit"
                                        action="index" params="[homeIndex:'true',taskType:'MERCHANT_INCOME',taskStatus:'7-10',q_startFlowTime_from:'',q_startFlowTime_to:'']"><span style="display: none">商户录入流程</span>(${dashBoardInstance.dealtCount})</g:link>
                            </td>
                        </tr>
                    </sec:access>
                </g:if>
            %{--商户信息变更流程--}%
                <g:if test="${dashBoardInstance.dealtName == 'MERCHANT_MODIFY'}">
                    <sec:access expression="hasRole('ROLE_AUTH_MERCHANT_AUDIT')">
                        <tr>
                            <td align="center"><g:message
                            code="dashBoard.dealtName.${dashBoardInstance.dealtName}"/></td>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="dealtStatus"
                                                        domainInstance="${dashBoardInstance}" textAlign="center"/>
                            <td class="tk-actions" align="center">
                                <g:link class="homeTab" controller="merchantAudit"
                                        action="index" params="[homeIndex:'true',taskType:'MERCHANT_MODIFY',taskStatus:'7-10',q_startFlowTime_from:'',q_startFlowTime_to:'']"><span style="display: none">商户信息变更流程</span>(${dashBoardInstance.dealtCount})</g:link>
                            </td>
                        </tr>
                    </sec:access>
                </g:if>
            %{--调单--}%
                <g:if test="${dashBoardInstance.dealtName == 'DISPATCH_ORDER'}">
                    <sec:access expression="hasRole('ROLE_AUTH_ASSIST_BILL_QUERY')">
                        <tr>
                            <td align="center"><g:message
                            code="dashBoard.dealtName.${dashBoardInstance.dealtName}"/></td>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="dealtStatus"
                                                    domainInstance="${dashBoardInstance}" textAlign="center"/>
                            <td class="tk-actions" align="center">
                                <g:link class="homeTab" controller="assistBillQuery"
                                        action="index" params="[homeIndex:'true',q_type:'DISPATCH_ORDER',q_status:'1']"><span style="display: none">调单</span>(${dashBoardInstance.dealtCount})</g:link>
                            </td>
                        </tr>
                    </sec:access>
                </g:if>
            %{--退单--}%
                <g:if test="${dashBoardInstance.dealtName == 'BACK_ORDER'}">
                    <sec:access expression="hasRole('ROLE_AUTH_ASSIST_BILL_QUERY')">
                        <tr>
                            <td align="center"><g:message
                            code="dashBoard.dealtName.${dashBoardInstance.dealtName}"/></td>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="dealtStatus"
                                                        domainInstance="${dashBoardInstance}" textAlign="center"/>
                            <td class="tk-actions" align="center">
                                <g:link class="homeTab" controller="assistBillQuery"
                                        action="index" params="[homeIndex:'true',q_type:'BACK_ORDER',q_status:'1']"><span style="display: none">退单</span>(${dashBoardInstance.dealtCount})</g:link>
                            </td>
                        </tr>
                    </sec:access>
                </g:if>
            %{--凭证调取--}%
                <g:if test="${dashBoardInstance.dealtName == 'DISPATCH_TICKET'}">
                    <sec:access expression="hasRole('ROLE_AUTH_ASSIST_BILL_QUERY')">
                        <tr>
                            <td align="center"><g:message
                                code="dashBoard.dealtName.${dashBoardInstance.dealtName}"/></td>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="dealtStatus"
                                                        domainInstance="${dashBoardInstance}" textAlign="center"/>
                            <td class="tk-actions" align="center">
                                <g:link class="homeTab" controller="assistBillQuery"
                                        action="index" params="[homeIndex:'true',q_type:'DISPATCH_TICKET',q_status:'1']"><span style="display: none">凭证调取</span>(${dashBoardInstance.dealtCount})</g:link>
                            </td>
                        </tr>
                    </sec:access>
                </g:if>
            %{--风险协查--}%
                <g:if test="${dashBoardInstance.dealtName == 'RISK_CHECK'}">
                    <sec:access expression="hasRole('ROLE_AUTH_ASSIST_BILL_QUERY')">
                        <tr>
                            <td align="center"><g:message
                            code="dashBoard.dealtName.${dashBoardInstance.dealtName}"/></td>
                            <domainSearchResult:rowData type="text" domain="dashBoard" property="dealtStatus"
                                                        domainInstance="${dashBoardInstance}" textAlign="center"/>
                            <td class="tk-actions" align="center">
                                <g:link class="homeTab" controller="assistBillQuery"
                                        action="index" params="[homeIndex:'true',q_type:'RISK_CHECK',q_status:'1']"><span style="display: none">风险协查</span>(${dashBoardInstance.dealtCount})</g:link>
                            </td>
                        </tr>
                    </sec:access>
                </g:if>
            %{--客服工单--}%
                <g:if test="${dashBoardInstance.dealtName == 'CUSTOMER_SERVICE_WORK_ORDER'}">
                    <sec:access expression="hasRole('ROLE_AUTH_CUSTOMER_SERVICE')">
                        <tr>
                            <td align="center"><g:message
                                    code="dashBoard.dealtName.${dashBoardInstance.dealtName}"/></td>

                            <domainSearchResult:rowData type="text" domain="dashBoard" property="dealtStatus"
                                                            domainInstance="${dashBoardInstance}" textAlign="center"/>
                            <g:if test="${dashBoardInstance.dealtStatus == '待办理'}">
                                <td class="tk-actions" align="center">
                                    <g:link class="homeTab" controller="customerServiceWorkOrder"
                                            action="index" params="[homeIndex:'true',q_orderStatus:'1']"><span style="display: none">客服协办</span>(${dashBoardInstance.dealtCount})</g:link>
                                </td>
                            </g:if>
                            <g:else>
                                <td class="tk-actions" align="center">
                                    <g:link class="homeTab" controller="customerServiceWorkOrder"
                                            action="index" params="[homeIndex:'true',q_orderStatus:'2']"><span style="display: none">客服协办</span>(${dashBoardInstance.dealtCount})</g:link>
                                </td>
                            </g:else>
                        </tr>
                    </sec:access>
                </g:if>
            %{--代理商随意通--}%
                <g:if test="${dashBoardInstance.dealtName == 'AGENT_SUIYITONG'}">
                    <sec:access expression="hasRole('ROLE_AUTH_SUIYITONG_AUDITDATAQUERY')">
                        <tr>
                            <td align="center"><g:message
                            code="dashBoard.dealtName.${dashBoardInstance.dealtName}"/></td>

                            <domainSearchResult:rowData type="text" domain="dashBoard" property="dealtStatus"
                                                        domainInstance="${dashBoardInstance}" textAlign="center"/>
                            <td class="tk-actions" align="center">
                                <g:link class="homeTab" controller="suiYiTongAuditDataQuery"
                                        action="index" params="[homeIndex:'true']"><span style="display: none">代理商随意通</span>(${dashBoardInstance.dealtCount})</g:link>
                            </td>
                        </tr>
                    </sec:access>
                </g:if>

            %{--合规整改--}%
                <g:if test="${dashBoardInstance.dealtName == 'COMPLIANCE_RECTIFICATION'}">
                    <sec:access expression="hasRole('ROLE_AUTH_COMPLIANCE_RECTIFICATION')">
                        <tr>
                            <td align="center"><g:message
                            code="dashBoard.dealtName.${dashBoardInstance.dealtName}"/></td>

                            <domainSearchResult:rowData type="text" domain="dashBoard" property="dealtStatus"
                                                        domainInstance="${dashBoardInstance}" textAlign="center"/>
                            <td class="tk-actions" align="center">
                                <g:link class="homeTab" controller="complianceRectificationMerchant"
                                        action="index" params="[homeIndex:'true',q_type:'2']"><span style="display: none">合规整改</span>(${dashBoardInstance.dealtCount})</g:link>
                            </td>
                        </tr>
                    </sec:access>
                </g:if>
            </g:each>
        </tbody>
    </table>


