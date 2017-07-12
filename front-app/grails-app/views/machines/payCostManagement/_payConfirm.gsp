<%@ page import="com.suixingpay.ssp.front.machines.OrdersPay" %>
<div id="payConfirm">
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">
        <div class="widget-header">
            <h5 class="widget-title bigger">
                <i class="ace-icon fa fa-table"></i> <g:message code="ordersPay.payReminder.label"></g:message>
            </h5>
        </div>
    </h4>
</div>
<div class="modal-body">
    <portlet:body withForm="true">
        <form action="#" method="post">
            <input type="hidden" value="${goodsOrderId }" id="orderId"/>

           %{-- <div class="widget-body">
                <h3 class="smaller lighter green inline">&nbsp;&nbsp;&nbsp;&nbsp;</h3>
            </div>--}%
            <div class="col-md-12 text-center" id="body">
                <span style="color: green"><h4><g:message code="payCostManagement.payMessage.label"></g:message></h4></span>
            </div>

            <div class="col-md-12 text-center" id="body_" style="display: none">
                <span style="color: green"><h4>请去已打开的页面进行修改</h4></span>
            </div>


        </form>
    </portlet:body>
</div>
<div class="modal-footer">
    <div id="footer">
        <button class="btn btn-pay-ok payDone" type="button" id="successButton" onclick="payDone()">
            <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
            <g:message code="ordersPay.payCompletion.label"></g:message>
        </button>

        <button class="btn  btn-question payDone" type="button" id="failButton" onclick="payDone()">
            <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
            <g:message code="ordersPay.payProblem.label"></g:message>
        </button>
    </div>
    <div id="footer_" style="display: none">
        <button data-bb-handler="ok" type="button" class="btn btn-primary"  data-dismiss="modal" aria-hidden="true">确认</button>
    </div>

</div>
</div>
<g:javascript>

            $(function () {

                $("#footer").hide()
                $("#body").hide()
                $("#footer_").show()
                $("#body_").show()

            })

</g:javascript>