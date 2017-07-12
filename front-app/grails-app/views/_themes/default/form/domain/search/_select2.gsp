<div class="col-xs-12 col-md-4 col-sm-4">
    <div class="form-group">
        <label class="control-label col-md-4"><g:if test="${popoverMessage}"><i class="fa fa-question-circle show-pop" data-popover-message="${popoverMessage}"></i></g:if><message:property domain="${domain }" property="${property }" /><g:message code="dashBoard.system.colon"></g:message>
        </label>
        <div class="col-md-8">
            <g:select class="form-control select2" name="q_${property}" from="${from}" value="${params ? params['q_' + property] : '' }" valueMessagePrefix="${domain}.${property}" noSelection="${noSelection?noSelection:['':'']}" />
        </div>
    </div>
</div>
