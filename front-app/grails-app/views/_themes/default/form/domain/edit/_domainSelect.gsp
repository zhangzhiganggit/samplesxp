<div class="col-md-6 col-sm-6 col-xs-12">
	<div class="form-group">
		<label class="col-md-3 col-sm-3 col-xs-12 control-label"><span class="${required?.toBoolean() ? 'required' : 'hide' }">*</span><message:property domain="${domain }" property="${property }"/><g:message code="dashBoard.system.colon"></g:message>
		</label>
		<div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: domainInstance, field: property, ' takin-input-errors')}">
			<g:if test="${readonly }">
				<g:textField class="form-control" name="${property }" placeholder="${placeholder}" value="${message(code: "${domain}.${property}.${domainInstance[property]}" ,default: "${domainInstance ? domainInstance[property] : '' }" )}" readonly="${readonly }" />
			</g:if>
			<g:else>
				<g:select class="form-control" name="${property}" from="${from}" value="${domainInstance[property]}" valueMessagePrefix="${domain}.${property}" noSelection="${noSelection?noSelection:['':'']}" />
			</g:else>
			<span class="help-block"><g:fieldError bean="${domainInstance }" field="${property }" /></span>
		</div>
	</div>
</div>