<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.show.label" args="[message.domain(domain: 'deviceOrder')]"/></title>
</head>

<component:portlet>
<div class="portlet-title">
    <div class="caption">
        <i class="fa fa-filter"></i>
        <span class="caption-subject bold uppercase"><g:message code="deviceOrder.orderConfirm.label"></g:message> </span>
        <span class="caption-helper"></span>
    </div>

            <div style="color: red;margin-bottom: 10px;margin-top: 10px;" class="col-md-8 col-sm-8 col-xs-8">
               <strong>
                   <g:message code="ordersQuery.remind.label"></g:message>:<g:message
                           code="deviceOrder.remindMessage.label"></g:message>
               </strong>
            </div>

</div>
<!--提示信息-->
    <portlet:body withForm="true">
<table class="table table-striped table-bordered table-hover dataTable no-footer">
    <div class="row">

        <tr>
            <td colspan="5"><g:message code="ordersQuery.arriveGoodsPersonInformation.label"></g:message></td>
        </tr>
    </div>
    <!-- 收货地址-->
    <tr>
        <td colspan="5">
            <div >
                ${ordersQueryInstance.arriveGoodsPerson}&nbsp;&nbsp;${ordersQueryInstance.deliveryArrive}&nbsp;&nbsp;${ordersQueryInstance.contactNumber}
            </div>
        </td>

    </tr>

</table>
<table class="table table-striped table-bordered table-hover dataTable no-footer">
    <tr>

        <domainSearchResult:header domain="deviceOrder" property="orderList"/>
        <domainSearchResult:header domain="deviceOrder" property="quantity"/>
        <domainSearchResult:header domain="deviceOrder" property="unitPrice"/>
        <domainSearchResult:header domain="deviceOrder" property="preferential"/>
        <domainSearchResult:header domain="deviceOrder" property="subtotal"/>
    </tr>

%{--第一行--}%
    <g:each var="deviceOrderInstance"
            in="${orderDetailList}">
        <g:hiddenField value="${deviceOrderInstance.priceId}" name="priceId"/>
        <tr role="row" class="odd">
            <td class="col-md-8  col-sm-8 col-xs-8">
                <div class="col-md-3  col-sm-3 col-xs-3">
                    <g:set var="path" value="${deviceOrderInstance?.imagePath}"/>
                    <img style="width: 150px;height:100px" class="lazy"  data-original="<g:createLink controller="deviceOrder" action="viewImage" params="[title: path]"/>"  src="/assets/default.jpg"/>
                </div>

                <div class="col-md-9 col-sm-9 col-xs-9">
                    <div class="row">${raw(deviceOrderInstance.goodsName)}
                        <g:if test="${deviceOrderInstance.isGift=='1'}">
                            <span class="label label-sm label-danger"><small><g:message
                                    code="ordersQuery.isGift.label"></g:message></small></span></g:if>
                    </div>

                </div>
            </td>
            <div class="row">
                <domainSearchResult:rowData type="text" textAlign="right" domain="deviceOrder" property="orderQuantity"
                                            domainInstance="${deviceOrderInstance}"/>

                <domainSearchResult:rowData type="text"  textAlign="right" domain="deviceOrder" property="unitPrice"
                                            domainInstance="${deviceOrderInstance}"/>
                <domainSearchResult:rowData type="text"  textAlign="right" domain="deviceOrder" property="itemDiscountAmount"
                                                domainInstance="${deviceOrderInstance}"/>
                <domainSearchResult:rowData type="text"  textAlign="right" domain="deviceOrder" property="itemTotalAmount"
                                            domainInstance="${deviceOrderInstance}"/>
            </div>
        </tr>
        <g:if test="${deviceOrderInstance.freeGiftsQuantity != null && justView}">
        <tr role="row" class="odd">
            <td class="col-md-8 col-sm-8 col-xs-8">
                <div class="col-md-3 col-sm-3 col-xs-3">
                    <g:set var="path" value="${deviceOrderInstance.imagePath}"/>
                    %{--<img style="width: 150px;height:90px" src="<g:createLink controller="deviceOrder" action="viewImage" params="[title: path]"/>"/>--}%
                </div>

                <div class="col-md-6 col-sm-6 col-xs-6">
                    <div class="row">${deviceOrderInstance.freeModelName}</div>
                </div>
            </td>

            <div class="row">
                <domainSearchResult:rowData type="number" domain="deviceOrder" property="freeGiftsQuantity"
                                            domainInstance="${deviceOrderInstance}"/>
            </div>
        </tr>
        </g:if>
    </g:each>
