<%@ page import="com.suixingpay.ssp.front.products.SecondsReceived" %>
<div class="modal-header ">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="secondsReceived.rateDetail.label"></g:message> </h4>
</div>
<component:portlet cssClass="scaffold-show">
    %{--<portlet:title--}%
            %{--title="${message(code: 'default.show.label', args: message.domain(domain: 'secondsReceived'))}"/>--}%
    <portlet:body withForm="true">
        <form:form action="index" params="[]">
            <form:body>

                
                <domainShow:displayString domain="secondsReceived" property="merchantCode"
                                          domainInstance="${secondsReceivedInstance}"/>


                <domainShow:displayString domain="secondsReceived" property="receiptsName"
                                          domainInstance="${secondsReceivedInstance}"/>


                <domainShow:displayString domain="secondsReceived" property="rateType"
                                          domainInstance="${secondsReceivedInstance}"/>


                <domainShow:displayNumber domain="secondsReceived" property="effectiveDate"
                                          domainInstance="${secondsReceivedInstance}"/>



                <domainShow:displayString domain="secondsReceived" property="invalidDate"
                                          domainInstance="${secondsReceivedInstance}"/>

                <div class="table-scrollable">
                    <table class="table table-striped table-bordered table-hover dataTable no-footer">
                        <thead>
                        <tr>

                            <domainSearchResult:header domain="secondsReceived" property="rules"/>
                            <domainSearchResult:header domain="secondsReceived" property="rateDetail"/>
                            <domainSearchResult:header domain="secondsReceived" property="fixedFee"/>
                            <domainSearchResult:header domain="secondsReceived" property="topAmount"/>
                            <domainSearchResult:header domain="secondsReceived" property="lowCharge"/>
                        </tr>
                        </thead>
                        <tbody><g:each var="secondsReceivedInstance"
                                       in="${rateList }">
                            <tr class="text-nowrap">
                                <domainSearchResult:rowData type="text" domain="secondsReceived" property="rules"
                                                            domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                                <domainSearchResult:rowData type="text" domain="secondsReceived" property="rateDetail"
                                                            domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                                <domainSearchResult:rowData type="text" domain="secondsReceived" property="fixedFee"
                                                            domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                                <domainSearchResult:rowData type="text" domain="secondsReceived" property="topAmount"
                                                            domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                                <domainSearchResult:rowData type="text" domain="secondsReceived" property="lowCharge"
                                                            domainInstance="${secondsReceivedInstance }" textAlign="center"/>
                            </tr></g:each>
                        </tbody>
                    </table>
                </div>
            <div class="col-md-12 text-center">
                <div class="col-md-12 text-center"><button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="secondsReceived.return.label"></g:message> </button></div>
            </div>
            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>
