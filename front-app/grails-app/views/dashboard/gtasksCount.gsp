<li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_barInHand">
    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
       data-close-others="true">
        <i class="icon-calendar"></i>
        <g:if test="${count}"><span class="badge badge-default">${count}</span></g:if>
    </a>
    <ul class="dropdown-menu">
        <li class="external">
            <h3>待办项 <span class="bold">(${count})</span></h3>
            %{--<a href="/dashboard/showGtasks"><span>查看所有系统待办项</span></a>--}%
        </li>
        <li>
            <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283">
                %{--<g:each in="${systemNoticeInstanceList}" var="systemNoticeInstance">--}%
                %{--<li>--}%
                %{--<a href="/systemNotice/index">--}%
                %{--<div class="subject">--}%
                %{--<div class="from">${systemNoticeInstance?.name}</div>--}%
                %{--<div class="time">${systemNoticeInstance?.publishDate}</div>--}%
                %{--</div>--}%
                %{--<div class="message">${systemNoticeInstance?.content}</div>--}%
                %{--</a>--}%
                %{--</li>--}%
                %{--</g:each>--}%
                <div class="portlet-body form">
                    <div class="table-scrollable" style="height: 350px;">
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
                                                                                    domainInstance="${dashBoardInstance}"
                                                                                    textAlign="center"/>
                                                <td align="center"><a href="/merchantAudit/index?homeIndex=true&taskType=MERCHANT_INCOME&taskStatus=7-10&q_startFlowTime_from=&q_startFlowTime_to=">
                                                    <span style="display: none">商户录入流程</span>
                                                    (${dashBoardInstance.dealtCount})
                                                </a></td>
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
                                                                            domainInstance="${dashBoardInstance}"
                                                                            textAlign="center"/>
                                                <td align="center"><a href="/merchantAudit/index?homeIndex=true&taskType=MERCHANT_MODIFY&taskStatus=7-10&q_startFlowTime_from=&q_startFlowTime_to=">
                                                    <span style="display: none">商户信息变更流程</span>
                                                    (${dashBoardInstance.dealtCount})
                                                </a></td>
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
                                                                            domainInstance="${dashBoardInstance}"
                                                                            textAlign="center"/>
                                                <td align="center"><a href="/assistBillQuery/index?homeIndex=true&q_type=DISPATCH_ORDER&q_status=1">
                                                    <span style="display: none">调单</span>
                                                    (${dashBoardInstance.dealtCount})
                                                </a></td>
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
                                                                            domainInstance="${dashBoardInstance}"
                                                                            textAlign="center"/>
                                                <td align="center"><a href="/assistBillQuery/index?homeIndex=true&q_type=BACK_ORDER&q_status=1">
                                                    <span style="display: none">退单</span>
                                                    (${dashBoardInstance.dealtCount})
                                                </a></td>
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
                                                                            domainInstance="${dashBoardInstance}"
                                                                            textAlign="center"/>
                                                <td align="center"><a href="/assistBillQuery/index?homeIndex=true&q_type=DISPATCH_TICKET&q_status=1">
                                                    <span style="display: none">凭证调取</span>
                                                    (${dashBoardInstance.dealtCount})
                                                </a></td>
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
                                                                            domainInstance="${dashBoardInstance}"
                                                                            textAlign="center"/>
                                                <td align="center"><a href="/assistBillQuery/index?homeIndex=true&q_type=RISK_CHECK&q_status=1">
                                                    <span style="display: none">风险协查</span>
                                                    (${dashBoardInstance.dealtCount})
                                                </a></td>
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
                                                                            domainInstance="${dashBoardInstance}"
                                                                            textAlign="center"/>
                                                <g:if test="${dashBoardInstance.dealtStatus == '待办理'}">
                                                    <td align="center"><a href="/customerServiceWorkOrder/index?homeIndex=true&q_orderStatus=1">
                                                        <span style="display: none">客服工单</span>
                                                        (${dashBoardInstance.dealtCount})
                                                    </a></td>
                                                </g:if>
                                                <g:else>
                                                    <td align="center"><a href="/customerServiceWorkOrder/index?homeIndex=true&q_orderStatus=2">
                                                        <span style="display: none">客服工单</span>
                                                        (${dashBoardInstance.dealtCount})
                                                    </a></td>
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
                                                                            domainInstance="${dashBoardInstance}"
                                                                            textAlign="center"/>
                                            <g:if test="${dashBoardInstance.dealtStatus == '待办理'}">
                                                <td align="center"><a href="/suiYiTongAuditDataQuery/index?homeIndex=true&q_orderStatus=2">
                                                    <span style="display: none">代理商随意通</span>
                                                    (${dashBoardInstance.dealtCount})
                                                </a></td>
                                            </g:if>
                                            <g:if test="${dashBoardInstance.dealtStatus == '审核驳回'}">
                                                <td align="center"><a href="/suiYiTongAuditDataQuery/index?homeIndex=true&q_orderStatus=-1">
                                                    <span style="display: none">代理商随意通</span>
                                                    (${dashBoardInstance.dealtCount})
                                                </a></td
                                            </g:if>
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
                                                                            domainInstance="${dashBoardInstance}"
                                                                            textAlign="center"/>
                                                <td align="center"><a href="/complianceRectificationMerchant/index?homeIndex=true&q_type=2">
                                                    <span style="display: none">合规整改</span>
                                                    (${dashBoardInstance.dealtCount})
                                                </a></td>
                                            </tr>
                                        </sec:access>
                                    </g:if>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>
            </ul>
        </li>
    </ul>
</li>

<g:javascript>

    function summaryInHand() {
        $.ajax({
            type: 'POST',
            url: "/dashboard/showGtasksCount",
            data: $('input[type="checkbox"]').serialize()
        }).done(function (data) {
            //更新右上角的角标
            $("#header_inbox_barInHand").remove()
            $('#header_inbox_barNotice').after(data)
            // $("#header_inbox_bar").html(data.children)

        });
    }
</g:javascript>