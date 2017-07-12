<div class="modal fade" id="batchOpenOrCloseResult" tabindex="-1" role="basic" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" onclick="closeWin()" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><g:message code="otherConsumeRate.batchExport.label"/> </h4>
            </div>
            <div class="modal-body">
                    <component:portlet >
                        <portlet:body>
                            <div class="table-toolbar">
                                <lable class="col-md-12">
                                    <g:if test="${errorMsg != null && errorMsg != ''}">
                                        <h5 style="color: red">${errorMsg}</h5>
                                    </g:if>
                                    <g:else>
                                        <h3 style="color: #4392fb;">
                                            本次批量导入成功${successCount}条,失败${failureCount}条,商编重复${repeatNum}条,失败商户及原因如下
                                        </h3>
                                    </g:else>
                                </lable>
                            </div>
                            <div class="table-scrollable" style="max-height: 40rem; overflow-y: auto;">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                                    <thead>
                                    <tr>
                                        <th><message:property domain="otherConsumeRate" property="code"/></th>
                                        <domainSearchResult:header domain="otherConsumeRate" property="merchantCode"/>
                                        <domainSearchResult:header domain="otherConsumeRate" property="errorReason"/>

                                    </tr>
                                    </thead>
                                    <tbody><g:each var="otherConsumeRateInstance"
                                                   in="${resultList }" status="index">
                                        <tr>
                                            <td>${index + 1}</td>
                                            <domainSearchResult:rowData type="text" domain="otherConsumeRate" property="merchantCode"
                                                                        domainInstance="${otherConsumeRateInstance }"/>
                                            <domainSearchResult:rowData type="text" domain="otherConsumeRate" property="errorReason"
                                                                        domainInstance="${otherConsumeRateInstance }"/>
                                        </tr></g:each>

                                    </tbody>

                                </table>

                            </div>
                        </portlet:body>
                    </component:portlet>
            </div>
            <div class="modal-footer">
                <div class="col-md-12">
                    <div class="col-md-12 text-center">
                        <button type="button" onclick="closeWin()" class="btn btn-ok" data-dismiss="modal"><g:message code="otherConsumeRate.affirm.label"/></button>
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

</script>
