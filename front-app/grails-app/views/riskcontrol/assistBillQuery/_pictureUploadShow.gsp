<%@ page import="com.suixingpay.ssp.front.riskcontrol.AssistBillQuery" %>
<div class="modal fade modal-dialog modal-lg" id="prictureUploadShowModal" tabindex="-1" role="basic"
     aria-hidden="true">

    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            <h4 class="modal-title">${message(code: 'assistBillQuery.pictureShow.label')}</h4>
        </div>

        <div class="modal-body">

            <portlet:body>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                ${message(code: 'assistBillQuery.pictureUpload.label')}<g:message code="dashBoard.system.colon"></g:message>

                            </label>

                            <div class="col-md-10" class="files">
                                <g:each var="file" status="i" in="${lastfiles}" >
                                    <div class="col-md-3"><img width="150px" height="150px" src="<g:createLink controller="assistBillQuery" action="viewImage" params='[title: "${file.path}"]'/>"/></div>
                                </g:each>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="row">
                        <div class="col-md-6 text-right">
                            <button type="button" class="btn btn-close"
                                    data-dismiss="modal">${message(code: 'assistBillQuery.close.label')}</button>
                        </div>

                    </div>
                </div>
            </portlet:body>
        </div>

        <div class="modal-footer">
        </div>
    </div>
</div>
<script type="text/javascript">
    function merchantTerminalManagementSearchForm() {
        $('#merchantTerminalManagementSearchForm').submit();
    }
</script>