    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title"><g:message  code="salesmanManagement.button.cancellation.label"/></h4>
    </div>
    <div class="modal-body">
        <div>
            <label><p style='margin:3px;font-size:10px;color:red'>注：业务员注销后不可恢复，系统内数据全部删除。</p>您确定注销该业务员？</label>
        </div>


    </div>

    <div class="modal-footer">
        <div class="text-center">
        <button type="button" class="btn btn-return" data-dismiss="modal"><g:message  code="systemUser.Close.label"/></button>
        <g:link class="btn btn-ok" controller="salesmanManagement" action="cancellation" id="${id}"><g:message
                code="salesmanManagement.button.cancellation.label"/></g:link>
        </div>
    </div>