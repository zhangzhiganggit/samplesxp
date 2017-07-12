<div class="col-xs-12 col-md-4 col-sm-4">
    <div class="form-group">
        <label class="control-label col-md-4"><g:if test="${popoverMessage}"><i class="fa fa-question-circle show-pop" data-popover-message="${popoverMessage}"></i></g:if><message:property domain="${domain}" property="${property}"/><g:message code="dashBoard.system.colon"></g:message>
        </label>

        <div class="col-md-8">
            <div class="input-group date form_datetime">
                <input type="text" class="form-control" name="${property}" value="${params ? params[property] : ''}"/>
                <span class="input-group-btn">
                    <button class="btn default date-set" type="button">
                        <i class="fa fa-calendar"></i>
                    </button>
                </span>
            </div>
        </div>
    </div>
</div>



