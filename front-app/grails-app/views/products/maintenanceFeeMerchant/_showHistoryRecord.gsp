<div class="modal-header ">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="maintenanceFeeMerchant.record.label"/> </h4>
</div>
<div class="modal-body">
    <div class="row">
        <component:portlet >
            <portlet:body>
                <div class="table-toolbar">
                    <div class="col-md-6 text-left"><lable><message:property domain="maintenanceFeeMerchant" property="merchantCode"/>：${merchantCode}</lable></div>
                    <div class="col-md-6 text-left text-nowrap"><lable><message:property domain="maintenanceFeeMerchant" property="merchantSalesSlipName"/>：${merchantSalesSlipName}</lable></div>
                </div>
                <div class="table-scrollable" style="max-height: 40rem; overflow-y: auto;">
                    <table  class="table table-striped table-bordered table-hover dataTable no-footer">
                        <thead>
                        <tr class="text-nowrap">
                            %{--<domainSearchResult:header domain="maintenanceFeeMerchant" property="operationType"/>--}%
                            <domainSearchResult:header domain="maintenanceFeeMerchant" property="beforeOperation"/>
                            <domainSearchResult:header domain="maintenanceFeeMerchant" property="afterOperation"/>
                            <domainSearchResult:header domain="maintenanceFeeMerchant" property="operator"/>
                            <domainSearchResult:header domain="maintenanceFeeMerchant" property="operationDateTime"/>
                        </tr>
                        </thead>
                        <tbody><g:each var="maintenanceFeeMerchantInstance"
                                       in="${maintenanceFeeMerchantInstanceList }">
                            <tr class="text-nowrap">

                                %{--<domainSearchResult:rowData type="inList" domain="maintenanceFeeMerchant" property="operationType"--}%
                                                            %{--domainInstance="${maintenanceFeeMerchantInstance }"/>--}%
                                <domainSearchResult:rowData type="inList" domain="maintenanceFeeMerchant" property="beforeOperation"
                                                            domainInstance="${maintenanceFeeMerchantInstance }"/>
                                <domainSearchResult:rowData type="inList" domain="maintenanceFeeMerchant" property="afterOperation"
                                                            domainInstance="${maintenanceFeeMerchantInstance }"/>
                                <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="operatorName"
                                                            domainInstance="${maintenanceFeeMerchantInstance }"/>
                                <domainSearchResult:rowData type="text" domain="maintenanceFeeMerchant" property="operationDateTime"
                                                            domainInstance="${maintenanceFeeMerchantInstance }"/>
                            </tr></g:each>
                        </tbody>
                    </table>
                </div>
            %{-- <component:paginate total="${maintenanceFeeMerchantInstanceCount }"/>--}%
            </portlet:body>
        </component:portlet>
    </div>
</div>
<div class="modal-footer">
</div>