<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeMerchantManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title">操作记录</h4>
</div>
<div class="modal-body">

    <div class="row text-nowrap">
<component:portlet>
    <portlet:body>

        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>


                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="merchantCode"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="merchantName"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="rate1"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="newRate1"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="salesMan1" />
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="createDate1" />

                </tr>
                </thead>
                <tbody><g:each var="otherConsumeMerchantManagementInstance"
                               in="${otherConsumeMerchantManagementInstanceList }">
                    <tr>

                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="merchantCode" textAlign="center"
                                                    domainInstance="${otherConsumeMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="merchantName" textAlign="left"
                                                    domainInstance="${otherConsumeMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="rate" textAlign="right"
                                                    domainInstance="${otherConsumeMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="newRate" textAlign="right"
                                                    domainInstance="${otherConsumeMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="salesMan" textAlign="left"
                                                    domainInstance="${otherConsumeMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="merchantManagement" property="createDate" textAlign="center"
                                                    domainInstance="${otherConsumeMerchantManagementInstance }"/>
                        %{--<input type="text" name="inside" value="${otherConsumeMerchantManagementInstanceList.insideMerchantCode[0]}" style="display: none">--}%

                    </tr></g:each>
                </tbody>
            </table>

        </div>

    </portlet:body>
    <div class="col-md-12 text-center">
        <button class="btn btn-cancle" data-dismiss="modal" id="closed">关闭</button>
    </div>
</component:portlet>
    </div>


</div>
<div class="modal-footer"></div>