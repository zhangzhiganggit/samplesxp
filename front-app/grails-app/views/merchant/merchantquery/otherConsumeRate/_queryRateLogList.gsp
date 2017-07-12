<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeRate" %>
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


                    <domainSearchResult:header domain="otherConsumeRate" property="merchantCode"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="receiptsName"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="beforEditRate"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="operation"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="afterEditRate"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="operId" />
                    <domainSearchResult:header domain="otherConsumeRate" property="operDate" />

                </tr>
                </thead>
                <tbody><g:each var="otherConsumeRateInstance"
                               in="${otherConsumeRateInstanceList }">
                    <tr>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeRate" property="merchantCode"
                                                    domainInstance="${otherConsumeRateInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeRate" property="receiptsName"
                                                    domainInstance="${otherConsumeRateInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="otherConsumeRate" property="beforEditRate"
                                                    domainInstance="${otherConsumeRateInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeRate" property="operation"
                                                    domainInstance="${otherConsumeRateInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="otherConsumeRate" property="afterEditRate"
                                                    domainInstance="${otherConsumeRateInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeRate" property="operId"
                                                    domainInstance="${otherConsumeRateInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeRate" property="operDate"
                                                    domainInstance="${otherConsumeRateInstance }"/>
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
