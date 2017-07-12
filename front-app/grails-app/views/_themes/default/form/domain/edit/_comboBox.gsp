<div class="col-md-6 col-sm-6 col-xs-12">
	<div class="form-group">
		<label class="col-md-3 control-label"><span class="${required?.toBoolean() ? 'required' : 'hide' }">*</span><message:property domain="${domain }" property="${property }"/><g:message code="dashBoard.system.colon"></g:message>
		</label>
		<div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: domainInstance, field: property, ' takin-input-errors')}">
			<g:if test="${required?.toBoolean() }">
				<g:textField class="form-control" name="${property }" value="${domainInstance[property] }" required="required" />
			</g:if>
			<g:else>
				<g:textField class="form-control" name="${property }" value="${domainInstance[property] }" />
			</g:else>
			<span class="help-block"><g:fieldError bean="${domainInstance }" field="${property }" /></span>
		</div>
	</div>
</div>