<component:portlet cssClass="scaffold-search">%{--
    <portlet:title
            title="${message(code: 'ordersQuery.search.label')}"
            iconCssClass="fa fa-filter"/>--}%


    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-filter"></i>
            <span class="caption-subject bold uppercase">查询条件</span>
            <span class="caption-helper"></span>
        </div>
        <div class="tools">
            <a target="_blank" href="${sms_front_url}/fromSspToHomePage.do?userName=${userName}&password=${passWord}&url=/posOrder/queryOrderList.do"><span class="caption-subject bold uppercase" style="color: red;text-decoration:underline">查看历史订单</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href=":;" class="collapse" data-original-title="" title=""> </a>

            <a href=":;" class="fullscreen" data-original-title="" title=""> </a>

        </div>
    </div>
    <portlet:body withForm="true">
        <form:form controller="ordersQuery" action="index"
                   name="scaffold-search-ordersQuery">
            <form:scaffoldSearchProperties/>
            <form:body>
            %{--订单查询条件--}%

                <div class="portlet-body form">
                    <div class="form-body">
                        <div class="form-group">
                            <domainSearch:datePicker domain="ordersQuery" property="orderDate"
                                                     dataDateFormat="yyyy-mm-dd"/>

                            <div class="col-md-3 btn-group" data-datepicker-target="orderDate" data-datepicker-format="yyyy-MM-dd">
                                <button type="button" class="btn btn-primary ssp-datepicker-thisweek"><g:message code="ordersQuery.thisWeek.label"></g:message> </button>
                                <button type="button" class="btn btn-primary ssp-datepicker-last1month"><g:message code="ordersQuery.last1month.label"></g:message></button>
                                <button type="button" class="btn btn-primary ssp-datepicker-last3month"><g:message code="ordersQuery.last3month.label"></g:message></button>
                            </div>

                            <domainSearch:select domain="ordersQuery" property="orderStatus" class="form-control"
                                                 from="${com.suixingpay.ssp.front.machines.OrdersQuery.getConstraintsMap()['orderStatus'].inList}"
                                                 name="q_orderStatus" valueMessagePrefix="ordersQuery.orderStatus"
                                                 value="${params ? params['q_orderStatus'] : ''}"
                                                 noSelection="['': '--请选择--']"/>
                        </div>
                    </div>
                    <div>
                    </div>
                </div>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-reset"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
