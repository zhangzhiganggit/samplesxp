<div class="modal fade" id="batchAddDeviceResult" tabindex="-1" role="basic" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" onclick="closeWin()" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><g:message code="happyToSendDevice.batchExport.label"/> </h4>
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
                                            本次导入成功${successCount}条数据,失败${failureCount}条数据
                                        </h3>
                                    </g:else>
                                </lable>
                            </div>
                            <div class="table-scrollable" style="max-height: 40rem; overflow-y: auto;">
                                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                                    <thead>
                                    <tr>
                                        <th><message:property domain="happyToSendDevice" property="code"/></th>
                                        <domainSearchResult:header domain="happyToSendDevice" property="originalSerialNm"/>
                                        <domainSearchResult:header domain="happyToSendDevice" property="errorReason"/>

                                    </tr>
                                    </thead>
                                    <tbody><g:each var="happyToSendDeviceInstance"
                                                   in="${resultList }" status="index">
                                        <tr>
                                            <td>${index + 1}</td>
                                            <domainSearchResult:rowData type="text" domain="happyToSendDevice" property="originalSerialNm"
                                                                        domainInstance="${happyToSendDeviceInstance }"/>
                                            <domainSearchResult:rowData type="text" domain="happyToSendDevice" property="errorReason"
                                                                        domainInstance="${happyToSendDeviceInstance }"/>
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
                        <button type="button" onclick="closeWin()" class="btn btn-ok" data-dismiss="modal"><g:message code="happyToSendDevice.affirm.label"/></button>
                    </div>
                    <div class="col-md-6 text-left">
                        <button type="button" onclick="exportBatch()" class="btn btn-result"><g:message code="happyToSendDevice.export.label"/></button>
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
        window.location.href="/happyToSendDevice/exportBatch";
    }
</script>
