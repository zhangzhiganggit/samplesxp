<%@ page import="com.suixingpay.ssp.front.machines.OrdersPay" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">
        %{--<input type="hidden" value="${goodsOrderId }" id="orderId"/>--}%
        <g:message code="ordersPay.promptInfo.label"></g:message>
    </h4>
</div>
<div class="modal-body">
    <portlet:body withForm="true">
        <form action="#" method="post">
            <div style="font-size: 20px;color:green" class="text-center">
                <g:message code="ordersPay.payMessage.label"></g:message> </div>
            <div class="form-actions text-center widget-color-normal5">

            </div>
        </form>
    </portlet:body>
</div>
<div class="modal-footer">
    <button type="button" class="btn  btn-pay" data-dismiss="modal"><g:message code="ordersPay.goPay.label"></g:message></button>

    <g:link controller="ordersQuery" action="index" params="[searchWeek:true,offset:1]" class="btn  btn-ok payDone" id="failButton">
        <g:message code="ordersPay.leave.label"></g:message>
    </g:link>
</div>