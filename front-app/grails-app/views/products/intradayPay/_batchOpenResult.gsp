<div class="modal fade" id="batchOpenResultModal" tabindex="-1" role="basic" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" onclick="closeWin()" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><g:message code="intradayPay.batchOpenIntradayResult.label"/> </h4>
            </div>
            <div class="modal-body">
                <portlet:body>
                    <div class="table-toolbar">
                        <g:if test="${readStatus == 'error'}">
                            <h5 style="color: red">${errorMsg}</h5>
                        </g:if>
                        <g:else>
                            <h3 style="color: #71d1ff;">
                                本次批量开通结果 ${totalCount}条,其中成功${successCount}条,失败${failCount}条，失败原因如下：
                            </h3>
                        </g:else>
                    </div>
                    <div class="table-scrollable" style="max-height: 40rem; overflow-y: auto;">
                        <table class="table table-striped table-bordered table-hover dataTable no-footer">
                            <thead>
                            <tr>
                                <domainSearchResult:header domain="intradayPay" property="code"/>
                                <domainSearchResult:header domain="intradayPay" property="merchantCode"/>
                                <domainSearchResult:header domain="intradayPay" property="failureReason"/>
                            </tr>
                            </thead>
                            <tbody><g:each var="result"
                                           in="${resultList}" status="index">
                                <tr>
                                    <td>${index+1}</td>
                                    <domainSearchResult:rowData type="text" domain="intradayPay" property="merchantCode"
                                                                domainInstance="${result}"/>
                                    <domainSearchResult:rowData type="text" domain="intradayPay" property="failureReason"
                                                                domainInstance="${result}"/>
                                </tr></g:each>
                            </tbody>
                        </table>
                    </div>
                </portlet:body>
            </div>
            <div class="modal-footer">
                <div class="row">
                    <div class="col-md-6 text-right">
                        <button onclick="closeWin()" type="button" class="btn btn-ok" data-dismiss="modal"><g:message code="intradayPay.affirm.label"/> </button>
                    </div>
                    <div class="col-md-6 text-left">
                        <button type="button" onclick="exportBatch()" class="btn btn-result"><g:message code="intradayPay.export.label"/></button>
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
        window.location.href="/intradayPay/exportBatch";
    }
</script>