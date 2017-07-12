<%@ page import="com.suixingpay.ssp.front.machines.OrdersQuery" %>
<component:portlet cssClass="scaffold-searchResult">
    <portlet:body>
        <form:form action="index">
        %{--第一行收货人，订单编号等信息--}%
            <div class="form-group">
                <div class="col-md-5">
                    <div class="col-md-6">
                        <label class="col-md-6 control-label"><g:message
                                code="ordersQuery.orderCode.label"/></label>

                        <div class="col-md-6">
                            <span class="form-control-static">${ordersQueryInstance.orderCode}</span>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label class="col-md-6 control-label"><g:message
                                code="ordersQuery.orderStatus.label"/></label>

                        <div class="col-md-6">
                            <span class="form-control-static"><g:message code="ordersQuery.orderStatus.${ordersQueryInstance.orderStatus}"></g:message></span>
                        </div>
                    </div>
                </div>

                <div class="col-md-5">
                    <div class="col-md-6">
                        <label class="col-md-6 control-label"><g:message
                                code="ordersQuery.arriveGoodsPerson.label"/></label>

                        <div class="col-md-6">
                            <span class="form-control-static">${ordersQueryInstance.arriveGoodsPerson}</span>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label class="col-md-6 control-label"><g:message
                                code="ordersQuery.contactNumber.label"/></label>

                        <div class="col-md-6">
                            <span class="form-control-static">${ordersQueryInstance.contactNumber}</span>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label class="col-md-6 control-label"><g:message
                                code="ordersQuery.deliveryArrive.label"/></label>

                        <div class="col-md-6">
                            <span class="form-control-static text-nowrap">${ordersQueryInstance.deliveryArrive}</span>
                        </div>
                    </div>
                </div>

                <div class="col-md-2">
                    <button type="button" class="btn btn-return" onclick="history.go(-1)">
                        <g:message code="merchantTerminalManagement.back.label"></g:message>
                    </button>
                </div>
            </div>

            <g:each var="transferInfoInstance" in="${transferInfoInstanceList}">
                <div class="border-order">
                    <table class="table-scrollable table-scrollable-borderless  table table-hover table-light">
                        <tr>
                            <td>
                                <div class="col-md-5">
                                    <label class="control-label"><strong><g:message code="ordersQuery.orderGoodsShippingInformation.label"></g:message></strong></label>
                                </div>

                                <div class="col-md-4">
                                    <label class="col-md-4 control-label"><g:message
                                            code="transferInfo.goodsTransferId.label"></g:message></label>

                                    <div class="col-md-8">
                                        <span class="form-control-static">${transferInfoInstance.goodsTransferId}</span>
                                    </div>
                                </div>
                            </td>
                        </tr>

                    %{--物品信息--}%
                        <g:each in="${transferInfoInstance.transferDetailList}" var="orderInfoInstance">
                            <tr>

                                <td><div class="form-group">
                                    %{--图片信息--}%
                                    <div class="col-md-5">
                                        <div class="col-md-6" ><g:set var="path" value="${orderInfoInstance?.imagePath}"/>
                                            <img style="width: 180px;height: 120px" class="lazy"  data-original="<g:createLink controller="deviceOrder" action="viewImage" params="[title: path]"/>"  src="/assets/default.jpg"/>
                                        </div>
                                        <label class="col-md-6">${raw(orderInfoInstance?.goodsName)}</label>
                                        %{--<div class="col-md-5 control-label">${orderInfoInstance.imagePath}</div>--}%
                                    </div>

                                    <div class="col-md-1">
                                        <g:img src="order.png"></g:img>
                                        <span class="form-control-static text-nowrap"> ${orderInfoInstance?.orderInputDate}</span>
                                    </div>

                                    <div class="col-md-1">
                                        <g:img src="arrow.png"></g:img>
                                    </div>

                                    <div class="col-md-1">
                                        <g:img src="pay-ok.png"></g:img>
                                        <span class="form-control-static text-nowrap"> ${orderInfoInstance?.orderPaymentDate}</span>
                                    </div>

                                    <div class="col-md-1">
                                        <g:img src="arrow.png"></g:img>
                                    </div>

                                    <div class="col-md-1">
                                        <g:img src="goods.png"></g:img>
                                        <span class="form-control-static text-nowrap"> ${orderInfoInstance?.sendDate}</span>

                                    </div>

                                    <div class="col-md-1">
                                        <g:img src="arrow.png"></g:img>
                                    </div>

                                    <div class="col-md-1">
                                        <g:img src="submin-ok.png"></g:img>
                                    </div>


                                </div></td>
                            </tr>
                        </g:each>
                        <tbody>
                        %{--订单编号--}%
                        <tr>
                            <td><div class="row">

                                <div class="col-md-6">
                                    <div class="col-md-6">
                                        <lable class="col-md-6 control-label"><g:message
                                                code="ordersQuery.orderCode.label"></g:message></lable>

                                        <div class="col-md-6">
                                            <span class="form-control-static">${ordersQueryInstance.orderCode}</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="col-md-8">
                                        <lable class="col-md-6 control-label"><g:message
                                                code="transferInfo.goodsTransferId.label"></g:message></lable>

                                        <div class="col-md-6">
                                            <span class="form-control-static">${transferInfoInstance.goodsTransferId}</span>
                                        </div>
                                    </div>
                                </div>
                            </div></td>
                        </tr>
                        %{--物流信息--}%
                        <g:each in="${transferInfoInstance.trackDetailList}" var="trackQueryInstance">
                            <tr>
                                <td>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="col-md-6">
                                                <lable class="col-md-6 control-label"><g:message
                                                        code="trackQueryInstance.logisticsCompany.label"></g:message></lable>

                                                <div class="col-md-6">
                                                    <span class="form-control-static">${
                                                        trackQueryInstance.logisticsCompany}</span>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <lable class="col-md-6 control-label"><g:message
                                                        code="trackQueryInstance.logisticsNo.label"></g:message></lable>

                                                <div class="col-md-6">
                                                    <span class="form-control-static">${trackQueryInstance.logisticsNo}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    %{--虚线框--}%
                                    <div class="dotted-div">
                                    ${raw(trackQueryInstance.trackInfo)}
                                    </div>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>

                    </table>
                </div>
            </g:each>

        </form:form>

    </portlet:body>
    <content tag="takin-footer">
        <asset:javascript src="/jquery.lazyload.js"/>

        <g:javascript>
        $(function () {
              $("img.lazy").lazyload();
        })
        </g:javascript>
    </content>

</component:portlet>

