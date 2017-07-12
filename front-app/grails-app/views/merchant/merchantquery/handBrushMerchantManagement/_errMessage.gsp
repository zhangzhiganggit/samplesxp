<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="handBrushMerchantManagement.rateEditDetails.label"/></h4>
</div>
<div class="modal-body text-nowrap">
    <div class="row ">
        <component:portlet cssClass="scaffold-show ">
            <portlet:body withForm="true">
                    <form:body>
                        <h3 style="color:red" class="text-center">${message}</h3>
                        &nbsp; &nbsp;
                    </form:body>

            </portlet:body>

        </component:portlet>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-cancle" data-dismiss="modal">关闭</button>
    </div>

</div>


