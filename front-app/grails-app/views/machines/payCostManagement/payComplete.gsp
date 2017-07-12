<%@ page import="com.suixingpay.ssp.front.machines.OrdersPay" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form action="" method="post">
            <input type="hidden" value="${goodsOrderId }" id="orderId"/>
            <div class="widget-header">
                <h5 class="widget-title bigger">
                    <i class="ace-icon fa fa-table"></i> 支付提示
                </h5>
            </div>
            <div class="widget-body">
                <h3 class="smaller lighter green inline">&nbsp;&nbsp;订单支付成功，订单编号是：&nbsp;&nbsp;</h3>
            </div>
            <div class="form-actions center widget-color-normal5">
                <h3 class="smaller lighter green inline">&nbsp;&nbsp;继续订购&nbsp;&nbsp;</h3>

                <h3 class="smaller lighter green inline">&nbsp;&nbsp;进入订单查询&nbsp;&nbsp;</h3>
            </div>
        </form>
    </portlet:body>
</component:portlet>
