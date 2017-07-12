<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'ordersQuery'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
    %{--订单查询结果--}%
        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <domainSearchResult:header domain="ordersQuery" property="orderCode" width="60"/>
                    <domainSearchResult:header domain="ordersQuery" property="orderAmountReceivable" width="90"/>
                    <domainSearchResult:header domain="ordersQuery" property="orderPaidAmount" width="90"/>
                    <domainSearchResult:header domain="ordersQuery" property="total" width="60"/>
                    <domainSearchResult:header domain="ordersQuery" property="payMod" width="80"/>
                    <domainSearchResult:header domain="ordersQuery" property="orderStatus" width="80"/>
                    <domainSearchResult:header domain="ordersQuery" property="orderCreateDate" width="90"/>
                    <domainSearchResult:header domain="ordersQuery" property="orderPayDate" width="90"/>
                    <domainSearchResult:header domain="ordersQuery" property="arriveGoodsPerson" width="60"/>
                    <th width="160"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="ordersQueryInstance"
                               in="${ordersQueryInstanceList}">
                    <tr class="text-nowrap">
                        <domainSearchResult:rowData textAlign="center" type="text" domain="ordersQuery" property="orderCode"
                                                    domainInstance="${ordersQueryInstance}"/>
                        <domainSearchResult:rowData  type="text" domain="ordersQuery" property="orderAmountReceivable"
                                                    domainInstance="${ordersQueryInstance}" textAlign="right"/>
                        <domainSearchResult:rowData type="text" domain="ordersQuery" property="orderPaidAmount"
                                                    domainInstance="${ordersQueryInstance}" textAlign="right"/>
                        <domainSearchResult:rowData type="text" domain="ordersQuery" property="total"
                                                    domainInstance="${ordersQueryInstance}" textAlign="right"/>
                        <domainSearchResult:rowData  type="inList" domain="ordersQuery" property="payMod"
                                                    domainInstance="${ordersQueryInstance}" />
                        <domainSearchResult:rowData type="inList" domain="ordersQuery" property="orderStatus"
                                                    domainInstance="${ordersQueryInstance}" textAlign="left"/>
                        <domainSearchResult:rowData textAlign="center" type="date" domain="ordersQuery" property="orderCreateDate"
                                                    domainInstance="${ordersQueryInstance}" />
                        <domainSearchResult:rowData textAlign="center" type="date" domain="ordersQuery" property="orderPayDate"
                                                    domainInstance="${ordersQueryInstance}"/>
                        <domainSearchResult:rowData type="text" domain="ordersQuery" property="arriveGoodsPerson"
                                                    domainInstance="${ordersQueryInstance}" textAlign="left"/>


                        <td class="tk-actions">
                        <!--判断如果为余额支付的订单，不显示操作链接-->
                        <g:if test="${ordersQueryInstance?.realPayMod!=7}">
                        <!--TODO 暂时以订货状态的作为测试数据订单状态为部分发货或全部发货时，点击查看按钮可查看到订单追踪信息-->
                             <g:if test="${ordersQueryInstance?.orderStatus == 41 || ordersQueryInstance?.orderStatus == 42}">
                                 <g:link controller="ordersQuery" action="transferDetailView" id="${ordersQueryInstance?.orderCode}"><g:message
                                         code="default.button.show.label"/></g:link>
                             </g:if>
                             <g:else >
                                 <g:link controller="ordersQuery" action="detailView" id="${ordersQueryInstance?.orderCode}" params="[type:'ordersQuery']"><g:message
                                         code="default.button.show.label"/></g:link>
                             </g:else>
                            <g:link controller="ordersQuery" class="oneMoreOrder" onclick="return checkDiscount(${ordersQueryInstance?.orderCode});" action="oneMoreOrder" id="${ordersQueryInstance?.orderCode}"> <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                    code="ordersQuery.buyNow.show-pop.label"></g:message>"></i><g:message code="ordersQuery.buyNow.label"></g:message> </g:link>
                             <g:if test="${ordersQueryInstance?.orderStatus == 11}"><a onclick="cancelOrder(${ordersQueryInstance?.orderCode})">
                                 <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                         code="ordersQuery.orderStatus.61.show-pop.label"></g:message>"></i><g:message code="ordersQuery.orderStatus.61"></g:message> </a></g:if>
                        </g:if>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${ordersQueryInstanceCount != -1}">
            <component:paginate total="${ordersQueryInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/machines/deviceOrder.js"/>
    <asset:javascript src="/machines/orderQuery.js"/>
        <g:javascript>
            $(function(){
                $('#showHistory').on('click', function (e) {
                    e.preventDefault();
                    var id = "queryOrderList";
                    var name = this.text;
                    var href = this.href;
                    parent.$("#ANewWindow").trigger('openNewWindowchanged', [id, name, href]);
                })
                $(".btn-reset").on('click',function(e) {
                    e.preventDefault();
                    resetDate();
                });
            });
        </g:javascript>
</content>