<div class="col-xs-12 col-md-4 col-sm-4">
	<div class="form-group">
		<label class="control-label col-md-4"><g:if test="${popoverMessage}"><i class="fa fa-question-circle show-pop" data-popover-message="${popoverMessage}"></i></g:if><message:property domain="${domain }" property="${property }" /><g:message code="dashBoard.system.colon"></g:message>
		</label>

		<div class="col-md-8">
		  	<input type="text" class="form-control" name="q_${property}" value="${params ? params['q_' + property] : '' }"/>

		</div>
	</div>
</div>
