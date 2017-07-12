<div class="modal fade" id="batchOpenholidayPayModal" tabindex="-1" role="basic" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" onclick="closeWin()" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><g:message code="holidayPay.batchOpenResult.label"/> </h4>
            </div>
            <div class="modal-body">
                    <component:portlet >
                        <portlet:body>
                            <div class="table-toolbar">
                                <lable class="col-md-12">
                                    <g:if test="${readStatus == 'error'}">
                                        <h5 style="color: red">${errorMsg}</h5>
                                    </g:if>
                                    <g:else>
                                        <h3 style="color: #4392fb;">
                                            本次批量开通结果${totalCount}条,其中成功${successCount}条,失败${failCount}条，失败原因如下：
                                        </h3>
                                    </g:else>
                                </lable>
                            </div>
                            <div class="table-scrollable" style="max-height: 40rem; overflow-y: auto;">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                                    <thead>
                                    <tr>
                                        <th><message:property domain="holidayPay" property="code"/></th>
                                        <domainSearchResult:header domain="holidayPay" property="merchantCode"/>
                                        <domainSearchResult:header domain="holidayPay" property="failureReason"/>

                                    </tr>
                                    </thead>
                                    <tbody><g:each var="holidayPayInstance"
                                                   in="${resultList }" status="index">
                                        <tr>
                                            <td>${index + 1}</td>
                                            <domainSearchResult:rowData type="text" domain="holidayPay" property="merchantCode"
                                                                        domainInstance="${holidayPayInstance }"/>
                                            <domainSearchResult:rowData type="text" domain="holidayPay" property="failureReason"
                                                                        domainInstance="${holidayPayInstance }"/>
                                        </tr></g:each>

                                    </tbody>

                                </table>

                            </div>
                        </portlet:body>
                    </component:portlet>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <div class="col-md-6 text-right">
                        <button type="button" onclick="closeWin()" class="btn btn-ok" data-dismiss="modal"><g:message code="holidayPay.confirm.label"/></button>
                    </div>
                    <div class="col-md-6 text-left">
                        <button type="button" onclick="exportBatch()" class="btn btn-result"><g:message code="holidayPay.export.label"/></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function closeWin(){
        window.location.reload();
    }

    function exportBatch(){
        window.location.href="/holidayPay/exportBatch";
    }
</script>
