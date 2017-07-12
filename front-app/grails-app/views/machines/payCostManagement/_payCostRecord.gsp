<%@ page import="com.suixingpay.ssp.front.machines.PayCostManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">
        <div class="widget-header">
            <h5 class="widget-title bigger">
                <i class="ace-icon fa fa-table"></i> <g:message
                    code="payCostManagement.payCostRecord.label"></g:message>
            </h5>
        </div>
    </h4>
</div>

<div class="modal-body">
    <div class="table-scrollable">
        <table class="table table-striped table-bordered table-hover dataTable no-footer">
            <thead>
            <tr>
                <domainSearchResult:header domain="payCostManagement" property="onlinePayNo"/>
                <domainSearchResult:header domain="payCostManagement" property="cardNumber"/>
                <domainSearchResult:header domain="payCostManagement" property="validDate"/>
                <domainSearchResult:header domain="payCostManagement" property="payCostDate"/>
                <domainSearchResult:header domain="payCostManagement" property="operator"/>
                <domainSearchResult:header domain="payCostManagement" property="payCostAmount"/>
            </tr>
            </thead>
            <tbody>
            <g:each var="payCostManagementInstance"
                    in="${payCostManagementInstanceList}">
                <tr>
                    <domainSearchResult:rowData type="text" domain="payCostManagement" property="onlinePayNo"
                                                domainInstance="${payCostManagementInstance}"/>
                    <domainSearchResult:rowData type="text" domain="payCostManagement" property="cardNumber"
                                                domainInstance="${payCostManagementInstance}"/>
                    <domainSearchResult:rowData type="date" domain="payCostManagement" property="validDate"
                                                domainInstance="${payCostManagementInstance}"/>
                    <domainSearchResult:rowData type="date" domain="payCostManagement" property="payCostDate"
                                                domainInstance="${payCostManagementInstance}"/>
                    <domainSearchResult:rowData type="text" domain="payCostManagement" property="operator"
                                                domainInstance="${payCostManagementInstance}"/>
                    <domainSearchResult:rowData type="text" domain="payCostManagement" property="payCostAmount"
                                                domainInstance="${payCostManagementInstance}"/>
                </tr></g:each>
            </tbody>
        </table>
    </div>

</div>

<div class="modal-footer">
    <button type="submit" class="btn btn-close" data-dismiss="modal"><g:message
            code="payCostManagement.close.label"></g:message></button>
</div>
