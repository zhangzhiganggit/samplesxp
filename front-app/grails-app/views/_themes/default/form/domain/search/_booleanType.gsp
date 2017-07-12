<div class="col-xs-12 col-md-4 col-sm-4">
	<div class="form-group">
		<label class="control-label col-md-4"><g:if test="${popoverMessage}"><i class="fa fa-question-circle show-pop" data-popover-message="${popoverMessage}"></i></g:if><message:property domain="${domain }" property="${property }" /><g:message code="dashBoard.system.colon"></g:message>
		</label>
		<div class="col-md-8">
			<div class="icheck-inline">
				<label>
					<input type="radio" class="icheck" name="q_${property }" value="true"<%= ( params['q_' + property] == true ) ? ' checked="checked"' : '' %>>
					<g:message code="${domain }.${property }.true" default="${message(code: 'default.boolean.true') }" />
				</label>
				<label>
					<input type="radio" class="icheck" name="q_${property }" value="false"<%= ( params['q_' + property] == false ) ? ' checked="checked"' : '' %>>
					<g:message code="${domain }.${property }.false" default="${message(code: 'default.boolean.false') }" />
				</label>
				<label>
					<input type="radio" class="icheck" name="q_${property }" value=""<%= ( !params['q_' + property] ) ? ' checked="checked"' : '' %>>
					<g:message code="${domain }.${property }.ignore" default="${message(code: 'default.boolean.ignore') }" />
				</label>
			</div>
		</div>
	</div>
</div>
