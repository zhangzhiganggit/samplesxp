<div class="col-md-6 col-sm-6 col-xs-12">
	<div class="form-group">
		<label class="col-md-3 col-sm-3 col-xs-12 control-label"><message:property domain="${domain }" property="${property }"/><g:message code="dashBoard.system.colon"></g:message><span class="${required ? 'required' : 'hide' }">*</span>
		</label>
		<div class="col-md-9 col-sm-9 col-xs-12${hasErrors(bean: domainInstance, field: property, ' takin-input-errors')}">
			<div class="icheck-inline">
				<g:each var="keyValue" in="${keyValues }" status="i">
					<label>
						<input type="checkbox" class="icheck" name="${property }" value="${keyValue.key }"<%= ( values?.contains(keyValue.key) ) ? ' checked="checked"' : '' %>>
						${keyValue.value }
					</label>
				</g:each>
			</div>
			<span class="help-block"><g:fieldError bean="${domainInstance }" field="${property }" /></span>
		</div>
	</div>
</div>