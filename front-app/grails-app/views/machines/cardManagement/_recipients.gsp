<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"><g:message code="cardManagement.ICrecipients.label"></g:message> </h4>
</div>

<div class="modal-body">

    <div class="row">
        <div class="form-group">
            <label class="control-label col-md-4" align="right">
                <message:property domain="cardManagement" property="cardNumber"></message:property>
            </label>
            <div class="col-md-8">
                ${cardNumber}
            </div>
        </div>
    </div>

    <div class="row">
        <div class="form-group">
            <label class="control-label col-md-4"  align="right">
                <message:property domain="cardManagement" property="recipientsPerson" />
            </label>
            <div class="col-md-4">
                <g:select class="form-control" from="${com.suixingpay.ssp.front.machines.CardManagement.getConstraintsMap()['recipientsPerson'].inList}"
                          name="recipientsPerson" valueMessagePrefix="cardManagement.recipientsPerson"
                          value="${params ? params['recipientsPerson'] : ''}" noSelection="['': '--请选择--']"/>
            </div>
        </div>
    </div>
    <div class="form-actions">

    <div class="col-md-offset-3 col-md-8">
        <button type="submit" class="btn btn-ok" data-dismiss="modal"><g:message code="cardManagement.sure.label"></g:message> </button>
    </div>
</div>
</div>

