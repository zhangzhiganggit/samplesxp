<div class="modal-header ">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="holidayPay.history.label"></g:message> </h4>
</div>
<div class="modal-body">
<component:portlet cssClass="scaffold-searchResult">
    <portlet:body>
        <div class="table-scrollable" style="max-height: 40rem; overflow-y: auto;">
            <table  class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="holidayPay" property="merchantCode"/>
                    <domainSearchResult:header domain="holidayPay" property="receiptsname"/>
                    <domainSearchResult:header domain="holidayPay" property="operationType"/>
                    <domainSearchResult:header domain="holidayPay" property="operator"/>
                    <domainSearchResult:header domain="holidayPay" property="operationtime"/>
                </tr>
                </thead>
                <tbody><g:each var="holidayPayInstance"
                               in="${holidayPayInstanceList }">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="holidayPay" property="merchantCode"
                                                    domainInstance="${holidayPayInstance }"/>
                        <domainSearchResult:rowData type="text" domain="holidayPay" property="receiptsname"
                                                    domainInstance="${holidayPayInstance }"/>
                        <domainSearchResult:rowData type="inList" domain="holidayPay" property="operationType"
                                                    domainInstance="${holidayPayInstance }"/>
                        <domainSearchResult:rowData type="inList" domain="holidayPay" property="operator"
                                                    domainInstance="${holidayPayInstance }"/>
                        <domainSearchResult:rowData type="text" domain="holidayPay" property="operationtime"
                                                    domainInstance="${holidayPayInstance }"/>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
%{--<component:paginate total="${holidayPayListCount }"/>--}%
</div>
<div class="modal-footer">
    <div class="col-md-12 text-center">
        <div class="col-md-6 text-right"> <button type="button" class="btn btn-ok" data-dismiss="modal"><g:message code="holidayPay.affirm.label"></g:message> </button></div>
        <div class="col-md-6 text-left"><button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="holidayPay.cancel.label"></g:message> </button></div>
    </div>
</div>