%{--第四行--}%

    <tr role="row" class="odd">
        <td colspan="5"><div style="float:left; text-align: center ;height: 50px; width: 8%;"><g:message code="ordersQuery.remark.label"></g:message>:</div>
            <div style="float:left;text-align: left;width: 90%"><small style="color: grey"><textarea
                 name="remark" style="height: 50px" cols="110" id="remarkText" placeholder="最多可输入200个汉字"
                disabled>${ordersQueryInstance.remark}</textarea></small></div></td>
    </tr>
    %{--第五行--}%
    <tr role="row" class="odd">
        <td colspan="5">
            <dd style="line-height: 20px"><g:message code="ordersQuery.aggregate.label"></g:message>0<g:message
                    code="ordersQuery.bountyMessage.label"></g:message>￥0.00</dd>

            <div style="height:0px;border-top:1px grey dashed;"/>
        </div>
        </td>
    </tr>


</table>
<div class="row">
<div class="form-group">
    <div class="col-md-2 col-sm-2 col-xs-2 text-left">
        <g:message code="ordersQuery.orderAmountReceivable.label"></g:message>
    </div>
    <label>￥${ordersQueryInstance.orderAmountReceivable}</label>
</div>
<div class="form-group">
    <div class="col-md-2 col-sm-2 col-xs-2 text-left">
        <g:message code="ordersQuery.cutAmount.label"></g:message>
    </div>
    <label>￥${ordersQueryInstance.cutAmount}</label>
</div>
<div class="form-group">
    <div class="col-md-2 col-sm-2 col-xs-2 text-left">
        <g:message code="ordersQuery.usedBounty.label"></g:message>
    </div>
    <label>￥${ordersQueryInstance.usedBounty}</label>
</div>
<div class="form-group">
    <div class="col-md-2 col-sm-2 col-xs-2 text-left">
        <g:message code="ordersQuery.orderPaidAmount.label"></g:message>
    </div>
    <label>￥${ordersQueryInstance.orderPaidAmount}</label>
</div>
</div>

%{--<tr role="row" class="odd">
    <td colspan="5">
        <div class="text-right form-group">
            <button type="button" class="btn btn-submit" onclick="confirmDeviceOrder();"><g:message
                    code="deviceOrder.orderConfirm.label"></g:message></button>
            <button type="button" class="btn btn-return" onclick="goToCart()"><g:message
                    code="deviceOrder.return.label"></g:message></button>
        </div>
    </td>
</tr>--}%

    <tr role="row" class="odd">
        <td colspan="5">
            <div class="text-right form-group">
                <form:form controller="ordersPay" action="index">
                    <form:body>
                        <g:hiddenField name="goodsOrderId" value="${ordersQueryInstance?.orderCode}"></g:hiddenField>
                        <input type="hidden" name="onlinepay" id="onlinepay"/>
                        <input type="hidden" name="remintpay" id="remintpay"/>
                    </form:body>
                    <form:actions>
                        <g:if test="${!justView}">
                            <formActions:submit value="${message(code: 'ordersQuery.toPay.button')}" id="detailViewToPay"
                                                btnCssClass="btn btn-pay"/>
                        </g:if>
                        <g:if test="${params.type =='ordersQuery'}">
                            <g:link controller="ordersQuery" action="index" class="btn btn-return"><g:message code="deviceOrder.return.label"></g:message> </g:link>
                        </g:if>
                        <g:if test="${params.type =='creditInfo'}">
                            <g:link controller="creditUsageAndRepageDetail" action="index" class="btn btn-return" id="${params.creditId}"><g:message code="deviceOrder.return.label"></g:message> </g:link>
                        </g:if>

                    </form:actions>
                </form:form>
                </div>
        </td>
    </tr>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/machines/deviceOrder.js"/>
    <asset:javascript src="/machines/orderQuery.js"/>
    <asset:javascript src="/jquery.lazyload.js"/>
    <g:javascript>
        $(function () {
            $("img.lazy").lazyload();
        })
    </g:javascript>
</content>
</html>
