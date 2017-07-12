<div class="col-xs-12 col-md-4 col-sm-4">
    <div class="form-group">
        <label class="control-label col-md-4"><g:if test="${popoverMessage}"><i class="fa fa-question-circle show-pop" data-popover-message="${popoverMessage}"></i></g:if><message:property domain="${domain}" property="${property}"/><g:message code="dashBoard.system.colon"></g:message>
        </label>

        <div class="col-md-8">
            <input class="form-control" type="text" name="q_${property}" value="${params ? params['q_' + property] : '' }" id="orgInput"/>
            <input class="form-control" type="hidden" name="q_${property}_id" value="${params ? params['q_' + property+'_id'] : '' }" id="orgInputId"/>
            <input class="form-control" type="hidden" name="q_directly" value="${directly}" id="directly"/>
            <div id="orgTree" class="pop-box" style=""></div>
        </div>
    </div>
</div>
