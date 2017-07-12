<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
</head>
<component:portlet cssClass="scaffold-search">
    <button class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <portlet:body withForm="true">
        <form action="" method="post">
            <div class="widget-header">
                <h5 class="widget-title bigger">
                    <i class="ace-icon fa fa-table"></i> <g:message code="ordersPay.payReminder.label"></g:message>
                </h5>
            </div>
            %{-- <div class="widget-body">
                 <h3 class="smaller lighter green inline">&nbsp;&nbsp;&nbsp;&nbsp;</h3>
             </div>--}%
            <div class="col-md-12 text-center">
                <span style="color: green"><h4><g:message code="ordersPay.orderPaySucess.label"></g:message>,
               <g:message code="ordersPay.orderCodeIs.label"></g:message> </h4></span>
            </div>
      %{--      <div class="widget-body">
                <h3 class="smaller lighter green inline">&nbsp;&nbsp;订单支付成功，订单编号是：&nbsp;&nbsp;</h3>
            </div>--}%
            <div class="form-actions text-center widget-color-normal5">
                <button class="btn btn-next-pay " type="button" onclick="nextStep();">
                    <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                    <g:message code="ordersPay.goCart.label"></g:message>
                </button>

                <button class="btn  btn-question " type="button" onclick="nextStep()">
                    <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                    <g:message code="ordersPay.searchOrder.label"></g:message>
                </button>
            </div>
        </form>
    </portlet:body>
</component:portlet>
