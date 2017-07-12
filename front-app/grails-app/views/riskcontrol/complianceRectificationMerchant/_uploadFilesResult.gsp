<div class="modal fade" id="filesResult" tabindex="-1" role="basic" aria-hidden="true" style="margin-left: 225px;margin-top: 30px">
    <div class="modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>

                <h4 class="modal-title"><g:message code="complianceRectificationMerchant.complianceRectificationMerchantImport.result"/></h4>
            </div>
            <div class="modal-body">
                <component:portlet >
                    <portlet:body>
                        <div class="table-toolbar">
                            <g:if test="${readStatus == 'error' || readStatus == 'fail'}">
                                <h5 style="color: red">${errorMsg}</h5>
                            </g:if>
                            <g:else>
                                <h3 style="color: green;">
                                    ${errorMsg}
                                </h3>
                            </g:else>
                        </div>
                        <g:if test="${readStatus == 'fail'}">
                        <div class="table-scrollable">
                            <table class="table table-striped table-bordered table-hover dataTable no-footer text-center ">
                                    <thead>
                                    <tr >
                                        <th style="text-align:center"><g:message code="complianceRectificationMerchant.number.label"/></th>
                                        <domainSearchResult:header domain="complianceRectificationMerchant" property="lineNumber"/>
                                        <domainSearchResult:header domain="complianceRectificationMerchant" property="causeFailure"/>
                                    </tr>
                                    </thead>
                                    <tbody><g:each var="errorMap"
                                                   in="${errorList }" status="index">
                                        <tr>
                                            <td>${index + 1}</td>
                                            <td>${errorMap['msgRow']}</td>
                                            <td>${errorMap['msgErr']}</td>
                                        </tr></g:each>
                                    </tbody>
                                </table>
                            </div>
                        </g:if>
                    </portlet:body>
                </component:portlet>
            </div>
            <div class="modal-footer">
                <div class="row">
                    <div class="col-md-6 text-right">
                        <button type="button" class="btn btn-ok" id="modal_ok" data-dismiss="modal" ><g:message code="complianceRectificationMerchant.sure.label"/></button>
                    </div>
                    <g:if test="${readStatus == 'fail'}">
                        <div class="col-md-6 text-left">
                            <g:link class="btn btn-download" controller="complianceRectificationMerchant" action="downloadFiles"
                                    params='[excelUuid: "${excelUuid}", fileName: "${message(code:'complianceRectificationMerchant.export.filename.label')}"]' >
                                ${message(code: 'complianceRectificationMerchant.export.label')}
                            </g:link>
                        </div>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    $("#modal_ok").click(function () {
        $('.rectificationMerchantResult').hide();
        $(".form-horizontal").submit();
    })


</script>