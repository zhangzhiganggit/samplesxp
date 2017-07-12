<div class="col-md-6">
	<div class="form-group">
		<label class="col-md-3 control-label">
			<message:property domain="${domain }" property="${property }"/>
			<span class="${required ? 'required' : 'hide' }">*</span>
		</label>
		<div class="col-md-9${hasErrors(bean: domainInstance, field: property, ' takin-input-errors')}">
			<g:if test="${required }">
				<g:textField class="form-control" name="${property }" value="${domainInstance[property] }" required="required" />
			</g:if>
			<g:else>
				<g:textField class="form-control" name="${property }" value="${domainInstance[property] }" />
			</g:else>
			<span class="help-block"><g:fieldError bean="${domainInstance }" field="${property }" /></span>
		</div>
	</div>
</div>
%{--未使用--}%