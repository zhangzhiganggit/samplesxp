<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeMerchantManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title">其他消费商户基本详情查看</h4>
</div>
<div class="modal-body">

    <div class="row text-nowrap">
        <component:portlet cssClass="scaffold-show">


            <portlet:body withForm="true">
                <form:form action="index">
                    <form:body>
                        <formCommon:hiddenField name="id" value="${otherConsumeMerchantManagementInstance?.id}"/>



                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="merchantCode"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>

                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="merchantRegistName"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>

                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="mobileNo"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>

                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="businessClassify"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="managePersonName"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="managePersonIdCardNo"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="authenticationStatus"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="status"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="manageAddress"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="belongToOrg"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="directlyOrg"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="salesMan"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="createDate"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                        <domainShow:displayString domain="otherConsumeMerchantManagement" property="rate"
                                                  domainInstance="${otherConsumeMerchantManagementInstance}"/>
                    </form:body>

                </form:form>
            </portlet:body>
        </component:portlet>
    </div>


</div>
<div class="modal-footer">
    <button type="button" class="btn btn-ok center-block" data-dismiss="modal">关闭</button>

</div>