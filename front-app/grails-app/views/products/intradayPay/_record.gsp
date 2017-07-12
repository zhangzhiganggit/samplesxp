<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="intradayPay.record.label"/> </h4>
</div>
<div class="modal-body">

        <component:portlet cssClass="scaffold-searchResult">
            <portlet:body>
                <div class="table-toolbar">
                    <div class="col-md-4">
                        <label><message:property domain="intradayPay" property="merchantCode"/> :</label>
                        <label>${merchantCode}</label>
                    </div>
                    <div class="col-md-4">
                        <label><message:property domain="intradayPay" property="merchantSalesSlipName"/>:</label>
                        <label>${merchantSalesSlipName}</label>
                    </div>
                </div>
                <div class="table-scrollable" style="max-height: 40rem; overflow-y: auto;">
                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="intradayPay" property="operationType"/>
                    <domainSearchResult:header domain="intradayPay" property="operationBefore"/>
                    <domainSearchResult:header domain="intradayPay" property="operationAfter"/>
                    <domainSearchResult:header domain="intradayPay" property="personName"/>
                    <domainSearchResult:header domain="intradayPay" property="operationDateTime"/>
                </tr>
                </thead>
                <tbody><g:each var="intradayPayInstance"
                               in="${intradayPayInstanceList }">
                    <tr>
                        <domainSearchResult:rowData type="inList" domain="intradayPay" property="operationType"
                                                    domainInstance="${intradayPayInstance }"/>
                        <domainSearchResult:rowData type="text" domain="intradayPay" property="operationBefore"
                                                    domainInstance="${intradayPayInstance }"/>
                        <domainSearchResult:rowData type="text" domain="intradayPay" property="operationAfter"
                                                    domainInstance="${intradayPayInstance }"/>
                        <domainSearchResult:rowData type="text" domain="intradayPay" property="personName"
                                                    domainInstance="${intradayPayInstance }"/>
                        <domainSearchResult:rowData type="text" domain="intradayPay" property="operationDateTime"
                                                    domainInstance="${intradayPayInstance }"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
            %{-- <component:paginate total="${intradayPayInstanceCount }"/>--}%
            </portlet:body>
        </component:portlet>
</div>
<div class="modal-footer">
</div>